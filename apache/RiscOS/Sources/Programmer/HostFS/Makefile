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
# Makefile for TML_HostFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 26-May-94  AMcC         Created.
#

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = cdir
AS      = aasm
CP      = copy
RM      = remove
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend -Stamp -quit
CPFLAGS = ~cfr~v

#
# Program specific options:
#
COMPONENT = TML_HostFS
SOURCE    = s.${COMPONENT}
TARGET    = rm.${COMPONENT}
EXPORTS   = ${EXP_HDR}.HostFS \
            ${EXP_HDR}.HostDebug

#
# Generic rules:
#
all: DumpFile SpewChars ${TARGET}
        @echo ${COMPONENT}: all complete

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

clean:
        ${RM} ${TARGET}
        ${RM} DumpFile
        ${RM} SpewChars
        @echo ${COMPONENT}: cleaned

DumpFile: s.DumpFile
        ${AS} ${ASFLAGS} -To $@ -From s.DumpFile
        SetType $@ Absolute

SpewChars: s.SpewChars
        ${AS} ${ASFLAGS} -To $@ -From s.SpewChars
        SetType $@ Absolute

${TARGET}: ${SOURCE}
        ${AS} ${ASFLAGS} -module -To $@ -From ${SOURCE}

${EXP_HDR}.HostFS: hdr.HostFS
        ${CP} hdr.HostFS $@ ${CPFLAGS}

${EXP_HDR}.HostDebug: hdr.HostDebug
        ${CP} hdr.HostDebug $@ ${CPFLAGS}

# Dynamic dependencies:
