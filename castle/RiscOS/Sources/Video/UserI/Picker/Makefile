# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
