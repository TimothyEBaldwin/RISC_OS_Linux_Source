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
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name    Description
# ----       ----    -----------
# 25-May-94  AMcC    Created.
# 12-Aug-94  AMcC    Updated for modified SpriteExtend (JPEG support)
# 29-Oct-94  AMcC    Exports hdr.SprExtend (SWI defs)
#                    Data file now called CFSIjpeg (was CFSI-jpeg)
#                    - exported to ChangeFSI at install time
# 01-Feb-95  GPS     Now compiles with cc505
# 13-Feb-95  GPS     CFSIjpeg now compiles with cc505
# 15-May-01  SNB     Re-engineered to use objasm throughout, not aasm
# 25-Sep-10  RPS     Now objasm is used, no need to postprocess C code
#                    as assembler with 'sed', just use the linker
#

#
# Paths
#
EXP_HDR = <export$dir>

# To switch between making debugging and non-debugging versions of SprExtend:
#   change the #define of DEBUG in h.commondefs
#   change the SETL of 'debug' in sources.SprExtend.
CDEFINES = -DRISCOS -DASMHUFF -DASMIDCT -DASMCOLOR
CINCLUDES = -IC:

#
# Generic options:
#
include StdTools

#
# Libraries
#
CLIB = CLIB:o.stubs

#
# Program specific options:
#
COMPONENT = SpriteExtend
TARGET   ?= SprExtend
OBJS      = sources.${TARGET}
ROM_TARGET= rm.${TARGET}
RAM_TARGET= rm.SprExtendSA
ROM_OBJECT= ${TARGET}.o
RAM_OBJECT= ${TARGET}SA.o

SFILES =\
 jhdr.s\
 stdpalette.s\
 yuvtabs.s

# Extra utilites (generate assembler code)
GENJHDR    = utils.genjhdr
GENPALETTE = utils.genpalette
GENYUVTABS = utils.genyuvtabs

# Needed for ChangeFSI
CFSI-JPEG  = data.CFSIjpeg

#
# Targets:
#
install: install_${TARGET}; @

install_CFSIjpeg: ${CFSI-JPEG}
        ${MKDIR} ${INSTDIR}
        ${CP} ${CFSI-JPEG} ${INSTDIR}.CFSIjpeg ${CPFLAGS}
        Access ${INSTDIR}.CFSIjpeg lr/r
        @echo ${COMPONENT}: CFSIjpeg file installed

install_SprExtend: ${RAM_TARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${RAM_TARGET} ${INSTDIR}.SprExtend ${CPFLAGS}
        @echo ${COMPONENT}: ram module installed

install_rom: ${ROM_TARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${ROM_TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

cfsi-jpeg: ${CFSI-JPEG}
        @echo ${COMPONENT}: CFSIjpeg file generated

rom: ${ROM_TARGET}
        @echo ${COMPONENT}: rom module built

standalone: ${RAM_TARGET}
        @echo ${COMPONENT}: ram module built

export: hdr.SprExtend
        ${CP} hdr.SprExtend ${EXP_HDR}.SprExtend ${CPFLAGS}
        @echo ${COMPONENT}: export complete

clean:
        ${RM} ${ROM_TARGET}
        ${RM} ${RAM_TARGET}
        ${RM} ${CFSI-JPEG}
        ${RM} ${GENPALETTE}
        ${RM} ${GENYUVTABS}
        ${RM} ${GENJHDR}
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} oh.* ${WFLAGS}
        ${XWIPE} s.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}.${TARGET}
        TokenCheck LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESDIR}.${TARGET}.Messages  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

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

${GENJHDR}: genjhdr.c jinclude.h jconfig.h jpegdata.h
        ${MAKE} -f util/mk COMPONENT=genjhdr THROWBACK=${THROWBACK}

#
# For ChangeFSI:
#
${CFSI-JPEG}: Sources.CFSI-JPEG jhdr.s stdpalette.s rojpeg.o
        ${AS} ${ASFLAGS} -o cfsi-jpeg.o Sources.CFSI-JPEG
        ${LD} -bin -o $@ cfsi-jpeg.o rojpeg.o

#
# Static dependencies:
#
${ROM_OBJECT}: ${OBJS} ${SFILES}
        do mkdir -p o
        ${AS} ${ASFLAGS} -o $@ ${OBJS}

${ROM_TARGET}: ${ROM_OBJECT} asmcore.o
        ${LD} -o $@ -rmf ${ROM_OBJECT} asmcore.o

${RAM_OBJECT}: ${OBJS} ${SFILES}
        do mkdir -p o
        ${AS} ${ASFLAGS} -PD "standalone SETL {TRUE}" -o $@ ${OBJS}

${RAM_TARGET}: ${RAM_OBJECT} resmsg.o asmcore.o
        ${LD} -o $@ -rmf ${RAM_OBJECT} resmsg.o asmcore.o
        ${MODSQZ} $@

resmsg.o: LocalRes:Messages
        TokenCheck LocalRes:Messages
        ${RESGEN} resfsarea o.resmsg LocalRes:Messages Resources.SprExtend.Messages

rojpeg.o:
        ${CC} ${CFLAGS} ${C_NO_STKCHK} -DEMBED -DSOURCE_IS_rojpeg $*.c

asmcore.o:
        ${CC} ${CFLAGS} ${C_NO_STKCHK} -DEMBED -DSOURCE_IS_putscaled $*.c

# Dynamic dependencies:
