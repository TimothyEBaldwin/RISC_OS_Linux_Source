# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
# 
# Project:   makeenc


# Toolflags:
CCflags = -c -depend !Depend -IC: -throwback
C++flags = -c -depend !Depend -IC: -throwback
Linkflags = -aif -c++ -o $@
ObjAsmflags = -throwback -NoCache -depend !Depend
CMHGflags = -depend !Depend -throwback -IC:
LibFileflags = -c -o $@
Squeezeflags = -o $@


# Final targets:
@.makeenc:   @.o.makeenc @.o.throwback C:o.Stubs 
        Link $(Linkflags) @.o.makeenc @.o.throwback C:o.Stubs 


# User-editable dependencies:

# Static dependencies:
@.o.makeenc:   @.c.makeenc
        cc $(ccflags) -o @.o.makeenc @.c.makeenc 
@.o.throwback:   @.c.throwback
        cc $(ccflags) -o @.o.throwback @.c.throwback 


# Dynamic dependencies:
o.throwback:	c.throwback
o.throwback:	C:h.swis
o.throwback:	C:h.kernel
o.throwback:	h.throwback
o.makeenc:	c.makeenc
o.makeenc:	C:Unicode.h.iso10646
o.makeenc:	h.throwback
