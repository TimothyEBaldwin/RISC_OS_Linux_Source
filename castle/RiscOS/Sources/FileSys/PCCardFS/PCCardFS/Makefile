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
