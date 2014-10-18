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
# Template makefile for library in RISC OS source tree.

# This is the only project-specific part of this makefile
#
COMPONENT	= ModMalloc
INSTDIR		?= <Install$Dir>

# Copy is used in a number of place in the same way, so we put
#appropriate flags into a macro:
CopyFlags	= ~cfr~v


# -------------------------------------------------------
# Now all the different targets we can be asked to build:
# -------------------------------------------------------


all:
	Echo	Library $(COMPONENT): Please supply a target.


clean:
	x Wipe o.Lib* ~c~r~v
	Echo Library $(COMPONENT): 'clean' finished.


clean_all:	clean
	x Wipe		@.o.Sources.!Module.Sources ~c~vr
	x Wipe		@.o.Sources.!Normal.Sources ~c~vr
	Echo		Library $(COMPONENT): 'clean_all' finished.


export:	export_$(PHASE)

export_hdrs:
	CDir		<Lib$Dir>.$(COMPONENT)
	CDir		<Lib$Dir>.$(COMPONENT).h
	Copy		@.h.$(COMPONENT)	<Lib$Dir>.$(COMPONENT).h.$(COMPONENT)	$(CopyFlags)
	Copy		@.VersionNum		<Lib$Dir>.$(COMPONENT).LibVersion	$(CopyFlags)
	IfThere		@.$(COMPONENT)		Then Copy @.$(COMPONENT) <Lib$Dir>.$(COMPONENT).$(COMPONENT) $(CopyFlags)
	Echo		Library $(COMPONENT): 'export_hdrs' finished.


export_libs:
	CDir		<Lib$Dir>.$(COMPONENT)
	CDir		<Lib$Dir>.$(COMPONENT).o
	Obey            @.o.Sources.!Module.!Run
	Obey            @.o.Sources.!Normal.!Run
	Copy            @.o.Lib   <Lib$Dir>.$(COMPONENT).o.Lib   $(CopyFlags)
	Copy            @.o.Lib_M <Lib$Dir>.$(COMPONENT).o.Lib_M $(CopyFlags)
	Echo		Library $(COMPONENT): 'export_libs' finished.

install:
	do mkdir -p $(INSTDIR)
	Copy		<Lib$Dir>.$(COMPONENT)	$(INSTDIR).$(COMPONENT)	$(CopyFlags)
	Echo		Library $(COMPONENT): 'install' finished.

resources:
	Echo		Library $(COMPONENT): 'resources' finished.

rom:
	Echo		Library $(COMPONENT): 'rom' finished.

install_rom:
	Echo		Library $(COMPONENT): 'install_rom' finished.

rom_link:
	Echo		Library $(COMPONENT): 'rom_link' finished.

ram:
	Echo		Library $(COMPONENT): 'ram' finished.



# Dynamic dependencies:
