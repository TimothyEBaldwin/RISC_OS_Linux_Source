# Copyright 2000 Pace Micro Technology plc
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
CP      = copy
RM      = remove
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend ${THROWBACK} -Stamp -quit -To $@ -From
ARMASMFLAGS = -depend !Depend -g -APCS 3/nofp/noswst ${THROWBACK}
CPFLAGS = ~cfr~v

TOKENISE = tokenise
TOKENS   = Hdr:Tokens

#
# Program specific options:
#
COMPONENT = IOMD
TARGET    = bin.IOMD
DBGTARGET = aif.IOMD
GPATARGET = gpa.IOMD
EXPORTS   =

OBJECTS   = o.Boot o.IIC o.NVRAM o.Video o.Interrupts o.MachineID o.Timers o.ATA

.s.o:;	${ARMASM} ${ARMASMFLAGS} $< $@

#
# Generic rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

debug: ${GPATARGET}
	@echo ${COMPONENT}: debug module built

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${RM} ROM
	${RM} ${TARGET}
	-Wipe o.* ~C~V
	-Wipe aif.* ~C~V
	-Wipe gpa.* ~C~V
	@echo ${COMPONENT}: cleaned

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

resources:
	@echo ${COMPONENT}: nothing to do

${TARGET}: ${OBJECTS}
	Link -bin -o $@ ${OBJECTS} -base 0xFC000000

${DBGTARGET}: ${OBJECTS}
	Link -bin -aif -d -o $@ ${OBJECTS} -base 0xFC000000

${GPATARGET}: ${DBGTARGET}
	ToGPA -s ${DBGTARGET} $@

# Dynamic dependencies:
