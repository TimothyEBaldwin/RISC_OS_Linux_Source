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
