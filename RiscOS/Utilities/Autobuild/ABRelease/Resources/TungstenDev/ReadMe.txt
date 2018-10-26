RISC OS Open Release Archive
============================

This is the IYONIX (codename Tungsten) development ROM image. It is a
bleeding-edge build which comes from the latest revisions of all the relevant
sources in our source code repository and is completely untested.

You MUST NOT attempt to program this into the flash of your IYONIX - even
softloading it should only be done if you are confident that you know what
you are doing and have a good backup strategy in place!


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
