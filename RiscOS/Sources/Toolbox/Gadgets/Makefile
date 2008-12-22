# Copyright 1997 Acorn Computers Ltd
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
# Makefile for TextGadget
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 12/05/97  RLougher  Created
# 04/06/98  SBrodie   Added RAM build into same Makefile

#
# Component specific options:
#
COMPONENT  = TextGadget
ROM_MODULE = aof.${COMPONENT}
RAM_MODULE = rm.${COMPONENT}

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}

EXP_HDR = <export$dir>.^.Interface2
EXP_C_H = <Cexport$dir>.h
EXP_C_O = <Cexport$dir>.o

#
# Generic options
#

MKDIR   = do mkdir -p
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe
CD	= dir
CHMOD	= access

#FEATURES   = -zM -zps1 -g ${DFLAGS}
FEATURES   = -zM -zps1 -ffah ${DFLAGS}
AFLAGS     = ${THROWBACK} -depend !Depend
CFLAGS     = ${THROWBACK} -depend !Depend -c ${FEATURES} ${INCLUDES}
CMHGFLAGS  = ${THROWBACK} -depend !Depend -p ${DFLAGS}
CPFLAGS    = ~cfr~v
WFLAGS     = ~c~vr
CHMODFLAGS = RW/R

DFLAGS  = -D${SYSTEM}_BUILD #-DUSE_TINY ${DEBUG}

INCLUDES = -IC:tboxlibint,C:tboxlibs,C:


# ------------------------------------------------------------------------------
# Libraries
#
ANSILIB   = CLib:o.ansilib
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
ROMCSTUBS = RISCOSLIB:o.romcstubs
TBOXLIB   = c:tboxlibs.o.toolboxlib
WIMPLIB   = c:tboxlibs.o.wimplib
RSTUBS     = RISCOSLIB:o.rstubs
ROMSTUBS   = RISCOSLIB:o.romstubs
REMOTEDB   = <Lib$Dir>.debug.o.remotezm

# Which is correct? sbrodie 19/06/1998.  Daytona uses AbsSym, Spinner/Trunk uses c_abssym

ABSSYM    = RISC_OSLib:o.c_abssym
# ABSSYM     = RISC_OSLib:o.AbsSym


OBJS =\
	o.Modhdr \
	o.TextGadget \
	o.TextArea \
	o.ScrollList \
	o.Scrollbar \
	o.riscos_uti \
	o.riscos_gra \
	o.Font \
	o.TextMan \
	o.MemMan \
	o.Text \
	o.ScrollLisS \
	o.Utils \
	o.TAsel_ven \
	o.glib \
	o.glib3 \
	o.rmensure \
	o.Sizes \
	o.string32

RAM_OBJS =\
	o.Modhdr \
	o.TextGadget \
	o.TextArea \
	o.ScrollList \
	o.Scrollbar \
	o.riscos_uti \
	o.riscos_gra \
	o.Font \
	o.TextMan \
	o.MemMan \
	o.Text \
	o.ScrollLisS \
	o.Utils \
	o.TAsel_ven \
	o.glib \
	o.glib3 \
	o.rmensure \
	o.Sizes \
	o.string32


# ------------------------------------------------------------------------------
HDR = h.ModHdr

# ------------------------------------------------------------------------------
# Rule patterns
#

.SUFFIXES:	.o .h .s .c .cmhg

.c.o:;		@echo
		@echo Compiling $< ( ${FEATURES})
		@${CC} ${CFLAGS} -o $@ $<

.cmhg.o:;	@echo
		@echo Generating module C veneers ( -p ${DFLAGS})
		@${CMHG} ${CMHGFLAGS} $< -o $@

.cmhg.h:;	@echo
		@echo Generating module C veneers' header file ( -p ${DFLAGS})
		@${CMHG} ${CMHGFLAGS} $< -d $@

.s.o:;		@echo
		@echo Assembling $<
		@${AS} ${AFLAGS} -o $@ $<


all: ${RAM_MODULE}
	@echo
	@echo ${COMPONENT}: Module built (RAM) in ${RAM_MODULE}

rom: ${ROM_MODULE}
	@echo ${COMPONENT}: Module built (ROM)

install: ${RAM_MODULE}
	${MKDIR} ${INSTDIR}
	${CP} ${RAM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: Module installed (ROM)

export: ${EXPORTS}
	@echo
	@echo ${COMPONENT}: No exports

clean:
	@echo
	${WIPE} o.* ${WFLAGS}
	${WIPE} aof ${WFLAGS}
	${WIPE} rm ${WFLAGS}
	${WIPE} linked ${WFLAGS}
	${WIPE} map ${WFLAGS}
	${RM} ${HDR}
	@echo ${COMPONENT}: cleaned

${ROM_MODULE}: ${OBJS} ${TBOXLIB} ${WIMPLIB} ${ROMCSTUBS} ${HDR}
	${MKDIR} aof
	${LD} -o $@ -aof ${OBJS} ${TBOXLIB} ${WIMPLIB} ${ROMCSTUBS}

${RAM_MODULE}: ${RAM_OBJS} ${TBOXLIB} ${WIMPLIB} ${CLIB} ${HDR}
	${mkdir} rm
	${LD} -o $@ -module ${RAM_OBJS} ${TBOXLIB} ${WIMPLIB} ${CLIB}
	${CHMOD} rm.${COMPONENT} ${CHMODFLAGS}


# Final link for the ROM Image (using given base address)
rom_link:
	${MKDIR} linked
	${MKDIR} map
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM} \
              -map > map.${COMPONENT}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete


# ------------------------------------------------------------------------------
# Relocatable module target
#

${EXP_C_H}.${COMPONENT}:	h.${COMPONENT}
	${CP} h.${COMPONENT} $@ ${CPFLAGS}


# ------------------------------------------------------------------------------
# Dynamic dependencies:
