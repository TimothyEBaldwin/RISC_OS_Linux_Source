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
# Makefile for Colour Translation module
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 10-Mar-95  GPS          Changed method for building ROM tables.
# 14-May-01  SNB          Changed to used fragment makefiles
#

COMPONENT = ColourTrans
TARGET    = Colours
ROM_SOURCE = MakeNew
HEADER1   = ColourTran
INSTRES_FILES = Tables.4greys:Tables   Palettes.4greys:Palettes \
                Tables.8greys:Tables   Palettes.8greys:Palettes \
                Tables.4desktop:Tables Palettes.4desktop:Palettes \
                Tables.8desktop:Tables Palettes.8desktop:Palettes
INSTRES_DEPENDS = MakeTables

include StdTools
include AAsmModule

clean::
        ${XWIPE} Tables.* ${WFLAGS}
        ${XWIPE} Palettes.* ${WFLAGS}
        ${XWIPE} MkTables.o.* ${WFLAGS}
        ${RM} MkTables.maketables

#
# Static dependencies:
#
MakeTables: MkTables.maketables
        ${XWIPE} Tables.* ${WFLAGS}
        ${RUN}MkTables.maketables @
        ${SQUASH} Tables.4greys
        ${SQUASH} Tables.8greys  
        ${SQUASH} Tables.4desktop

MkTables.maketables: MkTables.c.maketables
        ${CD} MkTables
        ${MAKE} -f maketables/mk COMPONENT=maketables THROWBACK=${THROWBACK}
        ${CD} ^

# Dynamic dependencies:
