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
# Makefile for Chars
#

COMPONENT  = Chars
APP        = !${COMPONENT}
ROM_MODULE = rm.${COMPONENT}
RDIR       = Resources
LDIR       = ${RDIR}.${LOCALE}

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources.${COMPONENT}
RESAPP = <resource$dir>.Apps.${APP}

include StdTools

FILES =\
 ${LDIR}.!Help \
 ${RDIR}.!Run \
 ${RDIR}.!RunImage \
 ${RDIR}.GenMessage \
 ${LDIR}.Templates 

# Resources to be included in the ROM module (not in Messages module}
RESFILES =\
 ${RDIR}.!RunImage

#
# Main rules:
#
all: ${FILES}
        @${ECHO} ${COMPONENT}: Application built (Disc)

rom: ${ROM_MODULE}
        @${ECHO} ${COMPONENT}: Module built (ROM)

install: ${FILES}
        ${MKDIR} ${INSTDIR}.${APP}
        ${CP} ${LDIR}.!Help      ${INSTDIR}.${APP}.!Help     ${CPFLAGS}
        ${CP} ${RDIR}.!Run       ${INSTDIR}.${APP}.!Run      ${CPFLAGS}
        ${CP} ${RDIR}.!RunImage  ${INSTDIR}.${APP}.!RunImage ${CPFLAGS}
        ${CP} ${RDIR}.GenMessage ${INSTDIR}.${APP}.Messages  ${CPFLAGS}
        ${CP} ${LDIR}.Templates  ${INSTDIR}.${APP}.Templates ${CPFLAGS}
        ${CHMOD} -R 555 ${INSTDIR}.${APP}.*
        @${ECHO} ${COMPONENT}: Application installed (Disc)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: Module installed (ROM)

resources: ${LDIR}.!RunLink ${RDIR}.GenMessage
        ${MKDIR} ${RESAPP}
        ${MKDIR} ${RESDIR}
        ${CP} ${LDIR}.!Help      ${RESAPP}.!Help     ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run   ${RESAPP}.!Run      ${CPFLAGS}
        ${CP} ${LDIR}.!RunLink   ${RESDIR}.!RunLink  ${CPFLAGS}
        ${CP} ${RDIR}.GenMessage ${RESDIR}.Messages  ${CPFLAGS}
        ${CP} ${LDIR}.Templates  ${RESDIR}.Templates ${CPFLAGS}
        @${ECHO} ${COMPONENT}: resource files copied to Messages module

clean:
        ${RM} ${ROM_MODULE}
        ${RM} ${RDIR}.!RunImage
        ${RM} ${RDIR}.GenMessage
        ${RM} ${LDIR}.!RunLink
        ${XWIPE} crunched.* ${WFLAGS}
        @${ECHO} ${COMPONENT}: cleaned

#
# Static dependencies:
#

${ROM_MODULE}: VersionNum ${RESFILES}
        ${GETVERSION} Chars$BuildV Chars$FullV Chars$Date
        ${DO} ${MODGEN} -date "<Chars$Date>" ${ROM_MODULE} !Chars !Chars <Chars$BuildV> Resources.!RunImage Resources.Chars.!RunImage

${RDIR}.GenMessage: ${LDIR}.Messages
        ${INSERTVERSION} ${LDIR}.Messages > ${RDIR}.GenMessage

${RDIR}.!RunImage: crunched.!RunImage
        ${SQUISH} ${SQUISHFLAGS} -from crunched.!RunImage -to $@

crunched.!RunImage: bas.!RunImage
        ${RUN}BasCrunch -1 bas.!RunImage $@

${LDIR}.!RunLink: bas.!RunLink
        ${SQUISH} ${SQUISHFLAGS} -from bas.!RunLink -to $@

# Dynamic dependencies:
