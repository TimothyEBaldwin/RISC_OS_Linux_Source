#
# Copyright (c) 2015, Timothy Baldwin
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


COMPONENT    = IXSupport
OBJS = main fs app_patch
RESOURCES   = no
CUSTOMROM=custom
CUSTOMEXP=no
CUSTOMRES=no

CMHGDEPENDS = main fs app_patch

include StdTools
include CModule

${DIRS} ::
	${MKDIR} h

CFLAGS += -Wpn -I<Lib$Dir>.Linux

rom: ${ROM_OBJS_} ${DIRS}
	@${ECHO} ${COMPONENT}: rom module built

rom_link: ${ROM_OBJS_} ${ROM_LIBS} ${ROMCSTUBS} ${FORCEROMLINK} ${DIRS} ${ROM_DEPEND}
	${AS} ${ASFLAGS} -pd "base * ${ADDRESS}" -o o.stubs s.stubs
	${LD} ${LDFLAGS} ${LDLINKFLAGS} -o ${LINKDIR}.${TARGET} -rmf -base ${ADDRESS} ${ROM_OBJS_} o.stubs <Lib$Dir>.Linux.o.HALSyms ${ROM_LIBS} ${ROMCSTUBS} ${ABSSYM} -Symbols ${LINKDIR}.${TARGET}_sym



include Depends
