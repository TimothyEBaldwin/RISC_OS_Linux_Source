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
#

#
# Paths
#
EXP_HDR = <export$dir>

# To switch between making debugging and non-debugging versions of SprExtend:
#   change the #define of DEBUG at the top of c.PutScaled
#   change the SETL of 'debug' in sources.SprExtend.

CDEFINES = -DRISCOS -DASMHUFF
#CDEFINES += -DDEBUG
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
 s.jhdr\
 s.putscaled\
 s.stdpalette\
 s.yuvtabs

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
        ${WIPE} o.* ${WFLAGS}
        ${WIPE} oh.* ${WFLAGS}
        ${WIPE} s.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RESDIR}.${TARGET}
        TokenCheck LocalRes:Messages
        ${CP} LocalRes:Messages  ${RESDIR}.${TARGET}.Messages  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied


ROM_OBJECT  = ${TARGET}.o
${ROM_OBJECT}: ${ROM_SOURCE} ${SFILES}
        do mkdir -p o
        ${AS} ${ASFLAGS} -o $@ ${ROM_SOURCE}
${ROM_TARGET}: ${ROM_OBJECT}
        ${LD} -o $@ -rmf ${ROM_OBJECT}

# Get the Messages from somewhere other than Resources:$.Resources.SprExtend
LCL_OBJECT = ${TARGET}M.o
${LOCALMSG}: ${LCL_OBJECT}
        ${LD} -rmf -o $@ ${LCL_OBJECT}
${LCL_OBJECT}: ${ROM_SOURCE} ${SFILES}
        ${AS} ${ASFLAGS} -o $@ ${ROM_SOURCE} -PD "localmessages SETL {TRUE}"

# Export the SWI definitions to Hdr:
${EXP_HDR}.SprExtend: hdr.SprExtend
        ${CP} hdr.SprExtend $@ ${CPFLAGS}
#
# Generate the SFILES
#
.c.s:;  ${CC} -S ${CFLAGS} ${TFLAGS} -ff -zps1 -DEMBED -DSOURCE_IS_$* $*.c
        ${SED} -e /IMPORT/d -e /dataseg/d -e /codeseg/d -e /AREA/d < s.$* > s.temp
        ${CP} s.temp s.$* ${CPFLAGS}d
        
s.yuvtabs: ${GENYUVTABS}
        ${RUN}${GENYUVTABS} > $@

s.stdpalette: ${GENPALETTE}
        ${RUN}${GENPALETTE} > $@

s.jhdr: ${GENJHDR}
        ${RUN}${GENJHDR} > $@

${GENPALETTE}: c.genpalette
        ${MAKE} -f util/mk COMPONENT=genpalette THROWBACK=${THROWBACK}

${GENYUVTABS}: c.genyuvtabs
        ${MAKE} -f util/mk COMPONENT=genyuvtabs THROWBACK=${THROWBACK}

${GENJHDR}: c.genjhdr
        ${MAKE} -f util/mk COMPONENT=genjhdr THROWBACK=${THROWBACK}
#
# For ChangeFSI:
#
${CFSI-JPEG}: Sources.cfsi-jpeg s.jhdr s.rojpeg s.stdpalette
        ${AS} ${ASFLAGS} -o o.cfsi-jpeg Sources.cfsi-jpeg
        ${LD} -bin -o $@ o.cfsi-jpeg

#
# Other bits:
#
j2s: o.j2s o.jdhuff o.jrevdct o.jcconv o.diffuse
        ${LD} -o $@ o.j2s o.jdhuff o.jrevdct o.jcconv o.diffuse ${CLIB}

o.diffuse: sources.diffuseo s.stdpalette
        ${AS} ${ASFLAGS} -from sources.diffuseo -to $@

o.jcconv: sources.jcconvo s.yuvtabs
        ${AS} ${ASFLAGS} -from sources.jcconvo -to $@

o.jdhuff: sources.jdhuffo s.jhdr
        ${AS} ${ASFLAGS} -from sources.jdhuffo -to $@

o.jrevdct: sources.jrevdcto
        ${AS} ${ASFLAGS} -from sources.jrevdcto -to $@

put: o.put
        ${LD} -o $@ o.put ${CLIB}

jput: o.jput
        ${LD} -o $@ o.jput ${CLIB}

tdct: o.testdct o.idcto
        ${LD} -o $@ o.testdct o.idcto ${CLIB}

# Dynamic dependencies:
