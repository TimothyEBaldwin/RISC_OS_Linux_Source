RISC OS Open Release Archive
============================

This is the PineA64 (Pinebook) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your board should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.


How to install the ROM image
============================

Currently there is no support in !SDCreate for the PineA64.


CMOS RAM
========

The PineA64 doesn't have CMOS memory on the circuit board which
RISC OS expects to find to hold its essential configuration options needed
before the main !Boot application is run.

Some default values are 'hard coded' into the ROM image and these will be
used at every power on. It isn't currently possible to seed the CMOS settings
with your own.

-- RISC OS Open
