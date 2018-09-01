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
# Makefile for Task Manager
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 18-Oct-94  AMcC         Templates copied to Resources as 'Templates' not 'Template3D'
#

COMPONENT = TaskManager
TARGET    = Switcher
HEADER1  = ${TARGET}

CMDHELP := special

include StdTools
include AAsmModule

resources-special:
	${MKDIR} ${RESFSDIR}
	Set SwitcherRes$Path LocalUserIFRes:,LocalRes:
	${CP} SwitcherRes:Messages  ${RESFSDIR}.Messages ${CPFLAGS}
	${CP} SwitcherRes:Templates ${RESFSDIR}.Templates ${CPFLAGS}
	Unset SwitcherRes$Path
	@echo ${COMPONENT}: resource files copied


# Dynamic dependencies:
