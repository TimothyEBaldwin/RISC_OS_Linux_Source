RISC OS Open Release Archive
============================

This is the BCM2835 (Raspberry Pi) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your board should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.


CMOS RAM
========

The Raspberry Pi doesn't include any CMOS memory on the circuit board which
RISC OS expects to find to hold its essential configuration options needed
before the main !Boot application is run.

It is possible to seed the CMOS settings in one of two ways

  * Add a CMOS file to the SD card
    Make any configuration settings changes desired than use the *SaveCMOS
    command to capture them in a file, put this file on the SD card alongside
    the RISC OS ROM image. The SDCMOS module included in the operating system
    will update this file whenever a configuration change is made.
  * Do nothing
    If the hardware is not present, and you haven't put a CMOS file on the
    SD card, you'll get the built in defaults every time you turn on.

-- RISC OS Open
