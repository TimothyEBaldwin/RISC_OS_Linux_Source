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
# Makefile for SprExtend
#

COMPONENT = SpriteExtend
TARGET   ?= SprExtend
OBJS      = sources.${TARGET}
ROM_TARGET= rm.${TARGET}
RAM_TARGET= rm.SprExtendSA
ROM_OBJECT= ${TARGET}.o
RAM_OBJECT= ${TARGET}SA.o
EXP_HDR   = <export$dir>

include StdTools
include StdRules
include ModuleLibs

# To switch between making debugging and non-debugging versions of SprExtend:
#   change the #define of DEBUG in commondefs.h
#   change the SETL of 'debug' in sources.SprExtend
CDEFINES  = -DRISCOS -DAVOID_TABLES -DNO_ZERO_ROW_TEST -DLAZYDECODE
CINCLUDES = -IC:
CFLAGS   += ${C_NO_STKCHK}

SFILES =\
 jhdr.s\
 stdpalette.s\
 yuvtabs.s

IJGFILES =\
 jdmarker.o\
 jdhuff.o\
 jdarith.o\
 jdinput.o\
 jdmaster.o\
 jdmainct.o\
 jdcolor.o\
 jdapistd.o\
 jdapimin.o\
 jdpostct.o\
 jddctmgr.o\
 jdcoefct.o\
 jdsample.o\
 jdtrans.o\
 jcomapi.o\
 jcapimin.o\
 jcmaster.o\
 jchuff.o\
 jctrans.o\
 jcparam.o\
 jcmarker.o\
 jdatasrc.o\
 jdatadst.o\
 jidctfst.o\
 jaricom.o\
 jutils.o
 
# Extra utilites (generate assembler code)
GENJHDR    = utils.genjhdr
GENPALETTE = utils.genpalette
GENYUVTABS = utils.genyuvtabs

#
# Targets:
#
install: install_${TARGET}; @

install_SprExtend: ${RAM_TARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${RAM_TARGET} ${INSTDIR}.SprExtend ${CPFLAGS}
        @${ECHO} ${COMPONENT}: ram module installed

install_rom: ${ROM_TARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${ROM_TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom module installed

rom: ${ROM_TARGET}
        @${ECHO} ${COMPONENT}: rom module built

standalone: ${RAM_TARGET}
        @${ECHO} ${COMPONENT}: ram module built

export: hdr.SprExtend
        ${CP} hdr.SprExtend ${EXP_HDR}.SprExtend ${CPFLAGS}
        @${ECHO} ${COMPONENT}: export complete

clean:
        ${RM} ${ROM_TARGET}
        ${RM} ${RAM_TARGET}
        ${RM} ${GENPALETTE}
        ${RM} ${GENYUVTABS}
        ${RM} ${GENJHDR}
        ${XWIPE} o ${WFLAGS}
        ${XWIPE} oh ${WFLAGS}
        ${XWIPE} od ${WFLAGS}
        ${XWIPE} s.* ${WFLAGS}
        @${ECHO} ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}.${TARGET}
        ${TOKENCHECK} LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESDIR}.${TARGET}.Messages  ${CPFLAGS}
        @${ECHO} ${COMPONENT}: resource files copied

#
# Generate the SFILES:
#
yuvtabs.s: ${GENYUVTABS}
        ${RUN}${GENYUVTABS} > $@

stdpalette.s: ${GENPALETTE}
        ${RUN}${GENPALETTE} > $@

jhdr.s: ${GENJHDR}
        ${RUN}${GENJHDR} > $@

${GENPALETTE}: genpalette.c
        ${MAKE} -f util/mk COMPONENT=genpalette THROWBACK=${THROWBACK}

${GENYUVTABS}: genyuvtabs.c
        ${MAKE} -f util/mk COMPONENT=genyuvtabs THROWBACK=${THROWBACK}

${GENJHDR}: genjhdr.c jpeglib.h jconfig.h jmorecfg.h
        ${MAKE} -f util/mk COMPONENT=genjhdr THROWBACK=${THROWBACK}

#
# Static dependencies:
#
${ROM_OBJECT}: ${OBJS} ${SFILES}
        ${MKDIR} o
        ${AS} ${ASFLAGS} -o $@ ${OBJS}

${ROM_TARGET}: ${ROM_OBJECT} ${IJGFILES} asmcore.o
        ${LD} -o $@ -rmf ${ROM_OBJECT} ${IJGFILES} asmcore.o

${RAM_OBJECT}: ${OBJS} ${SFILES}
        ${MKDIR} o
        ${AS} ${ASFLAGS} -PD "standalone SETL {TRUE}" -o $@ ${OBJS}

${RAM_TARGET}: ${RAM_OBJECT} ${IJGFILES} asmcore.o resmsg.o 
        ${LD} -o $@ -rmf ${RAM_OBJECT} ${IJGFILES} asmcore.o resmsg.o 
        ${MODSQZ} $@

resmsg.o: LocalRes:Messages
        ${TOKENCHECK} LocalRes:Messages
        ${MKDIR} o
        ${RESGEN} resfsarea o.resmsg LocalRes:Messages Resources.SprExtend.Messages

asmcore.o:
        ${MKDIR} o
        ${CC} ${CFLAGS} $*.c

# Dynamic dependencies:
