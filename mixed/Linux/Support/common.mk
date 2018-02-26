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

HARDDISC4=$(HOME)/Downloads/HardDisc4.5.22.zip
QEMU_SRC=$(HOME)/Downloads/qemu-2.11.0.tar.xz
RPCEMU=$(HOME)/Downloads/rpcemu-0.8.15.tar.gz
IOMD=$(HOME)/Downloads/IOMD-Soft.5.22.zip

LINUX_ROM=./RISC_OS

# From: https://www.gnu.org/software/make/manual/html_node/Call-Function.html#Call-Function
pathsearch = $(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(PATH)))))

QEMU1:=$(call pathsearch,qemu-arm)
BASH:=$(call pathsearch,bash)
BWRAP:=$(call pathsearch,bwrap)
export BWRAP

SHELL=$(BASH)
JOBS:=$(shell getconf _NPROCESSORS_ONLN)
export JOBS

SHELL=$(warning Building $@)$(BASH)
.SHELLFLAGS=-x -e -c
.ONESHELL:
.SILENT:

.DELETE_ON_ERROR:
.PHONY: all script-all

robind = $(foreach dir,$(wildcard $(1)),--ro-bind $(dir) $(dir))
sandbox_misc = $(call robind,/bin /lib /lib32 /libx32 /lib64 /usr/bin /usr/lib /usr/lib32 /usr/libx32 /usr/lib64 /etc/alternatives)
sandbox_build = $(call robind,/bin /lib /lib32 /libx32 /lib64 /usr /etc/alternatives) --dev /dev --tmpfs /usr/local
sandbox_base = $(BWRAP) --unsetenv TMPDIR --unshare-all --seccomp 9 9< <(Built/gen_seccomp $(1)) --proc /proc --dir /tmp
ldd2sandbox = env -i $(sandbox_base) $(sandbox_misc) --ro-bind '$(1)' /exe ldd /exe < /dev/null | sed -nr 's:^(.*[ \t])?((/usr)?/lib(|32|x32|64)(/[-A-Za-z_0-9][-A-Za-z._0-9\+]*)+)([ \t].*)?$$:--ro-bind \2 \2:p'  | sort -u | tr '\n' ' '
lib_depends := $(wildcard /etc/alternatives /etc/ld.so.* Support/*.mk)

all: Built/qemu_sandbox sdl Start_RISC_OS.desktop comma2attr

include Built/qemu_path
include $(wildcard Support/build.mk)

script-all: Built/sdl comma2attr Built/qemu_sandbox RISC_OS HardDisc4

RISC_OS:

Built:
	mkdir Built

sdl: Built/sdl
	ln -sf Built/sdl sdl

comma2attr: Built/comma2attr
	ln -sf Built/comma2attr comma2attr

Start_RISC_OS.desktop:
	ln -s Support/Start_RISC_OS.desktop

Built/sdl: Support/sdl.cpp Built/sdlkey.h Support/protocol.h $(wildcard mixed/Linux/SocketKVM/h/protocol)
	g++ --std=c++11 -Wall -pthread -g -O2 -IBuilt Support/sdl.cpp  `sdl2-config --cflags --libs` -o Built/sdl

Built/sdlkey.h: Support/sdlkey.c $(lib_depends) Support/Keyboard.h | Built
	gcc -std=gnu99 -Wall -IBuilt `sdl2-config --cflags --libs` Support/sdlkey.c -o Built/sdlkey
	Built/sdlkey > $@

Built/comma2attr: Support/comma2attr.c $(lib_depends) | Built
	gcc -std=gnu99 -Wall -g Support/comma2attr.c -o Built/comma2attr

Built/gen_seccomp: Support/gen_seccomp.c $(lib_depends) | Built
	gcc -std=c99 -Wall -Os -lseccomp Support/gen_seccomp.c -o Built/gen_seccomp

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

Built/qemu_stamp-v2.11.0: ${QEMU_SRC} | Built/gen_seccomp
	rm -rf Built/qemu*
	mkdir -p Built/qemu_files
	cp --reflink=auto '${QEMU_SRC}' Built/qemu_files/qemu.tar.xz
	unpack() {
	  echo "c9d34a79024eae080ce3853aa9afe503824520eefb440190383003081ce7f437 qemu.tar.xz" | sha256sum -c
	  tar -Jxf qemu.tar.xz
	  cd qemu-2.11.0
	  patch -p1
	}
	export -f unpack
	cat Support/qemu_swi.diff Support/qemu_renameat2.diff | $(sandbox_base) $(sandbox_misc) --bind Built/qemu_files /q --chdir /q bash -x -e -c unpack
	mv Built/qemu_files/qemu-2.11.0 Built/qemu
	touch Built/qemu_stamp-v2.11.0

Built/qemu_Makefile_stamp: Built/qemu_stamp-v2.11.0
	$(call sandbox_base,-s) $(sandbox_build) --bind Built/qemu /q --chdir /q ./configure --enable-attr --target-list=arm-linux-user --disable-werror
	touch Built/qemu_Makefile_stamp

Built/qemu-arm: Built/qemu_Makefile_stamp
	+$(call sandbox_base,-s) $(sandbox_build) --bind Built/qemu /q --chdir /q $(MAKE)
	test ! -L Built/qemu/arm-linux-user
	test ! -L Built/qemu/arm-linux-user/qemu-arm
	ln -f Built/qemu/arm-linux-user/qemu-arm Built/qemu-arm
	touch Built/qemu-arm

Built/qemu_sandbox: $(QEMU) Built/gen_seccomp Built/qemu_path
	set -o pipefail
	exec > Built/qemu_sandbox
ifeq ($(QEMU),/usr/bin/env)
	echo QEMU=
	echo -n QEMU_sandbox=\'
else
	echo QEMU=/qemu-arm
	echo -n QEMU_sandbox=\'
	$(call ldd2sandbox,$(QEMU))
	echo -n '--ro-bind $(QEMU) /qemu-arm '
endif
	if $(BWRAP) --die-with-parent --dev-bind / / true; then
	  echo -n '--die-with-parent '
	fi
	echo \'

Built/qemu_path: Built/gen_seccomp
	set -o pipefail
	export RISC_OS_Alias_IXFSBoot='BASIC -quit IXFS:$.Finish'
	if $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS /RISC_OS; then
	  echo QEMU:=/usr/bin/env > $@
	elif $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS $$($(call ldd2sandbox,$(QEMU1))) --ro-bind '$(QEMU1)' /qemu-arm /qemu-arm /RISC_OS'$(LINUX_ROM)'; then
	  echo QEMU:='$(QEMU1)' > $@
	else
	  echo QEMU:=Built/qemu-arm > $@
	fi

HardDisc4: | $(HARDDISC4) Built/boot_iomd_rom Built/rpcemu/rpcemu Built/comma2attr
	set -o pipefail
	! rm -rf HardDisc4_files
	mkdir HardDisc4_files
	cp --reflink=auto '$(HARDDISC4)' HardDisc4_files/HardDisc4.zip
	unpack() {
	  echo '2b5c2eadb4b4d5cff1ae5dfbce1159c15b41720ef89dcf735062d86074f34083 *HardDisc4.zip' | sha256sum -c
	  unzip -F HardDisc4.zip
	  rm HardDisc4.zip
	  printf '*Shutdown\nSYS &C0200,,,,,,,,1\n' > 'HardDisc4/!Boot/RO520Hook/Boot/Tasks/off,ffb'
	}
	export -f unpack
	$(sandbox_base) $(sandbox_misc) --bind HardDisc4_files /hd4 --chdir /hd4 bash -x -e -c unpack
	printf 'Running Rpcemu...'
	timeout -sKILL 60 $(BWRAP) --unshare-pid --unshare-net --ro-bind /tmp/.X11-unix /tmp/.X11-unix --proc /proc $(sandbox_misc) --ro-bind Built/rpcemu /r --ro-bind Built/boot_iomd_rom /r/roms/ROM --bind HardDisc4_files/HardDisc4 /r/hostfs --dev-bind /dev/null /r/hd4.hdf /r/rpcemu
	printf 'done.\n'
	rm 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot/Tasks/off,ffb' 'HardDisc4_files/HardDisc4/!Boot/RO520Hook/Boot/Tasks/off,ffb'
	printf 'X AddTinyDir IXFS:$$\nX AddTinyDir IXFS:$$.HardDisc4\n' > 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot/Tasks/Pinboard,feb'
	! Built/comma2attr --recurse HardDisc4_files/HardDisc4
	mv HardDisc4_files/HardDisc4 .

Built/boot_iomd_rom: $(IOMD) | Built
	echo '18d56d246fea44e856f11b1173b1f132950e8e8aa145a8cf83836e28061b8544 *$(IOMD)' | sha256sum -c
	unzip -p '$(IOMD)' "soft/!Boot/Choices/Boot/PreDesk/!!SoftLoad/riscos" > $@
	echo '222f7e5443e48071e1b41a1c8098071c6afc9a39973dfe17374aa1a2580df6a3 *$@' | sha256sum -c
	setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 $@ || true

$(HARDDISC4):
	sh Support/download.sh '$(HARDDISC4)' "https://www.riscosopen.org/zipfiles/platform/common/HardDisc4.5.22.zip?1429452894" "2b5c2eadb4b4d5cff1ae5dfbce1159c15b41720ef89dcf735062d86074f34083"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

$(IOMD):
	sh Support/download.sh '$(IOMD)' "https://www.riscosopen.org/zipfiles/platform/riscpc/IOMD-Soft.5.22.zip?1429651024" "18d56d246fea44e856f11b1173b1f132950e8e8aa145a8cf83836e28061b8544"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${QEMU_SRC}:
	sh Support/download.sh '${QEMU_SRC}' "https://download.qemu.org/qemu-2.11.0.tar.xz" "c9d34a79024eae080ce3853aa9afe503824520eefb440190383003081ce7f437"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fdffff00000000 $@ || true

$(RPCEMU):
	sh Support/download.sh '$(RPCEMU)' "http://www.marutan.net/rpcemu/cgi/download.php?sFName=0.8.15/rpcemu-0.8.15.tar.gz" "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9"
	setfattr -n user.RISC_OS.LoadExec -v 0x0089ffff00000000 $@ || true
