RISC OS Open Release Archive
============================

This is the OMAP (Beagle Board) development ROM image. It is a bleeding-edge
build which comes from the latest revisions of all the relevant sources in
our source code repository and is completely untested.

Using this ROM image in your Beagle should only be done if you are confident
that you know what you are doing! It is likely to be functionally incomplete
and probably unstable in various ways.

Some components in this archive are released under the licence (included in
this archive as Licence_v1.pdf), or see:

  http://www.castle-technology.co.uk/riscosbaselicence.htm


U-Boot scripts
==============

In addition to the ROM image, this archive also contains a set of U-Boot scripts to allow you to easily boot RISC OS on machines that use the U-Boot bootloader (e.g. BeagleBoard, IGEPv2, Touch Book, etc.)

In the U-Boot_scripts folder, find the script that corresponds to your machine type and copy it to an SD card along with the RISC OS ROM image. Note that you must also rename the boot script to 'boot.scr' so that U-Boot will find it (with a few exceptions - see below)

Notes:
* Owners of IGEPv2 boards must name the script 'boot.ini'
* If your board contains a version of u-boot prior to 2009.01, the script may instead have to be named 'reset.scr'
* Also note that 'boot.scr' is the Unix/Windows name of the file - if you're using RISC OS to copy the file you'll obviously have to copy it as 'boot/scr' instead (or 'boot/ini', etc.)
* If you use Windows to copy the file, please make sure that 'Hide extensions for known file types' is not enabled in your Folder Options, otherwise you may inadvertently copy the script as 'boot.scr.scr'!

For the curious, the 'source' folder contains the source code for the U-Boot scripts, along with an explanation of how they function.


-- RISC OS Open
