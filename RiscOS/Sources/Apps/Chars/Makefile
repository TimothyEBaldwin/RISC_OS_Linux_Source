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
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 05-Nov-94  AMcC   Updated for Black build
#

#
# Program specific options:
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

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = aasm
CP      = copy
RM      = remove
SQUISH  = squish
WIPE    = x wipe
PERL    = do <Perl$Dir>.perl

AFLAGS  = ${THROWBACK} -depend !Depend -nocache -stamp -quit -module
CPFLAGS = ~cfr~v
SQFLAGS = -nolist
WFLAGS  = ~c~v

FILES =\
 ${LDIR}.!Help \
 ${RDIR}.!Run \
 ${RDIR}.!RunImage \
 ${LDIR}.Messages \
 ${LDIR}.Templates 

# Resources to be included in the ROM module (not in Messages module}
RESFILES =\
 ${RDIR}.!RunImage

#
# Main rules:
#
all: ${FILES}
	@echo ${COMPONENT}: Application built (Disc}

rom: ${ROM_MODULE}
	@echo ${COMPONENT}: Module built (ROM}

install: ${FILES}
	${MKDIR} ${INSTDIR}.${APP}
	|
	${CP} ${LDIR}.!Help      ${INSTDIR}.${APP}.!Help     ${CPFLAGS}
	${CP} ${RDIR}.!Run       ${INSTDIR}.${APP}.!Run      ${CPFLAGS}
	${CP} ${RDIR}.!RunImage  ${INSTDIR}.${APP}.!RunImage ${CPFLAGS}
	${CP} ${LDIR}.Messages   ${INSTDIR}.${APP}.Messages  ${CPFLAGS}
	${CP} ${LDIR}.Templates  ${INSTDIR}.${APP}.Templates ${CPFLAGS}
	|
	Access ${INSTDIR}.${APP}.* lr/r
	|
	@echo ${COMPONENT}: Application installed {Disc}

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: Module installed {ROM}

resources: ${LDIR}.!RunLink
	${MKDIR} ${RESAPP}
	${MKDIR} ${RESDIR}
	|
	${CP} ${LDIR}.!Help      ${RESAPP}.!Help     ${CPFLAGS}
	${CP} ${RDIR}.ROM.!Run   ${RESAPP}.!Run      ${CPFLAGS}
	|
	${CP} ${LDIR}.!RunLink   ${RESDIR}.!RunLink  ${CPFLAGS}
	${CP} ${LDIR}.Messages   ${RESDIR}.Messages  ${CPFLAGS}
	${CP} ${LDIR}.Templates  ${RESDIR}.Templates ${CPFLAGS}
	|
	@echo ${COMPONENT}: resource files copied to Messages module

clean:
	${RM} ${ROM_MODULE}
	${RM} ${RDIR}.!RunImage
	${RM} ${LDIR}.!RunLink
	${WIPE} crunched.* ${WFLAGS}
	@echo ${COMPONENT}: cleaned

#
# Static dependencies:
#

${ROM_MODULE}: VersionNum ${RESFILES}
	${PERL} build:getversion Chars$Version
	do modgen ${ROM_MODULE} !Chars !Chars <Chars$Version> Resources.!RunImage Resources.Chars.!RunImage

${RDIR}.!RunImage: crunched.!RunImage
	${SQUISH} ${SQFLAGS} -from crunched.!RunImage -to $@

crunched.!RunImage: bas.!RunImage
	crunch.!RunImage; BASIC

${LDIR}.!RunLink: bas.!RunLink
	${SQUISH} ${SQFLAGS} -from bas.!RunLink -to $@

BBETYPE = chars
bbe-chars: bbe-generic
	BBE_Export_Dir Resources

#---------------------------------------------------------------------------
# Dynamic dependencies:
