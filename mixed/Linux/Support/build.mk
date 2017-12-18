#!/usr/bin/make -f

HARDDISC4=${HOME}/Downloads/HardDisc4.5.22.zip
QEMU_SRC=${HOME}/Downloads/qemu-2.11.0.tar.xz
RPCEMU=${HOME}/Downloads/rpcemu-0.8.15.tar.gz
IOMD=${HOME}/Downloads/IOMD-Soft.5.22.zip

LINUX_ROM=mixed/Linux/Support/bin/!Boot/Linux/RISC_OS
ACORN_CPP=../DDE/AcornC.C++

#JOBS=$(shell getconf _NPROCESSORS_ONLN)
QEMU=$(shell if uname -m | grep -q -E 'arm|aarch64'; then which env; else echo qemu/arm-linux-user/qemu-arm; fi)

TARGET=Linux
METHOD=Linux
PHASES=export_hdrs export_libs resources rom install_rom join

RPCEMU_BIN=rpcemu/rpcemu
BOOT_IOMD_ROM=boot_iomd_rom

fd_BOOT_IOMD_ROM=7
fd_BUILD_DIR=8
fd_ACORN_CPP=9

SHELL=/bin/bash
.SHELLFLAGS=-e -c
.ONESHELL:

.SILENT:
.DELETE_ON_ERROR:
.PHONY: all build check fast

# *Set Alias$$Obey %%Obey -v %%*0\n

all: check

ifeq (${METHOD}, rpcemu)
build: rpcemu/rpcemu boot_iomd_rom stamp-prepare
	rm "Images/${TARGET}_rom" || true
	test ! -f done* || rm done*
	ln -sfn /dev/fd/${fd_ACORN_CPP} AcornC.C++
	echo '#define VERSION "GIT commit: '$$(git rev-parse HEAD)'\n"' > mixed/Linux/HAL/h/version
	echo '*Set Run$$Path HostFS:$$.AcornC/C++.!SetPaths.Lib32.,<Run$$Path>
	*Set C$$Path HostFS:$$.AcornC/C++.Export.APCS-32.Lib.c++lib.,HostFS:$$.AcornC/C++.Libraries.c++lib.,HostFS:$$.AcornC/C++.Export.APCS-32.Lib.CLib.,HostFS:$$.AcornC/C++.Libraries.CLib.
	*Obey mixed.Linux.Support.Build rpcemu ${TARGET} ${PHASES}' > '!Boot,fea'
	rpcemu/rpcemu ${fd_BOOT_IOMD_ROM}< boot_iomd_rom \
	  ${fd_BUILD_DIR}<. ${fd_ACORN_CPP}<${ACORN_CPP} &
	until test -f done*; do sleep 1; done
	kill $$!; sleep 1
	sh done*
	rm done*
	mv "Images/${TARGET}_rom",??? "Images/${TARGET}_rom" || true
else
build: run ${LINUX_ROM} comma2attr stamp-prepare
	uname -a
	echo Building GIT commit: $$(git rev-parse HEAD)
	echo '#define VERSION "GIT commit: '$$(git rev-parse HEAD)'\n"' > mixed/Linux/HAL/h/version1
	cmp --quiet mixed/Linux/HAL/h/version1 mixed/Linux/HAL/h/version || cp mixed/Linux/HAL/h/version1 mixed/Linux/HAL/h/version
	rm "Images/${TARGET}_rom" || true
	find '${ACORN_CPP}' ./* -depth -exec ./comma2attr -- '{}' + ${fd_ACORN_CPP}<${ACORN_CPP} || true
	RISC_OS_Alias_IXFSBoot='Exec IXFS:$$.dev.fd.4' ./run ${LINUX_ROM} --nofork \
	  ${fd_BUILD_DIR}<. ${fd_ACORN_CPP}<'${ACORN_CPP}' 4<< 'END'
	*BASIC
	*Set Run$$Path IXFS:$$.dev.fd.${fd_ACORN_CPP}.!SetPaths.Lib32.,<Run$$Path>
	*Set C$$Path IXFS:$$.dev.fd.${fd_ACORN_CPP}.Export.APCS-32.Lib.c++lib.,IXFS:$$.dev.fd.${fd_ACORN_CPP}.Libraries.c++lib.,IXFS:$$.dev.fd.${fd_ACORN_CPP}.Export.APCS-32.Lib.CLib.,IXFS:$$.dev.fd.${fd_ACORN_CPP}.Libraries.CLib.
	*SetEval ROOL$$MaxJobs ${JOBS}
	*Set Boot$$Dir IXFS:$$.dev.fd.${fd_BUILD_DIR}.Export
	*Dir IXFS:$$.dev.fd.${fd_BUILD_DIR}
	PRINT TIME$$
	TIME$$="$(shell date --utc "+%a,%0e %b %Y.%T")"
	QUIT
	*BASIC -quit mixed.Linux.Support.BufferWriteC
	*Obey -c mixed.Linux.Support.Build Linux ${TARGET} ${PHASES}
	*BASIC
	SYS "IXSupport_LinuxSyscall",2,,,,,,,1
	END
endif
	chmod +x "Images/${TARGET}_rom"
	ln -f Images/Linux_rom RISC_OS || true
	$(MAKE) sdl || true

ifeq (${TARGET}, IOMD32)
check: rpcemu/rpcemu HardDisc4/stamp
	echo "Create HostFS:$$.done" > HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	test ! -f HardDisc4/done* || rm HardDisc4/done*
	timeout -sKILL 60 rpcemu/rpcemu ${fd_BOOT_IOMD_ROM}<"Images/${TARGET}_rom" ${fd_BUILD_DIR}<HardDisc4 || true
	sleep 1
	rm HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	test -f HardDisc4/done*
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
