# Copyright 1999 Pace Micro Technology plc
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
# Makefile for AsmUtils
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 20-Nov-1999  SNB          Created.
# 10-Feb-2000  ADH          Added modulefp and fpsr.
#

#
# Paths
#
LIBDIR = <Lib$Dir>.AsmUtils

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CP      = copy
CC      = cc
CM      = cmhg
RM      = remove
LD      = link
LB      = libfile
TOUCH   = create
WIPE    = -wipe

# No specific preference
OBJASMCPU =

CCFLAGS = -c -depend !Depend -ffaho ${INCLUDES} ${DFLAGS}
ASFLAGS = -depend !Depend -Stamp -quit ${OBJASMCPU}
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
INCLUDES  = -IC:
DFLAGS    = 

#
# Program specific options:
#
COMPONENT  = AsmUtils
COMPONENTZ = AsmUtilszm
TARGET     = alf.${COMPONENT}
TARGETZ    = alf.${COMPONENTZ}
SOURCE     = 
EXPORTS    = 

OBJS=   o.callbacks o.sixtyfour o.heapswis o.rminfo o.irqs \
        o.osvarlen o.muldiv o.modulefp o.fpsr o.escape o.clz

OBJSZ=  oz.callbacks oz.sixtyfour oz.heapswis oz.rminfo oz.irqs \
        oz.osvarlen oz.muldiv oz.modulefp oz.fpsr oz.escape oz.clz

HDRS=   h.callbacks h.sixtyfour h.heapswis h.rminfo h.irqs \
        h.osvarlen h.muldiv h.modulefp h.fpsr h.escape h.clz

LIBS = ${TARGET} ${TARGETZ}

LOCALDIRS = o._dirs

#
# Rule patterns
#
.SUFFIXES: .oz
.s.o:;     ${AS} ${ASFLAGS} -o $@ $< -PreDefine "ROM SETL {FALSE}"
.s.oz:;    ${AS} ${ASFLAGS} -o $@ $< -PreDefine "ROM SETL {TRUE}"

#
# build a the library:
#
all:    ${LIBS}

#
# RISC OS ROM build rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: export_${PHASE}

install_rom: ${TARGET}
	@echo ${COMPONENT}: rom module installed

install:
	${MKDIR} ${INSTDIR}.${COMPONENT}
	${CP} ${LIBDIR}.* ${INSTDIR}.${COMPONENT}.* ${CPFLAGS}
	@echo ${COMPONENT}: installed

clean:
	${WIPE} o ${WFLAGS}
	${WIPE} oz ${WFLAGS}
	${WIPE} alf ${WFLAGS}
	@echo ${COMPONENT}: cleaned

export_hdrs: ${HDRS} export_dirs
	${CP} h.callbacks  ${LIBDIR}.h.callbacks ${CPFLAGS}
	${CP} h.sixtyfour  ${LIBDIR}.h.sixtyfour ${CPFLAGS}
	${CP} h.rminfo     ${LIBDIR}.h.rminfo    ${CPFLAGS}
	${CP} h.heapswis   ${LIBDIR}.h.heapswis  ${CPFLAGS}
	${CP} h.irqs       ${LIBDIR}.h.irqs      ${CPFLAGS}
	${CP} h.osvarlen   ${LIBDIR}.h.osvarlen  ${CPFLAGS}
	${CP} h.muldiv     ${LIBDIR}.h.muldiv    ${CPFLAGS}
	${CP} h.modulefp   ${LIBDIR}.h.modulefp  ${CPFLAGS}
	${CP} h.fpsr       ${LIBDIR}.h.fpsr      ${CPFLAGS}
	${CP} h.escape     ${LIBDIR}.h.escape    ${CPFLAGS}
	${CP} h.clz        ${LIBDIR}.h.clz       ${CPFLAGS}
	${CP} VersionNum   ${LIBDIR}.LibVersion  ${CPFLAGS}
	@echo ${COMPONENT}: export complete (hdrs)

export_libs: ${LIBS} export_dirs
	${CP} alf ${LIBDIR}.o ${CPFLAGS}
	@echo ${COMPONENT}: export complete (libs)

${LOCALDIRS}:
	${MKDIR} o
	${MKDIR} oz
	${MKDIR} alf
	${TOUCH} $@

export_dirs:
	${MKDIR} ${LIBDIR}.h

#
# Final link
#
${TARGET}: ${OBJS} ${LOCALDIRS}
	${LB} ${LBFLAGS} -o $@ ${OBJS}

${TARGETZ}: ${OBJSZ} ${LOCALDIRS}
	${LB} ${LBFLAGS} -o $@ ${OBJSZ}

# Dynamic dependencies:
