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
# Makefile for Freeway
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 21-Nov-94  AMcC   Created
# 05-Jan-95  AMcC   Added resources: rule and paths
#

#
# Component specific options:
#
COMPONENT  = Freeway
ROM_MODULE = aof.Freeway
RAM_MODULE = rm.Freeway
DBG_MODULE = rm.DbgFreeway
RDIR       = Resources
LDIR       = ${RDIR}.${LOCALE}
RESDIR     = ^.^.AUNMsgs.Resources.${Locale}.Resources.${COMPONENT}

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
SQZ     = modsqz
TOUCH   = create

AFLAGS  = -depend !Depend -I<Hdr$Dir>.Global.,<Hdr$Dir>.Interface. -Stamp -quit
CFLAGS  = -zM -zps1 -ffah -Wp ${INCLUDES} ${DFLAGS} ${THROWBACK}
DFLAGS  = -DAUTH32 -DCOMPAT_INET4
# -DDEBUG -DDEBUGSER
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

INCLUDES  = -ITCPIPLibs:,C:

#
# Libraries
#
ANSILIB   = CLib:o.ansilib
CLIB      = C:o.stubs
RLIB      = RISC_OSLIB:o.risc_oslib
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.abssym
C_ABSSYM  = RISCOSLIB:o.c_abssym

SOCKLIBZM = TCPIPLibs:o.socklibzm
INETLIBZM = TCPIPLibs:o.inetlibzm
DEBUGLIB  = C:DebugLib.o.DebugLibZM
ASMUTILS  = C:AsmUtils.o.AsmUtilsZM

OBJS =\
 o.fwhdr\
 o.module\
 o.objects

DBG_OBJS=\
 o.fwhdr\
 od.module\
 od.objects

DIRS=od._dirs
#
# Rule patterns
#
.SUFFIXES:  .od
.c.o:;      ${CC} -c -depend !Depend ${CFLAGS} -o $@ $<
.c.od:;      ${CC} -c -depend !Depend ${CFLAGS} -DDEBUG -o $@ $<
.c.s:;      ${CC} -S ${CFLAGS} $<
.s.o:;      ${AS} ${AFLAGS} $< $@
.cmhg.o:;   ${CMHG} -p -o $@ $<
.cmhg.h:;   ${CMHG} -p -d $@ $<

#
# Main rules:
#
#
rom: ${ROM_MODULE}
	@echo ${COMPONENT}: Module built (ROM)

all: ${RAM_MODULE}
	@echo ${COMPONENT}: Module built (RAM)

trace: ${DBG_MODULE}
	@echo ${COMPONENT}: Module built (RAM trace)

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: Module installed (ROM)

resources:
	@echo ${COMPONENT}: Resources in AUNMsgs

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} od ${WFLAGS}
	${RM} ${ROM_MODULE}
	${RM} ${RAM_MODULE}
	${RM} ${DBG_MODULE}
	${RM} h.FwHdr
	${WIPE} linked.* ${WFLAGS}
	@echo ${COMPONENT}: cleaned

clean_all: clean
	${WIPE} o.* ${WFLAGS}
	@echo ${COMPONENT}: imported objects removed

${ROM_MODULE}: ${OBJS} ${SOCKLIBZM} ${INETLIBZM} ${ROMCSTUBS} ${ASMUTILS}
	${MKDIR} aof
	${LD} -o $@ -aof ${OBJS} ${SOCKLIBZM} ${INETLIBZM} ${ROMCSTUBS} ${ASMUTILS}

${RAM_MODULE}: ${OBJS} ${SOCKLIBZM} ${INETLIBZM} ${CLIB} ${ASMUTILS}
	${LD} -o $@ -rmf ${OBJS} ${SOCKLIBZM} ${INETLIBZM} ${CLIB} ${ASMUTILS}
	${SQZ} $@

${DBG_MODULE}: ${DBG_OBJS} ${SOCKLIBZM} ${INETLIBZM} ${CLIB} ${DIRS} ${DEBUGLIB} ${ASMUTILS}
	${LD} -o $@ -rmf ${DBG_OBJS} ${DEBUGLIB} ${SOCKLIBZM} ${INETLIBZM} ${CLIB} ${ASMUTILS}
	${SQZ} $@

# final link for ROM Image (using given base address)
rom_link:
	${MKDIR} linked
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${C_ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

# Static dependencies:
o.module: h.FwHdr
od.module: h.FwHdr

${DIRS}:
	${MKDIR} od
	${TOUCH} $@

#---------------------------------------------------------------------------
# Dynamic dependencies:
