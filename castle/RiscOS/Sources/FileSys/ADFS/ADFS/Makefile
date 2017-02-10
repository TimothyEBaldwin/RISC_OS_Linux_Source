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
# Makefile for ADFS
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 06-Jun-00  SNB          Recreated using makefile fragments

COMPONENT = ADFS

#
# Program specific options:
#
CHEADER1  = ${COMPONENT}
HEADER1   = ${COMPONENT}
HEADER2   = ADFSErr
HEADER3   = IDEDevice
ASMCHEADER1 = ADFSErr

EXPORTS   = hdr.ADFSErr ${C_EXP_HDR}.ADFSErr

TOKENSOURCE = s.TokenHelp
TOKHELPSRC = ${TOKENSOURCE}
HELPSRC    = HelpText
ROM_SOURCE = ADFS.s

ASFLAGS    = ${OPTIONS}

include StdTools
include AAsmModule

hdr.ADFSErr: o.ADFSErr
	${LD} -bin -o $@ o.ADFSErr
	SetType $@ Text

o.ADFSErr: s.ADFSErr
	${MKDIR} o
	${AS} -o $@ s.ADFSErr -I<Hdr$Dir>.Global,<Hdr$Dir>.Interface

#
# Generic rules:
#
clean::
        ${WIPE} o ${WFLAGS}
        ${RM} hdr.ADFSErr
        @@echo ${COMPONENT}: cleaned 

# Dynamic dependencies:
