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

COMPONENT    ?= ADFSFiler
ROM_SOURCE    = s.ADFSFiler
CUSTOMRES     = custom

ifeq (${TEMPLATES},yes)
WANTTEMPLATES = resources_templates
endif

ifeq (${COMPONENT},SCSIFiler)
SUFFIX        = S
else
ifeq (${COMPONENT},SDFSFiler)
SUFFIX        = SD
endif
endif

ifeq (${TARGET},ThemeDefs)
CUSTOMSA      = custom
CUSTOMEXP     = custom
install:
        ${MKDIR} ${INSTDIR}.${USERIF}
        | Give the sprites for the requested theme if present
        IfThere Resources.SCSI.${USERIF} Then ${CP} Resources.SCSI.${USERIF} ${INSTDIR}.${USERIF}.SCSIFiler ${CPFLAGS}
        IfThere Resources.SDFS.${USERIF} Then ${CP} Resources.SDFS.${USERIF} ${INSTDIR}.${USERIF}.SDFSFiler ${CPFLAGS}
        @${ECHO} ${COMPONENT}: disc theme resources installed
endif

include StdTools
include AAsmModule

${MERGEDMSGS}::
        ${MKDIR} ${MERGEDRDIR}.${TARGET}
        ${TOKENCHECK} LocalRes:Messages${SUFFIX}
        ${CP} LocalRes:Messages${SUFFIX} $@ ${CPFLAGS}
        IfThere LocalRes:CmdHelp${SUFFIX} Then ${TOKENCHECK} LocalRes:CmdHelp${SUFFIX}
        IfThere LocalRes:CmdHelp${SUFFIX} Then ${FAPPEND} $@ LocalRes:Messages LocalRes:CmdHelp${SUFFIX}

#
# For all:
#
resources: resources_${COMPONENT} ${MERGEDMSGS} resources_mkdir
        ${CP} ${MERGEDMSGS} ${RESFSDIR}.Messages ${CPFLAGS}

resources_mkdir:
        ${MKDIR} ${RESFSDIR}

resources_templates:
        ${CP} LocalRes:Templates ${RESFSDIR}.Templates ${CPFLAGS}

#
# For ADFSFiler: templates + merged messages, sprites are in the Wimp pool
#
resources_ADFSFiler: resources_templates
        @${NOP}

#
# For SCSIFiler: sprites + merged messages, templates shared with ADFS unless requested explicitly
#
resources_SCSIFiler: ${WANTTEMPLATES}
        ${CP} Resources.SCSI.${USERIF} ${RESFSDIR}.Sprites ${CPFLAGS}

#
# For SDFSFiler: sprites + merged messages, templates shared with ADFS unless requested explicitly
#
resources_SDFSFiler: ${WANTTEMPLATES}
        ${CP} Resources.SDFS.${USERIF} ${RESFSDIR}.Sprites ${CPFLAGS}

# Dynamic dependencies:
