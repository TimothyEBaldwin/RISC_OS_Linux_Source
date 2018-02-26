# Linux port of RISC OS

This is experimental software, there is a good chance it won't work!

It is currently being discussed on the [RISC OS Open website](https://www.riscosopen.org/forum/forums/3/topics/9068).

It should run on ARM Linux system natively, or slow on other Linux systems with the aid of a slightly [modified](mixed/Linux/Support/qemu_swi.diff) QEMU.

The RISC OS "ROM" Image is a Linux executable.

If you run RISC OS directly then, unlike virtual machines such as RPCEmu, there is **no restriction on what RISC OS programs can do to the Linux environment** beyond that provided by Linux. If you use the provided scripts then RISC OS should be prevented from causing harm.

RISC OS Open Limited’s DDE is required to build RISC OS, this is proprietary software that may be brought from [RISC OS Open Limited](https://www.riscosopen.org/content/sales/dde)

This Linux port of RISC OS can be built in similar fashion to the traditional method as documented on the RISC OS website, it is not necessary to run InstallTools as the relevant files will be accessed from the DDE without copying. However this will not build the SDL front-end which connects RISC OS to the Linux graphics system, without it RISC OS is limited to a text only interface.

## Top Level Makefile

It can also be built on Linux using the Makefiles, which runs the majority of the build on RISC OS, by default using an binary of the Linux port that is automatically downloaded from [github](https://github.com/TimothyEBaldwin/RO_Linux) and RISC OS Open Limited’s DDE in ../DDE. Allegro (for RPCEmu), Bash, Bubblewrap, GCC, GNU Make, Libseccomp and SDL 2 are also required by Makefiles and support code. Either Bubblewrap must be setuid root, or unprivileged user namespaces must be enabled.

On debian the dependencies are in the packages "bash bubblewrap gcc make liballegro4-dev libc6-dev libseccomp-dev libsdl2-dev".

Additional packages are required for building QEMU.

The following variables are accepted by the Makefiles:

| Variable   | |
| ---        | ---    |
| ACORN_CPP  | Path to AcornC.C++ diectory of DDE, default is `../DDE/AcornC.C++`
| TARGET     | What to build, such as `IOMD32` for a RiscPC/A7000 ROM image. Only `Linux` and `IOMD32` are supported by this source. |
| METHOD     | How to build, valid values are `rpcemu` and `Linux`. |
| JOBS       | Number of CPUs to use for building, if 0 or unset build sequentially. |
| LINUX_ROM  | Location of Linux RISC OS executable to use for building. |
| QEMU       | Location of qemu-arm executable. |
| PHASES     | Space separated list of build phases to run. |

The following targets are provided by the Makefiles:

| Target | Action |
| ---    | ---    |
| build  | Build RISC OS (or some other thing). |
| check  | Build and test RISC OS. |
| fast   | Runs only rom_install and join phases and tests. |

This following items will be download to ~/Downloads if needed:
* RISC OS 5.22 Disc Archive
* RISC OS 5.22 IOMD ROM Image
* RPCEmu 0.8.15
* QEMU 2.11.0

## Linux RISC OS command line options

| Option       | Action                                          |
| ---          | ---                                             |
| --help       | Display help message                            |
| --nvram FILE | Filename for nvram                              |
| --notimers   | Disable HAL timers                              |
| --noaborts   | Disable aborts - RISC OS will die with SIGSEGV  |
| --nofork     | Dont't fork - for debugging                     |
| --noseccomp  | Disable seccomp support                         |

## Linux RISC OS error codes

| Return Code | Error |
| ---         | ---   |
|     100     | Reboot requested |
|     101     | Memory mapping failed, try running "sudo sysctl vm.mmap_min_addr=8192" |
|     102     | Unrecognised command line option |
|     103     | Unable to open NVRAM file. |
|     104     | Permission denied when attempting to open NVRAM file. |
|     105     | Read only filesystem when attempting to open NVRAM file. |
|     106     | Unable to read size of NVRAM file. |
|     107     | Unable to enlarge NVRAM file. |
|     108     | Failed to reserve address space. |
|     109     | Unable to fork |
|     110     | Parent process exited (no message) |
|     111     | Cloning ptrace thread failed |
|     112     | Failed to set alternative signal stack. |
|     113     | SWI intercept failure |
|     114     | RISC OS kernel returned to HAL |


## To do List

- [x] Complete the key map.
- [x] Fix the realtime clock.
- [x] Make data aborts raise errors.
- [x] Support writing timestamps in IXFS.
- [x] Support reading timestamps in IXFS to centisecond resolution.
- [x] Test timestamps.
- [ ] Officially allocate names and SWI numbers etc.
- [x] Fix failure to truncate of unbuffered files when opened for output, and associated race condition.
- [ ] Fix spurious calls of FSEntry_Args 6 (flush file to disc) when files are closed.
- [ ] Perform proper error handling in IXFS.
- [x] Split video keyboard and mouse driver into separate module.
- [ ] Finish video keyboard and mouse driver.
- [ ] Fix overwriting of ROM image when rebuilding RISC OS, which will cause a crash if the overwritten ROM image is currently being run.
- [ ] Provide a means to run Linux programs.
- [ ] Implement PMP dynamic areas.
- [x] Replace the changes that are labeled "Hack"
- [x] Replace the branch table at the beginning of the HAL.
- [ ] Write test cases for VFP errors.
- [ ] Implement VFPSupport.
- [ ] Possibly add a binary release to the ABRelase phase.
