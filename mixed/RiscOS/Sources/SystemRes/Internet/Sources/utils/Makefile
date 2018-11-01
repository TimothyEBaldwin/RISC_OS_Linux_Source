# Copyright 1998 Acorn Computers Ltd
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
# Makefile
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 08-Oct-96  KJB    Created
#

COMPONENT = !Internet

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
SQUEEZE = squeeze
WIPE    = x wipe

AFLAGS  = ${THROWBACK} -depend !Depend -stamp -quit
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v


FILES=utl.CheckMem utl.ReadCMOSIP utl.RMFind utl.TriggerCBs utl.X

#
# Rule patterns
#
.SUFFIXES:  .o .s
.s.o:;      ${AS} ${AFLAGS} -o $@ $<

#
# Main rules:
#
# Utilities
#
all: ${FILES}
        @echo ${COMPONENT}: Utilties built (Disc)

clean:
        IfThere o.* Then ${WIPE} o.* ${WFLAGS}
        IfThere utl.* Then ${WIPE} utl.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

#
# Static dependencies:
#

utl.CheckMem: o.CheckMem
	${LD} -bin -o $@ $?
	SetType $@ &FFC


utl.X: o.X
	${LD} -bin -o $@ $?
	SetType $@ &FFC


utl.TriggerCBs: o.TriggerCBs
	${LD} -bin -o $@ $?
	SetType $@ &FFC


utl.RMFind: o.RMFind
	${LD} -bin -o $@ $?
	SetType $@ &FFC


utl.ReadCMOSIP: o.ReadCMOSIP
	${LD} -bin -o $@ $?
	SetType $@ &FFC


#---------------------------------------------------------------------------
# Dynamic dependencies:
