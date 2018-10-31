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
# Makefile for IOMD HAL
#

COMPONENT  = IOMD HAL
TARGET     = IOMD
OBJS       = Top Boot ATA IIC Interrupts MachineID NVRAM \
             Timers Video cbits KbdScan Debug Post IOMD21DMA RTC
HDRS       =
CMHGFILE   =
CUSTOMRES  = custom
CUSTOMROM  = custom
ROM_TARGET = custom
LNK_TARGET = custom
AIFDBG     = aif._IOMD
GPADBG     = gpa.GPA

include CModule

CCFLAGS   += -ff -APCS 3/32bit/nofp/noswst
ASFLAGS   += -APCS 3/nofp/noswst
AASMFLAGS += -APCS 3/nofp/noswst

resources:
        @${ECHO} ${COMPONENT}: no resources

rom: aof.${TARGET}
        @${ECHO} ${COMPONENT}: rom module built

_debug: ${GPADBG}
        @echo ${COMPONENT}: debug image built

install_rom: linked.${TARGET}
        ${CP} linked.${TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

aof.${TARGET}: ${ROM_OBJS_} ${ROM_LIBS} ${DIRS} ${ROM_DEPEND}
        ${LD} -o $@ -aof ${ROM_OBJS_} ${ROM_LIBS}

linked.${TARGET}: aof.${TARGET}
        ${LD} ${LDFLAGS} ${LDLINKFLAGS} -o $@ -bin -base 0xFC000000 aof.${TARGET}

${AIFDBG}: ${ROM_OBJS_} ${ROM_LIBS}
        ${MKDIR} aif
        ${LD} -aif -bin -d -o ${AIFDBG} ${ROM_OBJS_} ${ROM_LIBS}

${GPADBG}: ${AIFDBG}
        ToGPA -s ${AIFDBG} ${GPADBG}

# Dynamic dependencies:
