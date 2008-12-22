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
# Makefile for TinyStubs (in ROM)
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 09-Jan-95  AMcC   Created
# 24-Jan-95  AMcC   Now linked with tboxlib
# 16-Sep-98  SNB    Disabled TinySupport_Share; srccommit; use cmhg -p
#

#
# Component specific options:
#
COMPONENT  = TinyStubs
ROM_MODULE = aof.${COMPONENT}

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}

#
# Generic options:
#
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
MKDIR   = mkdir -p
RM      = remove
WIPE    = -wipe
TOUCH   = create

CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

AFLAGS   = -depend !Depend -Stamp -quit -CloseExec
CFLAGS   = -c -depend !Depend ${INCLUDES} -zM -fa -zps1 ${DFLAGS}
DFLAGS   = -DROM
INCLUDES = -I<Lib$Dir>.tboxlibint.,<Lib$Dir>.tboxlibs:,C:

#
# Libraries
#
ANSILIB   = CLib:o.ansilib
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.abssym
TBOXLIB   = <Lib$Dir>.tboxlibint.o.tboxlibm

OBJS =\
 o.jcomp\
 o.main\
 o.ModHdr

DIRS =\
 o._dirs

#
# Rule patterns
#
.c.o:;    ${CC} ${CFLAGS} -o $@ $<
.cmhg.o:; ${CMHG} -p -o $@ $<
.s.o:;    ${AS} ${AFLAGS} -o $@ $<

#
# Main rules:
#
#
rom: ${ROM_MODULE}
	@echo ${COMPONENT}: Module built (ROM)

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: Module installed (ROM)

resources: LocalRes:Messages
	${MKDIR} ${RESDIR}
	TokenCheck LocalRes:Messages
	${CP} LocalRes:Messages ${RESDIR}.Messages ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied to Messages module

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} aof ${WFLAGS}
	${WIPE} linked ${WFLAGS}
	${RM} h.ModHdr
	@echo ${COMPONENT}: cleaned

${ROM_MODULE}: ${OBJS} ${TBOXLIB} ${ROMCSTUBS} ${DIRS}
	${MKDIR} aof
	${LD} -o $@ -aof ${OBJS} ${TBOXLIB} ${ROMCSTUBS}

# final link for ROM Image (using given base address)
rom_link:
	${MKDIR} linked
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

o.ModHdr: h.ModHdr ${DIRS}
	@|
	
h.ModHdr: cmhg.ModHdr
	@|

c.main: h.ModHdr ${DIRS}
	${CMHG} -p -o o.ModHdr cmhg.ModHdr -d h.ModHdr

${DIRS}:
	${MKDIR} o
	${TOUCH} $@

#---------------------------------------------------------------------------
# Dynamic dependencies:
