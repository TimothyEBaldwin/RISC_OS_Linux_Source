# Copyright 1999 Pace Micro Technology plc
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
# Makefile for DDEUtils
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 22-Nov-99  SNB          Created.
#

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CP      = copy
RM      = remove
WIPE    = x wipe
LD      = link
CCFLAGS = -c -depend !Depend -IC: ${THROWBACK}
ASFLAGS = -depend !Depend -Stamp -quit ${THROWBACK} -o $@
LDFLAGS = -rmf
CPFLAGS = ~cfr~v
WFLAGS  = fr~c~v

#
# Program specific options:
#
COMPONENT = DDEUtils
SOURCE    = s.DDEUtils
TARGET    = rm.DDEUtils
EXPORTS   = ${EXP_HDR}.DDEUtils
DDEUtils  = rm.DDEUtils

OBJS      = DDEUtils.o
DIRS      = o._dirs

.s.o:;  ${AS} ${ASFLAGS} $<

#
# Generic rules:
#
rom: $(TARGET)
	@echo ${COMPONENT}: rom module built

ram: $(TARGET)
	@echo ${COMPONENT}: ram module built

all: rom

export: ${EXPORTS}
	@echo ${COMPONENT}: export complete

install_rom: $(TARGET)
	$(CP) $(TARGET) $(INSTDIR).$(COMPONENT) $(CPFLAGS)
	@echo ${COMPONENT}: rom module installed

install: ${TARGET}
	${MKDIR} ${INSTDIR}
	${CP} ${DDEUTILS} ${INSTDIR}.* ${CPFLAGS}
	@echo ${COMPONENT}: disc build module installed

clean:
	$(RM) $(TARGET)
	${WIPE} o ${WFLAGS}
	${WIPE} rm ${WFLAGS}
	@echo ${COMPONENT}: cleaned

${DIRS}:
	${MKDIR} o
	create $@

$(TARGET): $(OBJS) $(DIRS)
	${MKDIR} rm
	${LD} ${LDFLAGS} -o $@ ${OBJS}
	
${EXP_HDR}.DDEUtils: hdr.DDEUtils
	${CP} hdr.DDEUtils $@ ${CPFLAGS}

# Dynamic dependencies:
