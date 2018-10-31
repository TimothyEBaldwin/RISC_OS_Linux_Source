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
# Makefile for International Keyboard
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 23-Aug-94  AMcC         Updated to build International Version (from Opal)
# 01-Sep-98  KJB          Changed for new keygen tool
# 21-Nov-00  SBF          Added support for StripDepnd
# 22-Mar-01  SNB          Updated for portability
#

#
# Component specific details
#
COMPONENT  = InternationalKeyboard
TARGET     = IntKey
ROM_SOURCE = Source.IntKeyMod
RESOURCES  = no

.SUFFIXES:
.SUFFIXES: .o .s .c .layout

KBD       = -PD "Keyboard SETS \"${KEYBOARD}\""
ASFLAGS   = ${KBD} -I<hdr$dir>
CC_HOST   = %cc

include StdTools
include AAsmModule

#
# Static dependencies and specialist rules
#

LAYOUTS   = UK.s Italy.s Spain.s France.s Germany.s Esperanto.s Greece.s \
            Swed-Finl.s Denmark.s Norway.s Iceland.s Turkey.s Russia.s \
            Israel.s LatinAm.s Belgium.s Netherlands.s Japan.s \
            Switzerland.s Wales.s USA.s Korea.s Korea2.s Taiwan.s \
            DvorakUK.s DvorakUSA.s Pandora.s

${ROM_OBJECT}: ${LAYOUTS}
${LAYOUTS}: keygen

.layout.s:;  keygen ${STDTOOLOPTIONS} ${EXTRAKEYS} $< $@

clean::
        ${WIPE} s ${WFLAGS}
        ${RM} keygen
        ${RM} keyconvert
        @echo ${COMPONENT}: cleaned

keygen: keygen.c throwback.c unicdata.c
        ${MKDIR} s
        ${MAKE} -f keygen/mk COMPONENT=keygen THROWBACK=${THROWBACK}

keyconvert: keyconvert.c unicdata.c
        ${MKDIR} s
        ${MAKE} -f keygen/mk COMPONENT=keygen THROWBACK=${THROWBACK}

install: ${LAYOUTS}

# Dynamic dependencies:
