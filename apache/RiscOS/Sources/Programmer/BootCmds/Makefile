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
# Makefile for BootCommands
#

COMPONENT    = BootCmds
CMHGFILE     = header
CINCLUDES   += -IOS:,<Lib$Dir>.ConfigLib.
CDEFINES    += -DTRACE=0
OBJS         = main
LIBS        += ${OSLIB} ${CONLIB}
HDRS         =
RES_AREA     = files_messages
RAMCDEFINES += -DSTANDALONE=1
INSTRES_FILES   = aif.Repeat
INSTRES_DEPENDS = aif.Repeat

ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

include CModule

#
# Static dependencies
#
aif.Repeat: ${DIRS} repeatcmd.c
        ${CC} ${CINCLUDES} -o $@ repeatcmd.c ${CLIB} ${OSLIB}

# Dynamic dependencies:
