Zero page relocation & ZeroPain
===============================

This build of RISC OS makes use of "zero page relocation", a change to the
standard memory map which moves the processor vectors and the kernel's "zero
page" workspace away from address zero and up to the high end of the memory
map. This greatly increases the system's resilience to a common type of
software bug known as a "null pointer dereference", this comes in two forms:

a) Reading
   Buggy software makes a "harmless" null pointer dereferences where
   the code reads from page zero and then does something insignificant with 
   the result (usually ignoring it completely), or proceeds to use the value
   read and subsequently crashes.
b) Writing
   Buggy software corrupts either the operating system workspace or overwrites
   the processor vectors, most likely this results in crashing the computer
   or similar knock on effects.

Starting with RISC OS 5.24 the default state is running with the processor
vectors and kernel's workspace moved away from zero page. But due to the 
large amount of buggy software out there as a temporary measure there is still
a page of RAM left mapped in at the old address. The access attributes are
set such that:

a) Reading
   Is permitted in all processor modes (no change).
b) Writing
   Is forbidden in all processor modes (previously it was forbidden in user
   mode, but privileged modes could write).

This is designed to ensure the class of bugs with the most dangerous side
effect are always faulted. The other class of bug, reading, is still a problem
because the data your application is using is undefined.

In order to allow you to check your applications for bugs and report them to
the author so they can be fixed, a means of logging them is needed.

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

The module is intended to be a temporary aid to be used until the dummy 
compatibility page of RAM at address zero is removed - it is not intended to 
be a long-term compatibility solution for running old or unmaintained software.


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
which application caused a particular access. Any defective applications should
be reported to the author and added to the list of known problems

  https://www.riscosopen.org/wiki/documentation/show/Reporting%20zero%20page%20protection%20errors

ZeroPain will pause logging once the log file exceeds 1MB in size. Deleting the
log will allow it to resume.


Understanding log entries
=========================

Log entries produced by ZeroPain look like the following:

  Time: Wed Apr  6 21:35:14 2016
  Location: Offset 00011fe0 in module SharedCLibrary
  Current Wimp task: TaskWindow
  Last app to start: crashy 1 3
  
  R0  = 00000001 R1  = 00000001 R2  = 00000000 R3  = ffffffff
  R4  = 00000000 R5  = 00000001 R6  = 000097b0 R7  = 00000000
  R8  = 00009a14 R9  = 00009c44 R10 = 0000a4fc R11 = 0000b1ac
  R12 = 0000b1b0 R13 = 0000b18c R14 = fc18256c R15 = fc1825bc
  DFAR = 00000000  Mode USR32  Flags Nzcv if   PSR = 80000110
  
  fc182574 : 02012b01 : ANDEQ   R2,R1,#&0400       ; =1024
  fc182578 : 03520000 : CMPEQ   R2,#0
  fc18257c : 0a000015 : BEQ     &FC1825D8
  fc182580 : e3a07000 : MOV     R7,#0
  fc182584 : e3550000 : CMP     R5,#0
  fc182588 : 9a00009f : BLS     &FC18280C
  fc18258c : e5962008 : LDR     R2,[R6,#8]
  fc182590 : e2523001 : SUBS    R3,R2,#1
  fc182594 : e5863008 : STR     R3,[R6,#8]
  fc182598 : 4a000005 : BMI     &FC1825B4
  fc18259c : e4d41001 : LDRB    R1,[R4],#1
  fc1825a0 : e5963000 : LDR     R3,[R6,#0]
  fc1825a4 : e1a00001 : MOV     R0,R1
  fc1825a8 : e4c31001 : STRB    R1,[R3],#1
  fc1825ac : e5863000 : STR     R3,[R6,#0]
  fc1825b0 : ea000002 : B       &FC1825C0
  fc1825b4 * e4d40001 * LDRB    R0,[R4],#1
  fc1825b8 : e1a01006 : MOV     R1,R6
  fc1825bc : ebfffbad : BL      &FC181478
  fc1825c0 : e3700001 : CMN     R0,#1
  fc1825c4 : 0a00008b : BEQ     &FC1827F8
  fc1825c8 : e2877001 : ADD     R7,R7,#1
  fc1825cc : e1570005 : CMP     R7,R5
  fc1825d0 : 3affffed : BCC     &FC18258C
  fc1825d4 : ea00008c : B       &FC18280C
  fc1825d8 : e3550000 : CMP     R5,#0
  fc1825dc : 9a00008a : BLS     &FC18280C
  fc1825e0 : e5963008 : LDR     R3,[R6,#8]
  fc1825e4 : e3a07000 : MOV     R7,#0
  fc1825e8 : e3530000 : CMP     R3,#0
  fc1825ec : aa000011 : BGE     &FC182638
  fc1825f0 : e2533001 : SUBS    R3,R3,#1
  
  R15 = fc1825bc = SharedCLibrary +11fe8 = _write +78
  R14_usr = fc18256c = SharedCLibrary +11f98 = _write +28
            Function call to fc173848 = SharedCLibrary +3274 = _sys_istty +0
  
  USR stack:
  0000b18c : 00000015 : - R4
  0000b190 : 00000001 : | R5
  0000b194 : 00009460 : | R6
  0000b198 : 00000000 : | R7
  0000b19c : 00009a14 : | R8
  0000b1a0 : 0000b1c0 : | R11
  0000b1a4 : 0000b1b0 : | R12
  0000b1a8 : fc182844 : | R14: fc182844
           :          : | = SharedCLibrary +12270
           :          : | = fwrite +30
  0000b1ac : fc182550 : | APCS function: fc182548
           :          : | = SharedCLibrary +11f74
           :          : | = _write +4
  0000b1b0 : 0000b7a0 : | R5
  0000b1b4 : 0000b22c : | R11
  0000b1b8 : 0000b1c4 : | R12
  0000b1bc : 000085f4 : | R14: 000085f4
           :          : | = +5f4 in application memory
           :          : | = recurse3 +ec
  0000b1c0 : fc18282c : | APCS function: fc182824
           :          : | = SharedCLibrary +12250
           :          : | = fwrite +10
  0000b1c4 : 718021cb : | 
  0000b1c8 : 5f947b49 : | 
  0000b1cc : 7da0d868 : | 

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


Annotated stack dumps
=====================

Some ZeroPain log entries will include an annotated stack dump after the
disassembly. This stack dump can be critical in helping to identify the real
cause of a null pointer dereference, especially if the 'Location' in the
summary is listed as being the Shared C Library. So when reporting a zero page
issue on the ROOL forums or to a developer please try to include any log
entries which contain stack dumps. However note that there is a chance that the
stack dump may include sensitive information such as usernames and passwords,
so you may want to exercise caution when sharing the stack dumps if you have
been using your computer for activities such as online banking.

Note that the reason that only some entries contain a stack dump is because
there is an increased processing cost involved in generating the dump, and so
ZeroPain places some limitations on the situations in which a dump will be
produced. Also because the stack dumps may be very large, ZeroPain will only
allow one stack dump to be buffered in memory at a time, compared to the 128
summary entries that can be buffered at once.

Developers or users who wish to understand more about the stack dump format and
the different annotations should consult this reference on the ROOL wiki:

https://www.riscosopen.org/wiki/documentation/show/Debugger%20Annotated%20Exception%20Dumps


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
