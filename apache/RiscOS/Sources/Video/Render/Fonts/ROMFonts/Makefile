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
# Makefile for ROMFonts
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 05-Oct-99  SNB          Added ability to build STB Baseline !Fonts application.
#                         Can build UK-only, UK & Japanese, or UK, Japanese & Chinese
#                         by passing in OPTIONS=J, OPTIONS=C or OPTIONS=CJ to the makefile.
#                         UK will build without any OPTIONS flag.
#

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CP      = copy
RM      = remove
LD      = link
WIPE    = x wipe
CHMOD   = Unix.chmod ${CHMODFLAGS}
CCFLAGS = -c -depend !Depend -IC:
ASFLAGS = -depend !Depend -Stamp -o $@
LDFLAGS = -bin -o $@
CPFLAGS = ~cfr~v
WFLAGS  = ~cfr~v
CHMODFLAGS = -R 0755

#
# Program specific options:
#
SOURCE    = s.ROMFonts
TARGET    = rm.${USERIF}.${COMPONENT}


#
# Generic rules:
#
rom: ${TARGET}
        @echo ${COMPONENT}: rom module built

export: 
        @echo ${COMPONENT}: export complete

install_rom: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${WIPE} o ${WFLAGS}
        ${WIPE} rm.${USERIF} ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        @echo ${COMPONENT}: no resources

# Binary Build Environment augmenting rules
BBETYPE   = local
bbe-local: bbe-generic
	${MKDIR} ${BBEDIR}.Config.DiscBuild
	BBE_Export_File Config.${USERIF}
	BBE_Export_File Config.DiscBuild.${USERIF}
	${MKDIR} ${BBEDIR}.Fonts
        @Set Alias$MFD ${MKDIR} ${BBEDIR}.Fonts.%0
	@Set Alias$CFF ${CP} Fonts.%0 ${BBEDIR}.Fonts.%0 ${CPFLAGS}
	Obey Config.${USERIF}
        @echo ${COMPONENT}: resource files copied

install_:
	Obey Config.DiscBuild.$(USERIF) UK

install_J:
	Obey Config.DiscBuild.$(USERIF) Japan
        @echo Japanese installed.

install_C:
	Obey Config.DiscBuild.$(USERIF) China
        @echo Chinese installed.

install_CJ: install_C install_J
        @echo Unicode installed.

install_JC: install_C install_J
        @echo Unicode installed.

install: install_$(OPTIONS) dirs aliases
        $(CP) LocalUserIFRes:!Boot $(INSTDIR).!Boot $(CPFLAGS)
        $(CP) LocalUserIFRes:CopyLocal $(INSTDIR).CopyLocal $(CPFLAGS)
        $(CHMOD) $(INSTDIR)
        @echo $(COMPONENT): installed to $(INSTDIR)

aliases: 
        @Set Alias$MFD $(MKDIR) $(INSTDIR).%0
	@Set Alias$CFF $(CP) Fonts.%0 $(INSTDIR).%0 $(CPFLAGS)

dirs:
	$(MKDIR) $(INSTDIR)
        
o.${USERIF}: ${SOURCE}
        ${MKDIR} o
        ${AS} ${ASFLAGS} ${SOURCE}

rm.${USERIF}.ROMFonts: o.${USERIF}
        ${MKDIR} rm.${USERIF}
        ${LD} ${LDFLAGS} o.${USERIF}
        SetType ${TARGET} &FFA

o.MaruGothic:
	ResGen Data o.MaruGothic -via via.MaruGothic
rm.MaruGothic: o.MaruGothic
	${LD} ${LDFLAGS} o.MaruGothic

# Dynamic dependencies:
