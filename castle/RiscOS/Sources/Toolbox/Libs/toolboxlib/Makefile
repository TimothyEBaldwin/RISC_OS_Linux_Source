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
# Makefile for eventlib
#
# *****************************************
# ***       C h a n g e   L i s t       ***
# *****************************************
# Date		Name		Description
# ----		----		-----------
# 1997-09-18	BAL		Created
#


# ------------------------------------------------------------------------------
# Paths
#

LIBDIR		= <Lib$Dir>


# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= do mkdir -p
CP		= copy
RM		= remove
WIPE		= x wipe

CPFLAGS		= ~CLFNR~V
WFLAGS		= ~CFR~V


# ------------------------------------------------------------------------------
# Program specific options
#

COMPONENT	= toolboxlib
TARGET		= o.toolboxlib


# ------------------------------------------------------------------------------
# Build rules
#

all:	$(TARGET)
	@echo $(COMPONENT): library built

export: export_$(PHASE)

export_hdrs: dirs
	$(CP)	h.*		$(LIBDIR).tboxlibs.h.*		$(CPFLAGS)
	@echo $(COMPONENT): export complete (hdrs)

export_libs: $(TARGET) dirs
	$(CP)	$(TARGET)	$(LIBDIR).tboxlibs.$(TARGET)	$(CPFLAGS)
	@echo $(COMPONENT): export complete (libs)

# If you have 'every2', you can replace the list of components up to
# but not including the line "$(RM) $(TARGET)", with this one-liner:
#
# 	every.every2 -ci	@.sources.*.o wipe %0.*		$(WPFLAGS)

clean:
	${WIPE} @.sources.writable.o.*   ${WFLAGS}
	${WIPE} @.sources.window.o.*     ${WFLAGS}
	${WIPE} @.sources.version.o.*    ${WFLAGS}
	${WIPE} @.sources.toolbox.o.*    ${WFLAGS}
	${WIPE} @.sources.textarea.o.*   ${WFLAGS}
	${WIPE} @.sources.stringset.o.*  ${WFLAGS}
	${WIPE} @.sources.slider.o.*     ${WFLAGS}
	${WIPE} @.sources.scrolllist.o.* ${WFLAGS}
	${WIPE} @.sources.scrollbar.o.*  ${WFLAGS}
	${WIPE} @.sources.scale.o.*      ${WFLAGS}
	${WIPE} @.sources.saveas.o.*     ${WFLAGS}
	${WIPE} @.sources.radiobutto.o.* ${WFLAGS}
	${WIPE} @.sources.quit.o.*       ${WFLAGS}
	${WIPE} @.sources.proginfo.o.*   ${WFLAGS}
	${WIPE} @.sources.printdbox.o.*  ${WFLAGS}
	${WIPE} @.sources.popup.o.*      ${WFLAGS}
	${WIPE} @.sources.optionbutt.o.* ${WFLAGS}
	${WIPE} @.sources.numberrang.o.* ${WFLAGS}
	${WIPE} @.sources.menu.o.*       ${WFLAGS}
	${WIPE} @.sources.iconbar.o.*    ${WFLAGS}
	${WIPE} @.sources.Gadgets.o.*    ${WFLAGS}
	${WIPE} @.sources.fontmenu.o.*   ${WFLAGS}
	${WIPE} @.sources.fontdbox.o.*   ${WFLAGS}
	${WIPE} @.sources.fileinfo.o.*   ${WFLAGS}
	${WIPE} @.sources.draggable.o.*  ${WFLAGS}
	${WIPE} @.sources.displayfie.o.* ${WFLAGS}
	${WIPE} @.sources.dcs.o.*        ${WFLAGS}
	${WIPE} @.sources.colourmenu.o.* ${WFLAGS}
	${WIPE} @.sources.colourdbox.o.* ${WFLAGS}
	${WIPE} @.sources.button.o.*     ${WFLAGS}
	${WIPE} @.sources.ActionButt.o.* ${WFLAGS}
	$(RM) $(TARGET)
	$(RM) AutoGenMF
	@echo $(COMPONENT): cleaned

local_dirs:
	${MKDIR} @.sources.writable.o
	${MKDIR} @.sources.window.o
	${MKDIR} @.sources.version.o
	${MKDIR} @.sources.toolbox.o
	${MKDIR} @.sources.textarea.o
	${MKDIR} @.sources.stringset.o
	${MKDIR} @.sources.slider.o
	${MKDIR} @.sources.scrolllist.o
	${MKDIR} @.sources.scrollbar.o
	${MKDIR} @.sources.scale.o
	${MKDIR} @.sources.saveas.o
	${MKDIR} @.sources.radiobutto.o
	${MKDIR} @.sources.quit.o
	${MKDIR} @.sources.proginfo.o
	${MKDIR} @.sources.printdbox.o
	${MKDIR} @.sources.popup.o
	${MKDIR} @.sources.optionbutt.o
	${MKDIR} @.sources.numberrang.o
	${MKDIR} @.sources.menu.o
	${MKDIR} @.sources.iconbar.o
	${MKDIR} @.sources.Gadgets.o
	${MKDIR} @.sources.fontmenu.o
	${MKDIR} @.sources.fontdbox.o
	${MKDIR} @.sources.fileinfo.o
	${MKDIR} @.sources.draggable.o
	${MKDIR} @.sources.displayfie.o
	${MKDIR} @.sources.dcs.o
	${MKDIR} @.sources.colourmenu.o
	${MKDIR} @.sources.colourdbox.o
	${MKDIR} @.sources.button.o
	${MKDIR} @.sources.ActionButt.o
	$(MKDIR) o

dirs:
	$(MKDIR) $(LIBDIR)
	$(MKDIR) $(LIBDIR).tboxlibs
	$(MKDIR) $(LIBDIR).tboxlibs.h
	$(MKDIR) $(LIBDIR).tboxlibs.o
        
$(TARGET): local_dirs
	Obey	@.!Mk

# Dynamic dependencies:
