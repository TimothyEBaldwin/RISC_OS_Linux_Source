# Copyright 1997 Acorn Computers Ltd
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
# Makefile for renderlib
#
# *****************************************
# ***       C h a n g e   L i s t       ***
# *****************************************
# Date		Name		Description
# ----		----		-----------
# 1997-09-03	BAL		Created
#


# ------------------------------------------------------------------------------
# Paths
#

LIBDIR		= <Lib$Dir>


# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= do mkdir -p
AS		= objasm
CP		= copy
CC		= cc
RM		= remove
LB		= libfile
WIPE		= x wipe

CFLAGS		= -c -depend !Depend -ffah -strict $(INCLUDES) $(DFLAGS)
AFLAGS		= -depend !Depend -Stamp -quit
CPFLAGS		= ~CLFNR~V
LBFLAGS		= -c
WFLAGS		= ~CFR~V


# ------------------------------------------------------------------------------
# Include files
#

INCLUDES	= -IC:
DFLAGS		= 


# ------------------------------------------------------------------------------
# Program specific options:
#

COMPONENT	= renderlib
TARGET		= renderlib

OBJS		= o.drawfile
 

# ------------------------------------------------------------------------------
# Rule patterns
#

.SUFFIXES: .o .s .c
.c.o:;     $(CC) $(CFLAGS) -o $@ $<
.s.o:;     $(AS) $(AFLAGS) -o $@ $<


# ------------------------------------------------------------------------------
# Build rules
#

all:	$(TARGET)
	@echo $(COMPONENT): library built

export: export_$(PHASE)

export_hdrs: h.drawfile dirs
	$(CP)	h.drawfile	$(LIBDIR).tboxlibs.h.drawfile	$(CPFLAGS)
	@echo $(COMPONENT): export complete (hdrs)

export_libs: $(TARGET) dirs
	$(CP)	$(TARGET)	$(LIBDIR).tboxlibs.o.$(TARGET)	$(CPFLAGS)
	@echo $(COMPONENT): export complete (libs)

clean:
	$(WIPE) o.* $(WFLAGS)
	$(RM) $(TARGET)
	@echo $(COMPONENT): cleaned

local_dirs:
	$(MKDIR) o

dirs:
	$(MKDIR) $(LIBDIR)
	$(MKDIR) $(LIBDIR).tboxlibs
	$(MKDIR) $(LIBDIR).tboxlibs.h
	$(MKDIR) $(LIBDIR).tboxlibs.o
        
$(TARGET): $(OBJS) local_dirs
	$(LB) $(LBFLAGS) -o $(TARGET) $(OBJS)


# ------------------------------------------------------------------------------
# Dynamic dependencies:
