#
# Copyright (c) 2013, Timothy Baldwin
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of RISC OS Open Ltd nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

COMPONENT = HAL_Linux
TARGET = HAL_Linux
OBJS = o.Top o.Main o.PVOps o.Tests

include Makefiles:StdTools
include Makefiles:StdRules

CFLAGS = -depend !Depend -c -Wpn -APCS 3/32bit/nofp/noswst -DADDRESS=${ADDRESS} -DHALSIZE=(${HALSize:K=}*1024)
ASFLAGS += -APCS 3/nofp/noswst -pd "ro_size * ${ADDRESS_RW} - ${ADDRESS}"

o._dirs:
	${MKDIR} o
	${TOUCH} $@

HAL_Linux: ${OBJS} HALSyms o._dirs
	${MKDIR} <Lib$Dir>.Linux.o
	${MKDIR} <Lib$Dir>.Linux.s
	${CP} HALSyms <Lib$Dir>.Linux.o.HALSyms F~C~N~V
	${LD} -FIRST Top(HEAD) -o HAL_Linux -bin -split -base ${ADDRESS} -RW-Base ${ADDRESS_RW} -Symdefs <Lib$Dir>.Linux.o.HALSyms -Symbols HAL_Linux_sym ${OBJS}
	BASIC -quit Merge
	${SED} -n -e 's/\(0x........\) \(A\|D\) \(.*\)/\3 * \1/p' < <Lib$Dir>.Linux.o.HALSyms > <Hdr$Dir>.Global.CPU.PVSyms
	echo <32>END { >> <Hdr$Dir>.Global.CPU.PVSyms }
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
