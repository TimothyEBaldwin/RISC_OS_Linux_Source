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
ENSURE_DEPENDS	= EnsureDepends Depends

CPFLAGS		= ~CLFNR~V
WFLAGS		= ~CFR~V

COMPONENT	= tboxlibs

# -------------------------------------------------------
# Now all the different targets we can be asked to build:
# -------------------------------------------------------

clean:
	${CD}   toolboxlib
	${ENSURE_DEPENDS}
	${MAKE} clean
	${RM}   Depends
	${CD}   ^
	${CD}   wimplib
	${ENSURE_DEPENDS}
	${MAKE} clean
	${RM}   Depends
	${CD}   ^
	${CD}   flexlib
	${ENSURE_DEPENDS}
	${MAKE} clean
	${RM}   Depends
	${CD}   ^
	${CD}   eventlib
	${ENSURE_DEPENDS}
	${MAKE} clean
	${RM}   Depends
	${CD}   ^
	${CD}   renderlib
	${ENSURE_DEPENDS}
	${MAKE} clean
	${RM}   Depends
	${CD}   ^
	@echo	Library $(COMPONENT): clean complete.


export:	export_$(PHASE)

export_hdrs:
	${CD}   toolboxlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   wimplib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   flexlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   eventlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CD}   renderlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=hdrs
	${CD}   ^
	${CP}   VersionNum ${LIBDIR}.tboxlibs.LibVersion ${CPFLAGS}
	@echo	Library $(COMPONENT): export headers complete.
	

export_libs:
	${CD}   toolboxlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   wimplib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   flexlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   eventlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=libs
	${CD}   ^
	${CD}   renderlib
	${ENSURE_DEPENDS}
	${MAKE} export PHASE=libs
	${CD}   ^
	@echo	Library $(COMPONENT): export libraries complete.


install:
	${MKDIR} ${INSTDIR}.tboxlibs
	${CP} ${LIBDIR}.tboxlibs.* ${INSTDIR}.tboxlibs.* ${CPFLAGS}
	@echo ${COMPONENT}: installed


include Depends
