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
# Makefile for BASIC
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 11-May-01  SNB    Recreated.

COMPONENT   ?= BASIC105
RESOURCES    = no
VFPASM      ?= TRUE
CLEAN_DEPEND = vfpclean

include StdTools
include AAsmModule

ifeq ($(VFPASM),TRUE)
o.${MACHINE}.${COMPONENT}: s.VFPData
ASFLAGS += -PD "VFPAssembler SETL {TRUE}"
endif

s.VFPData: VFPLib.VFPLib VFPLib.GenData
	VFPLib.GenData

vfpclean::
	${RM} s.VFPData

# Dynamic dependencies:
