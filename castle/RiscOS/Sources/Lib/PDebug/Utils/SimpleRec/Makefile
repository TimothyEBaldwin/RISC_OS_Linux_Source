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
# Simple Makefile for a CLI app

CC 		= cc
LD 		= Link
ASM 		= ObjAsm
CMHG 		= CMHG
LB 		= LibFile
RM 		= Remove
WIPE 		= -Wipe
MKDIR 		= cdir

LIBDIR 		= <Lib$Dir>
CFLAGS 		= -c -depend !Depend -IC: -fah ${THROWBACK}
CPPFLAGS 	= -c -depend !Depend -IC: ${THROWBACK}
LDFLAGS		= -aif -c++
ASMFLAGS 	= -NoCache -depend !Depend ${THROWBACK}
CMHGFLAGS 	= -depend !Depend ${THROWBACK} -IC:
WIPEFLAGS 	= ~C~V

DESK 		= ${LIBDIR}.Desk.o.Desk

TARGET 		= SimpleRec

OBJS = \
 o.main \

LIBS = \
 C:o.stubs \
 ${DESK} \

.SUFFIXES:	.o .c
.c.o:;		${CC} ${CFLAGS} -o $@ $<

all:    ${TARGET}

clean:
	${RM}		${TARGET}
	${WIPE}	o	${WIPEFLAGS}


o.dirs:
	${MKDIR} o
	create o.dirs
	stamp  o.dirs

${TARGET}: ${OBJS} ${LIBS} o.dirs
	${LD} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}

# Dynamic dependencies:
