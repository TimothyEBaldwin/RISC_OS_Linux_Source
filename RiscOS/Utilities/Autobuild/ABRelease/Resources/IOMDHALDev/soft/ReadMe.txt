This is a ROM softloader patch for RiscPC and A7000 machines. It includes a
development release of the RISC OS 5.17 ROM image which can be installed into
your boot sequence as follows:

* Open your main hard disc (left click on the hard disc iconbar icon)

* Run the !Boot application by left double-clicking '!Boot'

* Left click on the 'Boot' icon to open the "Boot sequence" configuration
  window

* Left click on the 'Install' icon to open the "Boot Merge" window

* Drag the !Boot directory from this zip file to the merge window

* Click on the 'Merge' button to install the softloader

You can now reboot in order to try the latest development version of RISC OS
for the RiscPC/A7000. You will be prompted when the machine boots as to
whether you would like to softload or continue booting with your normal
(installed) version of RISC OS. Press 'y' or 'n' on the keyboard to indicate
your choice when asked.

Please note: this is a development release of the operating system and is
supplied in an entirely untested state. The softload tool is also largely
untested at present so please send a report of any problems you encounter to
info@riscosopen.org.

For a list of known issues with this ROM image, please see the ROOL wiki:

http://www.riscosopen.org/wiki/documentation/show/Software%20information:%20IOMD%20ROM


Thanks!

-- The ROOL Team