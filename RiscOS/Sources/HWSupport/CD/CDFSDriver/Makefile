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
