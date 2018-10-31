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
# Makefile for PCCardFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 15-Jul-94  AMcC         Created.
# 11-Oct-94  WT           Changed constituent files.

#
# Paths
#
EXP_HDR = <export$dir>

#
# Include files
#
CFLAGS = -zm -zps1

#
# Generic options:
#
include Makefiles:StdTools

#
# Libraries
#
include Makefiles:ModuleLibs


#
# Program specific options:
#
COMPONENT   = PCCardFS
RELOC_MOD   = rm.PCCardFS
TARGET      = aof.PCCardFS
EXPORTS     = ${EXP_HDR}.PCCardFS
RDIR        = Resources
LDIR        = ${RDIR}.${LOCALE}

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}

OBJS =\
 Debug.o\
 DefaultCIS.o\
 DiscOp.o\
 Error.o\
 FS_Veneer.o\
 Header.o\
 Init.o\
 Misc.o\
 MiscOp.o\
 Resources.o\
 Services.o\
 StarCmd.o\
 Swi.o\
 Variables.o

#
# Rule patterns
#
include Makefiles:ModStdRule

#
# Build rules:
#
all: ${RELOC_MOD}
        @echo ${COMPONENT}: all built

rom: ${TARGET}
        @echo ${COMPONENT}: all built (rom version)

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install_rom: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${WIPE} o.* ${WFLAGS}
        ${RM} ${RELOC_MOD}
        ${RM} ${TARGET}
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}
        ${CP} LocalRes:Messages ${RESDIR}.Messages ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS} ${ROMCSTUBS}
        ${LD} -o $@ -aof ${OBJS} ${ROMCSTUBS}

rom_link:
        ${MKDIR} linked
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

${RELOC_MOD}: ${OBJS} ${CLIB}
        ${LD} -o $@ -Module ${OBJS} ${CLIB}

${EXP_HDR}.PCCardFS: hdr.PCCardFS
        ${CP} hdr.PCCardFS $@ ${CPFLAGS}

# Dynamic dependencies:
