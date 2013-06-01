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
# Makefile for MakePSFont
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 14-Sep-94  AMcC         Created.
# 25-Nov-94  MJS          s.init added to source
#

#
# Paths
#
EXP_HDR = <export$dir>

#
# Program specific options:
#
COMPONENT  = MakePSFont
MODULE     = rm.MakePSFont
ROM_MODULE = aof.MakePSFont
EXPORTS    = ${EXP_HDR}.MakePSFont
RDIR      = Resources
LDIR      = ${RDIR}.${LOCALE}


#
# Export Paths for Messages module
#
RESDIR  = <resource$dir>.Resources2.${COMPONENT}

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe

AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -depend !Depend ${INCLUDES} ${DFLAGS} -zM
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ABSSYM    = RISCOSLIB:o.c_abssym
ASMUTILS  = C:AsmUtils.o.AsmUtilsZM

#
# Include files
#
INCLUDES = -IC: -IC:AsmUtils

OBJS =\
 o.convert\
 o.float\
 o.init \
 o.mheader\
 o.module\
 o.provide\
 o.registry\
 o.swicall\
 o.use

#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@
.cmhg.o:;   ${CMHG} -p $< $@

#
# Build rules:
#
all: ${MODULE}
	@echo ${COMPONENT}: all built (disc)

rom: ${ROM_MODULE}
	@echo ${COMPONENT}: all built (rom)

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install: ${MODULE}
	${CP} ${MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	Access ${INSTDIR}.${COMPONENT} lr/r
	@echo ${COMPONENT}: installed (disc)

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: installed (rom)

resources:
	${MKDIR} ${RESDIR}
	${CP} ${LDIR}.Messages  ${RESDIR}.Messages  ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied to Messages module

clean:
	${WIPE} o.* ${WFLAGS}
	${RM} ${MODULE}
	${RM} ${ROM_MODULE}
	${RM} linked.${COMPONENT}
	@echo ${COMPONENT}: cleaned

${MODULE}: ${OBJS} ${CLIB}
	${LD} -o $@ -Module ${OBJS} ${ASMUTILS} ${CLIB}

# Partially linked AOF object file
${ROM_MODULE}: ${OBJS} ${ASMUTILS} ${ROMCSTUBS}
	${LD} -o $@ -aof ${OBJS} ${ASMUTILS} ${ROMCSTUBS}

#
# Final link for the ROM Image {using given base address}
#
rom_link:
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

${EXP_HDR}.MakePSFont: hdr.MakePSFont
	${CP} hdr.MakePSFont $@ ${CPFLAGS}

# Dynamic dependencies:
