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
# Makefile for SCSIFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
#

COMPONENT = SCSIFS

#
# Program specific options:
#
CHEADER1  = ${COMPONENT}
HEADER1   = ${COMPONENT}
HEADER2   = SCSIFSErr
ASMCHEADER1 = SCSIFSErr

EXPORTS   = hdr.SCSIFSErr ${C_EXP_HDR}.SCSIFSErr

TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpText
ROM_SOURCE = Hdr_fst.s

include StdTools
include AAsmModule

hdr.SCSIFSErr: o.SCSIFSErr
	${LD} -bin -o $@ o.SCSIFSErr
	SetType $@ Text

o.SCSIFSErr: s.SCSIFSErr
	${MKDIR} o
	${AS} -o $@ s.SCSIFSErr -I<Hdr$Dir>.Global,<Hdr$Dir>.Interface

#
# Generic rules:
#
clean::
        ${WIPE} o ${WFLAGS}
        ${RM} hdr.SCSIFSErr

# Dynamic dependencies:
