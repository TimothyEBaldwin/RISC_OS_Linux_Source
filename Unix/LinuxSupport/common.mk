#!/usr/bin/make -f
#
# Copyright (c) 2013-2019, Timothy Baldwin
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

HARDDISC4=$(HOME)/Downloads/HardDisc4.5.28.util
QEMU_SRC=$(HOME)/Downloads/qemu-5.2.0.tar.xz
RPCEMU=$(HOME)/Downloads/rpcemu-0.9.3.tar.gz
IOMD=$(HOME)/Downloads/IOMD-Soft.5.28.zip

LINUX_ROM=Unix/RISCOS.IMG
VERBOSE=

# From: https://www.gnu.org/software/make/manual/html_node/Call-Function.html#Call-Function
pathsearch = $(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(PATH)))))

QEMU1:=$(call pathsearch,qemu-arm)
BASH:=$(call pathsearch,bash)
BWRAP=bwrap
export BWARP

SHELL=$(BASH)
JOBS:=$(shell getconf _NPROCESSORS_ONLN)
QEMU:=$(shell . Unix/LinuxSupport/lib.sh; arm_test || kill $$PPID; echo "$$QEMU")
export JOBS

.SHELLFLAGS:=-e -c $(if $(VERBOSE), -x)
BASHF:=$(BASH) $(.SHELLFLAGS)
.ONESHELL:
.SILENT:

.SUFFIXES:
.DELETE_ON_ERROR:
.PHONY: all script-all

all: comma2attr

robind = $(foreach dir,$(wildcard $(1)),--ro-bind $(dir) $(dir))
sandbox = $(BWRAP) --die-with-parent --cap-drop ALL --unsetenv TMPDIR --unshare-all --seccomp 9 9< <(Built/gen_seccomp $(1)) --proc /proc --dir /tmp $(call robind,/bin /lib* /usr /etc/alternatives) --dev /dev --tmpfs /usr/local
lib_depends := $(wildcard /etc/alternatives /etc/ld.so.* Unix/LinuxSupport/*.mk)

include $(wildcard Unix/LinuxSupport/build.mk)
include $(wildcard Unix/SocketKVMFrontends/build.mk)

SHELL=$(warning Building $@)$(BASH)

script-all: HardDisc4 Built/wrapper Built/wait_stdin Built/qemu-link

Built:
	! setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 Unix/RISCOS.IMG
	mkdir Built

comma2attr: Built/comma2attr
	ln -sf Built/comma2attr comma2attr

Built/comma2attr: Unix/LinuxSupport/comma2attr.c $(lib_depends) | Built
	gcc -std=gnu99 -Wall -g Unix/LinuxSupport/comma2attr.c -o Built/comma2attr

Built/wait_stdin: Unix/LinuxSupport/wait_stdin.c $(lib_depends) | Built
	gcc -std=c99 -Wall -Os Unix/LinuxSupport/wait_stdin.c -o Built/wait_stdin

Built/wrapper: Unix/LinuxSupport/wrapper.c $(lib_depends) | Built
	gcc -std=gnu99 -Wall -Os Unix/LinuxSupport/wrapper.c -o Built/wrapper

Built/gen_seccomp: Unix/LinuxSupport/gen_seccomp.c $(lib_depends) | Built
	gcc -std=c99 -Wall -Os Unix/LinuxSupport/gen_seccomp.c -o Built/gen_seccomp -lseccomp

Built/seccomp%: Built/gen_seccomp
	Built/gen_seccomp $* > $@

Built/rpcemu/stamp3: $(RPCEMU) Unix/LinuxSupport/rpcemu.diff | Built/gen_seccomp
	set -o pipefail
	rm -rf Built/rpcemu*
	mkdir -p Built/rpcemu_files
	unpack() {
	  echo "33b89e02e62b5621c625aa6d388d3a357e7ee013e74a00fcf53ef68f31d19605 /rpcemu.tar.gz" | sha256sum -c
	  tar -zxf /rpcemu.tar.gz
	  cd rpcemu-0.9.3
	  patch -p1 < /d
	  touch stamp3
	}
	export -f unpack
	$(sandbox) --file 8 8<'$(RPCEMU)' /rpcemu.tar.gz --ro-bind Unix/LinuxSupport/rpcemu.diff /d --bind Built/rpcemu_files /r --chdir /r $(BASHF) unpack </dev/null |& cat
	mv Built/rpcemu_files/rpcemu-0.9.3 Built/rpcemu

Built/rpcemu/rpcemu: Built/rpcemu/stamp3 | Built/gen_seccomp
	set -o pipefail
	+cp Unix/LinuxSupport/rpcemu.cfg Built/rpcemu/rpc.cfg
	build() {
	  touch hd4.hdf roms/ROM
	  (
	    cd src/qt5
	    if uname -m | grep -E -q 'x86|i386'; then
	      qtchooser -run-tool=qmake -qt=5 CONFIG+=dynarec
	    else
	      qtchooser -run-tool=qmake -qt=5
	    fi
	    $(MAKE)
	  )
	  rm -f poduleroms/SyncClock,ffa
	  echo H4sIAISQCFUCA2NgYDNTuO7MAAdlTAEM+Q4MDgwaNgxoQABdgOHVGoZ/DK8ZZoJlQxQ4uHQmMDGw\
	wWSZGWgP+EUYGJb8FXD8z5jIIAgV+0CMRm5GBgYTBgYAXYSkcwABAAA= | base64 -d | gzip -d > cmos.ram
	  touch rpcemu
	}
	export -f build
	$(sandbox) --bind Built/rpcemu /r --chdir /r $(BASHF) build </dev/null |& cat

Built/qemu_stamp-v5.2.0: ${QEMU_SRC} Unix/LinuxSupport/qemu_swi.diff | Built/gen_seccomp
	set -o pipefail
	rm -rf Built/qemu*
	mkdir -p Built/qemu_files
	unpack() {
	  echo "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc /qemu.tar.xz" | sha256sum -c
	  tar -Jxf /qemu.tar.xz
	  cd qemu-5.2.0
	  patch -p1 < /d
	}
	export -f unpack
	$(call sandbox,-s) --file 8 8<'${QEMU_SRC}' /qemu.tar.xz --ro-bind Unix/LinuxSupport/qemu_swi.diff /d --bind Built/qemu_files /q --chdir /q $(BASHF) unpack </dev/null |& cat
	mv Built/qemu_files/qemu-5.2.0 Built/qemu
	touch Built/qemu_stamp-v5.2.0

Built/qemu_Makefile_stamp: Built/qemu_stamp-v5.2.0 | Built/gen_seccomp
	set -o pipefail
	mkdir -p Built/cache
	env -i HOME=/ MAKEFLAGS="$$MAKEFLAGS" CCACHE_DIR=/c PATH="/usr/lib/ccache:$$PATH" $(call sandbox,-s) --bind Built/cache /c --bind Built/qemu /q --chdir /q ./configure --enable-attr --target-list=arm-linux-user --disable-werror </dev/null |& cat
	touch Built/qemu_Makefile_stamp

Built/qemu-arm: Built/qemu_Makefile_stamp | Built/gen_seccomp
	set -o pipefail
	+env -i HOME=/ MAKEFLAGS="$$MAKEFLAGS" CCACHE_DIR=/c PATH="/usr/lib/ccache:$$PATH" PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin $(call sandbox,-s) --bind Built/cache /c --bind Built/qemu /q --chdir /q $(MAKE) </dev/null |& cat
	test ! -L Built/qemu/build
	test ! -L Built/qemu/build/qemu-arm
	ln -f Built/qemu/build/qemu-arm Built/qemu-arm
	touch Built/qemu-arm

Built/qemu-link: $(QEMU) | Built
	QEMU="$(QEMU)"
	ln -sfn "$${QEMU##Built/}" Built/qemu-link

HardDisc4: | $(HARDDISC4) Built/gen_seccomp Built/qemu-link $(LINUX_ROM)
	set -o pipefail
	! rm -rf HardDisc4_files
	mkdir HardDisc4_files
	cp --reflink=auto '$(HARDDISC4)' HardDisc4_files/hd4,ffc
	echo '64607412d987a3f974217f109128de89e1ec9a6cd3284f52b3cf9c39fa0f6b60 *HardDisc4_files/hd4,ffc' | sha256sum -c
ifeq ($(INSECURE), YES)
	env -i RISC_OS_Alias_IXFSBoot='Echo Extracting HardDisc4
	/IXFS:$$.proc.self.cwd.HardDisc4_files.hd4
	BASIC -quit IXFS:$$.proc.self.cwd.Unix.LinuxSupport.Finish' '$(LINUX_ROM)' \
	 --abort-on-input --nvram /HardDisc4_files/CMOS
else
	env -i RISC_OS_Alias_IXFSBoot='Echo Extracting HardDisc4
	/IXFS:$$.HardDisc4_files.hd4
	BASIC -quit IXFS:$$.Finish' $(sandbox) \
	 --ro-bind Unix/LinuxSupport/Finish /Finish --bind HardDisc4_files /HardDisc4_files \
	 --ro-bind '$(LINUX_ROM)' /RISC_OS --ro-bind Built /Built \
	 /Built/qemu-link /RISC_OS  --abort-on-input --nvram /HardDisc4_files/CMOS </dev/null |& cat
endif
	cp -a --reflink=auto 'HardDisc4_files/HardDisc4/!Boot/RO520Hook/Boot' 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot'
	printf 'X AddTinyDir IXFS:$$\nX AddTinyDir <IXFS$$HardDisc4>\n' > 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot/Tasks/Pinboard,feb'
	mkdir 'HardDisc4_files/HardDisc4/!Boot/Loader'
	mv HardDisc4_files/CMOS 'HardDisc4_files/HardDisc4/!Boot/Loader/CMOS'
	mv HardDisc4_files/HardDisc4 .
	echo Finished extracting HardDisc4

Built/boot_iomd_rom: $(IOMD) | Built/gen_seccomp
	echo 'd1e955ff8e6dce905c455b9135391f3f1879673965fb4949c5f10716b4fe3e3e *$(IOMD)' | sha256sum -c
	$(sandbox) --ro-bind '$(IOMD)' /iomd.zip unzip -p iomd.zip "soft/!Boot/Choices/Boot/PreDesk/!!SoftLoad/riscos" > $@
	echo '051bd488965d43dc8d74757ee29fe72927e0f018dfe45e9c88e511496f0ec316 *$@' | sha256sum -c
	setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 $@ || true

$(HARDDISC4):
	sh Unix/LinuxSupport/download.sh '$(HARDDISC4)' "https://www.riscosopen.org/zipfiles/platform/common/HardDisc4.5.28.util" "64607412d987a3f974217f109128de89e1ec9a6cd3284f52b3cf9c39fa0f6b60"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fcffff00000000 $@ || true

$(IOMD):
	sh Unix/LinuxSupport/download.sh '$(IOMD)' "https://www.riscosopen.org/zipfiles/platform/riscpc/IOMD-Soft.5.28.zip" "d1e955ff8e6dce905c455b9135391f3f1879673965fb4949c5f10716b4fe3e3e"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${QEMU_SRC}:
	sh Unix/LinuxSupport/download.sh '${QEMU_SRC}' "https://download.qemu.org/qemu-5.2.0.tar.xz" "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fdffff00000000 $@ || true

$(RPCEMU):
	sh Unix/LinuxSupport/download.sh '$(RPCEMU)' "http://www.marutan.net/rpcemu/cgi/download.php?sFName=0.9.3/rpcemu-0.9.3.tar.gz" "33b89e02e62b5621c625aa6d388d3a357e7ee013e74a00fcf53ef68f31d19605"
	setfattr -n user.RISC_OS.LoadExec -v 0x0089ffff00000000 $@ || true
