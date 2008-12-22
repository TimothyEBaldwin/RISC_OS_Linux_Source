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

RESOURCEEXTRA = resources-colourtrans


include StdTools
include AAsmModule
include AppLibs

#
# Binary build environment
#
# Enhance the export rule to include the Tables and MkTables directories
BBETYPE   = local
bbe-local: bbe-generic
	BBE_Export_Dir Tables
	BBE_Export_Dir MkTables
	BBE_Export_Dir Palettes

#
# Generic rules:
#
clean::
	${XWIPE} Tables.* ${WFLAGS}
	${XWIPE} MkTables.o.* ${WFLAGS}
	${XWIPE} Palettes.* ${WFLAGS}
	${RM} MkTables.maketables
	@echo ${COMPONENT}: cleaned

resources-colourtrans: Palettes.8desktop
	${MKDIR} ${RESFSDIR}
	${CP} Palettes ${RESFSDIR}.* ${CPFLAGS}
	${CP} Tables   ${RESFSDIR}.* ${CPFLAGS}
	@echo ${COMPONENT}: extra resource files copied

MkTables.o.maketables: MkTables.c.maketables
	${CC} $(ccflags) -c -o $@ MkTables.c.maketables

MkTables.maketables:   MkTables.o.maketables ${CLIB} MkTables.o._dirs
	link $(linkflags) -o $@ MkTables.o.maketables ${CLIB}

Palettes.8desktop: MkTables.maketables ${ROM_MODULE}
	ifthere ${ROM_MODULE} then rmload ${ROM_MODULE} else rmload rm.${TARGET}
	MkTables.maketables @  
	settype Tables.8greys text
	settype Tables.4greys text
	MkTables.dosqueeze
	
MkTables.o._dirs:
	${MKDIR} MkTables.o

# Dynamic dependencies:
