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
# Makefile for TextGadgets module
#

COMPONENT     = Gadgets
TARGET       ?= TextGadget
OBJS          = glib glib3 main MemMan riscos_uti Scrollbar\
                ScrollList Sizes TextArea TextMan Font riscos_gra\
                TAsel_ven Utils
CMHGDEPENDS   = main
ROMCDEFINES   = -DROM
CINCLUDES     = -IC:tboxlibint,tbox:,C:
LIBS          = ${TBOXINTLIB} ${WIMPLIB}

include CModule

# Dynamic dependencies:
