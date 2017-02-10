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
