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
# Makefile for Alarm
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 05-Nov-94  AMcC   Updated for Black build
# 24-Jul-03  RPS    Use objasm
#

#
# Program specific options:
#
COMPONENT  = Alarm
APP        = !${COMPONENT}
ROM_MODULE = rm.${COMPONENT}
RDIR       = Resources
LDIR       = LocalRes:
MSGVERSION = ${AWK} -f Build:AwkVers
MSGS       = Resources.GenMessage

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}
RESAPP = <resource$dir>.Apps.${APP}

include StdTools

SQUISH    = squish
SQFLAGS   = -nolist

FILES =\
 ${RDIR}.!Boot \
 ${LDIR}!Help \
 ${RDIR}.!Run \
 ${RDIR}.!RunImage \
 ${RDIR}.Alarms \
 ${RDIR}.Code \
 ${MSGS} \
 ${LDIR}Template3D 

# Resources to be included in the ROM module (not in Messages module)
RESFILES =\
 ${RDIR}.code \
 ${RDIR}.!RunImage

#
# Main rules:
#
all: ${FILES}
        @echo ${COMPONENT}: Application built (Disc)

rom: ${ROM_MODULE}
        @echo ${COMPONENT}: Module built (ROM)

install: ${FILES}
        ${MKDIR} ${INSTDIR}.${APP}
        |
        ${CP} ${RDIR}.!Boot      ${INSTDIR}.${APP}.!Boot     ${CPFLAGS}
        ${CP} ${LDIR}!Help       ${INSTDIR}.${APP}.!Help     ${CPFLAGS}
        ${CP} ${RDIR}.!Run       ${INSTDIR}.${APP}.!Run      ${CPFLAGS}
        ${CP} ${RDIR}.!RunImage  ${INSTDIR}.${APP}.!RunImage ${CPFLAGS}
        ${CP} ${RDIR}.Alarms     ${INSTDIR}.${APP}.Alarms    ${CPFLAGS}
        ${CP} ${RDIR}.Code       ${INSTDIR}.${APP}.Code      ${CPFLAGS}
        ${CP} ${MSGS}            ${INSTDIR}.${APP}.Messages  ${CPFLAGS}
        ${CP} ${LDIR}Template3D  ${INSTDIR}.${APP}.Templates ${CPFLAGS}
        |
        Access ${INSTDIR}.${APP}.* lr/r
        Access ${INSTDIR}.${APP}.Alarms wr/r
        |
        @echo ${COMPONENT}: Application installed (Disc)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: Module installed {ROM}

resources: ${MSGS} ${RDIR}.Code
        ${MKDIR} ${RESAPP}
        ${MKDIR} ${RESDIR}
        |
        ${CP} ${RDIR}.!Boot      ${RESAPP}.!Boot     ${CPFLAGS}
        ${CP} ${LDIR}!Help       ${RESAPP}.!Help     ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run   ${RESAPP}.!Run      ${CPFLAGS}
        ${CP} ${LDIR}!RunLink    ${RESDIR}.!RunLink  ${CPFLAGS}
        ${CP} ${RDIR}.Code       ${RESDIR}.Code      ${CPFLAGS}
        ${CP} ${MSGS}            ${RESDIR}.Messages  ${CPFLAGS}
        ${CP} ${LDIR}Template3D  ${RESDIR}.Templates ${CPFLAGS}
        |
        @echo ${COMPONENT}: resource files copied to Messages module

clean:
        ${RM} ${ROM_MODULE}
        ${RM} ${RDIR}.!RunImage
        ${RM} ${RDIR}.Code
        ${RM} ${MSGS}
        ${XWIPE} !Alarm     ${WFLAGS}
        ${XWIPE} o          ${WFLAGS}
        ${XWIPE} crunched.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

#
# Static dependencies:
#
${ROM_MODULE}: s.Main ${MSGS} ${RESFILES}
        ${MKDIR} o
        ${AS} ${ASFLAGS} -o o.Main s.Main
        ${LD} -rmf -o $@ o.Main 

${MSGS}: LocalRes:Messages VersionNum
        ${MSGVERSION} LocalRes:Messages > $@

${RDIR}.!RunImage: crunched.!RunImage
        ${SQUISH} ${SQFLAGS} -from crunched.!RunImage -to $@

crunched.!RunImage: bas.Main bas.Dialogues bas.Utils bas.Clock bas.Alarms
        FAppend crunched.All bas.Main bas.Dialogues bas.Utils bas.Clock bas.Alarms
        ${RUN}crunch.!RunImage; BASIC

${RDIR}.Code: s.Browser
        ${MKDIR} o
        ${AS} ${ASFLAGS} -o o.Browser s.Browser
        ${LD} -bin -o $@ o.Browser

BBETYPE = alarm
bbe-alarm: bbe-generic
        BBE_Export_Dir Resources

#---------------------------------------------------------------------------
# Dynamic dependencies:
