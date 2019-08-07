#!/usr/bin/make -f
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

HARDDISC4=$(HOME)/Downloads/HardDisc4.5.24.util
QEMU_SRC=$(HOME)/Downloads/qemu-4.0.0.tar.xz
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
.SHELLFLAGS=-e -c
.ONESHELL:
.SILENT:

.SUFFIXES:
.DELETE_ON_ERROR:
.PHONY: all script-all

all: comma2attr

ifeq ($(INSECURE), YES)
QEMU:=/usr/bin/env
else
include Built/sandbox_config_make
all: Built/sandbox_config_sh
script-all: Built/sandbox_config_sh
endif

robind = $(foreach dir,$(wildcard $(1)),--ro-bind $(dir) $(dir))
sandbox_misc := $(call robind,/bin /lib* /usr/bin /usr/lib* /etc/alternatives)
sandbox_build := $(call robind,/bin /lib* /usr /etc/alternatives) --dev /dev --tmpfs /usr/local
sandbox_base = $(BWRAP) --unsetenv TMPDIR --unshare-all $(if $(use_seccomp), --seccomp 9 9< <(Built/gen_seccomp $(1)), --new-session) --proc /proc --dir /tmp --dir /dev/shm
ldd2sandbox = env -i $(sandbox_base) $(sandbox_misc) --ro-bind $(1) /exe ldd /exe < /dev/null | sed -nr 's:^(.*[ \t])?((/usr)?/lib[-A-Za-z_0-9]*(/[-A-Za-z_0-9][-A-Za-z._0-9\+]*)+)([ \t].*)?$$:--ro-bind \2 \2:p'  | sort -u | tr '\n' ' '
lib_depends := $(wildcard /etc/alternatives /etc/ld.so.* Support/*.mk)

include $(wildcard Support/build.mk)

script-all: RISC_OS HardDisc4 Built/wrapper

RISC_OS:

comma2attr: Built/comma2attr
	ln -sf Built/comma2attr comma2attr

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
	cat Support/rpcemu_exit.diff | $(sandbox_base) $(sandbox_misc) --bind Built/rpcemu_files /r --chdir /r $(BASH) -e -c unpack
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
	$(sandbox_base) $(sandbox_build) --bind Built/rpcemu /r --chdir /r/src $(BASH) -e -c configure

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
	$(sandbox_base) $(sandbox_build) --bind Built/rpcemu /r --chdir /r $(BASH) -e -c build

Built/qemu_stamp-v4.0.0: ${QEMU_SRC} | Built/gen_seccomp
	rm -rf Built/qemu*
	mkdir -p Built/qemu_files
	cp --reflink=auto '${QEMU_SRC}' Built/qemu_files/qemu.tar.xz
	unpack() {
	  echo "13a93dfe75b86734326f8d5b475fde82ec692d5b5a338b4262aeeb6b0fa4e469 qemu.tar.xz" | sha256sum -c
	  tar -Jxf qemu.tar.xz
	  cd qemu-4.0.0
	  patch -p1
	}
	export -f unpack
	cat Support/qemu_swi.diff | $(call sandbox_base,-s) $(sandbox_misc) --bind Built/qemu_files /q --chdir /q $(BASH) -e -c unpack
	mv Built/qemu_files/qemu-4.0.0 Built/qemu
	touch Built/qemu_stamp-v4.0.0

Built/qemu_Makefile_stamp: Built/qemu_stamp-v4.0.0
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
	echo use_seccomp=$(use_seccomp)
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
	if $(BWRAP) --seccomp 9 9< <(Built/gen_seccomp) --ro-bind / /  true; then
	  use_seccomp=true
	fi
	#
	export RISC_OS_Alias_IXFSBoot='BASIC -quit IXFS:$$.Finish'
	if $(sandbox_base) --ro-bind '$(LINUX_ROM)' /RISC_OS /RISC_OS --help; then
	  $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS /RISC_OS;
	  QEMU1=/usr/bin/env
	elif ! $(sandbox_base) --ro-bind Support/Finish /Finish --ro-bind '$(LINUX_ROM)' /RISC_OS $$($(call ldd2sandbox,"$$QEMU1")) --ro-bind "$$QEMU1" /qemu-arm /qemu-arm /RISC_OS; then
	  QEMU1=Built/qemu-arm
	fi
	echo "use_seccomp:=$$use_seccomp
	QEMU:=$$QEMU1" > $@

HardDisc4: | $(HARDDISC4) Built/sandbox_config_sh $(LINUX_ROM)
	set -o pipefail
	! rm -rf HardDisc4_files
	mkdir HardDisc4_files
	cp --reflink=auto '$(HARDDISC4)' HardDisc4_files/hd4,ffc
	echo 'c6e19fcc9a9783cbb8ebf5d1c52464ca810bf94ad6509bbe4818391c6bc8d4f4 *HardDisc4_files/hd4,ffc' | sha256sum -c
ifeq ($(INSECURE), YES)
	env -i RISC_OS_Alias_IXFSBoot='/IXFS:$$.proc.self.cwd.HardDisc4_files.hd4
	BASIC -quit IXFS:$$.proc.self.cwd.Support.Finish' '$(LINUX_ROM)'
else
	. Built/sandbox_config_sh
	env -i RISC_OS_Alias_IXFSBoot='/IXFS:$$.HardDisc4_files.hd4
	BASIC -quit IXFS:$$.Finish' $(sandbox_base) \
	 --ro-bind Support/Finish /Finish --bind HardDisc4_files /HardDisc4_files \
	 --ro-bind '$(LINUX_ROM)' /RISC_OS "$${auto_bwrap_args[@]}" $$QEMU /RISC_OS </dev/null 2>&1 | cat
endif
	cp -a --reflink=auto 'HardDisc4_files/HardDisc4/!Boot/RO520Hook/Boot' 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot'
	printf 'X AddTinyDir IXFS:$$\nX AddTinyDir <IXFS$$HardDisc4>\n' > 'HardDisc4_files/HardDisc4/!Boot/Choices/Boot/Tasks/Pinboard,feb'
	mv HardDisc4_files/HardDisc4 .

Built/boot_iomd_rom: $(IOMD) | Built
	echo 'a9eb33be72f0ead8c6263dd15da5648639094e6b34001739363571fe08fc9d91 *$(IOMD)' | sha256sum -c
	unzip -p '$(IOMD)' "soft/!Boot/Choices/Boot/PreDesk/!!SoftLoad/riscos" > $@
	echo '8d51bc41f479ebdaa2ceb2a2ba3bab59473dced135881685a0ae0b5ea89f1491 *$@' | sha256sum -c
	setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 $@ || true

$(HARDDISC4):
	sh Support/download.sh '$(HARDDISC4)' "https://www.riscosopen.org/zipfiles/platform/common/HardDisc4.5.24.util" "c6e19fcc9a9783cbb8ebf5d1c52464ca810bf94ad6509bbe4818391c6bc8d4f4"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fcffff00000000 $@ || true

$(IOMD):
	sh Support/download.sh '$(IOMD)' "https://www.riscosopen.org/zipfiles/platform/riscpc/IOMD-Soft.5.24.zip" "a9eb33be72f0ead8c6263dd15da5648639094e6b34001739363571fe08fc9d91"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${QEMU_SRC}:
	sh Support/download.sh '${QEMU_SRC}' "https://download.qemu.org/qemu-4.0.0.tar.xz" "13a93dfe75b86734326f8d5b475fde82ec692d5b5a338b4262aeeb6b0fa4e469"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fdffff00000000 $@ || true

$(RPCEMU):
	sh Support/download.sh '$(RPCEMU)' "http://www.marutan.net/rpcemu/cgi/download.php?sFName=0.8.15/rpcemu-0.8.15.tar.gz" "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9"
	setfattr -n user.RISC_OS.LoadExec -v 0x0089ffff00000000 $@ || true
