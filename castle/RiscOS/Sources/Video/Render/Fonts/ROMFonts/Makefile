# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
