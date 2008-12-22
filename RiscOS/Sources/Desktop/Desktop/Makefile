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
# Makefile for Desktop
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 07-Mar-01  SNB          Recreated
#

COMPONENT = Desktop
RESOURCES = manual

resources:
	${MKDIR} ${RESFSDIR}
	${CP}  LocalRes:Messages ${RESFSDIR}.Messages        ${CPFLAGS}
	${CAT} LocalRes:CmdHelp { >> ${RESFSDIR}.Messages }
	${CP}  LocalRes:Templates ${RESFSDIR}.Templates      ${CPFLAGS}
	${CP}  LocalRes:<UserIF>.Sprites ${RESFSDIR}.Sprites ${CPFLAGS}

include StdTools
include AAsmModule

BBETYPE = desktop
bbe-desktop: bbe-generic-resources-get-alias
	BBE_Export_File_In_Dir Resources.${LOCALE} CmdHelp
	BBE_Export_File_In_Dir Resources.${LOCALE} Messages
	BBE_Export_File_In_Dir Resources.${LOCALE} Templates
	BBE_Export_Dir Resources.${LOCALE}.${USERIF}
	BBE_Export_File VersionNum

# Dynamic dependencies:
