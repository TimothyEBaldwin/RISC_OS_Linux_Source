#!/usr/bin/make -f

HARDDISC4=${HOME}/Downloads/HardDisc4.5.22.zip
QEMU_SRC=${HOME}/Downloads/qemu-2.8.0.tar.bz2
RPCEMU=${HOME}/Downloads/rpcemu-0.8.15.tar.gz
IOMD=${HOME}/Downloads/IOMD-Soft.5.22.zip

LINUX_ROM=mixed/Linux/Support/RISC_OS
ACORN_CPP=../DDE/AcornC.C++

QEMU=$(shell uname -m | grep -q arm || echo qemu/arm-linux-user/qemu-arm)

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
.DELETE_ON_ERROR:
.PHONY: all build check fast

# *Set Alias$$Obey %%Obey -v %%*0\n

all: build

ifeq (${METHOD}, rpcemu)
build: rpcemu/rpcemu boot_iomd_rom stamp-prepare
	rm "Images/${TARGET}_rom" || true
	test ! -f done* || rm done*
	echo '*Obey mixed.Linux.Support.Build rpcemu ${TARGET} ${PHASES}' > '!Boot,fea'
	rpcemu/rpcemu ${fd_BOOT_IOMD_ROM}< boot_iomd_rom \
	  ${fd_BUILD_DIR}<. ${fd_ACORN_CPP}<${ACORN_CPP} &
	until test -f done*; do sleep 1; done
	kill $$!; sleep 1
	sh done*
	rm done*
	mv "Images/${TARGET}_rom",??? "Images/${TARGET}_rom" || true
else
build: ${QEMU} ${LINUX_ROM} comma2attr stamp-prepare
	rm "Images/${TARGET}_rom" || true
	find * -depth -exec ./comma2attr -- '{}' + ${fd_ACORN_CPP}<${ACORN_CPP} || true
	RISC_OS_Alias_IXFSBoot='Exec IXFS:$$.dev.fd.4' ${QEMU} ${LINUX_ROM} --nofork \
	${fd_BUILD_DIR}<. ${fd_ACORN_CPP}<'${ACORN_CPP}' 4< <(
	echo '*BASIC
	*FX 3 2
	*Dir IXFS:$$.dev.fd.${fd_BUILD_DIR}
	PRINT TIME$$
	TIME$$="$(shell date --utc "+%a,%0e %b %Y.%T")"
	QUIT
	*Obey -c mixed.Linux.Support.Build Linux ${TARGET} ${PHASES}
	' )
endif
	chmod +x "Images/${TARGET}_rom"
	ln -f Images/Linux_rom RISC_OS || true
	$(MAKE) sdl || true

ifeq (${TARGET}, IOMD32)
check: rpcemu/rpcemu HardDisc4/stamp
	echo "Create HostFS:$$.done" > HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	test ! -f HardDisc4/done* || rm HardDisc4/done*
	timeout -sKILL 20 rpcemu/rpcemu ${fd_BOOT_IOMD_ROM}<"Images/${TARGET}_rom" ${fd_BUILD_DIR}<HardDisc4 || true
	sleep 1
	rm HardDisc4/\!Boot/Choices/Boot/Tasks/ZZZ,feb
	test -f HardDisc4/done*
endif

ifeq (${TARGET}, Linux)
check: ${QEMU}
	mixed/Linux/Tests/runner.sh ${QEMU} ./RISC_OS
endif

fast: PHASES=install_rom join
fast: check
check: build

stamp-prepare: mixed/Linux/Support/build.mk
	ln -sfn  mixed/RiscOS/Library
	ln -sfn  mixed/RiscOS/Modules
	ln -sfn castle/RiscOS/Env
	ln -sfn castle/RiscOS/BuildSys
	cp -a castle/RiscOS/Export .
	mkdir -p Apps
	(cd Apps && ln -sfn ../*/RiscOS/Apps/\!* .)
	exec ${fd_ACORN_CPP}<'${ACORN_CPP}'
	ac='/proc/self/fd/${fd_ACORN_CPP}'
	for i in amu c++ cc cfront cmhg link decaof libfile objasm ResGen
	do
	  find $$ac/  \( -ipath "$$ac/!SetPaths/Lib32/$$i" -or -ipath "$$ac/!SetPaths/Lib32/$$i,???" \) -exec ln -sfn '{}' Library/Acorn/$$i,ff8 \;
	done
	mkdir -p Export/APCS-32/Lib/CLib/o
	find $$ac/ \( -ipath "$$ac/Libraries/c++lib" -or -ipath "$$ac/Export/APCS-32/Lib/c++lib" \) -exec ln -sfn '{}' Export/APCS-32/Lib/c++lib \;
	find $$ac/ \( -ipath "$$ac/Libraries/CLib/o/stubs*" -or -ipath "$$ac/Export/APCS-32/Lib/CLib/o/stubs*" \) -exec ln -sfn '{}' Export/APCS-32/Lib/CLib/o/stubs_bootstrap \;
	touch stamp-prepare

include mixed/Linux/Support/common.mk
