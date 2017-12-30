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
