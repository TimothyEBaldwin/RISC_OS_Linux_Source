# Copyright 1998 Acorn Computers Ltd
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
# Makefile for LanManFS
#
# Paths
#
EXP_HDR = <export$dir>

#
# Component specific options:
#
COMPONENT  = LanManFS
TARGET     = LanManFS
ROM_MODULE = aof.${TARGET}
RAM_MODULE = rm.${TARGET}
DBG_MODULE = rm.${TARGET}D

#
# Generic options:
#
include StdTools

DFLAGS    = -DCOMPAT_INET4 -DLONGNAMES ${OPTIONS}
AFLAGS    = -depend !Depend ${THROWBACK} -Stamp -quit -predefine "ROMSPRITES SETL {${ROMSPRITES}}"
CFLAGS    = -depend !Depend ${THROWBACK} -c -Wpcs -ff -zps1 -zM ${INCLUDES},. ${DFLAGS}
CMHGFLAGS = -depend !Depend ${THROWBACK} -p ${OPTIONS}
INCLUDES  = -ITCPIPLibs:,C:

#
# Libraries
#
include ModuleLibs

MAINOBJS  = LanMan.o Omni.o Logon.o CoreFn.o Printers.o NameCache.o \
            Xlate.o buflib.o Transact.o \
            LLC.o NetBIOS.o SMB.o Attr.o RPC.o NBIP.o Stats.o

NONCOBJS  = LanMan_MH.o Errors.o Interface.o

OBJS      = ${MAINOBJS} ${NONCOBJS}

ROM_OBJS  = ${NONCOBJS} ${MAINOBJS:%.o=or.%}

DBG_OBJS  = ${NONCOBJS} ${MAINOBJS:%.o=od.%}

OBJSI     = ${NONCOBJS} ${MAINOBJS:%.o=i.%}

OBJSINST  = ${NONCOBJS} ${MAINOBJS:%.o=inst.%}

LanMan_MH.h: LanMan_MH.o
	${CMHG} ${CMHGFLAGS} cmhg.$* -d $@

#
# Rule patterns
#
.SUFFIXES:  .o .od .or .s .c .i .h .cmhg .inst
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.c.or:;     ${CC} ${CFLAGS} -DROM -o $@ $<
.c.od:;     ${CC} ${CFLAGS} -DDEBUG -DDEBUGLIB -DTRACE -Dprintf=module_printf -o $@ $<
.c.i:;      $(CC) $(CFLAGS) -c -C -E $< >> $@
.i.inst:;   $(CC) $(CFLAGS) -C++ -o $@ $<
.cmhg.o:;   ${CMHG} ${CMHGFLAGS} -o $@ $< -d $*.h
.cmhg.h:;   ${CMHG} ${CMHGFLAGS} -o $@ -d $<
.s.o:;      ${AS} ${AFLAGS} $< $@

#
# Build target
#
all: ${RAM_MODULE}
	@echo ${COMPONENT}: all complete

install: ${RAM_MODULE} dirs
	${CP} ${RAM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: all complete

dirs:
	${MKDIR} ${INSTDIR}

o.LanMan o.LLC o.Logon o.NBIP o.Omni: LanMan_MH.h
or.LanMan or.LLC or.Logon or.NBIP or.Omni: LanMan_MH.h
od.LanMan od.LLC od.Logon od.NBIP od.Omni: LanMan_MH.h
i.LanMan i.LLC i.Logon i.NBIP i.Omni: LanMan_MH.h

#
# RISC OS ROM build rules:
#
rom: ${ROM_MODULE}
	@echo ${COMPONENT}: rom module built

resources:
	@echo ${COMPONENT}: no resource files to copy

preprocess: ${OBJSI} i.dirs
	@echo ${COMPONENT}: preprocess build complete

instrument: ${OBJSINST} inst.instlib i.dirs o.dirs 
	$(LD) -rmf -o $@ $(OBJSINST) inst.instlib $(STUBS)
	${MODSQZ} $@
	@echo ${COMPONENT}: instrument build complete

o.dirs:
	${MKDIR} o
	${MKDIR} od
	${MKDIR} or
	create o.dirs

i.dirs:
	${MKDIR} i
	${MKDIR} inst

export: 
	@echo ${COMPONENT}: export complete

install_rom: ${ROM_MODULE}
	${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${WIPE} o ${WFLAGS}
	${WIPE} od ${WFLAGS}
	${WIPE} or ${WFLAGS}
	${WIPE} i ${WFLAGS}
	${WIPE} inst ${WFLAGS}
	${WIPE} map ${WFLAGS}
	${WIPE} linked ${WFLAGS}
	${WIPE} aof ${WFLAGS}
	${WIPE} rm ${WFLAGS}
	${RM} h.LanMan_MH
	${RM} NameCache
	@echo ${COMPONENT}: cleaned

#
# Target 
#
${RAM_MODULE}: ${OBJS} o.dirs
	${MKDIR} rm
	${LD} -o $@ -rmf ${OBJS} ${NET4LIBS} ${CLIB} ${ASMUTILS}
	${MODSQZ} $@
	Access $@ RW/R

${DBG_MODULE}: ${DBG_OBJS} o.dirs
	${MKDIR} rm
	${LD} -o $@ -rmf ${DBG_OBJS} ${DEBUGLIB} ${NET4LIBS} ${CLIB} ${ASMUTILS}
	${MODSQZ} $@

#
# ROM Target 
#
${ROM_MODULE}: ${ROM_OBJS} ${NET4LIBS} o.dirs
	${MKDIR} aof
	${LD} -o $@ -aof ${ROM_OBJS} ${ROMCSTUBS} ${NET4LIBS} ${ASMUTILS}
	
#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${MKDIR} linked
	${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

# Dynamic dependencies:
