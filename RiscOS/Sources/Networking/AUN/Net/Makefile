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
# Makefile for Net
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 01-Dec-94  JDavies      Modified to allow build without Generic include files
#                         and to include disc-based, not built-in, swis.h
# 04-Jan-94  JDavies      Added build of NetMsgs module for use of Net module
#                         not with the RISC OS Black ROM. Start use of -fah
#                         option.
# 11-Jan-95  JDavies      Continue -fah use.
# 13-Jan-95  JDavies      Add -ff and -zps1 options
# 31-Jan-95  JDavies      Split c.debug off as a separate file
# 06-Feb-95  JDavies      Tidied
# 21-Feb-95  JDavies      Commented out NetMsgs stuff (rm.netMsgs is no longer
#                         needed or made.
# 22-Feb-95  JDavies      Removed need for CLibInc$Path to be set, uses
#                         C$Liboot instead.
# 14-Mar-95  JDavies      Added use of mnscommon.c. c.NetI now compilable -fahf
# 17-Mar-95  JDavies      Removed CNFLAGS definition, no longer needed
#

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = -wipe

AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -depend !Depend -fahf -zps1 -wp -zM ${INCLUDES} ${DFLAGS}
CMHGFLAGS = -p -depend !Depend
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.AbsSym

#
# Program specific options:
#
COMPONENT = Net
TARGET    = aof.Net

VPATH     = @ gwroute
INCLUDES  = -ITCPIPLibs:,C:
#DFLAGS    = -DDEBUG

LIBS   = TCPIPLibs:o.unixlibzm TCPIPLibs:o.inetlibzm TCPIPLibs:o.socklib5zm C:AsmUtils.o.AsmUtilsZM

OBJS   = o.mns o.mnscommon o.io o.swis o.configure o.netasm o.route o.showrt \
         o.text o.inetfn o.debug

EOBJS  = o.mnsi o.mnscommon o.io_e o.swis_e o.configure o.netasm \
         o.text o.inetfn o.debug

IOBJS  = o.mnsi o.mnscommon o.io o.swis o.configure o.netasm \
         o.text o.inetfn o.debug

GOBJS  = o.mnsg o.mnscommon o.io o.swis o.configure o.netasm o.showrt \
	 o.text o.inetfn \
         o.af o.if o.input o.output o.startup o.tables \
         o.timer o.trace o.inet o.data
	 

#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.cmhg.o:;   ${CMHG} ${CMHGFLAGS} $< $@
.s.o:;      ${AS} ${AFLAGS} $< $@

#
# AUN build rules:
#
# all:    rm.Net rm.NetB rm.NetE rm.NetG rm.NetI
all:    rm.Net rm.NetB rm.NetE rm.NetI

install:    rm.NetI
	${CP} rm.NetI ${INSTDIR}.NetI ${CPFLAGS}
	Access ${INSTDIR}.NetI WR/r
	@echo ${COMPONENT}: NetI installed
#
# RISC OS ROM build rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} rm.* ${WFLAGS}
	${WIPE} linked.* ${WFLAGS}
	${WIPE} map.* ${WFLAGS}
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

resources:
	@echo ${COMPONENT}: resource files are in AUNMsgs

${TARGET}: ${OBJS} o.MNSHdr_b ${ROMSTUBS}
	${LD} -o $@ -aof o.mnshdr_b ${OBJS} ${LIBS} ${ROMSTUBS}

rom_link:
	${LD} -o linked.${COMPONENT} -map -module -base ${ADDRESS} ${TARGET} ${ABSSYM} > map.${COMPONENT}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

#
# AUN:
#
#rm.NetMsgs: Resources.UK.Messages
#        modgen rm.~NetMsgs NetMsgs NetMsgs 0.03 Resources.UK.Messages Resources.Net.Messages
#        modsqz rm.~NetMsgs
#        remove rm.NetMsgs
#        rename rm.~NetMsgs rm.NetMsgs

rm.Net:  ${OBJS} o.MNSHdr_c ${LIBS} ${LCLIB}
	 ${LD} -o $@ -module -map o.mnshdr_c ${OBJS} ${LIBS} ${CLIB} > map.linkmap_c

rm.NetB: ${OBJS} o.MNSHdr_b ${LIBS} ${LCLIB}
	 ${LD} -o $@ -module -map o.mnshdr_b ${OBJS} ${LIBS} ${CLIB} > map.linkmap_b

rm.NetE: ${EOBJS} o.MNSHdr_e ${LIBS} ${LCLIB}
	 ${LD} -o $@ -module -map o.mnshdr_e ${EOBJS} ${LIBS} ${CLIB} > map.linkmap_e

rm.NetI: ${IOBJS} o.MNSHdr_i ${LIBS} ${LCLIB}
	 ${LD} -o $@ -module -map o.mnshdr_i ${IOBJS} ${LIBS} ${CLIB} > map.linkmap_i

rm.NetG: ${GOBJS} o.Mnshdr_g ${LIBS} ${LCLIB}
	 ${LD} -o $@ -module -map o.mnshdr_g ${GOBJS} ${LIBS} ${CLIB} > map.linkmap_g

#
# Special rules:
#

io_e.o: c.io
	${CC} ${CFLAGS} -DEDDS c.io -o o.io_e

swis_e.o: c.swis
	${CC} ${CFLAGS} -DEDDS c.swis -o o.swis_e

# Dynamic dependencies:
