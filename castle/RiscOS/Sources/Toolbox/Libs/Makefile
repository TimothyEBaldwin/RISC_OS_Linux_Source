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
