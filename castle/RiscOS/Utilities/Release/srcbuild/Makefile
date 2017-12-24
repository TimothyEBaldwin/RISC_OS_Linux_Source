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
# Makefile for srcbuild
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date        Name         Description
# ----        ----         -----------
# 19 Aug 1997 RWB          new srcbuild
# 05 Sep 1997 RWB          added install
# 30 Apr 1999 DSC          Made to install into new library structure.
# 09 Sep 1999 JPB          Added rules to auto create and clean "o"
#                          directory
#

#
# Generic options:
#
CINCLUDES = -IC:CLX -IC:
CDEFINES  = -DRISCOS
CFLAGS    = -Wc

include HostTools

#
# Libraries
#
include AppLibs

# Program specific options:
#
COMPONENT = srcbuild
TARGET    = ${COMPONENT}

OBJS =\
 srcbuild.o\
 riscos.o\
 build.o\
 parse.o

LIBS = ${CLXLIB} ${CLIB}

DIRS      =o._dirs

#
# Rule patterns
#
include Makefiles:StdRules

#
# Build
#
all: ${TARGET}
        @echo ${COMPONENT}: all complete

clean:
        ${XWIPE} o ${WFLAGS}
        ${XWIPE} ${TARGET} ${WFLAGS}
        @echo ${COMPONENT}: cleaned

install: ${TARGET}
	${MKDIR} ${INSTDIR}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: installed

${DIRS}:
        ${MKDIR} o
        ${TOUCH} $@

#
# Target
#
${TARGET}: ${OBJS} ${DIRS}
        ${LD} -o $@ ${OBJS} ${LIBS}
        ${CHMOD} a+rx $@

#
include Depends
