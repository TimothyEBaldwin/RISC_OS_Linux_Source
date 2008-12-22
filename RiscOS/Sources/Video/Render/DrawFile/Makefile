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
# Makefile for DrawFile
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date           Name  Description
# ----           ----  -----------
# 28th Nov 1994  JRC   Created.
# 11th Jan 1995  AMcC  Updated - diff rules for 3.10 and post 3.10

#
# Paths
#

RESDIR = <resource$dir>.Resources2

#
# Generic options:
#
CC     = cc -IOS: -fach -wp -DDRAWFILE
CP     = copy
OBJASM = ObjAsm ${THROWBACK} -depend !Depend -stamp -quit
CMHG   = CMHG
LINK   = Link
MKDIR  = cdir
RM     = remove
WIPE   = -wipe
ZM     = -zM

CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries:
#
OSLIB  = OSLib:OSLib.o
RSTUBS = RISC_OSLib:o.romcstubs
ABSSYM = RISC_OSLib:o.abssym
ASMUTILS = C:AsmUtils.o.AsmUtilsZM

#
# Program specific options:
#
COMPONENT = DrawFile
TARGET    = aof.DrawFile


OBJS = o.bbox o.callback o.declare o.header o.main \
      o.render o.riscos o.textarea o.trfm o.verify
OBJS_310 = \
      o.bbox o.callback o.declare o.files o.header310 oSA.main \
      o.render o.riscos o.textarea o.trfm o.verify

OBJSD = debug.bbox debug.callback debug.declare o.files o.header \
      o.hostfs debug.main debug.render \
      debug.riscos debug.textarea debug.trfm debug.verify debug.jc_trace

INCS = i.bbox i.declare i.main i.render i.files i.textarea i.verify

RESOURCES = o.Messages
RESOURCES310 = o.Message310

H = h.drawfile #h.hostfs

#
# Generic rules {used by top-level build}:
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
	${WIPE} oSA.* ${WFLAGS}
	${RM} linked.${COMPONENT}
	${RM} ${TARGET}
	${WIPE} rm.* ${WFLAGS}
	@echo ${COMPONENT}: cleaned

resources: resources-${CMDHELP}
	@echo ${COMPONENT}: resource files copied

resources_common:
	${MKDIR} ${RESDIR}.${COMPONENT}
	${CP} LocalRes:Messages       ${RESDIR}.${COMPONENT}.Messages       ${CPFLAGS}

resources-None: resources_common
	@

resources-: resources_common
	print LocalRes:CmdHelp { >> ${RESDIR}.${COMPONENT}.Messages }

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS} ${OSLIB} ${RSTUBS} ${ASMUTILS}
	${LINK} -o $@ -aof ${OBJS} ${OSLIB} ${RSTUBS} ${ASMUTILS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
	${LINK} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
	${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom_link complete

#
# Extra {development} rules:
#

all: RM.DrawFile 
	@Echo Made all

debug: RM.DrawFileD
	@Echo Made debug

clean_all:
	-Destroy ${OBJS} ${OBJSD} ${ASMS} ${INCS} RM.DrawFile RM.DrawFileD
	@Echo Made clean

asms: ${ASMS}
	@Echo Made asms

incs: ${INCS}
	@Echo Made incs

objs: ${OBJS} ${OBJSD}
	@Echo Made objs

map: ${OBJS} ${OSLIB} CLib:o.Stubs
	${LINK} -map -output null: -s Symbols ${OBJS} ${OSLIB} CLib:o.Stubs ${ASMUTILS} > Map

release: RM.DrawFile
	%Copy RM.DrawFile Choices:Boot.PreDesk.DrawFile ~CFLNRV
	/<Prefix$Dir>.RM.DrawFile
	@Echo Made release

# Internal targets
RM.DrawFile: ${OBJS} ${OSLIB} CLib:o.Stubs ${ASMUTILS}
	${LINK} -module -o $@ ${OBJS} ${OSLIB} CLib:o.Stubs ${ASMUTILS}

RM.DrawFileD: ${OBJSD} ${RESOURCES} ${OSLIB} CLib:o.Stubs ${ASMUTILS}
	${LINK} -module -o $@ ${OBJSD} ${RESOURCES} ${OSLIB} CLib:o.Stubs ${ASMUTILS}

# For Aquarius
RM.310.DrawFile: ${OBJS_310} ${RESOURCES310} ${OSLIB} CLib:o.Stubs ${ASMUTILS}
	${LINK} -module -o $@ ${OBJS_310} ${RESOURCES310} ${OSLIB} CLib:o.Stubs ${ASMUTILS}

# Static dependencies:

o.Messages: LocalRes:Messages
	ResGen Messages o.Messages LocalRes:Messages Resources.DrawFile.Messages

o.Message310: LocalRes:Message310
	ResGen Messages o.Message310 LocalRes:Message310 Resources.DrawFile.Messages

#General rules
.SUFFIXES:      .cmhg .h .c .debug .o .oSA .Resources .s .asm .i .def
.c.o:;          ${CC} ${THROWBACK} -depend !Depend -c ${ZM} -ff -o $@ $<
.c.oSA:;        ${CC} ${THROWBACK} -depend !Depend -c ${ZM} -ff -DSTANDALONE -o $@ $<
.c.debug:;      ${CC} ${THROWBACK} -depend !Depend -c ${ZM} -DTRACE=1 -o $@ $<
.c.i:;          ${CC} -E -C $< > $@
.c.s:;          ${CC} ${ZM} -S -ff $<
.cmhg.o:;       ${CMHG} -p $< $@
.Resources.o .Resources.debug:
	        ResGen $* $@ $< Resources.DrawFile.$*
.asm.o:;        ${OBJASM} $< $@
.asm.debug:;    ${OBJASM} $< $@
#.def.h:;        DefMod -h < $< > $@
#.def.s:;        DefMod -s < $< > $@
#.def.o:;        DefMod -l -o l.$* < $<
#                LibFile -c -o $@ -via ViaFile
#                Wipe l.$* ~C~FR~V

# Dynamic dependencies:
