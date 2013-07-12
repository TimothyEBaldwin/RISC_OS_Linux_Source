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
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 23-Feb-95  AMcC         Created.
#

#
# Generic options:
#
CP       = copy
MKDIR    = cdir
MODGEN   = modgen
MODSQZ   = modsqz
RM       = remove
SCANRES  = scanres
PERL     = do <Perl$Dir>.perl
WIPE     = -wipe

CPFLAGS  = ~cfr~v
WFLAGS   = ~cr~v

#
# Program specific options:
#
COMPONENT   = AUNMsgs
TARGET      = rm.AUNMsgs
MODULE_HELP = "AUN Messages"
FILELIST    = Resources.${LOCALE}.<System>

#
# Generic rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

${TARGET}: ${FILELIST} VersionNum
	${PERL} build:getversion AUNMsgs$BuildV AUNMsgs$FullV AUNMsgs$Date
	Do ${MODGEN} -date "<AUNMsgs$Date>" $@ ${COMPONENT} ${MODULE_HELP} <AUNMsgs$BuildV> -via ${FILELIST}

BBETYPE = aunmsgs
bbe-aunmsgs: bbe-generic-resources-get-alias
	BBE_Export_File VersionNum

# Dynamic dependencies:
