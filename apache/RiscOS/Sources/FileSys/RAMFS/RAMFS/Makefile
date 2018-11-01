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
# Makefile for RAMFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 14-May-01  SNB          Recreated.
#

COMPONENT  = RAMFS

HEADER1    = RAMFS
HEADER2    = RAMFSErr
ASMCHEADER1 = RAMFSErr
TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpText

EXPORTS    = hdr.RAMFSErr ${C_EXP_HDR}.RAMFSErr

include StdTools
include AAsmModule

hdr.RAMFSErr: o.RAMFSErr
	${LD} -bin -o $@ o.RAMFSErr
	SetType $@ Text

o.RAMFSErr: s.RAMFSErr
	${MKDIR} o
	${AS} -o $@ s.RAMFSErr -I<Hdr$Dir>.Global,<Hdr$Dir>.Interface

clean::
        ${RM} hdr.RAMFSErr
        @@echo ${COMPONENT}: cleaned 

# Dynamic dependencies:
