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

include StdTools

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
# Dynamic dependencies:
