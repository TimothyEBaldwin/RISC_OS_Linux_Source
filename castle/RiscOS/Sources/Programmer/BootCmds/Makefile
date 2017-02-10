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
# Makefile for BootCommands
#

COMPONENT    = BootCmds
CMHGFILE     = header
CINCLUDES   += -IOS:,<Lib$Dir>.ConfigLib.
CDEFINES    += -DTRACE=0
OBJS         = main
LIBS        += ${OSLIB} ${CONLIB}
HDRS         =
RES_AREA     = files_messages
RAMCDEFINES += -DSTANDALONE=1
INSTRES_FILES   = aif.Repeat
INSTRES_DEPENDS = aif.Repeat

ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

include CModule

#
# Static dependencies
#
aif.Repeat: ${DIRS} repeatcmd.c
        ${CC} ${CINCLUDES} -o $@ repeatcmd.c ${CLIB} ${OSLIB}

# Dynamic dependencies:
