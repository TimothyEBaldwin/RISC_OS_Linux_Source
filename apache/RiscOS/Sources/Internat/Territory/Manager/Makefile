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
# Makefile for Territory Manager
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 21-Nov-00  SBF          Added StripDepnd support.
# 26-Feb-01  SBF          StripDepnd support moved to MkClean
#

COMPONENT  = TerritoryManager
TARGET     = TerrMgr
HEADER1    = Territory
SPRITEFILE = z.SystemDisc

ASFLAGS    = -PD "SpriteDisc SETS \"${SPRITEFILE}\""

include StdTools
include AAsmModule

${SA_OBJECT} ${DBG_OBJECT} ${ROM_OBJECT}: ${SPRITEFILE}

${SPRITEFILE}: SystemDisc
	${SQUASH} SystemDisc $@

clean ::
	${RM} ${SPRITEFILE}


# Dynamic dependencies:
