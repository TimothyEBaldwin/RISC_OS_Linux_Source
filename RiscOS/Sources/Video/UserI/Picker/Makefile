# Copyright 1999 Pace Micro Technology plc
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
# Makefile for ColourPicker
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 23-Nov-99  SNB          Created

COMPONENT     ?= ColourPicker
TARGET        ?= Picker
HDRS          =
ASMHDRS       = ColourPick
INSTRES_FILES = Sprites Templates CMYK.Messages:CMYK CMYK.Templates:CMYK HSV.Messages:HSV HSV.Templates:HSV RGB.Messages:RGB RGB.Templates:RGB
VPATH         = Support011
CINCLUDES     = -ISupport011,icons ${INCLUDE_OSLIB}
RES_AREA      = resourcefs_files
RES_OBJ       = msgs
CMHGFILE      = header
OBJS          = cmyk dialogue helpreply hsv main model rgb tables callback icon lookup realloc relocate resource riscos steppable task window veneer
LIBS          = ${OSLIB} ${ASMUTILS}
ROMCDEFINES   = -DROM
SOURCES_TO_SYMLINK = $(wildcard icons/h/*) $(wildcard Support011/c/*) $(wildcard Support011/h/*) 

ifeq (,${MAKE_VERSION})

# RISC OS / amu case

WINEDIT = /Apps:!WinEdit

icons/dialogue_i.h: LocalRes:Templates
	${MKDIR} icons.h
	${WINEDIT} "-h??=define dialogue_%w_%n ((wimp_i) %i)" LocalRes:Templates >$@
	${PERL} Resources.perlscript $@

icons/cmyk_i.h: LocalRes:CMYK.Templates
	${MKDIR} icons.h
	${WINEDIT} "-h??=define cmyk_%w_%n ((wimp_i) %i)" LocalRes:CMYK.Templates >$@
	${PERL} Resources.perlscript $@

icons/rgb_i.h: LocalRes:RGB.Templates
	${MKDIR} icons.h
	${WINEDIT} "-h??=define rgb_%w_%n ((wimp_i) %i)" LocalRes:RGB.Templates >$@
	${PERL} Resources.perlscript $@

icons/hsv_i.h: LocalRes:HSV.Templates
	${MKDIR} icons.h
	${WINEDIT} "-h??=define hsv_%w_%n ((wimp_i) %i)" LocalRes:HSV.Templates >$@
	${PERL} Resources.perlscript $@

endif

include CModule

# Static dependencies:
cmyk.o:     icons/dialogue_i.h icons/cmyk_i.h
dialogue.o: icons/dialogue_i.h
hsv.o:      icons/dialogue_i.h icons/hsv_i.h
main.o:     icons/dialogue_i.h icons/cmyk_i.h icons/hsv_i.h icons/rgb_i.h
model.o:    icons/dialogue_i.h
rgb.o:      icons/dialogue_i.h icons/rgb_i.h

# Dynamic dependencies:
