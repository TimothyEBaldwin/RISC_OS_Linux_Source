# Copyright 1996 Acorn Computers Ltd
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
# Makefile for ToolAction
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
#

#
# Paths
#
EXP_HDR = <Cexport$dir>
EXP_HDR1 = <export$dir>.^.Interface2

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe
XWIPE   = x wipe
DEFMOD  = DefMod
MODSQZ  = modsqz
RESGEN  = resgen

AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -depend !Depend -zM -zps1 -ffah ${INCLUDES} ${DFLAGS} ${THROWBACK} -DNDEBUG
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

.SUFFIXES: .oz

#
# Libraries
#
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.AbsSym
OSLIB     = OSLib:o.OSLib
#
# Include files
#
INCLUDES = -IOS:,C:

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}

#
# Program specific options:
#
COMPONENT = ToolAction
TARGET    = aof.${COMPONENT}
BASEOBJS  = o.msgs o.utils o.toolact

OBJS	= o.modhdr o.resource o.resdata o.main o.string32 ${BASEOBJS}
ROMOBJS	= oz.modhdr oz.main oz.string32 ${BASEOBJS}

EXPORTS   = h.ToolAction hdr.ToolAction o.ToolAction

#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $< -DROM=0
.c.oz:;     ${CC} ${CFLAGS} -o $@ $< -DROM=1
.cmhg.o:;   ${CMHG} -p -o $@ $< h.$* -DROM=0
.cmhg.oz:;  ${CMHG} -p -o $@ $< h.$* -DROM=1
.cmhg.h:;   ${CMHG} -p -o null:o.$* $< $@ -DROM=0
.s.o:;      ${AS} ${AFLAGS} $< $@  -Predefine "ROM SETL {FALSE}"
.s.oz:;     ${AS} ${AFLAGS} $< $@  -Predefine "ROM SETL {TRUE}"

#
# build a relocatable module:
#
all: rm.${COMPONENT}

#
# component build rules
#

defs: h.ToolAction hdr.ToolAction o.ToolAction

h.ToolAction: Documents.def.ToolAction
	${DEFMOD} -h > h.ToolAction < Documents.def.ToolAction

hdr.ToolAction: Documents.def.ToolAction
	${DEFMOD} -hdr > hdr.ToolAction < Documents.def.ToolAction

o.ToolAction: Documents.def.ToolAction
	${DEFMOD} -l -o DefMod < Documents.def.ToolAction
	LibFile -c -o o.ToolAction -via viafile
	${RM} viafile
	${WIPE} Defmod ~cr

#
# RISC OS ROM build rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	${MKDIR} ${EXP_HDR}.h
	${MKDIR} ${EXP_HDR}.o
	${MKDIR} ${EXP_HDR1}
	${CP} h.ToolAction ${EXP_HDR}.h.ToolAction ${CPFLAGS}
	${CP} hdr.ToolAction ${EXP_HDR1}.ToolAction ${CPFLAGS}
	${CP} o.ToolAction ${EXP_HDR}.o.ToolAction ${CPFLAGS}
	@echo ${COMPONENT}: export complete

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

install: rm.${COMPONENT}
	${MKDIR} ${INSTDIR}
	${CP} rm.${COMPONENT} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: installed

clean:
	${XWIPE} o.* ${WFLAGS}
	${XWIPE} oz.* ${WFLAGS}
	${XWIPE} rm.* ${WFLAGS}
	${XWIPE} linked.* ${WFLAGS}
	${RM} ${TARGET}
	${RM} h.toolaction
	${RM} hdr.toolaction
	${RM} h.modhdr
	@echo ${COMPONENT}: cleaned

resources: LocalRes:Messages
	${MKDIR} ${RESDIR}
	TokenCheck LocalRes:Messages
	${CP} LocalRes:Messages ${RESDIR}.Messages ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied to Messages module

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${ROMOBJS} ${ROMCSTUBS} ${OSLIB}
	${LD} -o $@ -aof ${ROMOBJS} ${ROMCSTUBS} ${OSLIB}
#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

rm.${COMPONENT}: ${OBJS} ${OSLIB}
	${LD} -o $@ -module ${OBJS} ${OSLIB} ${CLIB}
	${MODSQZ} $@
	Access $@ WR/R

o.msgs oz.msgs o.resource oz.resource o.toolact oz.toolact: h.ToolAction

o.main oz.main: h.modhdr

o.resdata: LocalRes:Messages
	${RESGEN} toolaction_resources $@ LocalRes:Messages Resources.ToolAction.Messages

# Dynamic dependencies:
