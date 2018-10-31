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
# Makefile for Draw
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
COMPONENT  = Draw
APP        = !Draw
MODULE     = rm.!Draw
ROM_MODULE = aof.Draw
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
FILES =\
 ${RDIR}.!Boot\
 ${LDIR}.!Help\
 ${LDIR}.!Run\
 $(RDIR).!Sprites\
 ${MSGS} \
 $(RDIR).Sprites\
 ${LDIR}.Templates\
 abs.!RunImage

FILESD =\
 ${RDIR}.!Boot\
 ${LDIR}.!Help\
 ${LDIR}.!Run\
 $(RDIR).!Sprites\
 ${MSGS} \
 $(RDIR).Sprites\
 ${LDIR}.Templates\
 abs.!RunImageD

RESFILES =\
 ${RDIR}.Sprites

DFILES =\
 Debug.${APP}.!Boot\
 Debug.${APP}.!Help\
 Debug.${APP}.!Run \
 Debug.${APP}.!RunImage\
 Debug.${APP}.!Sprites\
 Debug.${APP}.Messages\
 Debug.${APP}.Sprites\
 Debug.${APP}.Templates

OBJS =\
 o.Draw o.DrawAction o.DrawCheck o.DrawDispl o.DrawDXF\
 o.DrawEdit o.DrawEnter o.DrawFileIO o.DrawGrid o.DrawHelp\
 o.DrawMenu o.DrawObject o.DrawPrint o.DrawScan o.DrawSelect\
 o.DrawTextC o.DrawTrans o.DrawUndo o.bezierarc

OBJSZ =\
 oz.Draw oz.DrawAction oz.DrawCheck oz.DrawDispl oz.DrawDXF\
 oz.DrawEdit oz.DrawEnter oz.DrawFileIO oz.DrawGrid oz.DrawHelp\
 oz.DrawMenu oz.DrawObject oz.DrawPrint oz.DrawScan oz.DrawSelect\
 oz.DrawTextC oz.DrawTrans oz.DrawUndo oz.bezierarc

OBJSD =\
 od.Draw od.DrawAction od.DrawCheck od.DrawDispl\
 od.DrawDXF od.DrawEdit od.DrawEnter od.DrawFileIO od.DrawGrid\
 od.DrawHelp od.DrawMenu od.DrawObject od.DrawPrint od.DrawScan\
 od.DrawSelect od.DrawTextC od.DrawTrans od.DrawUndo\
 od.bezierarc od.ftrace od.guard od.flex

ASMS =\
 s.Draw s.DrawAction s.DrawCheck s.DrawDispl s.DrawDXF\
 s.DrawEdit s.DrawEnter s.DrawFileIO s.DrawGrid s.DrawHelp\
 s.DrawMenu s.DrawObject s.DrawPrint s.DrawScan s.DrawSelect\
 s.DrawTextC s.DrawTrans s.DrawUndo s.bezierarc

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
        ${CP} LocalRes:DiscSprites.Sprites   ${INSTDIR}.${USERIF}.Draw   ${CPFLAGS}
        ${CP} LocalRes:DiscSprites.Sprites22 ${INSTDIR}.${USERIF}.Draw22 ${CPFLAGS}
        @${ECHO} ${COMPONENT}: disc theme resources installed
else
install: ${FILES}
        ${MKDIR} ${INSTDIR}
        $(CP) $(RDIR).!Boot     ${INSTDIR}.!Boot     ${CPFLAGS}
        $(CP) $(LDIR).!Help     ${INSTDIR}.!Help     ${CPFLAGS}
        $(CP) $(LDIR).!Run      ${INSTDIR}.!Run      ${CPFLAGS}
        $(CP) abs.!RunImage     ${INSTDIR}.!RunImage ${CPFLAGS}
        $(CP) $(RDIR).!Sprites  ${INSTDIR}.!Sprites  ${CPFLAGS}
        ${CP} ${MSGS}           ${INSTDIR}.Messages   ${CPFLAGS}
        $(CP) $(RDIR).Sprites   ${INSTDIR}.Sprites   ${CPFLAGS}
        $(CP) $(LDIR).Templates ${INSTDIR}.Templates ${CPFLAGS}
        -Access ${INSTDIR}.!Boot     lr/r
        -Access ${INSTDIR}.!Help     lr/r
        -Access ${INSTDIR}.!Run      lr/r
        -Access ${INSTDIR}.!RunImage lr/r
        -Access ${INSTDIR}.!Sprites  lr/r
        -Access ${INSTDIR}.Messages  lr/r
        -Access ${INSTDIR}.Sprites   lr/r
        -Access ${INSTDIR}.Templates lr/r
        @${ECHO} ${COMPONENT}: Application installed (Disc)
endif

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: Module installed (ROM)

installd: ${FILESD}
        $(CP) $(RDIR).!Boot     ${INSTDIR}.!Boot     ${CPFLAGS}ln
        $(CP) $(LDIR).!Help     ${INSTDIR}.!Help     ${CPFLAGS}ln
        $(CP) $(LDIR).!Run      ${INSTDIR}.!Run      ${CPFLAGS}ln
        $(CP) abs.!RunImageD    ${INSTDIR}.!RunImage ${CPFLAGS}ln
        $(CP) $(RDIR).!Sprites  ${INSTDIR}.!Sprites  ${CPFLAGS}ln
        $(CP) $(LDIR).Messages  ${INSTDIR}.Messages  ${CPFLAGS}ln
        $(CP) $(RDIR).Sprites   ${INSTDIR}.Sprites   ${CPFLAGS}ln
        $(CP) $(LDIR).Templates ${INSTDIR}.Templates ${CPFLAGS}ln
        -Access ${INSTDIR}.!Boot     lr/r
        -Access ${INSTDIR}.!Help     lr/r
        -Access ${INSTDIR}.!Run      lr/r
        -Access ${INSTDIR}.!RunImage lr/r
        -Access ${INSTDIR}.!Sprites  lr/r
        -Access ${INSTDIR}.Messages  lr/r
        -Access ${INSTDIR}.Sprites   lr/r
        -Access ${INSTDIR}.Templates lr/r
        @${ECHO} ${COMPONENT}: Application installed (Disc)

resources: ${MSGS}
        ${MKDIR} ${RESDIR}
        ${MKDIR} ${RESAPP}
        ${CP} ${RDIR}.ROM.!Boot ${RESAPP}.!Boot ${CPFLAGS}
        ${CP} ${LDIR}.!Help     ${RESAPP}.!Help ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run  ${RESAPP}.!Run  ${CPFLAGS}
        |
        ${CP} ${MSGS}           ${RESDIR}.Messages   ${CPFLAGS}
        ${CP} ${LDIR}.Templates ${RESDIR}.Templates ${CPFLAGS}
        @${ECHO} ${COMPONENT}: resource files copied to Messages module

clean:
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} s.* ${WFLAGS}
        ${XWIPE} oz.* ${WFLAGS}
        ${XWIPE} od.* ${WFLAGS}
        ${XWIPE} linked.* ${WFLAGS}
        ${XWIPE} map.* ${WFLAGS}
        ${RM} abs.!RunImage
        ${RM} ${ROM_MODULE}
        ${RM} ${MSGS}
        ${RM} ${MODULE}
        @${ECHO} ${COMPONENT}: cleaned

#
# Development rules:
# 
app: ${FILES}
        @${ECHO} Made application ${APP}

appd: ${DFILES}
        @${ECHO} Made Debug.${APP}

mod: ${MODULE}
        @${ECHO} ${COMPONENT}: Module built (RAM)

asms: ${ASMS}

linkmap: ${OBJS} ${LIBSD}
        ${LD} -map -o null:x ${OBJS} ${LIBSD} > map.linked

map:
        ${LD} -map -rmf -base 0 -o null: ${OBJS} ${LIBSD} > map.base0

clean_all:
   x Access ${INSTDIR}.!Boot     rw/rw
   x Access ${INSTDIR}.!Help     rw/rw
   x Access ${INSTDIR}.!Run      rw/rw
   x Access ${INSTDIR}.!RunImage rw/rw
   x Access ${INSTDIR}.!Sprites  rw/rw
   x Access ${INSTDIR}.Messages  rw/rw
   x Access ${INSTDIR}.Sprites   rw/rw
   x Access ${INSTDIR}.Templates rw/rw
   Destroy ${OBJS} ${OBJSD} ${ASMS} ${ROM_MODULE} ${MODULE} abs.!RunImage \
         s.AppName s.ModuleWrap s.ResFiles \
         Debug.RM.!Draw ${INSTDIR}.!Boot ${INSTDIR}.!Help \
         ${INSTDIR}.!Run ${INSTDIR}.!RunImage ${INSTDIR}.!Sprites \
         ${INSTDIR}.Messages ${INSTDIR}.Sprites ${INSTDIR}.Templates
#
# Static dependencies:
#
abs.!RunImage: ${OBJS} ${RLIB} ${CLIB}
        ${LD} -o $@ ${OBJS} ${RLIB} ${CLIB}
        ${SQZ} ${SQZFLAGS} $@

abs.!RunImageD: ${OBJSD} ${RLIB} ${CLIB}
        ${LD} -debug -o $@ ${OBJSD} ${RLIB} ${CLIB}

${MODULE}: oz.ModuleWrap ${OBJSZ} ${RLIB} ${CLIB}
        ${LD} -o $@ -module oz.ModuleWrap ${OBJSZ} ${RLIB} ${CLIB}

${ROM_MODULE}: oz.ModuleWrap ${OBJSZ} ${ROMSTUBS}
        ${LD} -o $@ -aof oz.ModuleWrap ${OBJSZ} ${ROMSTUBS}

# final link for ROM Image (using given base address)
rom_link:
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom_link complete

oz.ModuleWrap: s.ModuleWrap ${MSGS} s.AppName ${RESFILES} s.resfiles
        ${AS} ${ASFLAGS} s.ModuleWrap $@

s.ModuleWrap: ${WRAPPER}
        ${CP} ${WRAPPER} $@ ${CPFLAGS}

${MSGS}: ${LDIR}.Messages VersionNum
        ${MSGVERSION} ${LDIR}.Messages > $@

s.ResFiles: asm.ResFiles
        ${CP} asm.ResFiles $@ ${CPFLAGS}

s.AppName: asm.AppName
        ${CP} asm.AppName $@ ${CPFLAGS}

BBETYPE = draw
bbe-draw: bbe-generic
        BBE_Export_Dir Resources

#---------------------------------------------------------------------------
# debugging version:
#
Debug.${APP}.!RunImage: ${OBJSD} ${LIBSD}
        ${LD} -o $@ ${OBJSD} ${LIBSD}
        SetType $@ Absolute
        Squeeze $@

Debug.${APP}.!Boot: $(RDIR).!Boot
        ${CP} $(RDIR).!Boot $@ ${CPFLAGS}

Debug.${APP}.!Help: $(LDIR).!Help
        ${CP} $(LDIR).!Help $@ ${CPFLAGS}

Debug.${APP}.!Run: $(LDIR).!Run
        ${CP} $(LDIR).!Run $@ ${CPFLAGS}

Debug.${APP}.!Sprites: $(RDIR).!Sprites
        ${CP} $(RDIR).!Sprites $@ ${CPFLAGS}

Debug.${APP}.Messages: $(LDIR).Messages
        ${CP} $(LDIR).Messages $@ ${CPFLAGS}

Debug.${APP}.Sprites: $(RDIR).Sprites
        ${CP} $(RDIR).Sprites $@ ${CPFLAGS}

Debug.${APP}.Templates: $(LDIR).Templates
        ${CP} $(LDIR).Templates $@ ${CPFLAGS}
#---------------------------------------------------------------------------
# Dynamic dependencies:
