#
# Copyright (c) 2013-2018, Timothy Baldwin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


LINUX_ROM=Unix/RISC_OS/RISC_OS
ACORN_CPP=../DDE/AcornC.C++

TARGET=Linux
METHOD=Linux
PHASES=export_hdrs export_libs resources rom install_rom join

.PHONY: update-binary build check fast

all check: Build/$(TARGET)/RiscOS/Images/rom_check
build: Build/$(TARGET)/RiscOS/Images/rom

ifeq ($(TARGET), Linux)
all check: RISC_OS
endif

build_binds = $(foreach dir,Unix RiscOS mixed,--ro-bind $(dir) /dev/fd/5/$(dir)) --bind Build/$* /dev/fd/5/Build/$* --ro-bind '${ACORN_CPP}' /dev/fd/8 --symlink . /dev/fd/5/lock_source_1510718522

Build/src-stamp: $(shell find Unix RiscOS mixed)
	ln -sfn . lock_source_1510718522
	mkdir -p Build
	touch Build/src-stamp

ifeq ($(METHOD), rpcemu)
Build/%/RiscOS/Images/rom: Build/src-stamp | Built/rpcemu/rpcemu Built/boot_iomd_rom
else ifeq ($(INSECURE), YES)
Build/%/RiscOS/Images/rom: Build/src-stamp | ${LINUX_ROM}
else
Build/%/RiscOS/Images/rom: Build/src-stamp | Built/sandbox_config_sh ${LINUX_ROM}
endif
	set -o pipefail
	uname -a
	export COMMIT="$$(git rev-parse HEAD)"
	echo Building GIT commit: $$COMMIT
	#
	mkdir -p Build/$*
	setup_build() {
	  #
	  # Find directories and files
	  shopt -s globstar
	  shopt -s extglob
	  dirs=({Unix,RiscOS,mixed}/**/)
	  files=({Unix,RiscOS,mixed}/**)
	  #
	  cd Build/$*
	  #
	  # Remove old output
	  ! rm RiscOS/Images/rom*
	  #
	  # Create needed directories
	  mkdir -p "$${dirs[@]}"
	  #
	  # Create relative symbolic links
	  # Fast perl, fallback to slow shell
	  perl -e '
	    foreach $$f (@ARGV) {
	      $$t = $$f;
	      $$t =~ s:[^/]+:..:g;
	      symlink "$$t/../lock_source_1510718522/$$f", $$f;
	    }
	  ' "$${files[@]}" || {
	    for i in "$${files[@]}"; do
	      test -f "../../$$i" -a ! -L "$$i" && ln -sf "$${i//+([^\/])/..}/../lock_source_1510718522/$$i" "$$i"
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
	  #cp -ru --preserve=mode,timestamps ../../apache/RiscOS/Export .
	}
ifeq ($(INSECURE), YES)
	( setup_build )
else
	export -f setup_build
	$(call sandbox_base, -s) $(sandbox_misc) $(build_binds) --dev-bind /dev/null /dev/null --chdir /dev/fd/5 $(BASHF) setup_build
endif
	#
ifeq ($(METHOD), rpcemu)
	echo -e '*Set IXFS$$Path HostFS:\n*Obey -v IXFS:$$.dev.fd.5.Unix.LinuxSupport.Build rpcemu $* $(PHASES)' | \
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
else ifeq ($(INSECURE), YES)
	env -i $(if $(VERBOSE), RISC_OS_Alias_Obey='%%Obey -v %*0') JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey IXFS:$$.dev.fd.5.Unix.LinuxSupport.Build Linux $* $(PHASES)' '$(LINUX_ROM)' --abort-on-input 5<. 8<'${ACORN_CPP}' </dev/null |& cat
else
	. Built/sandbox_config_sh
	env -i $(if $(VERBOSE), RISC_OS_Alias_Obey='%%Obey -v %*0') JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey IXFS:$$.dev.fd.5.Unix.LinuxSupport.Build Linux $* $(PHASES)' $(sandbox_base) $(build_binds) --ro-bind '$(LINUX_ROM)' /RISC_OS "$${auto_bwrap_args[@]}" $$QEMU /RISC_OS  --abort-on-input </dev/null |& cat
endif
	find Build/$*/RiscOS/Images -type l -delete
	! mv 'Build/$*/RiscOS/Images/rom',??? 'Build/$*/RiscOS/Images/rom'
	! setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 'Build/$*/RiscOS/Images/rom'
	true

Build/IOMD32/RiscOS/Images/rom_check: Build/IOMD32/RiscOS/Images/rom Built/rpcemu/rpcemu
	mixed/Linux/Tests/runner_rpcemu.sh Build/IOMD32/RiscOS/Images/rom
	touch Build/IOMD32/RiscOS/Images/rom_check

ifeq ($(INSECURE), YES)
Build/Linux/RiscOS/Images/rom_check: Build/Linux/RiscOS/Images/rom
	chmod +x Build/Linux/RiscOS/Images/rom
	touch Build/Linux/RiscOS/Images/rom_check
else
Build/Linux/RiscOS/Images/rom_check: Build/Linux/RiscOS/Images/rom Built/sandbox_config_sh
	chmod +x Build/Linux/RiscOS/Images/rom
	mixed/Linux/Tests/runner.sh Build/Linux/RiscOS/Images/rom
	touch Build/Linux/RiscOS/Images/rom_check
endif

RISC_OS: Build/Linux/RiscOS/Images/rom_check
	cp --remove-destination --preserve=mode,xattr --reflink=auto Build/Linux/RiscOS/Images/rom Built/RISC_OS
	ln -sf Built/RISC_OS RISC_OS

fast: PHASES=install_rom join
fast: check
check: build

Unix/RISC_OS/RISC_OS:
	git submodule init
	git submodule update

update-binary:
	+shopt -s extglob
ifndef FAST
	! git clean -fxd
	git reset --hard
endif
	(
	  cd Unix/RISC_OS
	  git reset --hard
	  git clean -fxd
	  git checkout master~0
	)
	git submodule update
	SOURCE=$$(git rev-parse HEAD)
	BINARY=$$(cd Unix/RISC_OS && git rev-parse HEAD)
	#
ifndef FAST
	$(MAKE) JOBS=$(JOBS) METHOD=$(METHOD)
endif
	(
	  cd Unix/RISC_OS
	  git fetch --force https://github.com/TimothyEBaldwin/RISC_OS_Linux_Binary.git master:master
	  git checkout master
	)
	rm -rf Unix/RISC_OS/*
	mkdir -p Unix/RISC_OS/Support
	cp -v --reflink=auto --preserve=mode,xattr Support/!(Makefile|bin|build.mk|Build,feb|BufferWriteC) Unix/RISC_OS/Support/
	cp -v --reflink=auto --preserve=mode,xattr RISC_OS README.md Unix/RISC_OS/
	#
	mkdir -p Unix/RISC_OS/Unix
	cp -vrL Unix/SocketKVMFrontends Unix/RISC_OS/Unix/SocketKVMFrontends
	ln -sf ../Support Unix/RISC_OS/Unix/LinuxSupport
	ln -sf 'Unix/LinuxSupport/Start_RISC_OS.desktop' 'Unix/RISC_OS/Start_RISC_OS.desktop'
	ln -sf 'Unix/LinuxSupport/run_RISC_OS' 'Unix/RISC_OS/run_RISC_OS'
	#
	echo "# Source and build GIT commits
	SOURCE=$$SOURCE
ifneq ($(METHOD), rpcemu)
	BINARY=$$BINARY
endif
	LINUX='$$(uname -a)'
	" > Unix/RISC_OS/Support/source
	#
	(
	  cd Unix/RISC_OS
	  git add -A
	  git commit -m "Rebuilt binary from $$SOURCE"
	)
	git add -u
	git commit -m "Rebuilt bootstrap binary"
