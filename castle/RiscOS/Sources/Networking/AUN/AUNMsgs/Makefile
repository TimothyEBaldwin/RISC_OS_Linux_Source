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
# Makefile for AUN Messages Module
#

COMPONENT   = AUNMsgs
MODULE_HELP = "AUN Messages"
FILELIST    = Resources${SEP}${LOCALE}${SEP}${SYSTEM}
CUSTOMROM   = custom
CUSTOMSA    = custom
CUSTOMRES   = no
AUN_DIRS    = rm${SEP}${MACHINE}
AUN_MODULE  = ${AUN_DIRS}${SEP}AUNMsgMod

include StdTools
include AAsmModule

standalone: ${AUN_MODULE}
        @${ECHO} ${COMPONENT}: standalone module built

install: ${AUN_MODULE}
        ${MKDIR} ${INSTDIR}
        ${CP} ${AUN_MODULE} ${INSTDIR}${SEP}${TARGET} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: standalone module installed

rom: ${AUN_MODULE}
        @${ECHO} ${COMPONENT}: rom module built

install_rom: ${AUN_MODULE}
        ${CP} ${AUN_MODULE} ${INSTDIR}${SEP}${TARGET} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom module installed

${AUN_MODULE}: ${FILELIST} VersionNum
        ${MKDIR} ${AUN_DIRS}
        ${GETVERSION} AUNMsgs$BuildV AUNMsgs$FullV AUNMsgs$Date
        ${DO} ${MODGEN} -date "<AUNMsgs$Date>" $@ ${COMPONENT} ${MODULE_HELP} <AUNMsgs$BuildV> -via ${FILELIST}

# Dynamic dependencies:
