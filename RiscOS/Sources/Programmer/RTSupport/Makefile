# Copyright 2005 Castle Technology Ltd
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
# Makefile for RTSupport
#

DEBUG ?= FALSE

COMPONENT   = Real Time Support
TARGET      = RTSupport
OBJS        = debug global mess scheduler module
RES_AREA    = resmess_ResourcesFiles
CMHGDEPENDS = module
CMHGAUTOHDR = ${TARGET}
CMHGFILE_SWIPREFIX = RT
HDRS        =
ASMHDRS     = ${TARGET}
ASMCHDRS    = ${TARGET}
ROMCDEFINES = -DROM_MODULE
INSTRES_FILES = Priorities

ifeq ($(DEBUG),TRUE)
CFLAGS += -DDEBUGLIB
ASFLAGS += -PD "DEBUGLIB SETL {TRUE}"
LIBS = ${DEBUGLIBS} ${NET5LIBS}
endif

include CModule

CFLAGS     += -We
CDFLAGS    += -DDEBUGLIB

# Dynamic dependencies:
