RISC OS Open Release Archive
============================

This is the !System distribution of modules to update machines prior to 
those running RISC OS 5. If you already use RISC OS 5 then this distribution 
will do nothing since the disc image and ROM already contain the 
same (or later) versions.

Do not use the merge dialogue in 

  !Boot > Configuration > System Merge

because part of the update must refresh files in a directory that the merge 
dialogue cannot reach. Instead, a simple obey file called !SysMerge is
included.

Double click on !SysMerge.

!SysMerge should take a couple of seconds to run and it will only display a
message if it fails for any reason. It will copy each module into 
your !System directory (unless an even later version is already installed).

-- RISC OS Open
