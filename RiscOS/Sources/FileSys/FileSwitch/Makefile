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
# Makefile for FileSwitch
#
# *************************************
# ***     C h a n g e   L i s t     ***
# *************************************
# Date         Name         Description
# ----         ----         -----------
# 11-Apr-2001  DSC          Created.
#

COMPONENT = FileSwitch

HEADER1     = LowFSI
HEADER2     = HighFSI
# C headers to generate from the assembler sources
ASMCHEADER1 = LowFSI
ASMCHEADER2 = HighFSI
EXPORTS     = ${C_EXP_HDR}.${ASMCHEADER1} ${C_EXP_HDR}.${ASMCHEADER2}

TOKHELPSRC  = ${TOKENSOURCE}
HELPSRC     = HelpSrc

include StdTools
include AAsmModule

# Dynamic dependencies:
