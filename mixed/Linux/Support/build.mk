#!/usr/bin/make -f

HARDDISC4=${HOME}/Downloads/HardDisc4.5.22.zip
QEMU_SRC=${HOME}/Downloads/qemu-2.11.0.tar.xz
RPCEMU=${HOME}/Downloads/rpcemu-0.8.15.tar.gz
IOMD=${HOME}/Downloads/IOMD-Soft.5.22.zip

LINUX_ROM=mixed/Linux/Support/bin/!Boot/Linux/RISC_OS
ACORN_CPP=../DDE/AcornC.C++

#JOBS=$(shell getconf _NPROCESSORS_ONLN)
export JOBS
QEMU=$(shell if uname -m | grep -q -E 'arm|aarch64'; then which env; else echo qemu/arm-linux-user/qemu-arm; fi)

TARGET=Linux
METHOD=Linux
PHASES=export_hdrs export_libs resources rom install_rom join

RPCEMU_BIN=rpcemu/rpcemu
BOOT_IOMD_ROM=boot_iomd_rom

SHELL=/bin/bash
.SHELLFLAGS=-e -c
.ONESHELL:

.DELETE_ON_ERROR:
.PHONY: all build check fast

# *Set Alias$$Obey %%Obey -v %%*0\n

all: check

ifeq (${METHOD}, rpcemu)
build: rpcemu/rpcemu boot_iomd_rom stamp-prepare
else
build: run ${LINUX_ROM} stamp-prepare
endif
	uname -a
	echo Building GIT commit: $$(git rev-parse HEAD)
	echo '#define VERSION "GIT commit: '$$(git rev-parse HEAD)'\n"' > mixed/Linux/HAL/h/version1
	cmp --quiet mixed/Linux/HAL/h/version1 mixed/Linux/HAL/h/version || cp mixed/Linux/HAL/h/version1 mixed/Linux/HAL/h/version
	rm done* || true
	rm "Images/${TARGET}_rom"* || true
ifeq (${METHOD}, rpcemu)
	ln -sfn /dev/fd/9 AcornC.C++
	echo '*Obey -v mixed.Linux.Support.Build rpcemu HostFS:$$ HostFS:$$.AcornC/C++ ${TARGET} ${PHASES}' > '!Boot,fea'
	rpcemu/rpcemu 7<boot_iomd_rom 8<. 9<${ACORN_CPP} & \
	until test -f done,ffd; do sleep 1; done; kill $$!; sleep 1
	sh done,ffd
	rm done,ffd
	mv "Images/${TARGET}_rom",??? "Images/${TARGET}_rom" || true
else
	RISC_OS_Alias_IXFSBoot='Obey -v IXFS:$$.dev.fd.4.Build Linux IXFS:$$.dev.fd.8 IXFS:$$.dev.fd.9 ${TARGET} ${PHASES}' ./run ${LINUX_ROM} --nofork 4<mixed/Linux/Support 8<. 9<'${ACORN_CPP}'
endif
	chmod +x "Images/${TARGET}_rom"
	ln -f Images/Linux_rom RISC_OS || true
	$(MAKE) sdl || true

ifeq (${TARGET}, IOMD32)
check: rpcemu/rpcemu HardDisc4/stamp
	echo "Create HostFS:$$.done" > HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	rm HardDisc4/done* || true
	timeout -sKILL 60 rpcemu/rpcemu 7<"Images/${TARGET}_rom" 8<HardDisc4 || true
	sleep 1
	rm HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	test -f HardDisc4/done,ffd
endif

ifeq (${TARGET}, Linux)
check: run comma2attr
	mixed/Linux/Tests/runner.sh ./run ./RISC_OS
endif

fast: PHASES=install_rom join
fast: check
check: build

stamp-prepare: mixed/Linux/Support/build.mk
	test -f Makefile || ln -s mixed/Linux/Support/build.mk Makefile
	ln -sfn  mixed/RiscOS/Library
	ln -sfn  mixed/RiscOS/Modules
	ln -sfn castle/RiscOS/Env
	ln -sfn castle/RiscOS/BuildSys
	cp -a castle/RiscOS/Export .
	mkdir -p Apps
	(cd Apps && ln -sfn ../*/RiscOS/Apps/\!* .)
	touch stamp-prepare

run: ${QEMU}
	ln -sfn ${QEMU} run

include mixed/Linux/Support/common.mk
