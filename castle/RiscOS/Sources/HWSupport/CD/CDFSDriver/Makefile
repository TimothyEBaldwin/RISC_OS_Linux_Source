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
# Makefile for CDFS Driver
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 25-May-94  AMcC   Created.
# 23-Feb-95  AMcC   Resources now copied to CDFSRes
# 29-Nov-95  RWB    Added install: option
# 05-Nov-02  BJGA   Now uses shared makefiles

COMPONENT  = CDFSDriver
HEADER1    = CDROM
HEADER2    = CDErrors
ASMCHEADER1 = CDErrors
EXPORTS    = ${C_EXP_HDR}.${ASMCHEADER1}
RESFSDIR   = ${RESDIR}.CDFSDriver.${TARGET}
ROM_SOURCE = Main.s

include StdTools
include AAsmModule

# Dynamic dependencies:
