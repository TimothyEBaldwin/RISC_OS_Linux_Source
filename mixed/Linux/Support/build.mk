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

all: build
ifneq ($(INSECURE), YES)
all: check
endif

RISC_OS: $(if $(wildcard RISC_OS),,all)

build_binds = $(foreach dir,bsd castle cddl gpl mixed,--ro-bind $(dir) /dev/fd/5/$(dir)) --bind Build /dev/fd/5/Build --ro-bind '${ACORN_CPP}' /dev/fd/8 --symlink . /dev/fd/5/lock_source_1510718522

ifeq ($(METHOD), rpcemu)
build: Built/rpcemu/rpcemu Built/boot_iomd_rom
else
  ifneq ($(INSECURE), YES)
build: Built/qemu_sandbox
  endif
build: ${LINUX_ROM}
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
	  ! rm 'Images/$(TARGET)_rom'*
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
ifeq ($(TARGET), Linux)
	  # Create version header
	  echo '#define VERSION "GIT commit: '$$COMMIT'\n"' > version
	  cmp --quiet version mixed/Linux/HAL/h/version || cp version mixed/Linux/HAL/h/version
endif
	  cp -ru --preserve=mode,timestamps ../castle/RiscOS/Export .
	  ln -sf mixed/RiscOS/{Library,Modules} castle/RiscOS/{Env,BuildSys} .
	  cd Apps
	  ln -sf ../*/RiscOS/Apps/\!* .
	}
ifeq ($(INSECURE), YES)
	( setup_build )
else
	export -f setup_build
	$(call sandbox_base, -s) $(sandbox_misc) $(build_binds) --dev-bind /dev/null /dev/null --chdir /dev/fd/5 bash -e -c setup_build
endif
	#
ifeq ($(METHOD), rpcemu)
	echo -e '*Set IXFS$$Path HostFS:\n*Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build rpcemu $(TARGET) $(PHASES)' | \
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
	env -i JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build Linux $(TARGET) $(PHASES)' '$(LINUX_ROM)' --nofork  5<. 8<'${ACORN_CPP}' <<END 2>&1 | cat
  else
	. Built/qemu_sandbox
	env -i JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey -v IXFS:$$.dev.fd.5.mixed.Linux.Support.Build Linux $(TARGET) $(PHASES)' $(sandbox_base) $(build_binds) --ro-bind '$(LINUX_ROM)' /RISC_OS "$${QEMU_sandbox[@]}" $$QEMU /RISC_OS --nofork <<END 2>&1 | cat
  endif
	*BASIC
	VDU 7
	SYS "IXSupport_LinuxSyscall",20,,,,,,,1
	END
endif
	find Build/Images -type l -delete
	! mv 'Build/Images/$(TARGET)_rom',??? 'Build/Images/$(TARGET)_rom'
	! setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 'Build/Images/$(TARGET)_rom'
	true
ifeq ($(TARGET), Linux)
	chmod +x 'Build/Images/$(TARGET)_rom'
	ln -f Build/Images/Linux_rom Build/Images/Linux_rom_keep
	mv Build/Images/Linux_rom_keep RISC_OS
endif

ifeq ($(TARGET), IOMD32)
check: Built/rpcemu/rpcemu
	mixed/Linux/Tests/runner_rpcemu.sh 'Build/Images/$(TARGET)_rom'
endif

ifeq ($(TARGET), Linux)
check: Built/qemu_sandbox
	mixed/Linux/Tests/runner.sh ./RISC_OS
endif

fast: PHASES=install_rom join
fast: check
check: build

Support/bin/RISC_OS:
	git submodule init
	git submodule update

update-binary:
	+shopt -s extglob
ifndef FAST
	git clean -fxd
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
	cp -v --reflink=auto --preserve=mode,xattr Support/!(protocol.h|bin|build.mk|Build,feb|BufferWriteC) Support/bin/Support/
	cp -v --reflink=auto --preserve=mode,xattr mixed/Linux/SocketKVM/h/protocol Support/bin/Support/protocol.h
	cp -v --reflink=auto --preserve=mode,xattr RISC_OS README.md Support/bin/
	ln -sf 'Support/Start_RISC_OS.desktop' 'Support/bin/Start_RISC_OS.desktop'
	#
	echo "# Source and build GIT commits
	SOURCE=$$SOURCE
ifneq ($(METHOD), rpcemu)
	BINARY=$$(cd Support/bin && git rev-parse HEAD)
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


