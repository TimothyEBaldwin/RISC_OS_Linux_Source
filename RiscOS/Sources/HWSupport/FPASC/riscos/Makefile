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
# Makefile for Floating Point Accelerator Support Code (FPASC)
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name     Description
# ----       ----     -----------
# 25-May-94  AMcC     Created.
# 17-Aug-94  AMcC     Removed Specific machine names.
#                     If building for old series machines, comment out A600
#                     target and uncomment ARM2/3 target.
# 28-Jan-97  KJB      If building for a kernel that is capable of operating
#                     in a 32-mode with interrupts enabled, you can change
#                     the APCS to 32bit for a more efficient emulator

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = ObjAsm
CP      = Copy
LD      = Link
RM      = Remove
WIPE    = -Wipe
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Program specific options:
#
COMPONENT = FPEmulator
TARGET    = rm.${MACHINE}.FPEmulator
EXPORTS   = ${EXP_HDR}.FPEmulator

#
# Generic rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install: ${TARGET}
	${MKDIR} ${INSTDIR}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: ram module installed

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${RM} ${TARGET}
	${WIPE} o.* ${WFLAGS}
	@echo ${COMPONENT}: cleaned

resources:
	${MKDIR} ${RESDIR}.${COMPONENT}
	TokenCheck LocalRes:Messages
	${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied

${TARGET}: o.fpe
	${MKDIR} rm.${MACHINE}
	${LD} -rmf -o $@ o.fpe

o.fpe: s.${MACHINE}
	${AS} -I Hdr:t.^ ${ASFLAGS} -APCS ${FPE_APCS} -CPU 5 s.${MACHINE} $@

${EXP_HDR}.FPEmulator: hdr.FPEmulator
	${CP} hdr.FPEmulator $@ ${CPFLAGS}

BBETYPE = fpasc
bbe-fpasc: bbe-generic
	BBE_Export_File ^.VersionNum

# Dynamic dependencies:
