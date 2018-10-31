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
# Makefile for ToolAction module
#

COMPONENT     = ToolAction
OBJS          = main toolact utils
CMHGDEPENDS   = main
ROMCDEFINES   = -DROM
CINCLUDES     = -IOS:,C:tboxlibint,tbox:,C:
CUSTOMEXP     = custom
ROM_DEPEND    = h.ToolAction 
SA_DEPEND     = h.ToolAction 
LIBS          = ${TBOXINTLIB}

include CModule

clean::
        ${RM} h.ToolAction
        ${RM} hdr.ToolAction

export: h.ToolAction hdr.ToolAction o.ToolAction
        ${MKDIR} ${CEXPDIR}.h
        ${MKDIR} ${CEXPDIR}.o
        ${MKDIR} ${EXPDIR}.Interface2
        ${CP} h.ToolAction   ${CEXPDIR}.h.ToolAction ${CPFLAGS}
        ${CP} o.ToolAction   ${CEXPDIR}.o.ToolAction ${CPFLAGS}
        ${CP} hdr.ToolAction ${EXPDIR}.Interface2.ToolAction ${CPFLAGS}
        @echo ${COMPONENT}: header export complete

h.ToolAction: Documents.def.ToolAction
        ${DEFMOD} -h > h.ToolAction < Documents.def.ToolAction

hdr.ToolAction: Documents.def.ToolAction
        ${DEFMOD} -hdr > hdr.ToolAction < Documents.def.ToolAction

o.ToolAction: Documents.def.ToolAction
        ${MKDIR} o
        ${DEFMOD} -l -o DefMod < Documents.def.ToolAction
        ${AR} -c -o o.ToolAction -via viafile
        ${RM} viafile
        ${XWIPE} Defmod ${WFLAGS}

# Dynamic dependencies:
