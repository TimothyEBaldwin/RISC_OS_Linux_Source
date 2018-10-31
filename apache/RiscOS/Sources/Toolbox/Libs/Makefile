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
# Makefile for toolbox libraries
#
# *****************************************
# ***       C h a n g e   L i s t       ***
# *****************************************
# Date		Name		Description
# ----		----		-----------
# 10 Oct 1997   RWB		Tidied up based on previous trunk version

# ------------------------------------------------------------------------------
# Paths
#

LIBDIR		= <Lib$Dir>
# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= do mkdir -p
CD		= dir
AS		= objasm
CP		= copy
RM		= remove
WIPE		= x wipe
MAKE		= amu_machine

CPFLAGS		= ~CLFNR~V
WFLAGS		= ~CFR~V

COMPONENT	= tboxlibs

# -------------------------------------------------------
# Now all the different targets we can be asked to build:
# -------------------------------------------------------

clean:
	${CD}   toolboxlib
	${MAKE} clean
	${CD}   ^
	${CD}   wimplib
	${MAKE} clean
	${CD}   ^
	${CD}   flexlib
	${MAKE} clean
	${CD}   ^
	${CD}   eventlib
	${MAKE} clean
	${CD}   ^
	${CD}   renderlib
	${MAKE} clean
	${CD}   ^
	@echo	Library $(COMPONENT): clean complete.


export:	export_$(PHASE)

export_hdrs:
	${CD}   toolboxlib
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   wimplib
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   flexlib
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   eventlib
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   renderlib
	${MAKE} export PHASE=hdrs
	${CD}   ^
        ${CP}   VersionNum ${LIBDIR}.tboxlibs.LibVersion ${CPFLAGS}
	@echo	Library $(COMPONENT): export headers complete.
	

export_libs:
	${CD}   toolboxlib
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   wimplib
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   flexlib
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   eventlib
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   renderlib
	${MAKE} export PHASE=libs
	${CD}   ^
	@echo	Library $(COMPONENT): export libraries complete.


install:
        ${MKDIR} ${INSTDIR}.tboxlibs
        ${CP} ${LIBDIR}.tboxlibs.* ${INSTDIR}.tboxlibs.* ${CPFLAGS}
        @echo ${COMPONENT}: installed


# Dynamic dependencies:
