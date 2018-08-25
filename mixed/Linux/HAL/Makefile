#
# Copyright (c) 2013, Timothy Baldwin
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

COMPONENT = HAL_Linux
TARGET = HAL_Linux
OBJS = o.Top o.Main o.PVOps o.Tests

include Makefiles:StdTools
include Makefiles:StdRules

CFLAGS = -depend !Depend -c -Wpn -APCS 3/32bit/nofp/noswst -DADDRESS=${ADDRESS} -DHALSIZE=(${HALSize:K=}*1024)
ASFLAGS += -APCS 3/nofp/noswst -pd "ADDRESS * ${ADDRESS}"

o._dirs:
	${MKDIR} o
	${TOUCH} $@

HAL_Linux: ${OBJS} HALSyms o._dirs
	${MKDIR} <Lib$Dir>.Linux.o
	${MKDIR} <Lib$Dir>.Linux.s
	${CP} HALSyms <Lib$Dir>.Linux.o.HALSyms F~C~N~V
	${LD} -FIRST Top(HEAD) -o HAL_Linux -bin -base ${ADDRESS} -Symdefs <Lib$Dir>.Linux.o.HALSyms -Symbols HAL_Linux_sym ${OBJS}
	BASIC -quit Fix_Program_Header
	@${ECHO} Linux HAL built

rom: HAL_Linux
export: export_${PHASE}
export_libs: HAL_Linux
	|

export_hdrs:
	echo No Headers

resources: ;


install_rom: HAL_Linux
	${CP} HAL_Linux ${INSTDIR}.${TARGET} ${CPFLAGS}

h.version:
	Create h.version 0
	SetType h.version FFF

o.Main: h.version

clean::
	${XWIPE} o ${WFLAGS}
	${RM} h.version
	${RM} HAL_Linux
	${RM} HAL_Linux/rw
	${RM} HAL_Linux_sym
