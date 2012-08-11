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
# Makefile for Desktop
#

COMPONENT     = Desktop
RESOURCEEXTRA = resources_banner resources_templates

#
# Resource specials
# In ROM
#   This component has messages, a template, and squashed sprites
#   which are copied in the 'resources' phase
# In RAM
#   The 'install' rule produces a RAM loading standalone module
# On disc
#   If the target is the ThemeDefs application, the 'install' rule is
#   overridden to just install the various banner themes
#
resources_banner: LocalRes:<UserIF>.Sprites
	${SQUASH} LocalRes:<UserIF>.Sprites ${RESFSDIR}.Sprites

ifeq (${TARGET},ThemeDefs)
CUSTOMSA = custom
install: 
	${MKDIR} ${INSTDIR}.${USERIF}
	${CP} LocalRes:${USERIF}.Sprites ${INSTDIR}.${USERIF}.Banner ${CPFLAGS}
	@${ECHO} ${COMPONENT}: disc theme resources installed
endif

include StdTools
include AAsmModule

# Dynamic dependencies:
