# Copyright 2010 Castle Technology Ltd
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
# Makefile for Portable (HAL based)
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 09-Mar-01  SNB          Recreated
#

COMPONENT = Portable
HEADER1   = Portable
ROM_SOURCE = GetAll.s
HEADER2   = CPUClkDevice
HEADER3   = BMUDevice
ASMCHEADER1 = Portable
CHEADER1 = CPUClkDevice
EXPORTS = ${C_EXP_HDR}.${ASMCHEADER1} ${C_EXP_HDR}.${CHEADER1}

include StdTools
include AAsmModule

# Dynamic dependencies:
