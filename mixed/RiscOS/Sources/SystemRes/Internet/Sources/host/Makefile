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
#
# Generic options:
#
MKDIR   = mkdir -p 
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe

DEFINES = -DRISCOS_TWEAK -Dlint
AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -depend !Depend -ffah -Wp -zps1 ${INCLUDES} ${DEFINES} ${DFLAGS}
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
CLIB      = CLIB:o.stubs
NET5LIBS  = \
  TCPIPLibs:o.inetlib \
  TCPIPLibs:o.unixlib \
  TCPIPLibs:o.socklib \

#
# Include files
#
INCLUDES = -ITCPIPLibs:,C:

DIRS = o._dirs

#
# Program specific options:
#
COMPONENT = Host
TARGET    = bin.Host

OBJS =      o.ns o.host o.res o.dst 

#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.cmhg.o:;   ${CMHG} ${CMHGFLAGS} -o $@ $<
.cmhg.h:;   ${CMHG} ${CMHGFLAGS} -d $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@

#
# build a binary
#
all:    bin.Host

clean:  
        IfThere bin Then ${WIPE} bin ${WFLAGS}
        IfThere o Then ${WIPE} o ${WFLAGS}

${DIRS}:
        ${MKDIR} bin
        ${MKDIR} o

bin.Host: ${OBJS} ${NET5LIBS} ${CLIB} ${DIRS}
        ${LD} -o $@ ${OBJS} ${NET5LIBS} ${CLIB}

# Dynamic dependencies:
