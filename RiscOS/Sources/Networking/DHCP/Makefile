# Copyright 1999 Element 14 Ltd
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
# Makefile for DHCP
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 22-Mar-99  SNB          Created
#

#
# Available build options (pass in OPTIONS)
#
#
# -DMINIMUM_OPTIONS_LENGTH=4
#    Sets the length of options check.  Set this to 4 to disable the
#    length checks.  Defaults to 64 (what the DHCP standard requires)

#
# Paths
#
EXP_HDR = <cexport$dir>

#
# Generic options:
#
include Makefiles:StdTools

COMPONENT = DHCP
CMHGNAME  = DHCPhdr

EXPORTS = ${EXP_HDR}.h.${COMPONENT}

DEPENDS = -depend !Depend ${THROWBACK}

DEFINES = ${OPTIONS} -UTRACE

AFLAGS = ${DEPENDS} -Stamp -quit
CFLAGS  = -ffcah -c -zM -zps1 -wp ${DEFINES} ${INCLUDES} ${DEPENDS}
CMHGFLAGS = -p ${DEPENDS}

DIRS = o._dirs

#
# Libraries
#
include Makefiles:ModuleLibs

#
# Include files
#
INCLUDES = -ITCPIPLibs:,C:

#
# Program specific options:
#
TARGET    = rm.${COMPONENT}
CMHGOBJ   = o.$(CMHGNAME)
ROMTARGET = aof.${COMPONENT}

OBJS      =	\
 o.dhcp		\
 o.dhcperrors	\
 o.dhcpinform	\
 o.module	\
 o.interfaces	\
 o.iparp	\
 o.packets	\
 o.sockets	\
 o.voting	\
 $(CMHGOBJ)

#
# Rule patterns
#
.SUFFIXES:  .o .s .c .h .cmhg
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.cmhg.o:;   ${CMHG} ${CMHGFLAGS} -o $@ $<
.cmhg.h:;   ${CMHG} ${CMHGFLAGS} -d $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@


#
# build a DHCP module
#
all: ${TARGET}
	@echo ${COMPONENT}: all complete

install: ${TARGET} dirs
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: all complete

dirs:
	${MKDIR} ${INSTDIR}
#
# RISC OS ROM build rules:
#
rom: ${ROMTARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install_rom: ${ROMTARGET}
	${CP} ${ROMTARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${WIPE} o ${WFLAGS}
	${WIPE} rm ${WFLAGS}
	${WIPE} aof ${WFLAGS}
	${WIPE} linked ${WFLAGS}
	${RM} h.${CMHGNAME}
	@echo ${COMPONENT}: cleaned

#
# Target 
#
${TARGET}: ${XTARGET} ${OBJS} ${NET5LIBS} ${CLIB} ${ASMUTILS} ${DIRS}
	${MKDIR} rm
	${LD} -o $@ -rmf ${OBJS} ${NET5LIBS} ${CLIB} ${ASMUTILS}
	$(MODSQZ) $@
	Access $@ RW/R

#
# ROM Target 
#
${ROMTARGET}: ${OBJS} ${NET5LIBS} ${ROMCSTUBS} ${ASMUTILS} ${DIRS}
	${MKDIR} aof
	${LD} -o $@ -aof ${OBJS} ${NET5LIBS} ${ROMCSTUBS} ${ASMUTILS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${MKDIR} linked
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROMTARGET} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete


${EXPORTS}: h.${CMHGNAME} h.dhcpextern ${DIRS}
	${CP} h.dhcpextern $@ ${CPFLAGS}
	Do ${AWK} -- "/.define DHCP\_00/,/endif/" h.${CMHGNAME} >>$@

o.module: VersionNum h.${CMHGNAME}

${DIRS}:
	${MKDIR} o
	${TOUCH} $@

# Dynamic dependencies:
