sdl: mixed/Linux/Support/sdl.cpp mixed/Linux/SocketKVM/h/protocol mixed/Linux/Support/sdlkey.h
	g++ -Wall -pthread -g -O2 `sdl2-config --cflags --libs` --std=c++11 mixed/Linux/Support/sdl.cpp  -o sdl
	setfattr -n user.RISC_OS.LoadExec -v 0x00e6ffff00000000 $@ || true

mixed/Linux/Support/sdlkey.h: mixed/Linux/Support/sdlkey
	mixed/Linux/Support/sdlkey > $@

mixed/Linux/Support/sdlkey: mixed/Linux/Support/sdlkey.c Export/APCS-32/C/Global/h/Keyboard
	gcc -std=gnu99 -Wall `sdl2-config --cflags --libs` mixed/Linux/Support/sdlkey.c -o $@
	setfattr -n user.RISC_OS.LoadExec -v 0x00e6ffff00000000 $@ || true

comma2attr: mixed/Linux/Support/comma2attr.c
	gcc -std=gnu99 -g `pwd`/mixed/Linux/Support/comma2attr.c -o comma2attr
	setfattr -n user.RISC_OS.LoadExec -v 0x00e6ffff00000000 $@ || true

mixed/Linux/Support/bin/!Boot/Linux/RISC_OS:
	git submodule init
	git submodule update

update-binary:
	shopt -s extglob
	git clean -fxd
	git reset --hard
	(cd mixed/Linux/Support/bin && git reset --hard)
	git submodule update
	SOURCE=$$(git rev-parse HEAD)
	#
	echo "# Source and build GIT commits
	SOURCE=$$SOURCE
	BINARY=$$(cd mixed/Linux/Support/bin && git rev-parse HEAD)
	LINUX='$$(uname -a)'
	" > mixed/Linux/Support/bin/!Boot/Linux/source
	#
	$(MAKE) JOBS=$$(getconf _NPROCESSORS_ONLN)
	(cd mixed/Linux/Support/bin && git checkout master)
	cp --reflink=auto --preserve=mode,xattr RISC_OS mixed/Linux/Support/?(sdl.cpp|sdlkey.c|Keyboard.h|protocol.h) mixed/Linux/Support/bin/!Boot/Linux
	#
	cd mixed/Linux/Support/bin
	git add -u
	git commit -m "Rebuilt binary from $$SOURCE"

rpcemu/stamp: ${RPCEMU}
	rm -rf rpcemu rpcemu-0.8.15 || true
	echo "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9 *${RPCEMU}" | sha256sum -c
	tar zxf "${RPCEMU}"
	mv rpcemu-0.8.15 rpcemu
	touch rpcemu/stamp

rpcemu/src/Makefile: rpcemu/stamp
	cd rpcemu/src
	if uname -m | grep -E -q 'x86|i386'; then
	  ./configure --enable-dynarec CFLAGS="-no-pie -fno-pie"
	else
	  ./configure
	fi

rpcemu/rpcemu: rpcemu/src/Makefile
	$(MAKE) -C rpcemu/src
	rm rpcemu/poduleroms/SyncClock,ffa
	touch rpcemu/rpcemu
	echo H4sIAISQCFUCA2NgYDNTuO7MAAdlTAEM+Q4MDgwaNgxoQABdgOHVGoZ/DK8ZZoJlQxQ4uHQmMDGw\
	wWSZGWgP+EUYGJb8FXD8z5jIIAgV+0CMRm5GBgYTBgYAXYSkcwABAAA= | base64 -d | gzip -d > rpcemu/cmos.ram
	cp mixed/Linux/Support/rpcemu.cfg rpcemu/rpc.cfg
	rm -rf rpcemu/hostfs || true
	ln -sfn /dev/fd/${fd_BUILD_DIR} rpcemu/hostfs
	ln -sfn /dev/fd/${fd_BOOT_IOMD_ROM} rpcemu/roms/ROM

qemu/stamp: ${QEMU_SRC}
	rm -rf qemu qemu-2.8.0
	echo "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62 *${QEMU_SRC}" | sha256sum -c
	tar jxf "${QEMU_SRC}"
	mv qemu-2.8.0 qemu
	(cd qemu && patch -p1 < ../mixed/Linux/Support/qemu_swi.diff)
	touch qemu/stamp

qemu/Makefile: qemu/stamp
	(cd qemu && ./configure --enable-attr --target-list=arm-linux-user --disable-werror)
	touch qemu/Makefile

qemu/arm-linux-user/qemu-arm: qemu/Makefile
	$(MAKE) -C qemu

HardDisc4/stamp: ${HARDDISC4} boot_iomd_rom rpcemu/rpcemu
	echo '2b5c2eadb4b4d5cff1ae5dfbce1159c15b41720ef89dcf735062d86074f34083 *${HARDDISC4}' | sha256sum -c
	rm -rf HardDisc4 || true
	unzip -F '${HARDDISC4}' 'HardDisc4/*'
	timeout -sKILL 20 rpcemu/rpcemu ${fd_BOOT_IOMD_ROM}<boot_iomd_rom ${fd_BUILD_DIR}<HardDisc4 || true
	touch HardDisc4/stamp

boot_iomd_rom: ${IOMD}
	echo '18d56d246fea44e856f11b1173b1f132950e8e8aa145a8cf83836e28061b8544 *${IOMD}' | sha256sum -c
	unzip -p '${IOMD}' "soft/!Boot/Choices/Boot/PreDesk/!!SoftLoad/riscos" > boot_iomd_rom
	echo '222f7e5443e48071e1b41a1c8098071c6afc9a39973dfe17374aa1a2580df6a3 *boot_iomd_rom' | sha256sum -c
	setfattr -n user.RISC_OS.LoadExec -v 0x00e5ffff00000000 $@ || true

${HARDDISC4}:
	sh mixed/Linux/Support/download.sh '${HARDDISC4}' "https://www.riscosopen.org/zipfiles/platform/common/HardDisc4.5.22.zip?1429452894" "2b5c2eadb4b4d5cff1ae5dfbce1159c15b41720ef89dcf735062d86074f34083"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${IOMD}:
	sh mixed/Linux/Support/download.sh '${IOMD}' "https://www.riscosopen.org/zipfiles/platform/riscpc/IOMD-Soft.5.22.zip?1429651024" "18d56d246fea44e856f11b1173b1f132950e8e8aa145a8cf83836e28061b8544"
	setfattr -n user.RISC_OS.LoadExec -v 0x0091faff00000000 $@ || true

${QEMU_SRC}:
	sh mixed/Linux/Support/download.sh '${QEMU_SRC}' "http://wiki.qemu-project.org/download/qemu-2.8.0.tar.bz2" "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
	setfattr -n user.RISC_OS.LoadExec -v 0x00fdffff00000000 $@ || true

${RPCEMU}:
	sh mixed/Linux/Support/download.sh '${RPCEMU}' "http://www.marutan.net/rpcemu/cgi/download.php?sFName=0.8.15/rpcemu-0.8.15.tar.gz" "3f092e6000b5d50984e63768a74cdc9a40284d55c984e26df44c7d5875ced6e9"
	setfattr -n user.RISC_OS.LoadExec -v 0x0089ffff00000000 $@ || true
