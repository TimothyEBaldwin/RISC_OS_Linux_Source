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
# Makefile for IICTest
#

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = cdir
AS      = aasm
CP      = copy
RM      = remove
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend -Stamp -quit -module -To $@ -From
CPFLAGS = ~cfr~v

#
# Program specific options:
#
COMPONENT = IICTest
SOURCE    = s.IICTest
TARGET    = rm.IICTest
EXPORTS   = ${EXP_HDR}.${COMPONENT}

#
# Generic rules:
#
rom: ${TARGET}
	@echo ${COMPONENT}: rom module built

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install_rom: ${TARGET}
	${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
	@echo ${COMPONENT}: rom module installed

clean:
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

resources:
#       ${MKDIR} ${RESDIR}.${COMPONENT}
#       ${CP} Resources.${LOCALE}.Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
#       @echo ${COMPONENT}: resource files copied

${TARGET}: ${SOURCE}
	${AS} ${ASFLAGS} ${SOURCE}

${EXP_HDR}.${COMPONENT}: hdr.${COMPONENT}
#       ${CP} hdr.${COMPONENT} $@ ${CPFLAGS}

# Dynamic dependencies:
