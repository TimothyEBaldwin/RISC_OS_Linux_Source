Softloader
==========

This is a ROM softloader patch for RiscPC/A7000/A7000+ machines. 

It includes the softload tool and respective RISC OS ROM image which can be 
installed into your boot sequence as follows:

* You will need a standard layout !Boot already installed on your computer
  to try out the softload, the default HardDisc4 distribution includes one
  suitable for the major ROM releases from RISC OS 3.10, and is available from
    http://www.riscosopen.org/content/downloads/common
  follow the instructions inside the archive to install this first.

* Ensure you have an up to date !System containing SharedCLibrary 5.46 or
  later. An updated !System for 26 bit operating systems is available from
    http://www.riscosopen.org/content/downloads/riscpc
  follow the instructions inside the archive to install that too.

If you are using RISC OS 3
--------------------------

* Open your main hard disc (left click on the hard disc iconbar icon)

* Copy the '!Boot' application from this zip file on top of your 
  existing one, this will add the softloader to your boot time Choices

* Be aware that if your boot application contains RISC OS 3 specific items
  these will probably not be compatible with RISC OS 5, so additional manual
  steps may be required to ensure these do not conflict - eg. when first run
  the !Boot application copies such items into '!Boot.Choices.Boot' to match
  the ROM operating system

If you are using RISC OS 4 or later
-----------------------------------

* Run the configure application by left double-clicking '!Boot'

* Left click on the 'Boot' icon to open the "Boot sequence" configuration
  window, then left click on 'Install' to open the "Boot Merge" window

* Drag the '!Boot' application from this zip file to the merge window

* Click on the 'Merge' button to install the softloader

* Be aware that if your boot application contains RISC OS 4 specific items
  these will probably not be compatible with RISC OS 5, so additional manual
  steps may be required to ensure these do not conflict - eg. when first run
  the !Boot application copies such items into '!Boot.Choices.Boot' to match
  the ROM operating system

Restarting
----------

You can now reboot in order to try out this version of RISC OS.
You will be prompted when the machine boots as to whether you
would like to softload or continue booting with your ROM installed (in the 
ROM chip on the motherboard) version of RISC OS.
Press 'y' or 'n' on the keyboard to indicate your choice when asked.

Thanks!

-- The ROOL Team