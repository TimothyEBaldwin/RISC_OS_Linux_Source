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

COMPONENT   ?= BASIC105
VFPASM      ?= TRUE
ifeq ($(VFPASM),TRUE)
RESOURCES    = -private
else
RESOURCES    = no
endif
RESFSDIR     = ${RESDIR}.BASIC

include StdTools
include AAsmModule

ifeq ($(VFPASM),TRUE)
${ROM_OBJECT} ${SA_OBJECT} ${DBG_OBJECT}: s.VFPData
ASFLAGS += -PD "VFPAssembler SETL {TRUE}"

resources: o.VFPData
	${MKDIR} ${RESFSDIR}
	${LD} -BIN -Output ${RESFSDIR}.VFPData o.VFPData
endif

s.VFPData: VFPLib.VFPLib VFPLib.GenData
	BASIC { < VFPLib.GenData }

o.VFPData: s.VFPData
	${MKDIR} o
	${AS} ${ASFLAGS} -PD "standaloneVFPData SETL {TRUE}" -PD "standalone SETL {TRUE}" -o $@ s.VFPData 

clean::
	${RM} s.VFPData

# Dynamic dependencies:
