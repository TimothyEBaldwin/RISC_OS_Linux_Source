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
