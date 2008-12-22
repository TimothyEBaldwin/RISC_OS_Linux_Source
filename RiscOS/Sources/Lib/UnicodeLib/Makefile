# Copyright 1997 Acorn Computers Ltd
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
# Makefile for Unicode
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 06-Oct-97  SJM          Created.
#

#
# Paths
#
EXP_HDR = <export$dir>
LIBDIR = <Lib$Dir>
UNICODELIBDIR = ${LIBDIR}.Unicode
#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CP      = copy
CC      = cc
CC_HOST = %cc
CM      = cmhg
RM      = remove
LD      = link
LB      = libfile
TOUCH   = create
WIPE    = -wipe
SQUEEZE = squeeze
STRIP   = stripdepnd

CCFLAGS = -c -depend !Depend -fah ${INCLUDES} ${DFLAGS} ${THROWBACK}
ASFLAGS = -depend !Depend -Stamp -quit
CPFLAGS = ~cfr~v
LBFLAGS = -c
WFLAGS  = ~CFR~V

#
# Libraries
#
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.AbsSym

#
# Include files
#
INCLUDES  =
DFLAGS    = 

#
# Program specific options:
#
COMPONENT  = ucodelib
COMPONENTZ = ucodelibm
COMPONENTD = ucodelibd
TARGET     = ${COMPONENT}
TARGETZ    = ${COMPONENTZ}
TARGETD    = ${COMPONENTD}
SOURCE     = 
EXPORTS    = 

OBJS = autojp.o \
        unictype.o \
	utf8.o \
	utf16.o \
	encoding.o \
	iso2022.o \
	eightbit.o \
	iso6937.o \
	shiftjis.o \
	johab.o \
	bigfive.o \
	enc_utf7.o \
	enc_utf8.o \
	enc_ascii.o \
	enc_utf16.o \
	enc_ucs4.o \
	enc_scsu.o \
	enc_system.o \
	acorn.o \
	combine.o \
	riscos.o

OBJSZ = \
	oz.autojp \
	oz.unictype \
	oz.utf8 \
	oz.utf16 \
	oz.encoding \
	oz.iso2022 \
	oz.eightbit \
	oz.iso6937 \
	oz.shiftjis \
	oz.johab \
	oz.bigfive \
	oz.enc_utf7 \
	oz.enc_utf8 \
	oz.enc_ascii \
	oz.enc_utf16 \
	oz.enc_ucs4 \
	oz.enc_scsu \
	oz.enc_system \
	oz.acorn \
	oz.combine \
	oz.riscos


OBJSD = \
	od.autojp \
	od.unictype \
	od.utf8 \
	od.utf16 \
	od.encoding \
	od.iso2022 \
	od.eightbit \
	od.iso6937 \
	od.shiftjis \
	od.johab \
	od.bigfive \
	od.enc_utf7 \
	od.enc_utf8 \
	od.enc_ascii \
	od.enc_utf16 \
	od.enc_ucs4 \
	od.enc_scsu \
	od.enc_system \
	od.acorn \
	od.combine \
	od.riscos \
	od.debug

HDRS = autojp.h charsets.h encoding.h iso10646.h iso3166.h languages.h unictype.h utf8.h combine.h

LIBS = ${TARGET} ${TARGETD} ${TARGETZ} 

#
# Rule patterns
#
.SUFFIXES: .o .oz .od .c .h .s
.c.o:;     ${CC} ${CCFLAGS} -DROM=0 -DDEBUG=0 -ff     -o $@ $<
.c.oz:;    ${CC} ${CCFLAGS} -DROM=1 -DDEBUG=0 -ff -zM -o $@ $<
.c.od:;    ${CC} ${CCFLAGS} -DROM=0 -DDEBUG=1         -o $@ $<
.s.o:;     ${AS} ${ASFLAGS} -o $@ $<
.cmhg.o:;  ${CM} ${CMFLAGS} -o $@ $<
.cmhg.h:;  ${CM} ${CMFLAGS} -d $@ $<

#
# build the library:
#
all:	${LIBS}

#
# RISC OS ROM build rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: export_${PHASE}

install_rom: ${TARGET}
	@echo ${COMPONENT}: rom module installed

clean:
	${WIPE} o ${WFLAGS}
	${WIPE} oz ${WFLAGS}
	${WIPE} od ${WFLAGS}
	${RM} ${COMPONENT}
	${RM} ${COMPONENTZ}
	${RM} ${COMPONENTD}
	${RM} local_dirs
	${RM} c.unictype
	${RM} mkunictype
	${RM} TextConv
	${STRIP}
	@echo ${COMPONENT}: cleaned

export_hdrs: ${HDRS} dirs
	${CP} h.autojp   ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.charsets ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.combine  ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.encoding ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.iso10646 ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.iso3166  ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.languages ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.unictype ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.utf8     ${UNICODELIBDIR}.h.* ${CPFLAGS}
	${CP} h.utf16    ${UNICODELIBDIR}.h.* ${CPFLAGS}
	@echo ${COMPONENT}: export complete (hdrs)

export_libs: ${LIBS} dirs
	${CP} ${TARGET}  ${UNICODELIBDIR}.o.* ${CPFLAGS}
	${CP} ${TARGETD} ${UNICODELIBDIR}.o.* ${CPFLAGS}
	${CP} ${TARGETZ} ${UNICODELIBDIR}.o.* ${CPFLAGS}
	@echo ${COMPONENT}: export complete (libs)


local_dirs:
	${MKDIR} o
	${MKDIR} oz
	${MKDIR} od
	${TOUCH} local_dirs

dirs:
	${MKDIR} ${LIBDIR}
	${MKDIR} ${UNICODELIBDIR}
	${MKDIR} ${UNICODELIBDIR}.h
	${MKDIR} ${UNICODELIBDIR}.o

unictype.c: mkunictype data.UnicodeData
	mkunictype < data.UnicodeData > c.unictype
	echo Made unictype.c

mkunictype: mkunictype.c
	${CC_HOST} mkunictype

TextConv: textconv.o ${TARGET}
	${LD} -o $@ textconv.o ${TARGET} ${CLIB}
	${SQUEEZE} $@

#
# Final link
#
${TARGET}: ${OBJS} unictype.c local_dirs
	${LB} ${LBFLAGS} -o ${COMPONENT} ${OBJS}

${TARGETZ}: ${OBJSZ} unictype.c local_dirs
	${LB} ${LBFLAGS} -o ${COMPONENTZ} ${OBJSZ}

${TARGETD}: ${OBJSD} unictype.c local_dirs
	${LB} ${LBFLAGS} -o ${COMPONENTD} ${OBJSD}

# Dynamic dependencies:
