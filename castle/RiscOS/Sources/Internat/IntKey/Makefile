# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
