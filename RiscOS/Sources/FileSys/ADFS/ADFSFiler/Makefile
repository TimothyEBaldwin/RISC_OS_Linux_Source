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
# Makefile for ADFSFiler
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
#

COMPONENT       ?= ADFSFiler
ROM_SOURCE       = s.ADFSFiler
RESOURCEEXTRA    = resources_${COMPONENT}
PRIVATEMSGS      = yes
ifeq (${TEMPLATES},yes)
PRIVATETEMPLATES = resources_templates
endif

ifeq (${TARGET},ThemeDefs)
CUSTOMSA         = custom
CUSTOMEXP        = custom

install:
	${MKDIR} ${INSTDIR}.${USERIF}
	| Give the sprites for the requested theme if present
	IfThere Resources.SCSI.${USERIF} Then ${CP} Resources.SCSI.${USERIF} ${INSTDIR}.${USERIF}.SCSIFiler ${CPFLAGS}
	IfThere Resources.SDFS.${USERIF} Then ${CP} Resources.SDFS.${USERIF} ${INSTDIR}.${USERIF}.SDFSFiler ${CPFLAGS}
	@${ECHO} ${COMPONENT}: disc theme resources installed

export:
	@${ECHO} ${COMPONENT}: nothing to export when target is ${TARGET}
endif

include StdTools
include AAsmModule

#
# For ADFSFiler: templates + merged messages, sprites are in the Wimp pool
#
resources_ADFSFiler: resources_templates
	${NOP}

#
# For SCSIFiler: sprites + merged messages, templates shared with ADFS unless requested explicitly
#
resources_SCSIFiler: ${MERGEDMSGS} ${PRIVATETEMPLATES}
	${CP} ${MERGEDMSGS} ${RESFSDIR}.Messages ${CPFLAGS}
	${CP} Resources.SCSI.${USERIF} ${RESFSDIR}.Sprites ${CPFLAGS}

#
# For SDFSFiler: sprites + merged messages, templates shared with ADFS unless requested explicitly
#
resources_SDFSFiler: ${MERGEDMSGS} ${PRIVATETEMPLATES}
	${CP} ${MERGEDMSGS} ${RESFSDIR}.Messages ${CPFLAGS}
	${CP} Resources.SDFS.${USERIF} ${RESFSDIR}.Sprites ${CPFLAGS}

#
# Static dependencies:
#
o.${MACHINE}._Messages_.ADFSFiler:
	${MKDIR} ${MERGEDMDIR}
	${TOUCH} $@
	IfThere LocalRes:Messages Then ${CP} LocalRes:Messages $@ ${CPFLAGS}
	IfThere LocalRes:CmdHelp Then ${TOKENCHECK} LocalRes:CmdHelp
	IfThere LocalRes:CmdHelp Then ${CAT} LocalRes:CmdHelp { >> $@ }

o.${MACHINE}._Messages_.SCSIFiler:
	${MKDIR} ${MERGEDMDIR}
	${TOUCH} $@
	IfThere LocalRes:MessagesS Then ${CP} LocalRes:MessagesS $@ ${CPFLAGS}
	IfThere LocalRes:CmdHelpS Then ${TOKENCHECK} LocalRes:CmdHelpS
	IfThere LocalRes:CmdHelpS Then ${CAT} LocalRes:CmdHelpS { >> $@ }

o.${MACHINE}._Messages_.SDFSFiler:
	${MKDIR} ${MERGEDMDIR}
	${TOUCH} $@
	IfThere LocalRes:MessagesSD Then ${CP} LocalRes:MessagesSD $@ ${CPFLAGS}
	IfThere LocalRes:CmdHelpSD Then ${TOKENCHECK} LocalRes:CmdHelpSD
	IfThere LocalRes:CmdHelpSD Then ${CAT} LocalRes:CmdHelpSD { >> $@ }

# Dynamic dependencies:
