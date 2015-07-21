Zero page relocation & ZeroPain
===============================

This build of RISC OS makes use of "zero page relocation", a change to the
standard memory map which moves the processor vectors and the kernel's "zero
page" workspace away from address zero and up to the high end of the memory
map. This greatly increases the system's resilience to a common type of
software bug known as a "null pointer dereference". However, there is a catch:
because the OS has always had memory mapped to address zero, large amounts of
RISC OS software contains cases of "harmless" null pointer dereferences where
the code reads from page zero and then does something insignificant with the
result (usually ignoring it completely). With the new memory map, these
programs will most likely cease to operate, exiting with a data abort as soon
as they try to access page zero.

Since relocating zero page is very beneficial to the stability and security of
the OS, the goal is to have the feature enabled for all future stable releases,
starting with RISC OS 5.24. But due to the large amount of buggy software out
there we can't simply turn it on and be done with it - we need to have a
transition period in which developers can fix their code without worrying about
the fact their compilers, text editors, etc. are buggy too. We also need a way
for regular users to get involved with the testing process.

This is where ZeroPain comes in. ZeroPain traps most attempts to read page zero
and emulates the operation, providing a safe level of compatibility with the
old memory map. And for any page zero access which it emulates, it adds an
entry to a log file so that the user/developer is aware of the issue.

Note that ZeroPain does not trap writes to page zero, nor any attempts to
execute code. Some infrequently used instructions, such as LDRD, are also not
dealt with. In these cases a data or prefetch abort will be raised as normal,
and the program will most likely terminate with an error.


Installation
============

The recommended method of installation is to add the ZeroPain module to your
Choices.Boot.PreDesk folder. This can be performed by using the boot merge
utility in Configure to merge in the !Boot structure that is provided here.

To ensure that the log file is clearly visible, the default log location is the
file 'ZeroPain' in the root of your boot drive. However if desired you can
specify a different location for the file by editing the file !Boot.Choices.
Boot.PreDesk.!!ZeroPain.!Run.

Note that there is no need to uninstall ZeroPain before running a ROM which
does not use zero page relocation. The module will refuse to start on such a
machine, and the provided loader in the skeleton !Boot will swallow the error
so that it does not affect the startup of your machine.

Also note that the module contains a built-in kill switch - it will only run on
ROMs built in 2015. This ensures that, as the RISC OS 5.24 release draws near,
we have a period of testing where the module is inactive. This will help to
make sure that as many bugs as possible are caught prior to the release. If
necessary, the testing period may be extended and a new version of ZeroPain
released to cover it.


Use
===

There is little to know about using the module. As long as the module is
running, it will be monitoring the data abort vector and watching for attempts
to read from page zero. If an attempt is caught and emulated, an entry will be
added to the log file. If Reporter is running the module will also send a
message to Reporter's log.

Remember to review the contents of the log file at regular intervals, to see if
there are any issues which haven't already been reported to the relevant
application developer. The information below can help you to try and work out
which application caused a particular access.

ZeroPain will pause logging once the log file exceeds 1MB in size. Deleting the
log will allow it to resume.


Understanding log entries
=========================

Log entries produced by ZeroPain look like the following:

  Time: Sun Jun 28 19:23:18 2015
  Location: Application space
  Current Wimp task: Unknown
  Last app to start: amu -E standalone
  
  R0  = 00013e20 R1  = 00013e28 R2  = 00000000 R3  = 0001818c
  R4  = 00013e20 R5  = 0001e0e6 R6  = 0003ef60 R7  = 00000000
  R8  = 0003f02c R9  = 0003efbc R10 = 0001540c R11 = 000160bc
  R12 = 000160c0 R13 = 000160b0 R14 = 0000d310 R15 = 0000cec0
  DFAR = 00000008  Mode USR32  Flags nzCv if   PSR = 20000010
  
  0000ce78 : e51f183c : LDR     R1,&0000C644
  0000ce7c : e590200c : LDR     R2,[R0,#12]
  0000ce80 : e5b13008 : LDR     R3,[R1,#8]!
  0000ce84 : e3520000 : CMP     R2,#0
  0000ce88 : 1a000007 : BNE     &0000CEAC
  0000ce8c : e5932008 : LDR     R2,[R3,#8]
  0000ce90 : e580200c : STR     R2,[R0,#12]
  0000ce94 : e5922008 : LDR     R2,[R2,#8]
  0000ce98 : e5a32018 : STR     R2,[R3,#24]!
  0000ce9c : e5b0200c : LDR     R2,[R0,#12]!
  0000cea0 : e3520000 : CMP     R2,#0
  0000cea4 : 191ba800 : LDMNEDB R11,{R11,R13,PC}
  0000cea8 : ea000008 : B       &0000CED0
  0000ceac : e5922000 : LDR     R2,[R2,#0]
  0000ceb0 : e5a32008 : STR     R2,[R3,#8]!
  0000ceb4 : e580200c : STR     R2,[R0,#12]
  0000ceb8 * e5b21008 * LDR     R1,[R2,#8]!
  0000cebc : e5902008 : LDR     R2,[R0,#8]
  0000cec0 : e5a21018 : STR     R1,[R2,#24]!
  0000cec4 : e590000c : LDR     R0,[R0,#12]
  0000cec8 : e3500000 : CMP     R0,#0
  0000cecc : 191ba800 : LDMNEDB R11,{R11,R13,PC}
  0000ced0 : ebffffcf : BL      &0000CE14
  0000ced4 : eaffffe1 : B       &0000CE60
  0000ced8 : e1a0c00d : MOV     R12,R13
  0000cedc : e92dd800 : STMDB   R13!,{R11,R12,R14,PC}
  0000cee0 : e24cb004 : SUB     R11,R12,#4
  0000cee4 : e15d000a : CMP     R13,R10
  0000cee8 : 4b001989 : BLMI    &00013514
  0000ceec : e51f18b0 : LDR     R1,&0000C644
  0000cef0 : e3500001 : CMP     R0,#1
  0000cef4 : 03a00004 : MOVEQ   R0,#4

The timestamp is for your convenience, to help you identify how old the log
entry is.

'Location' indicates the location of the code performing the access. Usually
this will be 'Application space' or the name of a module (plus the address
offset into the module).

If 'Application space' was listed as the location then the page zero access is
almost certainly occurring due to a bug in the current application. 'Current
Wimp task' and 'Last app to start' can help to identify which application this
is. Note however that sometimes this information can be misleading - there is
no easy way for ZeroPain to detect when an application exits, and so 'Last app
to start' may in fact refer to an app which has already quit. Similarly,
'Current Wimp task' may be listed as 'Unknown' if an application hasn't yet
registered itself with the Wimp, or if it exits soon after performing the page
zero access.

If the location is listed as being inside a module, then it's possibly a bug in
the module, or it's possibly a bug in the code that called the module. For
example, in order to provide the best performance, many of the functions in the
Shared C Library don't perform error checking on their arguments. For these
functions it is the caller's responsibility to ensure that the arguments are
correct.

The register dump and disassembly is similar to that which can be produced by
the Debugger module, with a couple of key differences:

* The register dump includes the DFAR (data fault address register), indicating
  the address for which the access was attempted
* The highlighted line in the disassembly is the instruction that caused the
  access - in comparison to the output from the Debugger module which (for data
  aborts) will be 2 instructions ahead of the fault

In some cases there will be fewer lines of disassembly than shown above. This
will happen if the instruction which caused the abort is close to a page
boundary (the abort handler errs on the side of caution and avoids reading
across page boundaries). However there should still be enough information to
allow the problem code to be identified.


Zero page workspace emulated by ZeroPain
========================================

When ZeroPain emulates a read from zero page, it will return the value 0 for
most locations. However, special handling is performed for the following
addresses, which correspond to the old locations of some kernel workspace
values. If your code is accessing these locations, please consider following
the given instructions for alternative ways of getting at the same value. As a
last resort, you can modify your code to use OS_ReadSysInfo 6 to read the new
location of the value. However, directly accessing kernel workspace (even via
an address obtained through OS_ReadSysInfo 6) is strongly discouraged, as it
may limit our ability to make changes to the OS in future.

&104 - 'ESC_Status'. Software should use OS_ReadEscapeState instead.
&108 - 'IRQsema'. Used by some software to detect if it's running in the
       'foreground' or not.
&10C - 'MetroGnome'. This is the centisecond counter. Use OS_ReadMonotonicTime
       instead.
&FE8 - 'CLibCounter'. This is used by old versions of the shared C library, and
       the statically linked version (ansilib). Update to a newer version,
       and/or switch to using the shared C library.
&FEC - 'RISCOSLibWord'. As above.
&FF0 - 'CLibWord'. As above.
&FF8 - 'DomainId'. May be used by some software to identify the current Wimp
       task. Use Wimp_ReadSysInfo instead.


High processor vectors
======================

Modern ARM CPUs support a feature known as 'high processor vectors', whereby
the processor vectors are moved from their old location at &0 to a new location
at &FFFF0000. Zero page relocation within RISC OS makes use of this feature -
without it we would still need some memory mapped to address zero in order to
contain the processor vectors. Although high processor vectors is currently a
requirement for zero page relocation, this is likely to change in the future,
in order to support zero page relocation on the IOMD (RiscPC/A7000/RPCEmu)
build of RISC OS.

OS_PlatformFeatures 0 can be used to determine whether high processor vectors
are in use (flag returned in bit 20). Software which needs to interact with the
processor vectors directly should use this to determine their location.

https://www.riscosopen.org/wiki/documentation/show/OS_PlatformFeatures%200

The address of the processor vectors should not be used to infer the address of
the zero page workspace, and vice-versa.

Apart from the change in location, the processor vectors continue to operate as
normal - so for FIQ handlers, you can still rely on having 228 bytes of space
available for your handler code (from &FFFF001C to &FFFF00FF inclusive). Also,
for future compatibility, code should not assume that the processor vectors are
readable from user mode - regardless of whether high processor vectors are in
use or not.
