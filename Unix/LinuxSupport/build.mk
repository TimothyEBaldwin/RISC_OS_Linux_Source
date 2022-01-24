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


LINUX_ROM=Unix/RISC_OS/Unix/RISCOS.IMG
ACORN_CPP=../DDE/AcornC.C++

TARGET=Linux
METHOD=Linux
PHASES=export_hdrs export_libs resources rom install_rom join

.PHONY: update-binary build check fast

all check: Build2/$(TARGET)/RiscOS/Images/rom_check
build: Build2/$(TARGET)/RiscOS/Images/rom
script-all: Built/RISCOS.IMG

ifeq ($(TARGET), Linux)
all check: Built/RISCOS.IMG
endif

build_binds = $(foreach dir,Built Unix RiscOS mixed,--ro-bind $(dir) /fd/5/$(dir)) --bind Build2/$* /fd/5/Build2/$* --ro-bind '${ACORN_CPP}' /fd/8 --symlink . /fd/5/lock_source_44befc1cf3

Build2/src-stamp: $(shell find Unix/LinuxSupport/build.mk Unix/SocketKVMFrontends/SocketKVM_Protocol.h Unix/SocketKVMFrontends/Makefile,fe1 RiscOS mixed \! \( -name '.*' -prune \))
	mkdir -p Build2
	touch Build2/src-stamp

ifeq ($(METHOD), rpcemu)
Build2/%/RiscOS/Images/rom: Build2/src-stamp | Built/rpcemu/rpcemu Built/boot_iomd_rom
else ifeq ($(INSECURE), YES)
Build2/%/RiscOS/Images/rom: Build2/src-stamp | ${LINUX_ROM}
else
Build2/%/RiscOS/Images/rom: Build2/src-stamp | Built/gen_seccomp $(QEMU) ${LINUX_ROM}
endif
	set -o pipefail
	uname -a
	export COMMIT="$$(git rev-parse HEAD)"
	echo Building GIT commit: $$COMMIT
	#
	mkdir -p Build2/$*
	setup_build() {
	  #
	  # Find directories and files
	  shopt -s globstar
	  shopt -s extglob
	  dirs=({Unix,RiscOS,mixed}/**/)
	  files=({Unix,RiscOS,mixed}/**)
	  #
	  cd Build2/$*
	  #
	  # Remove old output
	  ! rm RiscOS/Images/rom*
	  #
	  # Remove symbolic broken links
	  find . -xtype l -delete
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
	      symlink "$$t/../lock_source_44befc1cf3/$$f", $$f;
	    }
	  ' "$${files[@]}" || {
	    for i in "$${files[@]}"; do
	      test -f "../../$$i" -a ! -L "$$i" && ln -sf "$${i//+([^\/])/..}/../lock_source_44befc1cf3/$$i" "$$i"
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
	$(call sandbox, -s) $(build_binds) --chdir /fd/5 $(BASHF) setup_build
endif
	#
ifeq ($(METHOD), rpcemu)
	echo -e '*Set IXFS$$Path HostFS:\n*Obey -v IXFS:$$.dev.fd.5.Unix.LinuxSupport.Build rpcemu $* $(PHASES)' | \
	$(sandbox) \
	--ro-bind /tmp/.X11-unix /tmp/.X11-unix \
	--ro-bind Built/rpcemu /r \
	--tmpfs /r/hostfs \
	--dev-bind /dev/null /r/hd4.hdf \
	--ro-bind Built/boot_iomd_rom /r/roms/ROM \
	$(build_binds) \
	--symlink /fd /r/hostfs/dev/fd \
	--file 0 '/r/hostfs/!Boot,fea' \
	--ro-bind-try /etc/machine-id /etc/machine-id \
	--ro-bind-try /var/lib/dbus/machine-id /var/lib/dbus/machine-id \
	--chdir /r /r/rpcemu
else ifeq ($(INSECURE), YES)
	env -i $(if $(VERBOSE), RISC_OS_Alias_Obey='%%Obey -v %*0') JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey IXFS#S:$$.dev.fd.5.Unix.LinuxSupport.Build Linux $* $(PHASES)' '$(LINUX_ROM)' --abort-on-input 5<. 8<'${ACORN_CPP}' </dev/null |& cat
else
	env -i $(if $(VERBOSE), RISC_OS_Alias_Obey='%%Obey -v %*0') JOBS='$(JOBS)' RISC_OS_Alias_IXFSBoot='Obey IXFS#S:$$.dev.fd.5.Unix.LinuxSupport.Build Linux $* $(PHASES)' $(sandbox) $(build_binds) --ro-bind '$(LINUX_ROM)' /RISC_OS --chdir /fd/5 sh -c 'exec "$$0" "$$@" 5</fd/5 8</fd/8;' '$(QEMU)' /RISC_OS --abort-on-input </dev/null |& cat
endif
	find Build2/$*/RiscOS/Images -type l -delete
	! mv 'Build2/$*/RiscOS/Images/rom',??? 'Build2/$*/RiscOS/Images/rom'
	! setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 'Build2/$*/RiscOS/Images/rom'
	true

Build2/IOMD32/RiscOS/Images/rom_check: Build2/IOMD32/RiscOS/Images/rom Built/rpcemu/rpcemu
	Unix/LinuxSupport/test_runner_rpcemu.sh Build2/IOMD32/RiscOS/Images/rom
	touch Build2/IOMD32/RiscOS/Images/rom_check

ifeq ($(INSECURE), YES)
Build2/Linux/RiscOS/Images/rom_check: Build2/Linux/RiscOS/Images/rom
	chmod +x Build2/Linux/RiscOS/Images/rom
	touch Build2/Linux/RiscOS/Images/rom_check
else
Build2/Linux/RiscOS/Images/rom_check: Build2/Linux/RiscOS/Images/rom Built/qemu-link
	chmod +x Build2/Linux/RiscOS/Images/rom
	Unix/LinuxSupport/test_runner_linux.sh Build2/Linux/RiscOS/Images/rom
	touch Build2/Linux/RiscOS/Images/rom_check
endif

Built/RISCOS.IMG: Build2/Linux/RiscOS/Images/rom_check
	cp --remove-destination --preserve=mode,xattr --reflink=auto Build2/Linux/RiscOS/Images/rom Built/RISCOS.IMG

fast: PHASES=install_rom join
fast: check
check: build

Unix/RISC_OS/Unix/RISCOS.IMG:
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
	mkdir -p Unix/RISC_OS/Unix/LinuxSupport
	cp -v --reflink=auto --preserve=mode,xattr Unix/LinuxSupport/!(arm_test.s|arm_test.sh|Makefile|bin|build.mk|Build,feb|BufferWriteC) Unix/RISC_OS/Unix/LinuxSupport/
	cp -v --reflink=auto --preserve=mode,xattr README.md Unix/RISC_OS/
	cp -v --reflink=auto --preserve=mode,xattr Built/RISCOS.IMG Unix/RISC_OS/Unix/
	#
	cp -vrL Unix/SocketKVMFrontends Unix/RISC_OS/Unix/SocketKVMFrontends
	ln -sf 'Unix/LinuxSupport/Start_RISC_OS.desktop' 'Unix/RISC_OS/Start_RISC_OS.desktop'
	ln -sf 'Unix/LinuxSupport/run_RISC_OS' 'Unix/RISC_OS/run_RISC_OS'
	ln -sf 'Unix/LinuxSupport/common.mk' 'Unix/RISC_OS/Makefile'
	#
	echo "# Source and build GIT commits
	SOURCE=$$SOURCE
ifneq ($(METHOD), rpcemu)
	BINARY=$$BINARY
endif
	LINUX='$$(uname -a)'
	" > Unix/RISC_OS/Unix/LinuxSupport/source
	#
	(
	  cd Unix/RISC_OS
	  git add -A
	  git commit -m "Rebuilt binary from $$SOURCE"
	)
	git add -u
	git commit -m "Rebuilt bootstrap binary"
