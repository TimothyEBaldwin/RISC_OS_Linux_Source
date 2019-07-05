Softloader
==========

This is a ROM softloader patch for the IYONIX pc. 

It includes the softload tool and respective RISC OS ROM image which can be 
installed into your boot sequence as follows:

* You will need a standard layout !Boot already installed on your computer
  to try out the softload, the default HardDisc4 distribution includes one
  suitable for the major ROM releases from RISC OS 3.10, and is available from
    http://www.riscosopen.org/content/downloads/common
  follow the instructions inside the archive to install this first.

* Ensure you have an up to date !System containing SharedCLibrary 5.46 or
  later. 

Installing the patch
--------------------

* Run the configure application by left double-clicking '!Boot'

* Left click on the 'Boot' icon to open the "Boot sequence" configuration
  window, then left click on 'Install' to open the "Boot Merge" window

* Drag the '!Boot' application from this zip file to the merge window

* Click on the 'Merge' button to install the softloader

Restarting
----------

You can now reboot in order to try out this version of RISC OS.
You will be prompted when the machine boots as to whether you
would like to softload or continue booting with your ROM installed (in the 
ROM chip on the motherboard) version of RISC OS.
Press 'y' or 'n' on the keyboard to indicate your choice when asked.

Thanks!

-- The ROOL Team