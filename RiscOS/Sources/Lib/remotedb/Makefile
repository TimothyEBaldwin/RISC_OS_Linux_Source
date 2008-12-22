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
# Makefile for remotedb
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 24 Apr 1997  RWB 	  Created
#

#
# Paths
#
#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = -wipe
CD	= dir
LIBFILE = libfile

SOCKLIBZM = TCPIPLibs:o.socklibzm
SOCKLIB   = TCPIPLibs:o.socklib
UNIXLIBZM = TCPIPLibs:o.unixlibzm
UNIXLIB   = TCPIPLibs:o.unixlib
INETLIBZM = TCPIPLibs:o.inetlibzm
INETLIB   = TCPIPLibs:o.inetlib

DEBUGLIB = <Lib$Dir>.debug

CFLAGS   = -c -depend !Depend -Wap -zps0 ${INCLUDES} ${THROWBACK} -ffah ${DFLAGS}
CFLAGSZM = -c -depend !Depend -Wap -zps0 ${INCLUDES} ${THROWBACK} -ffah ${DFLAGS} -zM
CPFLAGS  = ~cfr~v
WFLAGS   = ~c~v

CCZM=		${CC} ${CFLAGSZM}

#
# Libraries
#
CLIB     = CLIB:o.stubs
#
# Include files
#
INCLUDES = -ITCPIPLibs:,C:
DFLAGS   = -DCOMPAT_INET4

# Program specific options:
#
COMPONENT   = remote
COMPONENTZM = remotezm
LCOMPONENT  = lremote
LCOMPONENTZM= lremotezm

OBJ      = o.${COMPONENT}
OBJZM    = z.${COMPONENT}

#
# Rule patterns
#
.SUFFIXES: .z .o .c .s
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.c.z:;      ${CCZM} -c -o $@ $<

#
# Build
#
all: ${COMPONENT} ${COMPONENTZM} ${LCOMPONENT} ${LCOMPONENTZM} o.dirs
	@echo ${COMPONENT}: all complete

${COMPONENT}: ${OBJ}
	${LD} -o ${COMPONENT}   -aof ${OBJ} ${SOCKLIB} ${UNIXLIB} ${INETLIB}

${COMPONENTZM}: ${OBJZM}
	${LD} -o ${COMPONENTZM} -aof ${OBJZM} ${SOCKLIBZM} ${UNIXLIBZM} ${INETLIBZM}

${LCOMPONENT}: ${OBJ}
	${LIBFILE} -o ${LCOMPONENT}   -c ${OBJ}

${LCOMPONENTZM}: ${OBJZM}
	${LIBFILE} -o ${LCOMPONENTZM} -c ${OBJZM}

o.dirs:
	${MKDIR} o
	${MKDIR} z
	create o.dirs
	stamp  o.dirs

clean:
	${WIPE} o ${WFLAGS}
	${WIPE} z ${WFLAGS}
	${WIPE} ${COMPONENT} ${WFLAGS}
	${WIPE} ${COMPONENTZM} ${WFLAGS}
	${WIPE} ${LCOMPONENT} ${WFLAGS}
	${WIPE} ${LCOMPONENTZM} ${WFLAGS}
	@echo ${COMPONENT}: cleaned

export: export_${PHASE}

export_hdrs:
	${MKDIR} ${DEBUGLIB}
	${MKDIR} ${DEBUGLIB}.h
	${CP} h.${COMPONENT} ${DEBUGLIB}.h.${COMPONENT}   ${CPFLAGS}
	@echo ${COMPONENT}: export complete (hdrs)

export_libs: ${COMPONENT} ${COMPONENTZM} ${LCOMPONENT} ${LCOMPONENTZM} o.dirs
	${MKDIR} ${DEBUGLIB}
	${MKDIR} ${DEBUGLIB}.o
	${CP} ${COMPONENT}   ${DEBUGLIB}.o.${COMPONENT}   ${CPFLAGS}
	${CP} ${COMPONENTZM} ${DEBUGLIB}.o.${COMPONENTZM} ${CPFLAGS}
	${CP} ${LCOMPONENT}   ${DEBUGLIB}.o.${LCOMPONENT}   ${CPFLAGS}
	${CP} ${LCOMPONENTZM} ${DEBUGLIB}.o.${LCOMPONENTZM} ${CPFLAGS}
	${CP} VersionNum ${DEBUGLIB}.LibVersion ${CPFLAGS}


#
# Dynamic dependencies:
