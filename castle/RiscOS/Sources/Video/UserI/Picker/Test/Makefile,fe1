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
VPATH = @ <Support$Dir>

CC = cc -c -ISupport:,OS: -fachK -wp ${THROWBACK} -depend !Depend
OBJASM = ObjAsm ${THROWBACK} -depend !Depend -stamp -quit
LINK   = Link
LIBS = OSLib:o.oslib CLib:o.Stubs

OBJS = o.application o.callback o.riscos o.task o.trace o.m o.hostfs

ASMS = s.main s.application s.callback s.riscos s.task

INCS = i.main i.application i.callback i.riscos i.task

all: Test
   @Do Announce "Made <Obey$Dir>"

asms: ${ASMS}

incs: ${INCS}

Test: o.main ${OBJS} ${LIBS}
   ${LINK} -output Test o.main ${OBJS} ${LIBS}
   Access Test WR/R
   SetType Test Absolute

clean:
   -Destroy ${OBJS} ${ASMS} ${INCS} Test

o.trace: h.hostfs

.SUFFIXES: .o .c .s .i .h .def
.c.s:;     ${CC} -S -o $@ $<
.c.o:;     ${CC} -c -o $@ $<
.s.o:;     ${OBJASM} -from $< -to $@
.c.i:;     ${CC} -E -C $< > $@
.def.o:;   DefMod -l -o l.$* < $<
           LibFile -c -o $@ -via ViaFile
           Wipe l.$* ~C~VR
.def.h:;   DefMod -h < $< > $@

# Dynamic dependencies:
o.callback:	<Support$Dir>.c.callback
o.callback:	OS:h.types
o.callback:	<Support$Dir>.h.callback
o.callback:	OS:h.os
o.callback:	<Support$Dir>.h.trace
o.callback:	<Support$Dir>.h.m
o.callback:	<Support$Dir>.h.realloc
o.callback:	<Support$Dir>.h.riscos
o.callback:	OS:h.territory
o.callback:	<Support$Dir>.h.trace
o.riscos:	<Support$Dir>.c.riscos
o.riscos:	OS:h.messagetrans
o.riscos:	OS:h.types
o.riscos:	OS:h.os
o.riscos:	OS:h.macros
o.riscos:	OS:h.os
o.riscos:	OS:h.territory
o.riscos:	OS:h.wimp
o.riscos:	OS:h.osspriteop
o.riscos:	OS:h.font
o.riscos:	<Support$Dir>.h.m
o.riscos:	<Support$Dir>.h.realloc
o.riscos:	<Support$Dir>.h.trace
o.riscos:	<Support$Dir>.h.riscos
o.riscos:	<Support$Dir>.h.trace
o.task:	<Support$Dir>.c.task
o.task:	OS:h.help
o.task:	OS:h.types
o.task:	OS:h.os
o.task:	OS:h.wimp
o.task:	OS:h.osspriteop
o.task:	OS:h.font
o.task:	OS:h.macros
o.task:	OS:h.messagetrans
o.task:	OS:h.os
o.task:	OS:h.osbyte
o.task:	OS:h.taskmanager
o.task:	OS:h.wimp
o.task:	<Support$Dir>.h.callback
o.task:	<Support$Dir>.h.trace
o.task:	<Support$Dir>.h.m
o.task:	<Support$Dir>.h.realloc
o.task:	<Support$Dir>.h.riscos
o.task:	OS:h.territory
o.task:	<Support$Dir>.h.task
o.task:	<Support$Dir>.h.trace
o.trace:	<Support$Dir>.c.trace
o.trace:	OS:h.econet
o.trace:	OS:h.types
o.trace:	OS:h.os
o.trace:	OS:h.macros
o.trace:	OS:h.os
o.trace:	OS:h.osargs
o.trace:	OS:h.osfile
o.trace:	OS:h.osfind
o.trace:	OS:h.osgbpb
o.trace:	h.hostfs
o.trace:	<Support$Dir>.h.trace
o.m:	<Support$Dir>.c.m
o.m:	OS:h.macros
o.m:	OS:h.os
o.m:	OS:h.types
o.m:	OS:h.wimp
o.m:	OS:h.osspriteop
o.m:	OS:h.font
o.m:	<Support$Dir>.h.m
o.m:	<Support$Dir>.h.realloc
o.m:	<Support$Dir>.h.trace
o.m:	<Support$Dir>.h.riscos
o.m:	OS:h.territory
o.m:	<Support$Dir>.h.trace
o.application:	<Support$Dir>.c.application
o.application:	OS:h.os
o.application:	OS:h.types
o.application:	OS:h.wimp
o.application:	OS:h.osspriteop
o.application:	OS:h.font
o.application:	OS:h.wimpreadsysinfo
o.application:	<Support$Dir>.h.application
o.application:	<Support$Dir>.h.callback
o.application:	<Support$Dir>.h.trace
o.application:	<Support$Dir>.h.task
o.application:	<Support$Dir>.h.task
o.application:	<Support$Dir>.h.trace
o.main:	c.main
o.main:	OS:h.help
o.main:	OS:h.types
o.main:	OS:h.os
o.main:	OS:h.wimp
o.main:	OS:h.osspriteop
o.main:	OS:h.font
o.main:	OS:h.macros
o.main:	OS:h.os
o.main:	OS:h.wimp
o.main:	OS:h.wimpreadsysinfo
o.main:	Support:h.application
o.main:	Support:h.callback
o.main:	Support:h.trace
o.main:	Support:h.task
o.main:	Support:h.callback
o.main:	Support:h.riscos
o.main:	OS:h.territory
o.main:	Support:h.trace
o.main:	OS:h.colourpicker
