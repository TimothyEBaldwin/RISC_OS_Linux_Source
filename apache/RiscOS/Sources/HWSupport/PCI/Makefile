# Copyright 2002 Tematic Ltd
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
# Makefile for PCI
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 06-Jun-00  SNB          Recreated using makefile fragments

COMPONENT = PCI

#
# Program specific options:
#
HEADER1    = ${COMPONENT}
ASMCHEADER1= ${COMPONENT}
EXPORTS    = ${C_EXP_HDR}.${ASMCHEADER1}

TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpTexts
ROM_SOURCE = GetAll.s

ASFLAGS    = ${OPTIONS}

include StdTools
include AAsmModule

#
# Generic rules:
#
clean::
        ${WIPE} rm ${WFLAGS}
        @@echo ${COMPONENT}: cleaned 

# Dynamic dependencies:
