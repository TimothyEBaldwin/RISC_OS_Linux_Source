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
RES_OBJ      =
CUSTOMRES    = custom
RAMCDEFINES += -DSTANDALONE=1

ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
SA_OBJS      = ${OBJS} msgs
else
SA_OBJS      = ${OBJS} msgscmd
endif

include CModule

#
# Resources need both the messages and the 'Repeat' binary
#
resources: resources-${CMDHELP} aif.Repeat
	${CP} aif.Repeat ${RESFSDIR}.Repeat ${CPFLAGS}
	@${ECHO} ${COMPONENT}: resources copied to Messages module

#
# Static dependencies
#
o.msgscmd: ${DIRS} LocalRes:Messages LocalRes:CmdHelp aif.Repeat
	   ${MKDIR} ${MERGEDMDIR}
	   FAppend ${MERGEDMSGS} LocalRes:Messages LocalRes:CmdHelp
	   ${RESGEN} files_messages $@ ${MERGEDMSGS}     Resources.${TARGET}.Messages \
                                       aif.Repeat        Resources.${TARGET}.Repeat

o.msgs:    ${DIRS} LocalRes:Messages aif.Repeat
	   ${RESGEN} files_messages $@ LocalRes:Messages Resources.${TARGET}.Messages \
                                       aif.Repeat        Resources.${TARGET}.Repeat

aif.Repeat: ${DIRS} repeatcmd.c
	${CC} ${CINCLUDES} -o $@ repeatcmd.c ${CLIB} ${OSLIB}

# Dynamic dependencies:
