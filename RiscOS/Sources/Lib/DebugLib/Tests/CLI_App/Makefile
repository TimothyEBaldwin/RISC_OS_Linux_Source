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
CC 		= ${MemChecKCC} cc
LD 		= Link
ASM 		= ObjAsm
CMHG	 	= CMHG
LB  		= LibFile
RM  		= Remove
WIPE 		= -Wipe
MKDIR 		= cdir
STRIP		= stripdepnd

LIBDIR 		= <Lib$Dir>
CFLAGS 		= -c -depend !Depend -IC: -fah ${THROWBACK}
CPPFLAGS 	= -c -depend !Depend -IC: ${THROWBACK}
LDFLAGS		= -aif -c++
ASMFLAGS 	= -NoCache -depend !Depend
CMHGFLAGS 	= -depend !Depend ${THROWBACK}
WIPEFLAGS 	= ~CFR~V

DEBUGLIB 	= ${LIBDIR}.Debuglib.o.debuglib
MEMCHECKLIB	= MemCheck:o.MC

DFLAGS 		= -DDEBUGLIB

DIRS		= o._dirs

TARGET 		= CLI_App
TARGETMC	= CLI_AppMC

OBJS =\
 o.main\

OBJSMC =\
 oMC.main\

LIBS =\
 C:o.stubs\
 ${DEBUGLIB}\
 TCPIPLibs:o.socklib5\
 TCPIPLibs:o.inetlib\

LIBSMC =\
 C:o.stubs\
 ${DEBUGLIB}MCD\
 TCPIPLibs:o.socklib5\
 TCPIPLibs:o.inetlib\
 ${MEMCHECKLIB}\

.SUFFIXES:	.o .oMC .c
.c.o:;		${CC} ${CFLAGS} ${DFLAGS} -o $@ $<
.c.oMC:;	${CC} ${CFLAGS} ${DFLAGS} -fn -o $@ $<

all:    ${TARGET}

memcheck:	${TARGETMC}

clean:
	${RM}		${TARGET}
	${RM}		${TARGETMC}
	${WIPE}	o	${WIPEFLAGS}
	${WIPE} oMC	${WIPEFLAGS}
	${STRIP}

${DIRS}:
	${MKDIR} o
	${MKDIR} oMC
	create ${DIRS}
	stamp  ${DIRS}

${TARGET}: ${OBJS} ${LIBS} ${DIRS}
	${LD} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}

${TARGETMC}: ${OBJSMC} ${LIBSMC} ${DIRS}
	${LD} ${LDFLAGS} -o $@ ${OBJSMC} ${LIBSMC}

# Dynamic dependencies:
