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
# Makefile for Debugger
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 10-May-01  KJB          Nicked
#

# Use COMPONENT=Debugger (or leave unset) to build the Debugger module
# Use COMPONENT=dis2 to build a full, standalone version of the C-based disassembler
COMPONENT    ?= Debugger

ifeq ("${COMPONENT}","Debugger")
HELPSRC       = HelpSrc
TOKENSOURCE   = TokHelpSrc
TOKHELPSRC    = ${TOKENSOURCE}
ASMHDRS       = Debugger
OBJS          = Debugger util dis2_vfp support exc
HDRS          =
CMHGFILE      =

# dis2 build options
ARM           = FALSE
THUMB         = FALSE
MODULE        = TRUE
endif

ifeq ("${COMPONENT}","dis2")
OBJS          = util dis2_arm main

# dis2 build options
ARM           = TRUE
THUMB         = FALSE
MODULE        = FALSE
endif


ifeq (${ARM},TRUE)
CDEFINES += -DDISASSEMBLE_ARM
endif

ifeq (${THUMB},TRUE)
CDEFINES += -DDISASSEMBLE_THUMB
endif

ifeq (${MODULE},TRUE)
CDEFINES += -DMODULE
RAMASMDEFINES += -PD "standalone SETL {TRUE}" -PD "MergedMsgs SETS \"${MERGEDMSGS}\""
endif

ifeq ("${COMPONENT}","Debugger")
include CModule

# We don't want to link to CLib
ROM_LIBS =
SA_LIBS  =
ROM_SYMS =

CFLAGS += -apcs /nofp
else
include CApp
endif

ACTIONS_ARM = actions/common \
              actions/ARMv7 \
              actions/ARMv7_ASIMD \
              actions/ARMv7_VFP \
              actions/ARMv8_AArch32 \
              actions/ARMv8FP_AArch32 \
              actions/FPA \
              actions/XScale_DSP

ACTIONS_VFP = actions/common \
              actions/ARMv7_ASIMD \
              actions/ARMv7_VFP \
              actions/ARMv8FP_AArch32

ENCODINGS = Build:decgen.encodings.ARMv7 \
            Build:decgen.encodings.ARMv8FP_AArch32 \
            Build:decgen.encodings.ARMv8_AArch32 \
            Build:decgen.encodings.FPA \
            Build:decgen.encodings.XScale_DSP

DECGEN = <Tools$Dir>.Misc.decgen.decgen 

# dis2 build rules

dis2_arm.c: $(ACTIONS_ARM) head.c $(ENCODINGS)
	$(DECGEN) -bits=32 -e "-DCDP={ne(coproc,1)}" "-DLDC_STC={ne(coproc,1)}{ne(coproc,2)}" "-DMRC_MCR={ne(coproc,1)}" -DVFP1=(cond:4) "-DVFP2={ne(cond,15)}" -DAS1(X)=1111001[X] -DAS2=11110100 -DAS3=(cond:4)1110 "-DAS4={ne(cond,15)}" "-DCC={ne(cond,15)}" $(ENCODINGS) -valid -a $(ACTIONS_ARM) -pre head.c -o dis2_arm.c -prefix=dis2_ -name=dis2 -void -maxmaskbits=3 -opt-strings -treewalker -useargstruct -updatecache cache/arm

dis2_arm.o: dis2_arm.c
	${CC} ${CFLAGS} -o $@ dis2_arm.c

dis2_arm.oz: dis2_arm.c
	${CC} ${CFLAGS} ${C_MODULE} -o $@ dis2_arm.c

dis2_vfp.c: $(ACTIONS_VFP) head.c $(ENCODINGS)
	$(DECGEN) -bits=32 -e "-DCDP={ne(coproc,1)}" "-DLDC_STC={ne(coproc,1)}{ne(coproc,2)}" "-DMRC_MCR={ne(coproc,1)}" -DVFP1=(cond:4) "-DVFP2={ne(cond,15)}" -DAS1(X)=1111001[X] -DAS2=11110100 -DAS3=(cond:4)1110 "-DAS4={ne(cond,15)}" "-DCC={ne(cond,15)}" $(ENCODINGS) -valid -a $(ACTIONS_VFP) -pre head.c -o dis2_vfp.c -prefix=dis2_ -name=dis2 -default=UNDEFINED -void -maxmaskbits=3 -opt-strings -treewalker -useargstruct -updatecache cache/vfp

dis2_vfp.o: dis2_vfp.c
	${CC} ${CFLAGS} -o $@ dis2_vfp.c

dis2_vfp.oz: dis2_vfp.c
	${CC} ${CFLAGS} ${C_MODULE} -o $@ dis2_vfp.c

excdump.h: hdr.ExcDump
	${HDR2H} hdr.ExcDump $@

exc.c: excdump.h

clean::
	${RM} c.dis2_vfp
	${RM} c.dis2_arm
	${RM} h.excdump
	${RM} ${TOKENSOURCE}

# Stuff from AAsmModule that's missing from CModule

TOKENS     ?= Hdr:Tokens

${TOKENSOURCE}: ${HELPSRC} ${TOKENS}
        ${TOKENISE} ${TOKENS} ${HELPSRC} $@

Debugger.s: ${TOKENSOURCE}

# Dynamic dependencies:
