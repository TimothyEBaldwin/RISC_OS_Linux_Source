RISC OS Open Release Archive
============================

This is the OMAP4 (PandaBoard) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your board should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.

Some components in this archive are released under the licence (included in
this archive as Licence_v1_1.pdf), or see:

  http://www.castle-technology.co.uk/riscosbaselicence.htm


How to install the ROM image
============================

The easiest way to install the ROM image onto an SD card is to use the
included !SDCreate application. If you have the RISC OS 5 USB mass storage
drivers then !SDCreate can write the image straight to an SD card.

Alternatively you can create a disc image file which can then be written to a
card using any ordinary Windows/Linux/Mac PC. For more information, including
a description of the SD card structure, see the !SDCreate help file or the
RISC OS Open wiki:

  http://www.riscosopen.org/wiki/documentation/pages/Using+the+Cortex-A8+port


The 'InstallHD4' script, and setting up a !Boot sequence
========================================================

For details of how to setup up a !Boot sequence for your OMAP4 machine, please
see the 'Putting the HardDisc4 image onto a USB drive' section of this wiki
page:

  http://www.riscosopen.org/wiki/documentation/pages/Using+the+Cortex-A8+port

The 'InstallHD4' script supplied with this archive is intended to be used in
conjunction with the installation steps given on the above page.


An important note about CMOS RAM
================================

The OMAP port of RISC OS now has the ability to use CMOS settings that are
saved to the SD card alongside the ROM image. However, RISC OS currently
lacks the ability to write updated settings back to the card. Therefore if
you make any configuration changes that will affect CMOS RAM (e.g. switching
to boot from drive 4 instead of 0) then you must make sure you manually save
the settings using *SaveCMOS and copy the new file onto the SD card. For more
information about how the CMOS file is handled, please see the !SDCreate help
file.


-- RISC OS Open