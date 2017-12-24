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
