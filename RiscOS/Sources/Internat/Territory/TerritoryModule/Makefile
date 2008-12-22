# Copyright 1998 Acorn Computers Ltd
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
# Makefile for Territory modules
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 21-Mar-01  SNB          Recreated.

#
# Program specific options:
#
COMPONENT ?= UK
TARGET    ?= ${COMPONENT}

ROM_SOURCE = Territory.s
ASFLAGS = -PD "Territory SETS \"${TARGET}\""

RESOURCES   = -private
PRIVATEMSGS = -private

#
# Generic options:
#
include StdTools
include AAsmModule

#
# Generic rules:
#
clean::
	${WIPE} rm ${WFLAGS}
	@${ECHO} ${COMPONENT}: extra directories cleaned

${MERGEDMSGS}: Resources.${TARGET}.Territory LocalRes:Messages
	${MKDIR} ${MERGEDMDIR}
	${CP} Resources.${TARGET}.Territory $@ ${CPFLAGS}
	${CAT} LocalRes:Messages { >> $@ }

resources: ${MERGEDMSGS}
	${MKDIR} ${RESFSDIR}
	${CP} ${MERGEDMSGS} ${RESFSDIR}.Messages ${CPFLAGS}
	@${ECHO} ${COMPONENT}: resources copied to Messages module

# BBE Rules
BBETYPE   = local
bbe-local: bbe-generic-resources-get-alias
	BBE_Export_File_In_Dir ${MERGEDMDIR} ${TARGET}
	BBE_Export_File VersionNum


# Dynamic dependencies:
