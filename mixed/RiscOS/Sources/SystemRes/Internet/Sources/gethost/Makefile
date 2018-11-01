# Copyright 2003 Tematic Ltd
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
SQUEEZE = squeeze

DEFINES = -DRISCOS_TWEAK
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

#
# Include files
#
INCLUDES = -ITCPIPLibs:,C:

DIRS = o._dirs

#
# Program specific options:
#
COMPONENT = GetHost
TARGET    = GetHost
OBJS =      o.GetHost

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
all:    GetHost

clean:  
        IfThere o Then ${WIPE} o ${WFLAGS}
        ${RM} GetHost

${DIRS}:
        ${MKDIR} o

GetHost: ${OBJS} ${NET5LIBS} ${CLIB} ${DIRS}
        ${LD} -o $@ ${OBJS} ${NET5LIBS} ${CLIB}
        ${SQUEEZE} $@


# Dynamic dependencies:
