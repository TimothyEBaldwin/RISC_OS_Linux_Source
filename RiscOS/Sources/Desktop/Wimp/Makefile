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
# Makefile for Wimp
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name    Description
# ----       ----    -----------
# 25-May-94  AMcC    Created.
# 18-Oct-94  AMcC    Template3D now copied to Resources as 'Templates'
#                    Now correctly copies Tools3D to Resources:...Tools
# 26-Jun-95  JRH     Now copies STB (ie hacked-down) versions of Tools,
#                    Templates and Sprites. Doesn't copy Sprites22
# 23-Oct-98  BJGA    Changed to use objasm, so that we can override the
#                    choice of options file using an argument to amu
# 03-Aug-99  BJGA    No longer produces build errors if some resources are absent
#

#
# Program specific options:
#
COMPONENT = WindowManager
TARGET   ?= Wimp
HEADER1   = ${TARGET}
HEADER2   = WimpSpace
CUSTOMRES = custom

SA_FLAGS  =
ASFLAGS   = -NoWarn -PreDefine "Options SETS \"${OPTIONS}\""

ifeq (${TARGET},ThemeDefs)
CUSTOMSA  = custom
CUSTOMEXP = custom

install: 
	${MKDIR} ${INSTDIR}.${USERIF}
	| Give the disc ones in preference if they exist, else minimalist ROM ones
	IfThere LocalRes:${USERIF}.DiscSprites.Sprites   Then ${CP} LocalRes:${USERIF}.DiscSprites.Sprites   ${INSTDIR}.${USERIF}.Sprites   ${CPFLAGS} Else ${CP} LocalRes:${USERIF}.Sprites ${INSTDIR}.${USERIF}.Sprites ${CPFLAGS}
	IfThere LocalRes:${USERIF}.DiscSprites.Sprites11 Then ${CP} LocalRes:${USERIF}.DiscSprites.Sprites11 ${INSTDIR}.${USERIF}.Sprites11 ${CPFLAGS}
	IfThere LocalRes:${USERIF}.DiscSprites.Sprites22 Then ${CP} LocalRes:${USERIF}.DiscSprites.Sprites22 ${INSTDIR}.${USERIF}.Sprites22 ${CPFLAGS}
	IfThere LocalRes:${USERIF}.DiscSprites.Tools     Then ${CP} LocalRes:${USERIF}.DiscSprites.Tools     ${INSTDIR}.${USERIF}.Tools     ${CPFLAGS} Else ${CP} LocalRes:${USERIF}.Tools   ${INSTDIR}.${USERIF}.Tools   ${CPFLAGS}
	IfThere LocalRes:${USERIF}.DiscSprites.CoFlags   Then ${CP} LocalRes:${USERIF}.DiscSprites.CoFlags   ${INSTDIR}.${USERIF}.CoFlags   ${CPFLAGS}
	IfThere LocalRes:${USERIF}.DiscSprites.CoSprite  Then ${CP} LocalRes:${USERIF}.DiscSprites.CoSprite  ${INSTDIR}.${USERIF}.CoSprite  ${CPFLAGS}
	@${ECHO} ${COMPONENT}: disc theme resources installed

export:
	@${ECHO} ${COMPONENT}: nothing to export when target is ${TARGET}
endif

include StdTools
include AAsmModule

resources: resources-wimp-${CMDHELP}
	@echo ${COMPONENT}: resource files copied

resources-wimp_common:
	${MKDIR} ${RESFSDIR}
	IfThere LocalRes:<UserIF>.Messages  Then ${CP} LocalRes:<UserIF>.Messages  ${RESFSDIR}.Messages  ${CPFLAGS} Else IfThere LocalRes:Messages Then ${CP} LocalRes:Messages ${RESFSDIR}.Messages ${CPFLAGS}
	IfThere LocalRes:<UserIF>.Templates Then ${CP} LocalRes:<UserIF>.Templates ${RESFSDIR}.Templates ${CPFLAGS}
	IfThere LocalRes:<UserIF>.Sprites   Then ${CP} LocalRes:<UserIF>.Sprites   ${RESFSDIR}.Sprites   ${CPFLAGS}
	IfThere LocalRes:<UserIF>.Sprites22 Then ${CP} LocalRes:<UserIF>.Sprites22 ${RESFSDIR}.Sprites22 ${CPFLAGS}
	IfThere LocalRes:<UserIF>.TileN     Then ${CP} LocalRes:<UserIF>.TileN     ${RESFSDIR}.TileN     ${CPFLAGS}
	IfThere LocalRes:<UserIF>.TileV     Then ${CP} LocalRes:<UserIF>.TileV     ${RESFSDIR}.TileV     ${CPFLAGS}
	IfThere LocalRes:<UserIF>.Tools     Then ${CP} LocalRes:<UserIF>.Tools     ${RESFSDIR}.Tools     ${CPFLAGS}

resources-wimp-None: resources-wimp_common
	@|

resources-wimp-: resources-wimp_common
	@IfThere LocalRes:CmdHelp Then ${CAT} LocalRes:CmdHelp { >> ${RESFSDIR}.Messages }

BBETYPE = wimp
bbe-wimp: bbe-generic-resources-get-alias
	BBE_Export_File_In_Dir Resources.${LOCALE} Messages
	BBE_Export_File_In_Dir Resources.${LOCALE} CmdHelp
	BBE_Export_Dir Resources.${LOCALE}.${USERIF}
	BBE_Export_File VersionNum

# Dynamic dependencies:
