#!/bin/sh
mkimage -A arm -O u-boot -T script -C none -n "RISC OS BeagleBoard boot script" -d beagle ../BeagleBoard.scr
mkimage -A arm -O u-boot -T script -C none -n "RISC OS DevKit8000 boot script" -d devkit ../DevKit8000.scr
mkimage -A arm -O u-boot -T script -C none -n "RISC OS IGEPv2 boot script" -d igep ../IGEPv2.scr
mkimage -A arm -O u-boot -T script -C none -n "RISC OS Pandora boot script" -d pandora ../Pandora.scr
mkimage -A arm -O u-boot -T script -C none -n "RISC OS Touch Book boot script" -d touchbook ../TouchBook.scr
