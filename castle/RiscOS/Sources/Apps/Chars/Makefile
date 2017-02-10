# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
