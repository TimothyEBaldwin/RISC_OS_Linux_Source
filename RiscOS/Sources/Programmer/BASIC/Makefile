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

COMPONENT    ?= BASIC105
VFPASM       ?= TRUE
RESDIR       ?= _!_x_!_
RESFSDIR      = ${RESDIR}.BASIC

ifeq ($(VFPASM),TRUE)
ASFLAGS       = -PD "VFPAssembler SETL {TRUE}"
SA_DEPEND     = VFPData
INSTRES_FILES = VFPData
INSTRES_DEPENDS = VFPData

s.VFPData: VFPLib.VFPLib VFPLib.GenData
	BASIC { < VFPLib.GenData }

VFPData: s.VFPData hdr.VFPMacros
	${MKDIR} o
	${AS} ${ASFLAGS} -PD "BuildingVFPData SETL {TRUE}" -o o.VFPData s.VFPData
	${LD} -BIN -o $@ o.VFPData

clean::
	${RM} s.VFPData
	${RM} VFPData
endif

include StdTools
include AAsmModule

ifeq ($(COMPONENT),BASICVFP)
AS            = ObjAsmVFP
endif

# Dynamic dependencies:
