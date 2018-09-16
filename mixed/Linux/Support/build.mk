#
# Copyright (c) 2013-2018, Timothy Baldwin
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of RISC OS Open Ltd nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#


LINUX_ROM=Support/bin/RISC_OS
ACORN_CPP=../DDE/AcornC.C++

TARGET=Linux
METHOD=Linux
PHASES=export_hdrs export_libs resources rom install_rom join

.PHONY: update-binary build check fast

all check: Build/Images/$(TARGET)_rom_check
build: Build/Images/$(TARGET)_rom

ifeq ($(TARGET), Linux)
all check: RISC_OS
endif

build_binds = $(foreach dir,bsd castle cddl gpl mixed,--ro-bind $(dir) /dev/fd/5/$(dir)) --bind Build /dev/fd/5/Build --ro-bind '${ACORN_CPP}' /dev/fd/8 --symlink . /dev/fd/5/lock_source_1510718522

Build/src-stamp: $(shell find bsd castle cddl gpl mixed)
	mkdir -p Build
	touch Build/src-stamp

ifeq ($(METHOD), rpcemu)
Build/Images/%_rom: Build/src-stamp | Built/rpcemu/rpcemu Built/boot_iomd_rom
else ifeq ($(INSECURE), YES)
Build/Images/%_rom: Build/src-stamp | ${LINUX_ROM}
else
Build/Images/%_rom: Build/src-stamp | Built/sandbox_config_sh ${LINUX_ROM}
endif
	set -o pipefail
	uname -a
	export COMMIT="$$(git rev-parse HEAD)"
	echo Building GIT commit: $$COMMIT
	#
	ln -sfn . lock_source_1510718522
	mkdir -p Build
	setup_build() {
	  #
	  # Find directories and files
	  shopt -s globstar
	  shopt -s extglob
	  dirs=({bsd,castle,cddl,gpl,mixed}/**/)
	  files=({bsd,castle,cddl,gpl,mixed}/**)
	  #
	  cd Build
	  #
	  # Remove old output
	  ! rm 'Images/$*_rom'*
	  #
	  # Create needed directories
	  mkdir -p Apps "$${dirs[@]}"
	  #
	  # Create relative symbolic links
	  # Fast perl, fallback to slow shell
	  perl -e '
	    foreach $$f (@ARGV) {
	      $$t = $$f;
	      $$t =~ s:[^/]+:..:g;
	      symlink "$$t/lock_source_1510718522/$$f", $$f;
	    }
	  ' "$${files[@]}" || {
	    for i in "$${files[@]}"; do
	      test -f "../$$i" -a ! -L "$$i" && ln -sf "$${i//+([^\/])/..}/lock_source_1510718522/$$i" "$$i"
	      echo -n .
	    done
	  echo
	  }
	  #
	  if [[ "$*" = "Linux" ]]; then
	    # Create version header
	    echo '#define VERSION "GIT commit: '$$COMMIT'\n"' > version
	    cmp --quiet version mixed/Linux/HAL/h/version || cp version mixed/Linux/HAL/h/version
	  fi
	  cp -ru --preserve=mode,timestamps ../castle/RiscOS/Export .
	  ln -sf mixed/RiscOS/{Library,Modules} castle/RiscOS/{Env,BuildSys} .
	  cd Apps
	  ln -sf ../../lock_source_1510718522/Build/*/RiscOS/Apps/\!* .
	}
ifeq ($(INSECURE), YES)
	( setup_build )
else
	export -f setup_build
	$(call sandbox_base, -s) $(sandbox_misc) $(build_binds) --dev-bind /dev/null /dev/null --chdir /dev/fd/5 bash -e -c setup_build
endif
	#
ifeq ($(METHOD), rpcemu)
	echo -e '*Set IXFS$$Path HostFS:\n*Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build rpcemu $* $(PHASES)' | \
	$(BWRAP) --unshare-pid --unshare-net $(sandbox_misc) \
	--ro-bind /tmp/.X11-unix /tmp/.X11-unix \
	--proc /proc \
	--ro-bind Built/rpcemu /r \
	--tmpfs /r/hostfs \
	--dev-bind /dev/null /r/hd4.hdf \
	--ro-bind Built/boot_iomd_rom /r/roms/ROM \
	$(build_binds) \
	--symlink /dev/fd /r/hostfs/dev/fd \
	--file 0 '/r/hostfs/!Boot,fea' \
	/r/rpcemu
else
  ifeq ($(INSECURE), YES)
	env -i JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build Linux $* $(PHASES)' '$(LINUX_ROM)' --nofork  5<. 8<'${ACORN_CPP}' <<END 2>&1 | cat
  else
	. Built/sandbox_config_sh
	env -i JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build Linux $* $(PHASES)' $(sandbox_base) $(build_binds) --ro-bind '$(LINUX_ROM)' /RISC_OS "$${auto_bwrap_args[@]}" $$QEMU /RISC_OS --nofork <<END 2>&1 | cat
  endif
	*BASIC
	VDU 7
	SYS "IXSupport_LinuxSyscall",20,,,,,,,1
	END
endif
	find Build/Images -type l -delete
	! mv 'Build/Images/$*_rom',??? 'Build/Images/$*_rom'
	! setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 'Build/Images/$*_rom'
	true

Build/Images/IOMD32_rom_check: Build/Images/IOMD32_rom Built/rpcemu/rpcemu
	mixed/Linux/Tests/runner_rpcemu.sh Build/Images/IOMD32_rom
	touch Build/Images/IOMD32_check

ifeq ($(INSECURE), YES)
Build/Images/Linux_rom_check: Build/Images/Linux_rom
	chmod +x Build/Images/Linux_rom
	touch Build/Images/Linux_rom_check
else
Build/Images/Linux_rom_check: Build/Images/Linux_rom Built/sandbox_config_sh
	chmod +x Build/Images/Linux_rom
	mixed/Linux/Tests/runner.sh Build/Images/Linux_rom
	touch Build/Images/Linux_rom_check
endif

RISC_OS: Build/Images/Linux_rom_check
	cp --preserve=mode,xattr --reflink=auto Build/Images/Linux_rom Built/RISC_OS
	ln -sf Built/RISC_OS RISC_OS

fast: PHASES=install_rom join
fast: check
check: build

Support/bin/RISC_OS:
	git submodule init
	git submodule update

update-binary:
	+shopt -s extglob
ifndef FAST
	! git clean -fxd
	git reset --hard
endif
	(
	  cd mixed/Linux/Support/bin
	  git reset --hard
	  git clean -fxd
	  git checkout master~0
	)
	git submodule update
	SOURCE=$$(git rev-parse HEAD)
	BINARY=$$(cd mixed/Linux/Support/bin && git rev-parse HEAD)
	#
ifndef FAST
	$(MAKE) JOBS=$(JOBS) METHOD=$(METHOD)
endif
	(
	  cd Support/bin
	  git fetch --force https://github.com/TimothyEBaldwin/RO_Linux.git master:master
	  git checkout master
	)
	rm -rf Support/bin/Support 'Support/bin/!Boot'
	mkdir -p Support/bin/Support
	cp -v --reflink=auto --preserve=mode,xattr Support/!(Makefile|bin|build.mk|Build,feb|BufferWriteC) Support/bin/Support/
	cp -v --reflink=auto --preserve=mode,xattr RISC_OS README.md Support/bin/
	ln -sf 'Support/Start_RISC_OS.desktop' 'Support/bin/Start_RISC_OS.desktop'
	ln -sf 'Support/run_RISC_OS' 'Support/bin/run_RISC_OS'
	#
	echo "# Source and build GIT commits
	SOURCE=$$SOURCE
ifneq ($(METHOD), rpcemu)
	BINARY=$$BINARY
endif
	LINUX='$$(uname -a)'
	" > Support/bin/Support/source
	#
	(
	  cd Support/bin
	  git add -A
	  git commit -m "Rebuilt binary from $$SOURCE"
	)
	git add -u
	git commit -m "Rebuilt bootstrap binary"


