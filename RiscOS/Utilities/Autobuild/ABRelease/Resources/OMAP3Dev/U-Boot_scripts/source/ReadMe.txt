RISC OS U-Boot scripts
----------------------

This folder contains the human-readable source to the boot scripts, along with a Unix shell script for converting the scripts to binary format using U-Boot's 'mkimage' tool.

Currently the scripts operate by entering the OMAP ROM image at different entry points - one entry point per machine type. From the entry point used, RISC OS is then able to determine the machine type that it is running on, and thus the correct parameters to use for initialising and communicating with peripherals. The table of entry points is listed below. New entries will only ever be added to the end; existing entries will no be moved/removed.

You can use the table below as a guide for creating your own scripts, or by choosing the right entry point when converting a RISC OS ROM image to a U-Boot uImage.


Machine type		Entry point
------------		-----------

BeagleBoard		ROM start + &00000000
DevKit8000		ROM start + &00000004
IGEPv2			ROM start + &00000008
Pandora			ROM start + &0000000C
Touch Book		ROM start + &00000010



Jeffrey Lee, 3/03/2010
me@phlamethrower.co.uk