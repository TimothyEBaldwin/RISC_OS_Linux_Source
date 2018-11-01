RISC OS Open Release Archive
============================

This is the OMAP4 (PandaBoard) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your board should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.


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


How to install the ROM image
============================

The easiest way to install the ROM image onto an SD card is to use the
included !SDCreate application. If you have the RISC OS 5 USB mass storage
drivers then !SDCreate can write the image straight to an SD card.

Alternatively you can create a disc image file which can then be written to a
card using any ordinary Windows/Linux/Mac PC. For more information, including
a description of the SD card structure, see the !SDCreate help file.


The 'InstallHD4' script, and setting up a !Boot sequence
========================================================

For details of how to setup up a !Boot sequence for your OMAP4 machine, please
see the 'Putting the HardDisc4 image onto a USB drive' section of this wiki
page:

  http://www.riscosopen.org/wiki/documentation/show/Generic%20OMAP%20port%20setup%20information

The 'InstallHD4' script supplied with this archive is intended to be used in
conjunction with the installation steps given on the above page.


CMOS RAM
========

The OMAP port of RISC OS now supports saving configuration settings in a CMOS
memory chip so that they are kept when the power is turned off. This
requires a small carrier board to be plugged in, which you can obtain for
a few pounds from

  http://www.riscosopen.org/content/sales/cmos-widgets

or your RISC OS dealer.

If this carrier board is not detected it is possible to seed the CMOS settings
in one of two ways

  * Add a CMOS file to the SD card
    Make any configuration settings changes desired than use the *SaveCMOS
    command to capture them in a file, put this file on the SD card alongside
    the RISC OS ROM image. The SDCMOS module included in the operating system
    will update this file whenever a configuration change is made.
  * Do nothing
    If the hardware is not present, and you haven't put a CMOS file on the
    SD card, you'll get the built in defaults every time you turn on.

-- RISC OS Open
