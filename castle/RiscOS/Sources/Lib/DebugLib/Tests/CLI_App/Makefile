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
