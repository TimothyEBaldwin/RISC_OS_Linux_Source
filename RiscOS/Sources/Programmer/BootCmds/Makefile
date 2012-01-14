# Copyright 1997 Acorn Computers Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Makefile for BootCommands
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date           Name       Description
# ----           ----       -----------
# 12th Sep 1994  JC         Created.
#

#
# Generic options:
#
MKDIR   = do mkdir -p
CC      = cc -IOS: -fach -wp -DBOOTCMDS
CP      = copy
CPFLAGS = ~cfr~v
OBJASM  = ObjAsm ${THROWBACK} -depend !Depend -stamp -quit
CMHG    = CMHG
LINK    = Link 
ZM      = -zM
WIPE    = x wipe
XWIPE   = x wipe
WFLAGS  = ~c~vr
RM      = remove

STUBS   = CLib:o.Stubs

#
# Libraries:
#
OSLIB  = OSLib:OSLib.o
RSTUBS = RISC_OSLib:o.romcstubs
ABSSYM = RISC_OSLib:o.abssym

#
# Program specific options:
#
COMPONENT = BootCmds
TARGET    = aof.${COMPONENT}
RESDIR    = <resource$dir>.Resources2.BootCmds

OBJS = o.files o.header o.main o.Messages o.Repeat o.riscos

OBJSD = o.header o.hostfs debug.m debug.main debug.trace \
      debug.riscos debug.files o.Repeat o.Messages debug.svc

ROM_OBJS = o.files o.header o.main o.Repeat o.riscos

ASMS = s.main

RESOURCES = o.Messages o.Repeat

#
# Generic rules {used by top-level build}:
#

all: rm.${COMPONENT}

rom: ${TARGET}
	@echo BootCmds: rom module built

export: 
	@echo BootCmds: export complete

install: install_${COMPONENT}

install_BootCmds: RM.BootCmds
	${MKDIR} ${INSTDIR}
	${CP} RM.BootCmds ${INSTDIR}.BootCmds ${CPFLAGS}
	@echo ${COMPONENT}: ram module installed

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.BootCmds ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${XWIPE} o.* ${WFLAGS}
	${XWIPE} rm.* ${WFLAGS}
	${XWIPE} linked.* ${WFLAGS}
	${XWIPE} map.* ${WFLAGS}
	${RM} Resources.Repeat
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

resources: resources-${CMDHELP}
	@echo BootCmds: Resources copied to Messages module

resources_common:
	${MKDIR} ${RESDIR}
	${CP} LocalRes:Messages  ${RESDIR}.Messages  ${CPFLAGS}

resources-None: resources_common
	@

resources-: resources_common
	print LocalRes:CmdHelp { >> ${RESDIR}.Messages }

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${ROM_OBJS} ${OSLIB} ${RSTUBS}
	${LINK} -o $@ -aof ${ROM_OBJS} ${OSLIB} ${RSTUBS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${LINK} -o linked.BootCmds -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
	${CP} linked.BootCmds ${LINKDIR}.BootCmds ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

#
# Extra {development} rules:
#

asms: ${ASMS}

#Internal targets
RM.BootCmds: ${OBJS} ${OSLIB} ${STUBS}
	${LINK} -rmf -output RM.BootCmds ${OBJS} ${OSLIB} ${STUBS}
	Access RM.BootCmds WR/R

RM.BootCmdsD: ${OBJSD} ${OSLIB} ${STUBS}
	${LINK} -rmf -output RM.BootCmdsD ${OBJSD} ${OSLIB} ${STUBS}
	Access RM.BootCmdsD WR/R

o.Messages: LocalRes:Messages
	ResGen Messages o.Messages LocalRes:Messages Resources.BootCmds.Messages

o.Repeat: Resources.Repeat
	ResGen Repeat o.Repeat Resources.Repeat Resources.BootCmds.Repeat

Resources.Repeat: o.repeatcmd ${OSLIB} ${STUBS}
	${LINK} -output Resources.Repeat o.repeatcmd ${OSLIB} ${STUBS}

o.repeatcmd: c.repeatcmd
	${CC} ${THROWBACK} -depend !Depend -c -ff c.repeatcmd

debug.trace: h.hostfs

#General rules
.SUFFIXES:   .cmhg .c .debug .o .asm .def
.c.o:;       ${CC} ${THROWBACK} -depend !Depend -c ${ZM} -ff $<
.asm.o:;     ${OBJASM} -stamp -quit $< $@
.asm.debug:; ${OBJASM} -pd "TRACE SETL {TRUE}" -pd "STANDALONE SETL {TRUE}" -stamp -quit $< $@
.c.debug:;   ${CC} ${THROWBACK} -depend !Depend -c ${ZM} -ff -DTRACE=1 -DSTANDALONE -o $@ $<
.cmhg.o:;    ${CMHG} -p -depend !Depend $< $@
.c.s:;       ${CC} ${THROWBACK} -depend !Depend -s ${ZM} -ff $<
.def.o:;     DefMod -l -o l.$* < $<
	     LibFile -c -o $@ -via ViaFile
	     Wipe l.$* ~C~FR~V
.def.h:;     DefMod -h < $< > $@
.def.s:;     DefMod -s < $< > $@

# Dynamic dependencies:
