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
# Makefile for Help2
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 31-Mar-98  RML    Created
# 27-Apr-98  RML    ROM build rules added
# 01-May-98  RML    Creates rm directory
# 21-Sep-02  RPS    For ROM,we'll make use of the sprites in the Wimp

#
# Program specific options:
#
COMPONENT   = Help
APP         = !Help
MODULE      = rm.${COMPONENT}
ROM_MODULE  = aof.${COMPONENT}
RDIR        = Resources
LDIR        = ${RDIR}.${LOCALE}
MODULE_NAME = !Help
MODULE_HELP = "!Help"
FILELIST    = ${RDIR}.Filelist

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources.${COMPONENT}
RESAPP = <resource$dir>.Apps.${APP}

include StdTools

#
# Libraries
#
CLIB       = CLib:o.stubs
EVENTLIB   = tbox:o.eventlib
TOOLBOXLIB = tbox:o.toolboxlib
WIMPLIB    = tbox:o.wimplib

#
# Include files
#
INCLUDES = -Itbox:,C:
CFLAGS   = ${THROWBACK} -depend !Depend -ffa ${INCLUDES}

FILES =\
 ${RDIR}.!Boot \
 ${LDIR}.!Help \
 ${RDIR}.!Run \
 ${RDIR}.!RunImage \
 ${LDIR}.Messages \
 ${LDIR}.Res

OBJS =\
  o.main \
  o.help \
  o.common

#
# Rule patterns
#
.SUFFIXES: .o
.c.o:;   ${CC} ${CFLAGS} ${DFLAGS}        -c -o $@ $<
 
#
# Main rules:
#
rom: ${MODULE}
        @${ECHO} ${COMPONENT}: rom module built

install_rom: ${MODULE}
        ${CP} ${MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom module installed

install: ${FILES}
         ${MKDIR} ${INSTDIR}.${APP}
         ${CP} ${RDIR}.!Boot      ${INSTDIR}.${APP}.!Boot      ${CPFLAGS}
         ${CP} ${LDIR}.!Help      ${INSTDIR}.${APP}.!Help      ${CPFLAGS}
         ${CP} ${RDIR}.!Run       ${INSTDIR}.${APP}.!Run       ${CPFLAGS}
         ${CP} ${RDIR}.!RunImage  ${INSTDIR}.${APP}.!RunImage  ${CPFLAGS} 
         ${INSERTVERSION} ${LDIR}.Messages > ${INSTDIR}.${APP}.Messages
         ${CP} ${LDIR}.Res        ${INSTDIR}.${APP}.Res        ${CPFLAGS}
         ${CP} ${RDIR}.!Sprites   ${INSTDIR}.${APP}.!Sprites   ${CPFLAGS}
         ${CP} ${RDIR}.!Sprites22 ${INSTDIR}.${APP}.!Sprites22 ${CPFLAGS}
         ${CHMOD} -R 555 ${INSTDIR}.${APP}.*
         @${ECHO} ${COMPONENT}: Application installed {Disc}

resources:
        ${MKDIR} ${RESAPP}
        ${MKDIR} ${RESDIR}
        ${CP} ${LDIR}.!Help         ${RESAPP}.!Help     ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Run      ${RESAPP}.!Run      ${CPFLAGS}
        ${CP} ${RDIR}.ROM.!Boot     ${RESAPP}.!Boot     ${CPFLAGS}
        ${CP} ${LDIR}.Res           ${RESDIR}.Res       ${CPFLAGS}
        ${INSERTVERSION} ${LDIR}.Messages > ${RESDIR}.Messages
        @${ECHO} ${COMPONENT}: resource files copied to Messages module

clean:
        ${XWIPE} rm       ${WFLAGS}
        ${XWIPE} o.*      ${WFLAGS}
        ${XWIPE} ${APP}   ${WFLAGS}
        ${RM} ${MODULE}
        ${RM} ${RDIR}.!RunImage
        @${ECHO} ${COMPONENT}: cleaned

#
# Static dependencies:
#

${RDIR}.!RunImage: ${OBJS} ${EVENTLIB} ${TOOLBOXLIB} ${WIMPLIB} ${CLIB}
       ${LD} -o $@ ${OBJS} ${CLIB} ${EVENTLIB} ${TOOLBOXLIB} ${WIMPLIB} 
       ${SQZ} ${SQZFLAGS} $@

${MODULE}: ${FILES} VersionNum
           ${MKDIR} rm
           ${GETVERSION} Help2$BuildV Help2$FullV Help2$Date
           ${DO} ${MODGEN} -date "<Help2$Date>" $@ ${MODULE_NAME} ${MODULE_HELP} <Help2$BuildV> -via ${FILELIST}
        
BBETYPE = help2
bbe-help2: bbe-generic
        BBE_Export_Dir Resources


#---------------------------------------------------------------------------
# Dynamic dependencies:
