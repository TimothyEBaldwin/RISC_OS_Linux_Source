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
# Makefile for a Toolbox Object module
#
# $Id$
#
# Component specific options:
#
RAMMESSAGES = o.msgs

COMMON_OBJ = o.modhdr o.toolact o.utils

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMMESSAGES} ${COMMON_OBJ}

DBG_OBJS = od.main ${RAMMESSAGES} o.modhdr od.toolact od.utils

CINCLUDES = -IOS:
RAM_DEPEND = h.ToolAction h.modhdr
ROM_DEPEND = h.ToolAction h.modhdr

#
# Get main rules
#
include C:tboxlibint.TboxMake

#
# Module specific rules:
#
resources: resources-messages
	@echo ${COMPONENT}: resource files copied to Messages module

clean: toolbox-clean
	${RM} h.ToolAction
	${RM} h.modhdr
	${RM} hdr.ToolAction
	${RM} o.ToolAction
	@echo ${COMPONENT}: cleaned

export: h.ToolAction hdr.ToolAction o.ToolAction
	${MKDIR} <cexport$dir>.h
	${MKDIR} <cexport$dir>.o
	${MKDIR} <export$dir>.Interface2
	${CP} h.ToolAction   <cexport$dir>.h.ToolAction ${CPFLAGS}
	${CP} o.ToolAction   <cexport$dir>.o.ToolAction ${CPFLAGS}
	${CP} hdr.ToolAction <export$dir>.ToolAction    ${CPFLAGS}
	@echo ${COMPONENT}: export complete

h.ToolAction: Documents.def.ToolAction
	${DEFMOD} -h > h.ToolAction < Documents.def.ToolAction

hdr.ToolAction: Documents.def.ToolAction
	${DEFMOD} -hdr > hdr.ToolAction < Documents.def.ToolAction

o.ToolAction: Documents.def.ToolAction
	${DEFMOD} -l -o DefMod < Documents.def.ToolAction
	${AR} -c -o o.ToolAction -via viafile
	${RM} viafile
	${WIPE} Defmod ${WFLAGS}

#---------------------------------------------------------------------------
# Dynamic dependencies:
