# File:    Makefile
# Purpose: Makefile for Wild
# Author:  Ben Laughton
#
# History:
#
# 2000-04-10: BAL
# Created.




# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= cdir
CP		= copy
RM		= remove
WIPE		= -wipe
STRIPDEPND	= stripdepnd



# ------------------------------------------------------------------------------
# Flags
#

CPFLAGS		= ~cfr~v
WFLAGS		= ~c~vr




# ------------------------------------------------------------------------------
# Program specific options
#

COMPONENT	= Wild

# C debugging and DebugLib do not map 1<->1 since DebugLib is used for other
# stuff as well.
C_DEBUG_ON	= -DDesk_DEBUG
C_DEBUG_OFF	= -DNDEBUG




# ------------------------------------------------------------------------------
# Build rules
#

# Local

all:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_OFF) LIBSUFFIX= EXT=o
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_OFF) LIBSUFFIX=_M EXT=z
	@echo $(COMPONENT): build complete

debug:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_ON) LIBSUFFIX=_D EXT=od
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_ON) LIBSUFFIX=_M_D EXT=odz
	@echo $(COMPONENT): debug build complete

preprocess:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_OFF) EXT=i
	@echo $(COMPONENT): preprocessing complete


export: export_$(PHASE)

export_hdrs:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) TARGET=AvoidAMUBug EXT=AvoidAMUBug
	@echo $(COMPONENT): export complete (hdrs)

export_libs:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_OFF) LIBSUFFIX= EXT=o
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXTRA_C_FLAGS=$(C_DEBUG_OFF) LIBSUFFIX=_M EXT=z
	@echo $(COMPONENT): export complete (libs)
	
clean:
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXT=o
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXT=z
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXT=od
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXT=odz
	@amu -f MainMake $(MFLAGS) $(MAKECMDGOALS) EXT=i
	@$(WIPE) l	$(WFLAGS)
	@$(STRIPDEPND) MainMake
	@echo $(COMPONENT): cleaned

test:
	@echo MFLAGS       ${MFLAGS}
	@echo MAKECMDGOALS ${MAKECMDGOALS}

# Dynamic dependencies:
