# Linux port of RISC OS

This is experimental software, there is a good chance it won't work!

It is currently being discussed on the [RISC OS Open website](https://www.riscosopen.org/forum/forums/3/topics/9068).

It should run on ARM Linux system natively, or slow on other Linux systems with the aid of a slightly [modified](mixed/Linux/Support/qemu_swi.diff) QEMU.

The RISC OS "ROM" Image is a Linux executable.

Unlike virtual machines such as RPCEmu, it provides **no restriction on what RISC OS programs can do to the Linux environment.**

RISC OS Open Limited’s DDE is required to build RISC OS, this is proprietary software that may be brought from [RISC OS Open Limited](https://www.riscosopen.org/content/sales/dde)

This Linux port of RISC OS can be built in similar fashion to the traditional method as documented on the RISC OS website, it is not necessary to run InstallTools as the relevant files will be accessed from the DDE without copying. However this will not build the SDL front-end which connects RISC OS to the Linux graphics system, without it RISC OS is limited to a text only interface.

## Top Level Makefile

It can also be built on Linux (or other Unix) using the Makefile, which runs the majority of the build on RISC OS, by default using an binary of the Linux port that is included with this distribution and RISC OS
Open Limited’s DDE in ../DDE. This can be brought from [RISC OS Open
Limited](https://www.riscosopen.org/content/sales/dde)

The following variables are accepted by the Makefile:

| Variable | |
| ---    | ---    |
| ACORN_CPP | Path to AcornC.C++ diectory of DDE, default is `../DDE/AcornC.C++`
| TARGET     | What to build, such as `IOMD32` for a RiscPC/A7000 ROM image. Only `Linux` and `IOMD32` are supported by this source. |
| METHOD     | How to build, valid values are `rpcemu` and `Linux`. |
| JOBS       | Number of CPUs to use for building, if 0 or unset build sequentially. |
| LINUX_ROM  | Location of Linux RISC OS executable to use for building. |
| QEMU       | Location of qemu-arm executable. |
| PHASES     | Space separated list of build phases to run. |

The following targets are provided by the Makefile:

| Target | Action |
| ---    | ---    |
| build  | Build RISC OS (or some other thing). |
| check  | Build and test RISC OS. |
| fast   | Runs only rom_install and join phases and tests. |

This following items will be download to ~/Downloads if needed:
* RISC OS 5.22 Disc Archive
* RISC OS 5.22 IOMD ROM Image
* RPCEmu 0.8.15
* QEMU 2.8.0

## Linux RISC OS command line options

| Option       | Action                                          |
| ---          | ---                                             |
| --help       | Display help message                            |
| --nvram FILE | Filename for nvram                              |
| --notimers   | Disable HAL timers                              |
| --noaborts   | Disable aborts - RISC OS will die with SIGSEGV  |
| --nofork     | Dont't fork - for debugging                     |
| --noseccomp  | Disable seccomp support                         |

## To do List

- [ ] Complete the key map.
- [x] Fix the realtime clock.
- [x] Make data aborts raise errors.
- [x] Support writing timestamps in IXFS.
- [ ] Support reading timestamps in IXFS to centisecond resolution.
- [ ] Test timestamps.
- [ ] Officially allocate names and SWI numbers etc.
- [ ] Fix failure to truncate of unbuffered files when opened for output, and associated race condition.
- [ ] Fix spurious calls of FSEntry_Args 6 (flush file to disc) when files are closed.
- [ ] Perform proper error handling in IXFS.
- [x] Split video keyboard and mouse driver into separate module.
- [ ] Finish video keyboard and mouse driver.
- [ ] Fix overwriting of ROM image when rebuilding RISC OS, which will cause a crash if the overwritten ROM image is currently being run.
- [ ] Provide a means to run Linux programs.
- [ ] Implement PMP dynamic areas.
- [ ] Replace the changes that are labeled "Hack" 
- [ ] Fix the race condition that causes !Edit to crash when loading growing files, it reliably crashes when trying to load it's own WimpSlot.
- [x] Replace the branch table at the beginning of the HAL.
- [ ] Write test cases for VFP errors.
- [ ] Implement VFPSupport.
