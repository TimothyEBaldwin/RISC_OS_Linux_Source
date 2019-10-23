#
# Copyright (c) 2015, Timothy Baldwin
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


COMPONENT    = IXSupport
OBJS = main fs app_patch errors
RESOURCES   = no
CUSTOMROM=custom
CUSTOMEXP=no
CUSTOMRES=no

CMHGDEPENDS = main fs app_patch

include StdTools
include CModule

${DIRS} ::
	${MKDIR} h

mkerrors: c.mkerrors
	%cc -depend !Depend -I<Lib$Dir>.Linux -ITCPIPLibs: -memaccess -L22-S22-L41 c.mkerrors -o mkerrors

s.errors: mkerrors
	Run mkerrors > s.errors

o.errors: s.errors
	${AS} ${ASFLAGS} -o $@ s.errors

rom: ${ROM_OBJS_} ${DIRS}
	@${ECHO} ${COMPONENT}: rom module built

rom_link: ${ROM_OBJS_} ${ROM_LIBS} ${ROMCSTUBS} ${FORCEROMLINK} ${DIRS} ${ROM_DEPEND}
	${AS} ${ASFLAGS} -pd "base * ${ADDRESS}" -o o.stubs s.stubs
	${LD} ${LDFLAGS} ${LDLINKFLAGS} -o ${LINKDIR}.${TARGET} -rmf -base ${ADDRESS} ${ROM_OBJS_} o.stubs <Lib$Dir>.Linux.o.HALSyms ${ROM_LIBS} ${ROMCSTUBS} ${ABSSYM} -Symbols ${LINKDIR}.${TARGET}_sym

clean::
	${RM} s.errors
	${RM} mkerrors
