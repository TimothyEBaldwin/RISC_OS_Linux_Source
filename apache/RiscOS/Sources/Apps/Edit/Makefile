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
# Makefile for Edit
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-Oct-94  AMcC   Updated for Black build
# 28-Oct-94  AMcC   added -zps1 flag to .c.oz rule (module version)
#

#
# Program specific options:
#
COMPONENT  = Edit
APP        = !Edit
MODULE     = rm.Edit
ROM_MODULE = aof.Edit
RDIR       = Resources
LDIR       = LocalRes:
MSGVERSION = ${AWK} -f Build:AwkVers
MSGS       = Resources.GenMessage

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources.${COMPONENT}
RESAPP = <resource$dir>.Apps.${APP}

include StdTools
include ModuleLibs

SQZFLAGS  = -f
CINCLUDES = -IC:
ASFLAGS   = ${STDTOOLOPTIONS} -nocache -stamp -quit
CFLAGS    = ${STDTOOLOPTIONS} ${C_WARNINGS} ${CINCLUDES} -wp
WRAPPER   = RISC_OSLib:s.ModuleWrap
LIBSD     = ${RLIB} ${CLIB}

#
# Include files:
#
FILES =\
 ${RDIR}.!Boot\
 ${RDIR}.!Run\
 ${RDIR}.!Sprites\
 ${RDIR}.!Sprites22\
 abs.!RunImage\
 ${RDIR}.Export\
 ${LDIR}!Help\
 ${MSGS} \
 ${LDIR}Templates

# Include these in the ROM module
RESFILES =\
 ${RDIR}.Export

OBJS  = o.edit o.editv o.message o.slist
OBJSZ = oz.edit oz.editv oz.message oz.slist
OBJSD = od.edit od.editv od.message od.slist

#
# Rule patterns
#
.SUFFIXES: .oz .od
.c.o:;    ${CC} ${CFLAGS} -c ${C_NO_FNAMES} $<
.c.oz:;   ${CC} ${CFLAGS} -c ${C_NO_FNAMES} ${C_MODULE} ${C_NO_STKCHK} -o $@ $<
.c.od:;   ${CC} ${CFLAGS} -c -DTRACE=1 -g -o $@ $<
.s.o:;    ${AS} ${ASFLAGS} $< $@

#
# Main rules:
#
all: ${FILES}
        @echo ${COMPONENT}: Application built (Disc)

rom: ${ROM_MODULE}
        @echo ${COMPONENT}: Module built (ROM)

install: ${FILES}
        ${MKDIR} ${INSTDIR}
        ${CP} ${RDIR}.!Boot        ${INSTDIR}.!Boot      ${CPFLAGS}
        ${CP} ${LDIR}!Help         ${INSTDIR}.!Help      ${CPFLAGS}
        ${CP} ${RDIR}.!Run         ${INSTDIR}.!Run       ${CPFLAGS}
        ${CP} ${RDIR}.!Sprites     ${INSTDIR}.!Sprites   ${CPFLAGS}
        ${CP} ${RDIR}.!Sprites22   ${INSTDIR}.!Sprites22 ${CPFLAGS}
        ${CP} abs.!RunImage        ${INSTDIR}.!RunImage  ${CPFLAGS}
        ${CP} ${RDIR}.Export       ${INSTDIR}.Export     ${CPFLAGS}
        ${CP} ${MSGS}              ${INSTDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}Templates     ${INSTDIR}.Templates  ${CPFLAGS}
        Access ${INSTDIR}.!Boot      lr/r
        Access ${INSTDIR}.!Help      lr/r
        Access ${INSTDIR}.!Run       lr/r
        Access ${INSTDIR}.!Sprites   lr/r
        Access ${INSTDIR}.!Sprites22 lr/r
        Access ${INSTDIR}.!RunImage  lr/r
        Access ${INSTDIR}.Export     lr/r
        Access ${INSTDIR}.Messages   lr/r
        Access ${INSTDIR}.Templates  lr/r
        @echo ${COMPONENT}: Application installed (Disc)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: Module installed (ROM)

resources: ${MSGS}
        ${MKDIR} ${RESDIR}
        ${MKDIR} ${RESAPP}
        ${CP} ${RDIR}.ROM.!Boot  ${RESAPP}.!Boot      ${CPFLAGS}
        ${CP} ${LDIR}!Help       ${RESAPP}.!Help      ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run   ${RESAPP}.!Run       ${CPFLAGS}
        ${CP} ${MSGS}            ${RESDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}Templates   ${RESDIR}.Templates  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied to Messages module

clean:
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} oz.* ${WFLAGS}
        ${XWIPE} od.* ${WFLAGS}
        ${XWIPE} linked.* ${WFLAGS}
        ${RM} abs.!RunImage
        ${RM} ${ROM_MODULE}
        ${RM} ${MODULE}
        ${RM} ${MSGS}
        ${RM} s.ModuleWrap
        @echo ${COMPONENT}: cleaned

#
# Development rules:
#
mod: ${MODULE}
        @echo ${COMPONENT}: Module built (RAM)

#
# Static dependencies:
#
abs.!RunImage: ${OBJS} ${RLIB} ${CLIB}
        ${LD} -o $@ ${OBJS} ${RLIB} ${CLIB}
        ${SQZ} ${SQZFLAGS} $@

${MODULE}: oz.ModuleWrap ${OBJSZ} ${RLIB} ${CLIB}
        ${LD} -o $@ -module oz.ModuleWrap ${OBJSZ} ${RLIB} ${CLIB}

${ROM_MODULE}: oz.ModuleWrap ${OBJSZ} ${ROMSTUBS}
        ${LD} -o $@ -aof oz.ModuleWrap ${OBJSZ} ${ROMSTUBS}

# final link for ROM Image (using given base address)
rom_link:
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

oz.ModuleWrap: s.ModuleWrap s.AppName ${MSGS} ${RESFILES}
        ${AS} ${ASFLAGS} s.ModuleWrap $@

s.ModuleWrap: ${WRAPPER}
        ${CP} ${WRAPPER} $@ ${CPFLAGS}

${MSGS}: ${LDIR}Messages VersionNum
        ${MSGVERSION} ${LDIR}Messages > $@

BBETYPE = edit
bbe-edit: bbe-generic
        BBE_Export_Dir Resources

#---------------------------------------------------------------------------
# Debugging version:
#
debug.${APP}.!RunImage: ${OBJSD} ${RLIB} ${CLIB}
        ${MKDIR} debug
        ${MKDIR} debug.${APP}
        ${LD} -o $@ -debug ${OBJSD} ${RLIB} ${CLIB}

#---------------------------------------------------------------------------
# Dynamic dependencies:
