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
# Makefile for Floating Point Accelerator Support Code (FPASC)
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name     Description
# ----       ----     -----------
# 25-May-94  AMcC     Created.
# 17-Aug-94  AMcC     Removed Specific machine names.
#                     If building for old series machines, comment out A600
#                     target and uncomment ARM2/3 target.
# 28-Jan-97  KJB      If building for a kernel that is capable of operating
#                     in a 32-mode with interrupts enabled, you can change
#                     the APCS to 32bit for a more efficient emulator

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = ObjAsm
CP      = Copy
LD      = Link
RM      = Remove
WIPE    = -Wipe
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Program specific options:
#
COMPONENT = FPEmulator
TARGET_ROM = rm.${MACHINE}.FPEmulator
TARGET_RAM = rm.${MACHINE}.FPERAM
EXPORTS   = ${EXP_HDR}.FPEmulator
FPEANCHOR ?= Low
# 32bit-compatible RAM builds store FPEAnchor locally, so that they're compatible with kernels which use high or low zero page workspace. But this means the module must write to its own image to set its workspace pointer.
# 26bit-only builds can stick with the legacy low FPEAnchor location, avoiding the need for the module to self-modify.
ifeq (${FPE_APCS},3/26bit)
FPEANCHOR_RAM ?= Low
else
FPEANCHOR_RAM ?= Local
endif

#
# Generic rules:
#
rom: ${TARGET_ROM}
        @echo ${COMPONENT}: rom module built

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install: ${TARGET_RAM}
        ${MKDIR} ${INSTDIR}
        ${CP} ${TARGET_RAM} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: ram module installed

install_rom: ${TARGET_ROM}
        ${CP} ${TARGET_ROM} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${RM} ${TARGET_ROM}
        ${RM} ${TARGET_RAM}
        ${WIPE} o.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}.${COMPONENT}
	TokenCheck LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

${TARGET_RAM}: o.fpe_ram
        ${MKDIR} rm.${MACHINE}
        ${LD} -rmf -o $@ o.fpe_ram

${TARGET_ROM}: o.fpe_rom
        ${MKDIR} rm.${MACHINE}
        ${LD} -rmf -o $@ o.fpe_rom

o.fpe_ram: s.${MACHINE}
        ${AS} -I Hdr:t.^ ${ASFLAGS} -APCS ${FPE_APCS} -PD "FPEAnchorType SETS \"${FPEANCHOR_RAM}\"" s.${MACHINE} $@

o.fpe_rom: s.${MACHINE}
        ${AS} -I Hdr:t.^ ${ASFLAGS} -APCS ${FPE_APCS} -PD "FPEAnchorType SETS \"${FPEANCHOR}\"" s.${MACHINE} $@

${EXP_HDR}.FPEmulator: hdr.FPEmulator
        ${CP} hdr.FPEmulator $@ ${CPFLAGS}

BBETYPE = fpasc
bbe-fpasc: bbe-generic
        BBE_Export_File ^.VersionNum

# Dynamic dependencies:
