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
# Makefile for CDFSFiler
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 25-May-94  AMcC   Created.
# 27-Feb-95  AMcC   Resources now copied to CDFSRes
# 05-Nov-02  BJGA   Rewritten to use shared makefiles
# 16-Nov-02  RPS    Added Player sprites to resources
#

COMPONENT = CDFSFiler
CMDHELP := special

include StdTools
include AAsmModule

resources-special:
        ${MKDIR} ${RESFSDIR}
        ${TOKENCHECK} LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESFSDIR}.Messages ${CPFLAGS}
        IfThere LocalRes:CmdHelp Then ${TOKENCHECK} LocalRes:CmdHelp
        IfThere LocalRes:CmdHelp Then ${CAT} LocalRes:CmdHelp { >> ${RESFSDIR}.Messages }
        ${CP} LocalRes:Player    ${RESFSDIR}.Player ${CPFLAGS}
        ${CP} LocalRes:Templates ${RESFSDIR}.Templates ${CPFLAGS}
        @@echo ${COMPONENT}: resource files copied

# Dynamic dependencies:
