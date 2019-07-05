RISC OS Open Release Archive
============================

This is a Cortex-A15 Titanium (from Elesar Ltd) development ROM image. It is a
bleeding-edge build which comes from the latest revisions of all the relevant
sources in our source code repository and is completely untested.

Programming this into the flash of your motherboard should only be done if
you are confident that you know what you are doing and have a good backup
strategy in place! A failed ROM may need unplugging from its socket and
reprogramming in a chip programmer.

To program the ROM image into the QSPI boot flash, set the directory to be
this archive and type the command
  *FlashQSPI -file riscos
and wait for the erase/program/verify cycle to complete. This will take
around 30 seconds single tasking.

Alternatively, it is possible to temporarily 'soft load' the ROM image
before committing it into the QSPI boot flash. Then, if something goes wrong
it's possible to press the reset button and go back to the last flashed ROM.


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
