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
# Makefile for Menu module
#

COMPONENT     = Menu
OBJS          = auxiliary create delete events getstate\
                hide main miscop show task
CMHGDEPENDS   = main
ROMCDEFINES   = -DROM
CDFLAGS       = -Ddebugging=1
CMHGDFLAGS    = -Ddebugging=1
CINCLUDES     = -IC:tboxlibint,tbox:,C:
HDRS          =
LIBS          = ${TBOXINTLIB}
DBG_LIBS      = ${TBOXINTDBGLIB}

include CModule

# Dynamic dependencies:
