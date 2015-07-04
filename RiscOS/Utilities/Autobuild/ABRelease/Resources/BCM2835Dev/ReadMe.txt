RISC OS Open Release Archive
============================

This is the BCM2835 (Raspberry Pi) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your board should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.

Some components in this archive are released under the licence (included in
this archive as Licence_v1_1.pdf), or see:

  http://www.castle-technology.co.uk/riscosbaselicence.htm


IMPORTANT
=========

This build of RISC OS utilises "zero page relocation", a change to the
standard memory map which is designed to increase the stability of the OS and
your software. However, there is a catch - a lot of existing software is buggy,
and this change will expose those bugs, causing the software to crash.

To help with the transition to having zero page relocation enabled by default,
a compatibility/logging module called 'ZeroPain' has been developed. See the
readme file in the ZeroPain folder for more information. It is recommended that
you install the module before you install this new ROM image, otherwise you may
have difficulty booting your system.

-- RISC OS Open
