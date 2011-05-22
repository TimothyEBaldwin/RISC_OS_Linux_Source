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
# Makefile for Kernel
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
#

#
# Paths
#
EXP_HDR = <export$dir>
C_EXP_HDR = <cexport$dir>.Global.h

#
# Generic options:
#
MKDIR   = mkdir -p
AS      = aasm
ARMASM  = objasm
LD      = link
CP      = copy
RM      = remove
WIPE    = -wipe
PERL    = do <Perl$Dir>.perl
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend ${THROWBACK} -Stamp -quit -To $@ -From
ARMASMFLAGS = -depend !Depend -g ${THROWBACK} -cpu 5TE
CPFLAGS = ~cfr~v
WFLAGS  = ~cfr~v

TOKENISE = tokenise
TOKENS   = Hdr:Tokens

#
# Program specific options:
#
COMPONENT = Kernel
SOURCE    = s.GetAll
TARGET    = rm.Kernel
AIFDBG    = aif.Kernel
GPADBG    = GPA
OBJECTS   = o.GetAll #o.ARMops o.End
EXPORTS   = ${EXP_HDR}.EnvNumbers \
            ${EXP_HDR}.ModHand \
            ${EXP_HDR}.PublicWS \
            ${EXP_HDR}.RISCOS \
            ${EXP_HDR}.Variables \
            ${EXP_HDR}.VduExt \
            ${EXP_HDR}.HALEntries \
            ${EXP_HDR}.HALDevice \
            ${EXP_HDR}.OSEntries \
            ${C_EXP_HDR}.RISCOS \
            ${C_EXP_HDR}.HALEntries \
            ${C_EXP_HDR}.HALDevice \
            ${C_EXP_HDR}.OSEntries

#
# Generic rules:
#
.SUFFIXES: .o .s
.s.o:; ${ARMASM} ${ARMASMFLAGS} -o $@ $< #-list list.$*

rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

debug: ${GPADBG}
	@echo ${COMPONENT}: debug image built

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${RM} s.TMOSHelp
	${RM} s.Time+Date
	${WIPE} o.* ${WFLAGS}
	${RM} ${TARGET}
	${WIPE} aif ${WFLAGS}
	${RM} ${GPADBG}
	${WIPE} list.* ${WFLAGS}
	@echo ${COMPONENT}: cleaned

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

resources: resources-${CMDHELP}
	@echo ${COMPONENT}: resource files copied

resources_common:
	${MKDIR} ${RESDIR}.${COMPONENT}
	Set Kernel$Messages LocalRes:Messages
	IfThere LocalRes:<UserIF>.Messages Then Set Kernel$Messages LocalRes:<UserIF>.Messages
	TokenCheck LocalRes:<UserIF>.Messages
	${CP} <Kernel$Messages>  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
	UnSet Kernel$Messages

resources-None: resources_common
	@

resources-: resources_common
	TokenCheck LocalRes:Messages
	print LocalRes:CmdHelp { >> ${RESDIR}.${COMPONENT}.Messages }

${TARGET}: ${OBJECTS}
	${LD} -bin -o ${TARGET} ${OBJECTS}

${AIFDBG}: ${OBJECTS}
	${MKDIR} aif
	${LD} -aif -bin -d -o ${AIFDBG} ${OBJECTS}

${GPADBG}: ${AIFDBG}
	ToGPA -s ${AIFDBG} ${GPADBG}

s.TMOSHelp: ${TOKENS} HelpStrs
	${TOKENISE} ${TOKENS} HelpStrs $@

s.Time+Date:
	@echo |IGBLS Builddate|JBuilddate SETS "<Sys$Date> <Sys$Year>.<Sys$Time>" |J|IEND { > s.Time+Date }
	settype s.Time+Date FFF
	
o.GetAll: s.TMOSHelp \
          s.Time+Date

#
# Exported interface headers
#
${EXP_HDR}.EnvNumbers: hdr.EnvNumbers
	${CP} hdr.EnvNumbers $@ ${CPFLAGS}

${EXP_HDR}.ModHand: hdr.ModHand
	${CP} hdr.ModHand $@ ${CPFLAGS}

${EXP_HDR}.PublicWS: hdr.PublicWS
	${CP} hdr.PublicWS $@ ${CPFLAGS}

${EXP_HDR}.RISCOS: hdr.RISCOS
	${CP} hdr.RISCOS $@ ${CPFLAGS}

${EXP_HDR}.VduExt: hdr.VduExt
	${CP} hdr.VduExt $@ ${CPFLAGS}

${EXP_HDR}.Variables: hdr.Variables
	${CP} hdr.Variables $@ ${CPFLAGS}
	
${EXP_HDR}.HALEntries: hdr.HALEntries
	${CP} hdr.HALEntries $@ ${CPFLAGS}
	
${EXP_HDR}.HALDevice: hdr.HALDevice
	${CP} hdr.HALDevice $@ ${CPFLAGS}
	
${EXP_HDR}.OSEntries: hdr.OSEntries
	${CP} hdr.OSEntries $@ ${CPFLAGS}
	
${C_EXP_HDR}.RISCOS: hdr.RISCOS
	${MKDIR} ${C_EXP_HDR}
	${PERL} Build:Hdr2H hdr.RISCOS $@

${C_EXP_HDR}.HALEntries: hdr.HALEntries
	${MKDIR} ${C_EXP_HDR}
	${PERL} Build:Hdr2H hdr.HALEntries $@

${C_EXP_HDR}.HALDevice: o.Global.h.HALDevice h.HALDevice
	${CP} h.HALDevice $@ ${CPFLAGS}
	print o.Global.h.HALDevice { >> $@ }

${C_EXP_HDR}.OSEntries: hdr.OSEntries
	${MKDIR} ${C_EXP_HDR}
	perl Build:Hdr2H hdr.OSEntries $@

o.Global.h.HALDevice: hdr.HALDevice
	${MKDIR} o.Global.h
	dir o
	${PERL} Build:Hdr2H ^.hdr.HALDevice Global.h.HALDevice
	back

BBETYPE = kernel
bbe-kernel: bbe-generic-resources-get-alias
	BBE_Export_File_In_Dir Resources.${LOCALE} CmdHelp
	BBE_Export_File_In_Dir Resources.${LOCALE} Messages
	BBE_Export_Dir Resources.${LOCALE}.${USERIF}
	BBE_Export_File VersionNum

# Dynamic dependencies:
