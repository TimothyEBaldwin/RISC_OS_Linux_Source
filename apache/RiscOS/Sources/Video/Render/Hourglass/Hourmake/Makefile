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
# Makefile for hourmake
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 23-Apr-98  RML    Created

#
# Program specific options:
#
COMPONENT  = hourmake

#
# Generic options:
#
MKDIR   = cdir
CC      = cc
LD      = link
CP      = copy
RM      = remove
SQUISH  = squish
WIPE    = x wipe

AFLAGS  = ${THROWBACK} -depend !Depend -nocache -stamp -quit -module
CFLAGS  = ${THROWBACK} -depend !Depend -ffa ${INCLUDES} 
CPFLAGS = ~cfr~v
SQFLAGS = -nolist
WFLAGS  = ~c~v

#
# Libraries
#
CLIB       = CLib:o.stubs

#
# Include files
#
INCLUDES = -IC:

FILES =\
 obj.hourmake

OBJS =\
  o.hourmake

#
# Rule patterns
#
.SUFFIXES: .o

.c.o:; @echo
       @echo Compiling $<
       @${CC} ${CFLAGS} ${DFLAGS}        -c -o $@ $<
 
#
# Main rules:
#

all:     ${FILES}
         @echo ${COMPONENT}: Application made.

clean:
        ${WIPE} o.*          ${WFLAGS}
        ${RM}   obj.hourmake
        @echo ${COMPONENT}: cleaned

#
# Static dependencies:
#

obj.hourmake: ${OBJS} ${CLIB}
       ${LD} -o $@ ${CLIB} ${OBJS}

#---------------------------------------------------------------------------
# Dynamic dependencies:
