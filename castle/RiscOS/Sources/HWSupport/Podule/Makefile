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
# Makefile for Podule {Expansion cards}
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 28-Jun-94  AMcC         Added extra development rules.
# 30-Aug-94  AMcC         Added resources: target
# 16-Jan-96  JRH          Makes different targets for different machines
# 11-Jan-00  PMS          Converted to use objasm instead of aasm so that we
#                         can pass in assembly-time constants to control
#                         fake podule header for Customer F 5 Ethernet NC
#                         which doesn't have a podule ROM. Paul Skirrow.
# 13-Jan-00  PMS          Creates/deletes o dir, (ie don't keep o in cvs)
# 13-Jan-00  PMS          Passes Options from MakeFile to ObjAsm 
# 06-Jun-00  SNB          Recreated using makefile fragments

COMPONENT = Podule

#
# Program specific options:
#
HEADER1     = ${COMPONENT}
ASMCHEADER1 = ${COMPONENT}
EXPORTS     = ${C_EXP_HDR}.${ASMCHEADER1}

TOKHELPSRC  = ${TOKENSOURCE}
HELPSRC     = HelpTexts
ROM_SOURCE  = GetAll.s

ASFLAGS     = ${OPTIONS}

include StdTools
include AAsmModule

# Dynamic dependencies:
