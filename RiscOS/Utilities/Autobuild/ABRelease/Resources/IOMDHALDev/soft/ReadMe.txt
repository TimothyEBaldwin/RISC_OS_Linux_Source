This is a ROM softloader patch for RiscPC/A7000/A7000+ machines. It includes
the softload tool and respective RISC OS ROM image which can be installed into
your boot sequence as follows:

* Ensure you have an up to date !System containing SharedCLibrary 5.46 or
  later. An updated !System for 26 bit operating systems is available from
    http://www.riscosopen.org/content/downloads/other-zipfiles
  follow the instructions inside the archive to install this.
  Remember that although RISC OS 5 runs in 32 bit mode, the early part of
  the softloading is on the original 26 bit host operating system. 

* Open your main hard disc (left click on the hard disc iconbar icon)

* Run the configure application by left double-clicking '!Boot'

* Left click on the 'Boot' icon to open the "Boot sequence" configuration
  window

* Left click on the 'Install' icon to open the "Boot Merge" window

* Drag the !Boot directory from this zip file to the merge window

* Click on the 'Merge' button to install the softloader

You can now reboot in order to try out this version of RISC OS.
You will be prompted when the machine boots as to whether you
would like to softload or continue booting with your ROM installed (in the
flash ROM memory chip on the motherboard) version of RISC OS.
Press 'y' or 'n' on the keyboard to indicate your choice when asked.

Thanks!

-- The ROOL Team