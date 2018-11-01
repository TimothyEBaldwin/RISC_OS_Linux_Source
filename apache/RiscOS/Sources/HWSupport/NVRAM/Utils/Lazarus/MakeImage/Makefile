# Copyright 2000 Pace Micro Technology plc
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
# Makefile for EEProm
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# When		Who	What
# ----		---	----
# 01 Aug 2000	JRF	Created

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe
CD      = dir
DEFMOD  = DefMod
AR      = LibFile
STRIP   = -StripDepnd
ZIP     = zip

ASFLAGS = -depend !Depend -Stamp -quit -module
CCFLAGS = -c ${THROWBACK} -depend !Depend ${INCLUDES} ${OPTS}
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v
INCLUDES= -IC:

#
# Libraries
#
CLIB       = CLIB:o.stubs


#
# Rule patterns
#
.c.o:;      ${CC} ${CCFLAGS} -o $@ $<

#
# Program specific options:
#
COMPONENT = EEPROM
TARGET    = EEPROM
EXPORTS   = 
OBJS      = o.main


#
# Generic rules:
#
all: ${TARGET}
        @echo ${COMPONENT}: all complete

export: export.ExampOut
        ${MKDIR} export
        ${CP} c.Main               export.Main/c     ${CPFLAGS}
        ${CP} Resources.ExampInput export.ExampInput ${CPFLAGS}
        ${CP} Resources.ReadMe     export.ReadMe     ${CPFLAGS}
        ${ZIP} -r example/zip export.*
        @echo ${COMPONENT}: export complete

export.ExampOut: ${TARGET}
        ${MKDIR} export
        /${TARGET} Resources.ExampInput $@ > stdout
        settype $@ Text

clean:
        ${WIPE} ${TARGET} ${WFLAGS}
        ${WIPE} o.* ${WFLAGS}
        ${WIPE} export ${WFLAGS}
        ${WIPE} stdout ${WFLAGS}
        ${WIPE} example/zip ${WFLAGS}
        @echo Stripping dependencies from makefile...
        ${STRIP}
        @echo ${COMPONENT}: cleaned

resources:
        TokenCheck LocalRes:Messages
        ${MKDIR} ${RESDIR}.${COMPONENT}
        ${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

# Executable for exporting the description
#
${TARGET}: ${OBJS} ${CLIB}
        ${LD} -o $@ -aif ${OBJS} ${CLIB}


# Dynamic dependencies:
