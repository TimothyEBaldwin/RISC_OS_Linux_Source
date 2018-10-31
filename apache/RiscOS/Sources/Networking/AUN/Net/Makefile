# Copyright 1996 Acorn Computers Ltd
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
# Makefile for Net[I|E|G]
#

COMPONENT    = Net
VPATH        = gwroute
LIBS         = ${UNIXLIB} ${INETLIB} ${SOCK5LIB} ${ASMUTILS}
OBJS         = ${OBJ${TARGET}}
CINCLUDES    = -ITCPIPLibs:,C:
HDRS         =
CFLAGS       = -wp
ROMCDEFINES  = -DROM
RESFSDIR     = ${RESDIR}${SEP}Net
CMHGDEPENDS  = mns mnsg mnsi
ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

#
# Objects implicated in the various targets
#
OBJNET       = mns  mnscommon io   swis   configure netasm text inetfn debug route showrt
OBJNETI      = mnsi mnscommon io   swis   configure netasm text inetfn debug
OBJNETE      = mnsi mnscommon io_e swis_e configure netasm text inetfn debug
OBJNETG      = mnsg mnscommon io   swis   configure netasm text inetfn \
               showrt af if input output startup tables timer trace inet data

include CModule

#
# Custom rules
#
swis_e.o:
        ${CC} -DEDDS ${CFLAGS} -o $@ swis.c

io_e.o:
        ${CC} -DEDDS ${CFLAGS} -o $@ io.c

# Dynamic dependencies:
