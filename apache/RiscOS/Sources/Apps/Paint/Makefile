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
# Makefile for Paint
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 25-Oct-94  AMcC   Updated for Black build
# 28-Oct-94  AMcC   added -zps1 flag to .c.oz rule (module version)
#

#
# Program specific options:
#
COMPONENT  = Paint
APP        = !Paint
MODULE     = rm.!Paint
ROM_MODULE = aof.Paint
RDIR       = Resources
LDIR       = ${RDIR}.${LOCALE}
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
FILES = \
 ${RDIR}.!Boot\
 ${LDIR}.!Help\
 ${LDIR}.!Run\
 ${MSGS} \
 ${LDIR}.Sprites\
 ${LDIR}.Templates\
 abs.!RunImage

FILESD = \
 ${RDIR}.!Boot\
 ${LDIR}.!Help\
 ${LDIR}.!Run\
 ${MSGS} \
 ${LDIR}.Sprites\
 ${LDIR}.Templates\
 abs.!RunImageD

RESFILES =

DFILES = \
 debug.${APP}.!Boot\
 debug.${APP}.!Help\
 debug.${APP}.!Run\
 debug.${APP}.!RunImage\
 debug.${APP}.Messages\
 debug.${APP}.Sprites\
 debug.${APP}.Templates

OBJS      = o.colours o.main o.menus o.psprite o.sprwindow o.tools o.toolwindow \
            o.AltRename o.PaintLib
OBJSZ     = oz.colours oz.main oz.menus oz.psprite oz.sprwindow\
            oz.tools oz.toolwindow oz.AltRename oz.PaintLib
OBJSD     = od.colours od.ftrace od.guard od.main od.menus\
            od.psprite od.sprwindow od.tools od.toolwindow o.m\
            od.AltRename od.PaintLib
ASMS      = s.colours s.main s.menus s.psprite s.sprwindow s.tools s.toolwindow
INCS      = i.colours i.main i.menus i.psprite i.sprwindow i.tools i.toolwindow

#
# Rule patterns
#
.SUFFIXES: .oz .od .asm
.c.o:;    ${CC} ${CFLAGS} -c ${C_NO_FNAMES} $<
.c.oz:;   ${CC} ${CFLAGS} -c ${C_NO_FNAMES} ${C_MODULE} ${C_NO_STKCHK} -o $@ $<
.c.od:;   ${CC} ${CFLAGS} -c -DTRACE=1 -g -o $@ $<
.asm.o:;  ${AS} ${ASFLAGS} $< $@
.c.s:;    ${CC} ${CFLAGS} -s ${C_NO_FNAMES} $<

#
# Main rules:
#
all: ${FILES}
        @${ECHO} ${COMPONENT}: Application built (Disc)

rom: ${ROM_MODULE}
        @${ECHO} ${COMPONENT}: Module built (ROM)

ifeq (${TARGET},ThemeDefs)
install:
        ${MKDIR} ${INSTDIR}.${USERIF}
        ${CP} LocalRes:DiscSprites.Sprites   ${INSTDIR}.${USERIF}.Paint   ${CPFLAGS}
        ${CP} LocalRes:DiscSprites.Sprites22 ${INSTDIR}.${USERIF}.Paint22 ${CPFLAGS}
        @${ECHO} ${COMPONENT}: disc theme resources installed
else
install: ${FILES}
        ${MKDIR} ${INSTDIR}
        ${CP} ${RDIR}.!Boot      ${INSTDIR}.!Boot      ${CPFLAGS}
        ${CP} ${LDIR}.!Help      ${INSTDIR}.!Help      ${CPFLAGS}
        ${CP} ${LDIR}.!Run       ${INSTDIR}.!Run       ${CPFLAGS}
        ${CP} abs.!RunImage      ${INSTDIR}.!RunImage  ${CPFLAGS}
        ${CP} ${MSGS}            ${INSTDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}.Sprites    ${INSTDIR}.Sprites    ${CPFLAGS}
        ${CP} ${LDIR}.Templates  ${INSTDIR}.Templates  ${CPFLAGS}
        Access ${INSTDIR}.!Boot      lr/r
        Access ${INSTDIR}.!Help      lr/r
        Access ${INSTDIR}.!Run       lr/r
        Access ${INSTDIR}.!RunImage  lr/r
        Access ${INSTDIR}.Messages   lr/r
        Access ${INSTDIR}.Sprites    lr/r
        Access ${INSTDIR}.Templates  lr/r
        @${ECHO} ${COMPONENT}: Application installed (Disc)
endif

installd: ${FILESD}
        ${CP} ${RDIR}.!Boot      ${INSTDIR}.!Boot      ${CPFLAGS}
        ${CP} ${LDIR}.!Help      ${INSTDIR}.!Help      ${CPFLAGS}
        ${CP} ${LDIR}.!Run       ${INSTDIR}.!Run       ${CPFLAGS}
        ${CP} abs.!RunImageD     ${INSTDIR}.!RunImage  ${CPFLAGS}
        ${CP} ${MSGS}            ${INSTDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}.Sprites    ${INSTDIR}.Sprites    ${CPFLAGS}
        ${CP} ${LDIR}.Templates  ${INSTDIR}.Templates  ${CPFLAGS}
        Access ${INSTDIR}.!Boot      lr/r
        Access ${INSTDIR}.!Help      lr/r
        Access ${INSTDIR}.!Run       lr/r
        Access ${INSTDIR}.!RunImage  lr/r
        Access ${INSTDIR}.Messages   lr/r
        Access ${INSTDIR}.Sprites    lr/r
        Access ${INSTDIR}.Templates  lr/r
        @${ECHO} ${COMPONENT}: Debug application installed (Disc)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: Module installed (ROM)

resources: ${MSGS}
        ${MKDIR} ${RESDIR}
        ${MKDIR} ${RESAPP}
        ${CP} ${RDIR}.!Boot     ${RESAPP}.!Boot  ${CPFLAGS}
        ${CP} ${LDIR}.!Help     ${RESAPP}.!Help  ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run  ${RESAPP}.!Run   ${CPFLAGS}
        |
        ${CP} ${MSGS}           ${RESDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}.Sprites   ${RESDIR}.Sprites   ${CPFLAGS}
        ${CP} ${LDIR}.Templates ${RESDIR}.Templates ${CPFLAGS}
        @${ECHO} ${COMPONENT}: resource files copied to Messages module

clean:
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} oz.* ${WFLAGS}
        ${XWIPE} od.* ${WFLAGS}
        ${XWIPE} s.* ${WFLAGS}
        ${XWIPE} linked.* ${WFLAGS}
        ${XWIPE} map.* ${WFLAGS}
        ${XWIPE} debug.!Paint.* ${WFLAGS}
        ${XWIPE} !Paint.* ${WFLAGS}
        ${RM} abs.!RunImage
        ${RM} abs.!RunImageD
        ${RM} ${ROM_MODULE}
        ${RM} ${MSGS}
        ${RM} ${MODULE}
        @${ECHO} ${COMPONENT}: cleaned

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
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM} \
              -map > map.${COMPONENT}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom_link complete

oz.ModuleWrap: s.ModuleWrap ${MSGS} s.AppName ${RESFILES} s.Resfiles
        ${AS} ${AFLAGS} s.ModuleWrap $@

s.ModuleWrap: ${WRAPPER}
        ${CP} ${WRAPPER} $@ ${CPFLAGS}

${MSGS}: ${LDIR}.Messages VersionNum
        ${MSGVERSION} ${LDIR}.Messages > $@

s.ResFiles: asm.ResFiles
        ${CP} asm.ResFiles $@ ${CPFLAGS}

s.AppName: asm.AppName
        ${CP} asm.AppName $@ ${CPFLAGS}

BBETYPE = paint
bbe-paint: bbe-generic
        BBE_Export_Dir Resources

#---------------------------------------------------------------------------
# debugging version:
#
abs.!RunImageD: ${OBJSD} ${RLIB} ${CLIB}
        ${LD} -d -o $@ ${OBJSD} ${RLIB} ${CLIB}

debug.${APP}.!Boot: ${RDIR}.!Boot
        ${CP} ${RDIR}.!Boot $@ ${CPFLAGS}

debug.${APP}.!Help: ${LDIR}.!Help
        ${CP} ${LDIR}.!Help $@ ${CPFLAGS}

debug.${APP}.!Run: ${LDIR}.!Run
        ${CP} ${LDIR}.!Run $@ ${CPFLAGS}

debug.${APP}.Messages: ${LDIR}.Messages
        ${CP} ${LDIR}.Messages $@ ${CPFLAGS}

debug.${APP}.Sprites: ${LDIR}.Sprites
        ${CP} ${LDIR}.Sprites $@ ${CPFLAGS}

debug.${APP}.Templates: ${LDIR}.Templates
        ${CP} ${LDIR}.Templates $@ ${CPFLAGS}

#---------------------------------------------------------------------------
# Dynamic dependencies:
