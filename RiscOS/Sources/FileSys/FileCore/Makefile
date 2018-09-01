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
# Makefile for FileCore
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 14-May-01  SNB          Created.
#

COMPONENT = FileCore

HEADER1 = FileCore
HEADER2 = MultiFS
HEADER3 = FileCoreErr
ASMCHEADER1 = FileCore
CHEADER1 = FileCoreErr

EXPORTS = ${C_EXP_HDR}.FileCore ${C_EXP_HDR}.FileCoreErr

TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpText

include StdTools
include AAsmModule

h.FileCoreErr: o.FileCoreErr
	${MKDIR} h
	${LD} -bin -o $@ o.FileCoreErr
	SetType $@ Text

o.FileCoreErr: s.FileCoreErr
	${MKDIR} o
	${AS} -o $@ s.FileCoreErr -I<Hdr$Dir>.Global,<Hdr$Dir>.Interface

clean::
	@IfThere h Then ${ECHO} ${WIPE} h ${WFLAGS}
	@IfThere h Then ${WIPE} h ${WFLAGS}

# Dynamic dependencies:
