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
#   change the #define of DEBUG at the top of c.PutScaled
#   change the SETL of 'debug' in sources.SprExtend.
CDEFINES = -DRISCOS -DASMHUFF
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
TARGET    = SprExtend
ROM_SOURCE= sources.${TARGET}
ROM_TARGET= rm.${TARGET}
LOCALMSG  = rm.${TARGET}M
EXPORTS   = ${EXP_HDR}.SprExtend

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
# Rule patterns
#
.SUFFIXES: .o .oh .c .sources

.c.o:;       ${CC} -c ${CFLAGS} ${TFLAGS} -o $@ $<
.c.oh:;      ${CC} -c ${CFLAGS} -o $@ $<
.sources.o:; ${AS} ${ASFLAGS} -from $< -to $@

#
# Rules:
#
all: ${CFSI-JPEG} ${LOCALMSG}
        @echo ${COMPONENT}: all built

install: ${CFSI-JPEG}
        ${MKDIR} ${INSTDIR}
        ${CP} ${CFSI-JPEG} ${INSTDIR}.CFSIjpeg ${CPFLAGS}
        Access ${INSTDIR}.CFSIjpeg lr/r
        @echo ${COMPONENT}: CFSIjpeg file installed

cfsi-jpeg: ${CFSI-JPEG}
        @echo ${COMPONENT}: CFSIjpeg file generated

#
# Generic rules:
#
rom: ${ROM_TARGET}
        @echo ${COMPONENT}: rom module built

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install_rom: ${ROM_TARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${ROM_TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${RM} ${ROM_TARGET}
        ${RM} ${LOCALMSG}
        ${RM} ${GENPALETTE}
        ${RM} ${GENYUVTABS}
        ${RM} ${GENJHDR}
        ${RM} ${CFSI-JPEG}
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} oh.* ${WFLAGS}
        ${XWIPE} s.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}.${TARGET}
        TokenCheck LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESDIR}.${TARGET}.Messages  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied


ROM_OBJECT  = ${TARGET}.o
${ROM_OBJECT}: ${ROM_SOURCE} ${SFILES} putscaled.o
        do mkdir -p o
        ${AS} ${ASFLAGS} -o $@ ${ROM_SOURCE}
${ROM_TARGET}: ${ROM_OBJECT}
        ${LD} -o $@ -rmf ${ROM_OBJECT} putscaled.o

# Get the Messages from somewhere other than Resources:$.Resources.SprExtend
LCL_OBJECT = ${TARGET}M.o
${LOCALMSG}: ${LCL_OBJECT}
        ${LD} -rmf -o $@ ${LCL_OBJECT} putscaled.o
${LCL_OBJECT}: ${ROM_SOURCE} ${SFILES} putscaled.o
        ${AS} ${ASFLAGS} -o $@ ${ROM_SOURCE} -PD "localmessages SETL {TRUE}"

# Export the SWI definitions to Hdr:
${EXP_HDR}.SprExtend: hdr.SprExtend
        ${CP} hdr.SprExtend $@ ${CPFLAGS}
        
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

${GENJHDR}: genjhdr.c
        ${MAKE} -f util/mk COMPONENT=genjhdr THROWBACK=${THROWBACK}

#
# For ChangeFSI:
#
${CFSI-JPEG}: Sources.CFSI-JPEG jhdr.s stdpalette.s rojpeg.o
        ${AS} ${ASFLAGS} -o cfsi-jpeg.o Sources.CFSI-JPEG
        ${LD} -bin -o $@ cfsi-jpeg.o rojpeg.o

#
# Standalone C code (no library calls) for the assembler to use:
#
rojpeg.o:
        ${CC} ${CFLAGS} ${TFLAGS} -ff -zps1 -DEMBED -DSOURCE_IS_rojpeg $*.c

putscaled.o:
        ${CC} ${CFLAGS} ${TFLAGS} -ff -zps1 -DEMBED -DSOURCE_IS_putscaled $*.c

# Dynamic dependencies:
