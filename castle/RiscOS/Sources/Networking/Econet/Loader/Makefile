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
# Makefile for Econet Loader
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 28-Jun-94  AMcC         Created.
#

#
# Generic options:
#
MKDIR    = cdir
AS       = aasm
CP       = copy
RM       = remove
TOKENISE = tokenise

AFLAGS   = -depend !Depend -stamp -closeexec -quit
CPFLAGS  = ~cfr~v

TOKENS   = Hdr:Tokens

#
# Program specific options:
#
COMPONENT = EconetLoader
IMAGE     = rom.Econet
LOADER    = rm.Loader

#
# Create a podule ROM image file: type 'amu' from a Task window
#
podule: ${IMAGE}
        @echo ${COMPONENT}: podule rom built

${IMAGE}: ${MSGSMOD} ${LOADER} ${TARGET}
         IncSerial
         RunJoiner

clean:
        ${RM} ${IMAGE}
        ${RM} ${LOADER}
        @echo ${COMPONENT}: cleaned

#
# Assemble the Econet podule loader (AsmLoader)
#
${LOADER}: s.Loader
        ${AS} s.Loader $@ ${AFLAGS}

#---------------------------------------------------------------------------
# Dynamic dependencies:
rm.Loader: Hdr:ListOpts
rm.Loader: Hdr:Macros
rm.Loader: Hdr:System
rm.Loader: Hdr:SWIs
rm.Loader: Hdr:CPU.Generic26
rm.Loader: Hdr:IO.GenericIO
rm.Loader: Hdr:RISCOS
rm.Loader: Hdr:ModHand
rm.Loader: Hdr:FSNumbers
rm.Loader: Hdr:NewErrors
rm.Loader: Hdr:Podule
rm.Loader: Version
