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

COMPONENT ?= ADFSFiler
ROM_SOURCE = s.ADFSFiler
RESOURCEEXTRA = resources_${COMPONENT}
PRIVATEMSGS = yes

include StdTools
include AAsmModule

resources_ADFSFiler: resources_templates
	@|

resources_SCSIFiler: ${MERGEDMSGS}
	${CP} ${MERGEDMSGS} ${RESFSDIR}.Messages ${CPFLAGS}
	IfThere LocalRes:^.Zip Then ${CP} LocalRes:^.Zip ${RESFSDIR}.Sprites ${CPFLAGS}
	IfThere LocalRes:^.Zip11 Then ${CP} LocalRes:^.Zip11 ${RESFSDIR}.Sprites11 ${CPFLAGS}
	IfThere LocalRes:^.Zip22 Then ${CP} LocalRes:^.Zip22 ${RESFSDIR}.Sprites22 ${CPFLAGS}

ifeq (${SCSITEMPLATES},yes)
resources_SCSIFiler: resources_templates
endif

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

# Dynamic dependencies:
