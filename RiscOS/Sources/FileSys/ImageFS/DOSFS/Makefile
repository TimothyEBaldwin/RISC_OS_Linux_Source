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
# Makefile for DOSFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 30-Aug-94  AMcC         Added rom_link rule
# 07-Nov-02  RPS          Ability to pass PCMCIA switch in

# For objasm 3.00 (comment out if using earlier assembler)
APCS_NONE = -apcs none

#
# Paths
#
EXP_HDR = <export$dir>

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

ifeq ($(FAT32_DISABLE),TRUE)
FAT_DISABLE = -DNO_FAT32
endif

AFLAGS  = -depend !Depend -Stamp -quit -predefine "PCMCIATRUE SETL {${PCMCIA}}"
CFLAGS  = -c -depend !Depend -ffah -zps1 -zM ${INCLUDES} ${DFLAGS} ${FAT_DISABLE} ${THROWBACK}
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
include ModuleLibs

CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.AbsSym

#
# Include files
#
INCLUDES = -IC:

DEBUG    ?= FALSE
# DFLAGS should be NULL for any non-debugging release
DFLAGS    = -dPCMCIA${PCMCIA} -dDEBUG${DEBUG} 
#DFLAGS    = -dPCMCIA${PCMCIA} -dTRACE -dTUBE=1  

#
# Program specific options:
#
COMPONENT = DOSFS
TARGET    = aof.DOSFS
EXPORTS   = ${EXP_HDR}.DOSFS

OBJS_COMMON =\
 o.DOSFS\
 o.DOSFSctl\
 o.DOSclusters\
 o.DOSdirs\
 o.DOSnaming\
 o.Helpers\
 o.MsgTrans\
 o.OpsArgs\
 o.OpsFind\
 o.OpsFunc\
 o.OpsFile\
 o.OpsGetPut\
 o.Statics\
 o.TIMEconv\
 o.debug\
 o.StaticDefs\

OBJS_RAM =\
 ${OBJS_COMMON}\
 o.DOSFShdrRAM

OBJS_ROM =\
 ${OBJS_COMMON}\
 o.init\
 o.DOSFShdr

#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@
.cmhg.o:;   ${CMHG} -p -o $@ $<
.cmhg.h:;   ${CMHG} -p -d $@ $<

#
# build a relocatable module:
#
all: rm.DOSFS

debug: rm.DOSFSD

#
# RISC OS ROM build rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install: rm.DOSFS
	${MKDIR} ${INSTDIR}
	${CP} rm.${COMPONENT} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: installed (disc)

install_rom: ${TARGET}
	${MKDIR} ${INSTDIR}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: installed (rom)

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} rm.* ${WFLAGS}
	${WIPE} linked.* ${WFLAGS}
	${RM} symbols
	${RM} ${TARGET}
	${RM} h.DOSFShdr
	@echo ${COMPONENT}: cleaned

resources:
	${MKDIR} ${RESDIR}.${COMPONENT}
	TokenCheck LocalRes:Messages
	${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS_ROM} ${ROMCSTUBS}
	${LD} -o $@ -aof ${OBJS_ROM} ${ASMUTILS} ${ROMCSTUBS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

rm.DOSFS: ${OBJS_RAM} ${CLIB}
	${LD} -o $@ -module ${OBJS_RAM} ${ASMUTILS} ${CLIB} 
	@echo ${COMPONENT}: RAM module built

rm.DOSFSd: ${OBJS_RAM} ${CLIB}
	${LD} -o $@ -module -symbols symbols ${OBJS_RAM} ${DEBUGLIB} ${MODMALLOCLIB} ${WILDLIB} ${DDTLIB} ${DESKLIB} ${NET5LIBS} ${ASMUTILS} ${CLIB}
	@echo ${COMPONENT}: RAM debug module built

${EXP_HDR}.DOSFS: hdr.DOSFS
	${CP} hdr.DOSFS $@ ${CPFLAGS}

# Static dependencies:

o.DOSFShdrRAM: cmhg.DOSFShdr
	${CMHG} -p -DRAM -o $@ cmhg.DOSFShdr

# recreate h.DOSFShdr if necessary
o.DOSFS: h.DOSFShdr

# DOSFS C Support functions (defines C register definitions)
# Workaround required when using Objasm 3.00
o.DOSFSctl: s.DOSFSctl
	${AS} ${AFLAGS} ${APCS_NONE} s.DOSFSctl $@

# Dynamic dependencies:
