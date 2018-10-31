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
# Makefile for ADFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 06-Jun-00  SNB          Recreated using makefile fragments

COMPONENT = ADFS

#
# Program specific options:
#
CHEADER1  = ${COMPONENT}
HEADER1   = ${COMPONENT}
HEADER2   = ADFSErr
HEADER3   = IDEDevice
ASMCHEADER1 = ADFSErr

EXPORTS   = hdr.ADFSErr ${C_EXP_HDR}.ADFSErr

TOKENSOURCE = s.TokenHelp
TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpText
ROM_SOURCE = ADFS.s

ASFLAGS    = ${OPTIONS}

include StdTools
include AAsmModule

hdr.ADFSErr: o.ADFSErr
	${LD} -bin -o $@ o.ADFSErr
	SetType $@ Text

o.ADFSErr: s.ADFSErr
	${MKDIR} o
	${AS} -o $@ s.ADFSErr -I<Hdr$Dir>.Global,<Hdr$Dir>.Interface

#
# Generic rules:
#
clean::
        ${WIPE} o ${WFLAGS}
        ${RM} hdr.ADFSErr
        @@echo ${COMPONENT}: cleaned 

# Dynamic dependencies:
