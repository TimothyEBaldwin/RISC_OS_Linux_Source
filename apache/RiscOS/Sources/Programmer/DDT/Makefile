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
# Makefile for DDT
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 12-Oct-94  AMcC         Created.
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
ASFLAGS = -depend !Depend -Stamp -quit -module
CPFLAGS = ~cfr~v

#
# Program specific options:
#
COMPONENT = DDT
EXPORTS   = ${EXP_HDR}.DDT

#
# Generic rules:
#
export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

${EXP_HDR}.DDT: hdr.DDT
        ${CP} hdr.DDT $@ ${CPFLAGS}

# Dynamic dependencies:
