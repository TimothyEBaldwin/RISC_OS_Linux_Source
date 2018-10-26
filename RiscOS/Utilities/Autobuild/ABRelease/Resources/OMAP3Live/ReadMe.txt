RISC OS Open Release Archive
============================

This is the OMAP (Beagle Board) 'Live' ROM image. It is a bleeding-edge build
which comes from the latest revisions of all the relevant sources in our source
code repository and is completely untested.

Using this ROM image in your Beagle should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.


How to install the ROM image
============================

The easiest way to install the ROM image onto an SD card is to use the
included !SDCreate application. If you have the RISC OS 5 USB mass storage
drivers then !SDCreate can write the image straight to an SD card.

Alternatively you can create a disc image file which can then be written to a
card using any ordinary Windows/Linux/Mac PC. For more information, including
a description of the SD card structure, see the !SDCreate help file.


An important note about CMOS RAM
================================

The OMAP port of RISC OS now supports saving configuration settings in a CMOS
memory chip so that they are kept when the power is turned off. This
requires a small carrier board to be plugged in, which you can obtain for
a few pounds from your favourite supplier.

If this carrier board is not detected it is possible to have 'read only' 
settings in one of two ways

  * Add a CMOS file to the SD card
    Make any configuration settings changes desired than use the *SaveCMOS
    command to capture them in a file, put this file on the SD card alongside
    the RISC OS ROM image.
    For more information about how the CMOS file is handled, please see
    the !SDCreate help file.
  * Do nothing
    If the hardware is not present, and you haven't put a CMOS file on the
    SD card, you'll get the built in defaults.

-- RISC OS Open
