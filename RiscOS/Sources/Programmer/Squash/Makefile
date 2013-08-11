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
# Makefile for Squash module
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

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CP      = copy
LD      = link
RM      = remove
WIPE    = -wipe
CCFLAGS = -c -depend !Depend -IC: -faf -zps1 -zM
ASFLAGS = -depend !Depend -Stamp -quit
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Program specific options:
#
COMPONENT = Squash
TARGET    = rm.Squash
EXPORTS   = ${EXP_HDR}.${COMPONENT}

OBJS =\
 compress.o\
 comp_ass.o\
 cssr.o\
 debug.o\
 mr_module.o\
 statics.o\
 trial.o\
 zcat_ass.o\
 zssr.o

#
# Rule patterns
#
.c.o:;      ${CC} ${CCFLAGS} -o $@ $<
.s.o:;      ${AS} ${ASFLAGS} $< $@

#
# Generic rules:
#
all:
	@echo testing

rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${WIPE} o.* ${WFLAGS}
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

resources:
	${MKDIR} ${RESDIR}.${COMPONENT}
	TokenCheck LocalRes:Messages
	${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied

${TARGET}: ${OBJS}
	${LD} -o $@ -bin -base 0 ${OBJS}
	SetType $@ module

zcat_ass.o: zcat_ass12.s
	${AS} ${ASFLAGS} s.zcat_ass12 $@

${EXP_HDR}.${COMPONENT}: hdr.${COMPONENT}
	${CP} hdr.${COMPONENT} $@ ${CPFLAGS}

# Dynamic dependencies:
