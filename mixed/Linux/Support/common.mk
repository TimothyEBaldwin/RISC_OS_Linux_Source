#!/usr/bin/make -f
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

HARDDISC4=$(HOME)/Downloads/HardDisc4.5.24.zip
QEMU_SRC=$(HOME)/Downloads/qemu-3.0.0.tar.xz
RPCEMU=$(HOME)/Downloads/rpcemu-0.8.15.tar.gz
IOMD=$(HOME)/Downloads/IOMD-Soft.5.24.zip

LINUX_ROM=./RISC_OS

# From: https://www.gnu.org/software/make/manual/html_node/Call-Function.html#Call-Function
pathsearch = $(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(PATH)))))

QEMU1:=$(call pathsearch,qemu-arm)
BASH:=$(call pathsearch,bash)
BWRAP:=$(call pathsearch,bwrap)
export BWRAP
export QEMU1

SHELL=$(BASH)
JOBS:=$(shell getconf _NPROCESSORS_ONLN)
export JOBS

SHELL=$(warning Building $@)$(BASH)
.SHELLFLAGS=-x -e -c
.ONESHELL:
.SILENT:

.SUFFIXES:
.DELETE_ON_ERROR:
.PHONY: all script-all

all: sdl Start_RISC_OS.desktop comma2attr

ifeq ($(INSECURE), YES)
QEMU:=/usr/bin/env
else
include Built/sandbox_config_make
all: Built/sandbox_config_sh
script-all: Built/sandbox_config_sh
endif

robind = $(foreach dir,$(wildcard $(1)),--ro-bind $(dir) $(dir))
sandbox_misc := $(sandbox_root) $(call robind,/usr/bin /usr/lib* /etc/alternatives)
sandbox_build := $(sandbox_root) $(call robind,/usr /etc/alternatives) --dev /dev --tmpfs /usr/local
sandbox_base = $(BWRAP) --unsetenv TMPDIR --unshare-all --seccomp 9 9< <(Built/gen_seccomp $(1)) --proc /proc --dir /tmp --dir /dev/shm
ldd2sandbox = env -i $(sandbox_base) $(sandbox_misc) --ro-bind $(1) /exe ldd /exe < /dev/null | sed -nr 's:^(.*[ \t])?((/usr)?/lib[-A-Za-z_0-9]*(/[-A-Za-z_0-9][-A-Za-z._0-9\+]*)+)([ \t].*)?$$:--ro-bind \2 \2:p'  | sort -u | tr '\n' ' '
lib_depends := $(wildcard /etc/alternatives /etc/ld.so.* Support/*.mk)
frontend_depends := Support/Keyboard.h Support/frontend_common.h Support/SocketKVM_Protocol.h $(lib_depends)

include $(wildcard Support/build.mk)

script-all: Built/sdl RISC_OS HardDisc4 Built/wrapper

RISC_OS:

Built:
	mkdir Built

sdl: Built/sdl
	ln -sf Built/sdl sdl

opengl: Built/opengl
	ln -sf Built/opengl opengl

comma2attr: Built/comma2attr
	ln -sf Built/comma2attr comma2attr

Start_RISC_OS.desktop:
	ln -s Support/Start_RISC_OS.desktop

Built/sdl: Support/sdl.cpp Built/sdlkey.h $(frontend_depends)
	g++ --std=c++11 -Wall -pthread -g -O2 -IBuilt Support/sdl.cpp  `sdl2-config --cflags --libs` -o Built/sdl

Built/opengl: Support/opengl.cpp $(frontend_depends)
	g++ -pthread -g -O2 --std=c++11 Support/opengl.cpp -lGL -lGLU -lglut -o Built/opengl

Built/sdlkey.h: Support/sdlkey.c $(lib_depends) Support/Keyboard.h | Built
	gcc -std=gnu99 -Wall -IBuilt Support/sdlkey.c `sdl2-config --cflags --libs` -o Built/sdlkey
	Built/sdlkey > $@

Built/comma2attr: Support/comma2attr.c $(lib_depends) | Built
	gcc -std=gnu99 -Wall -g Support/comma2attr.c -o Built/comma2attr

Built/wrapper: Support/wrapper.c $(lib_depends) | Built
	gcc -std=gnu99 -Wall -Os Support/wrapper.c -o Built/wrapper

Built/gen_seccomp: Support/gen_seccomp.c $(lib_depends) | Built
	gcc -std=c99 -Wall -Os Support/gen_seccomp.c -o Built/gen_seccomp -lseccomp

Built/seccomp%: Built/gen_seccomp
	Built/gen_seccomp $* > $@

Built/rpcemu/stamp: $(RPCEMU) | Built/gen_seccomp
	rm -rf Built/rpcemu*
	mkdir -p Built/rpcemu_files
	cp --reflink=auto '$(RPCEMU)' Built/rpcemu_files/rpcemu.tar.gz
	unpack() {
	  echo "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9 rpcemu.tar.gz" | sha256sum -c
	  tar -zxf rpcemu.tar.gz
	  cd rpcemu-0.8.15
	  patch -p1
	  touch stamp
	}
	export -f unpack
	cat Support/rpcemu_exit.diff | $(sandbox_base) $(sandbox_misc) --bind Built/rpcemu_files /r --chdir /r bash -x -e -c unpack
	mv Built/rpcemu_files/rpcemu-0.8.15 Built/rpcemu

Built/rpcemu/src/Makefile: Built/rpcemu/stamp
	configure() {
	  if uname -m | grep -E -q 'x86|i386'; then
	    ./configure --enable-dynarec CFLAGS="-no-pie -fno-pie"
	  else
	    ./configure
	  fi
	  touch Makefile
	}
	export -f configure
	$(sandbox_base) $(sandbox_build) --bind Built/rpcemu /r --chdir /r/src bash -x -e -c configure

Built/rpcemu/rpcemu: Built/rpcemu/src/Makefile
	+cp Support/rpcemu.cfg Built/rpcemu/rpc.cfg
	build() {
	  touch hd4.hdf roms/ROM
	  $(MAKE) -C src
	  ! rm poduleroms/SyncClock,ffa
	  echo H4sIAISQCFUCA2NgYDNTuO7MAAdlTAEM+Q4MDgwaNgxoQABdgOHVGoZ/DK8ZZoJlQxQ4uHQmMDGw\
	wWSZGWgP+EUYGJb8FXD8z5jIIAgV+0CMRm5GBgYTBgYAXYSkcwABAAA= | base64 -d | gzip -d > cmos.ram
	  touch rpcemu
	}
	export -f build
	$(sandbox_base) $(sandbox_build) --bind Built/rpcemu /r --chdir /r bash -x -e -c build

Built/qemu_stamp-v3.0.0: ${QEMU_SRC} | Built/gen_seccomp
	rm -rf Built/qemu*
	mkdir -p Built/qemu_files
	cp --reflink=auto '${QEMU_SRC}' Built/qemu_files/qemu.tar.xz
	unpack() {
	  echo "8d7af64fe8bd5ea5c3bdf17131a8b858491bcce1ee3839425a6d91fb821b5713 qemu.tar.xz" | sha256sum -c
	  tar -Jxf qemu.tar.xz
	  cd qemu-3.0.0
	  patch -p1
	}
	export -f unpack
	cat Support/qemu_swi.diff | $(call sandbox_base,-s) $(sandbox_misc) --bind Built/qemu_files /q --chdir /q bash -x -e -c unpack
	mv Built/qemu_files/qemu-3.0.0 Built/qemu
	touch Built/qemu_stamp-v3.0.0

Built/qemu_Makefile_stamp: Built/qemu_stamp-v3.0.0
	$(call sandbox_base,-s) $(sandbox_build) --bind Built/qemu /q --chdir /q ./configure --enable-attr --target-list=arm-linux-user --disable-werror
	touch Built/qemu_Makefile_stamp

Built/qemu-arm: Built/qemu_Makefile_stamp
	+$(call sandbox_base,-s) $(sandbox_build) --bind Built/qemu /q --chdir /q $(MAKE)
	test ! -L Built/qemu/arm-linux-user
	test ! -L Built/qemu/arm-linux-user/qemu-arm
	ln -f Built/qemu/arm-linux-user/qemu-arm Built/qemu-arm
	touch Built/qemu-arm

Built/sandbox_config_sh: $(QEMU) Built/gen_seccomp
	set -o pipefail
	exec > Built/sandbox_config_sh
ifeq ($(QEMU),/usr/bin/env)
	echo QEMU=

	echo -n 'auto_bwrap_args=( '
else
	echo QEMU=/qemu-arm
	echo -n 'auto_bwrap_args=( '
	$(call ldd2sandbox,$(QEMU))
	echo -n '--ro-bind $(QEMU) /qemu-arm '
endif
	for i in --die-with-parent --as-pid-1 "--cap-drop ALL"; do
	  if $(BWRAP) --unshare-all $$i --dev-bind / / true; then
	    echo -n "$$i "
	  fi
	done
	echo \)

Built/sandbox_config_make: Built/gen_seccomp $(LINUX_ROM) /bin
	set -o pipefail
	$(BWRAP) --ro-bind / /  true
	#
	for i in /bin /sbin /lib*; do
	  if [[ -L $$i ]]; then
	    sandbox_root+=(--symlink "$$(readlink "$$i")" "$$i")
	  else
	    sandbox_root+=(--ro-bind "$$i" "$$i")
	  fi
	done
	#
	export RISC_OS_Alias_IXFSBoot='BASIC -quit IXFS:$.Finish'
	if $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS /RISC_OS; then
	  QEMU1=/usr/bin/env
	elif ! $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS $$($(call ldd2sandbox,"$$QEMU1")) --ro-bind "$$QEMU1" /qemu-arm /qemu-arm /RISC_OS; then
	  QEMU1=Built/qemu-arm
	fi
	echo "sandbox_root:=$${sandbox_root[@]@Q}
	QEMU:=$$QEMU1" > $@

HardDisc4: | $(HARDDISC4)
	set -o pipefail
	! rm -rf HardDisc4_files
	mkdir HardDisc4_files
	cp --reflink=auto '$(HARDDISC4)' HardDisc4_files/HardDisc4.zip
	unpack() {
	  echo 'b2229fbf5f08026d99e2fd552431187d868b3276816b1429709d0594b4a400bc *HardDisc4.zip' | sha256sum -c
	  unzip HardDisc4.zip
	  rm HardDisc4.zip
	  chmod -R u+rw .
	  mv 'HardDisc4/!Boot/!Run' 'HardDisc4/!Boot/!Run_real,feb'
	  {
	    echo 'Dir <Obey$$Dir>.^'
	    cat ../Support/hd4_types
	    echo -n '
	      Remove <Obey$$Dir>.!Run
	      Rename <Obey$$Dir>.!Run_real <Obey$$Dir>.!Run
	      /<Obey$$Dir>'
	  } >> 'HardDisc4/!Boot/!Run,feb'
	  cp -a --reflink=auto 'HardDisc4/!Boot/RO520Hook/Boot' 'HardDisc4/!Boot/Choices/Boot'
	  printf 'X AddTinyDir IXFS:$$\nX AddTinyDir <IXFS$$HardDisc4>\n' > 'HardDisc4/!Boot/Choices/Boot/Tasks/Pinboard,feb'
	}
ifeq ($(INSECURE), YES)
	( cd HardDisc4_files && unpack )
else
	export -f unpack
	$(sandbox_base) $(sandbox_misc) --ro-bind Support /Support --bind HardDisc4_files /hd4 --chdir /hd4 bash -x -e -c unpack
endif
	mv HardDisc4_files/HardDisc4 .

Built/boot_iomd_rom: $(IOMD) | Built
	echo 'a9eb33be72f0ead8c6263dd15da5648639094e6b34001739363571fe08fc9d91 *$(IOMD)' | sha256sum -c
	unzip -p '$(IOMD)' "soft/!Boot/Choices/Boot/PreDesk/!!SoftLoad/riscos" > $@
	echo '8d51bc41f479ebdaa2ceb2a2ba3bab59473dced135881685a0ae0b5ea89f1491 *$@' | sha256sum -c
	setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 $@ || true

$(HARDDISC4):
	sh Support/download.sh '$(HARDDISC4)' "https://www.riscosopen.org/zipfiles/platform/common/HardDisc4.5.24.zip" "b2229fbf5f08026d99e2fd552431187d868b3276816b1429709d0594b4a400bc"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

$(IOMD):
	sh Support/download.sh '$(IOMD)' "https://www.riscosopen.org/zipfiles/platform/riscpc/IOMD-Soft.5.24.zip" "a9eb33be72f0ead8c6263dd15da5648639094e6b34001739363571fe08fc9d91"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${QEMU_SRC}:
	sh Support/download.sh '${QEMU_SRC}' "https://download.qemu.org/qemu-3.0.0.tar.xz" "8d7af64fe8bd5ea5c3bdf17131a8b858491bcce1ee3839425a6d91fb821b5713"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fdffff00000000 $@ || true

$(RPCEMU):
	sh Support/download.sh '$(RPCEMU)' "http://www.marutan.net/rpcemu/cgi/download.php?sFName=0.8.15/rpcemu-0.8.15.tar.gz" "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9"
	setfattr -n user.RISC_OS.LoadExec -v 0x0089ffff00000000 $@ || true
