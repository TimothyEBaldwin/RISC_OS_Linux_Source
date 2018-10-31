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
