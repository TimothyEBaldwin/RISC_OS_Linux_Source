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
