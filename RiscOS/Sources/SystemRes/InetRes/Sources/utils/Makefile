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
# Makefile for !Internet utilities
#

COMPONENT = InetResUtils
CUSTOMROM = custom
CUSTOMSA  = custom
CUSTOMDBG = custom

include StdRules
include AAsmModule

clean::
	${RM} CheckMem
	${RM} ReadCMOSIP
	${RM} RMFind
	${RM} TriggerCBs

#
# Static dependencies:
#

standalone: CheckMem ReadCMOSIP RMFind TriggerCBs ${DIRS}
	@${ECHO} ${COMPONENT}: utilities built

CheckMem: CheckMem.o
	${LDBIN} $@ $?
	${SETTYPE} $@ &FFC

TriggerCBs: TriggerCBs.o
	${LDBIN} $@ $?
	${SETTYPE} $@ &FFC

ReadCMOSIP: ReadCMOSIP.o
	${LDBIN} $@ $?
	${SETTYPE} $@ &FFC

RMFind: RMFind.o
	${LDBIN} $@ $?
	${SETTYPE} $@ &FFC

# Dynamic dependencies:
