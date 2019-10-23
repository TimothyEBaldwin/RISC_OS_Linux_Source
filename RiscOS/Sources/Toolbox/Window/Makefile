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
# Makefile for Window module
#

COMPONENT     = Window
OBJS          = actbut adjuster button display draggable label labelbox\
                numrange optbut popupmenu radiobut simple slider\
                stringset writable\
                create delete events gadgets getstate globals hide\
                main miscop show slider_ven task toolbar toolbox utils
VPATH         = gadgets                
CMHGDEPENDS   = main
ROMCDEFINES   = -DROM
CDEFINES      = -D${SYSTEM} ${STYLE}
CDFLAGS       = -Ddebugging=1
CMHGDFLAGS    = -Ddebugging=1
CINCLUDES     = -IC:tboxlibint,tbox:,C:
HDRS          =
LIBS          = ${TBOXINTLIB} ${WIMPLIB}
DBG_LIBS      = ${TBOXINTDBGLIB}

include CModule

# Dynamic dependencies:
