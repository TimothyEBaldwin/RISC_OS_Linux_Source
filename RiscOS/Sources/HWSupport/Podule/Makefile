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
# Makefile for Podule {Expansion cards}
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 28-Jun-94  AMcC         Added extra development rules.
# 30-Aug-94  AMcC         Added resources: target
# 16-Jan-96  JRH          Makes different targets for different machines
# 11-Jan-00  PMS          Converted to use objasm instead of aasm so that we
#                         can pass in assembly-time constants to control
#                         fake podule header for Customer F 5 Ethernet NC
#                         which doesn't have a podule ROM. Paul Skirrow.
# 13-Jan-00  PMS          Creates/deletes o dir, (ie don't keep o in cvs)
# 13-Jan-00  PMS          Passes Options from MakeFile to ObjAsm 
# 06-Jun-00  SNB          Recreated using makefile fragments

COMPONENT = Podule

#
# Program specific options:
#
HEADER1     = ${COMPONENT}
ASMCHEADER1 = ${COMPONENT}
EXPORTS     = ${C_EXP_HDR}.${ASMCHEADER1}

TOKHELPSRC  = ${TOKENSOURCE}
HELPSRC     = HelpTexts
ROM_SOURCE  = GetAll.s

ASFLAGS     = ${OPTIONS}

include StdTools
include AAsmModule

# Dynamic dependencies:
