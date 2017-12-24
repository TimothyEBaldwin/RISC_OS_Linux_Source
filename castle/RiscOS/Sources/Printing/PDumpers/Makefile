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
# Makefile for PDumper (Printer Dumpers)
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 27-May-94  AMcC         Created.
# 03-Nov-94  MJS          Added EscapeP2 dumper
# 24-Jul-95  MJS          Added CanonX dumper
# 13-Dec-02  SAR          Added CanonX2 dumper created from common CanonX sources
#

#
#
EXP_HDR = <export$dir>

#
# Program specific options:
#
COMPONENT = PDumpers
EXPORTS   = ${EXP_HDR}.PDumper
DUMPERS   = DotMatrix \
            ImageWriter \
            LaserJet \
            PCL \
            EscapeP2 \
            CanonX2 \
            CanonX \
            24Pin \
            Sprite

#
# Generic options:
#
CP      = copy
MKDIR   = do mkdir -p
DIR     = @dir
WIPE    = x wipe
MAKE   ?= amu
SUBMAKE = @${MAKE} ${MFLAGS} ${MAKECMDGOALS}

STRIPDEPEND = stripdepnd

CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Generic rules:
#
all: ${DUMPERS}
        @echo ${COMPONENT}: all built (disc)

rom: ${DUMPERS}
        @echo ${COMPONENT}: all built (rom)

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install: ${DUMPERS}
        Set Alias$CPFD $(CP) rm.%0 $(INSTDIR).%0 $(CPFLAGS)
        Set Alias$CPFDL CPFD %0|MAccess $(INSTDIR).%0 LR/r
        |
        $(MKDIR) $(INSTDIR)
        CPFDL PDumperDM
        CPFDL PDumperIW
        CPFDL PDumperLJ
        CPFDL PDumperPCL
        CPFDL PDumperE2
        CPFDL PDumperCX2
        CPFDL PDumperCX
        |
        Unset Alias$CPFDL
        Unset Alias$CPFD
        @echo ${COMPONENT}: installed (disc)

install_rom: ${DUMPERS}
        ${CP} rm.PDumperDM  ${INSTDIR}.PDumperDM  ${CPFLAGS}
        ${CP} rm.PDumperIW  ${INSTDIR}.PDumperIW  ${CPFLAGS}
        ${CP} rm.PDumperLJ  ${INSTDIR}.PDumperLJ  ${CPFLAGS}
        ${CP} rm.PDumperPCL ${INSTDIR}.PDumperPCL ${CPFLAGS}
        ${CP} rm.PDumperE2  ${INSTDIR}.PDumperE2  ${CPFLAGS}
        ${CP} rm.PDumperCX2 ${INSTDIR}.PDumperCX2 ${CPFLAGS}
        ${CP} rm.PDumperCX  ${INSTDIR}.PDumperCX  ${CPFLAGS}
        @echo ${COMPONENT}: installed (rom)

clean: ${DUMPERS}
        ${XWIPE} rm.* ${WFLAGS}
        ${STRIPDEPEND} PDumper24.Makefile
        ${STRIPDEPEND} PDumperCX.Makefile
        ${STRIPDEPEND} PDumperDM.Makefile
        ${STRIPDEPEND} PDumperE2.Makefile
        ${STRIPDEPEND} PDumperIW.Makefile
        ${STRIPDEPEND} PDumperLJ.Makefile
        ${STRIPDEPEND} PDumperPCL.Makefile
        ${STRIPDEPEND} PDumperSP.Makefile
        @echo ${COMPONENT}: cleaned

${EXP_HDR}.PDumper: hdr.PDumper
        ${CP} hdr.PDumper $@ ${CPFLAGS}

#----------------------------------------------------------------------
# Supported bit image printers
#----------------------------------------------------------------------

DotMatrix:
        ${DIR} PDumperDM
        ${SUBMAKE} ^.rm.PDumperDM INSTDIR=^.rm
        @back

ImageWriter:
        ${DIR} PDumperIW
        ${SUBMAKE} ^.rm.PDumperIW INSTDIR=^.rm
        @back

LaserJet:
        ${DIR} PDumperLJ
        ${SUBMAKE} ^.rm.PDumperLJ INSTDIR=^.rm
        @back

PCL:
        ${DIR} PDumperPCL
        ${SUBMAKE} ^.rm.PDumperPCL INSTDIR=^.rm
        @back

EscapeP2:
        ${DIR} PDumperE2
        ${SUBMAKE} ^.rm.PDumperE2 INSTDIR=^.rm
        @back

CanonX2:
        ${DIR} PDumperCX
        ${SUBMAKE} ^.rm.PDumperCX2 TARGET=PDumperCX2 INSTDIR=^.rm 
        @back

CanonX:
        ${DIR} PDumperCX
        ${SUBMAKE} ^.rm.PDumperCX TARGET=PDumperCX INSTDIR=^.rm 
        @back

24Pin:
        ${DIR} PDumper24
        ${SUBMAKE} ^.rm.PDumper24 INSTDIR=^.rm
        @back

Sprite:
        ${DIR} PDumperSP
        ${SUBMAKE} ^.rm.PDumperSP25 INSTDIR=^.rm
        @back

# Dynamic dependencies:
