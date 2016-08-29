# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
#
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
#
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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

include Depends
