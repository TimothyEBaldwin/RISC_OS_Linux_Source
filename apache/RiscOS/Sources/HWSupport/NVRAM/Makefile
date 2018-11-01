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
# Makefile for NVRAM
#

#
# Program specific options:
#
COMPONENT = NVRAM
TARGET    = aof.${COMPONENT}
RAMTARGET = rm.${COMPONENT}
TRACERAMTARGET = rm.${COMPONENT}db
OBJS      = header.o module.o nvram.o msgfile.o parse.o trace.o
EXPORTS   = ${EXP_H}.${COMPONENT} ${EXP_HDR}.${COMPONENT}
RDIR      = ${RESDIR}.NVRAM
DIRS      = o._dirs

#
# Paths
#
EXP_H   = <CExport$Dir>.h
EXP_HDR = <export$dir>.^.Interface2

#
# Generic options:
#
CFLAGS = ${C_NO_STKCHK} ${C_MODULE}

include StdTools
include ModuleLibs
include ModStdRule

#
# build a relocatable module:
#
all: ${RAMTARGET}

trace: ${TRACERAMTARGET}

module.o: header.h

#
# Create local directories
#
${DIRS}:
        ${MKDIR} o
        ${MKDIR} aof
        ${MKDIR} rm
        ${MKDIR} linked
        create ${DIRS}
        stamp  ${DIRS}

#
# RISC OS ROM build rules:
#
rom: ${TARGET} ${DIRS}
        @echo ${COMPONENT}: rom module built

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install: install_${TYPE}

install_ram: ${RAMTARGET}
        ${MKDIR} ${INSTDIR}
        ${CP} ${RAMTARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        ${ATTR} -files +or +ow +wr -ww ${INSTDIR}.${COMPONENT}
        @echo ${COMPONENT}: ram module installed

install_tags: Resources.${SYSTEM}.Tags
        ${MKDIR} ${INSTDIR}
        ${CP} Resources.${SYSTEM}.Tags ${INSTDIR}.Tags ${CPFLAGS}
        ${ATTR} -files +or +ow +wr -ww ${INSTDIR}.Tags
        @echo ${COMPONENT}: tags file installed

install_rom: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${XWIPE} o ${WFLAGS}
        ${XWIPE} aof ${WFLAGS}
        ${XWIPE} rm ${WFLAGS}
        ${XWIPE} linked ${WFLAGS}
        ${RM} h.header
        @echo ${COMPONENT}: cleaned

resources:
        ${MKDIR} ${RDIR}
        ${CP} resources.<System>.Tags ${RDIR}.Tags ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

BBETYPE = nvram
bbe-nvram: bbe-generic
  BBE_Export_Dir Resources.${SYSTEM}

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS} ${ROMCSTUBS}
        ${LD} -o $@ -aof ${OBJS} ${ROMCSTUBS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

${RAMTARGET}: ${OBJS} ${CLIB} ${DIRS}
        ${LD} -o $@ -module ${OBJS} ${CLIB}

${TRACERAMTARGET}: ${OBJS} ${CLIB} ${DIRS}
        ${LD} -o $@ -module ${OBJS} ${CLIB} ${DEBUGLIBS}

${EXP_H}.${COMPONENT}: export.h.${COMPONENT}
        ${CP} export.h.${COMPONENT} $@ ${CPFLAGS}

${EXP_HDR}.${COMPONENT}: export.hdr.${COMPONENT}
        ${CP} export.hdr.${COMPONENT} $@ ${CPFLAGS}

# Dynamic dependencies:
