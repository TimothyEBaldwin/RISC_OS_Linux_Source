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
# Makefile for BASIC
#

COMPONENT    ?= BASIC105
VFPASM       ?= TRUE
RESDIR       ?= _!_x_!_
RESFSDIR      = ${RESDIR}.BASIC

# Build during install_rom phase to avoid race conditions.
CUSTOMROM     = TRUE
install_rom: install_rom${CUSTOMROM}
rom:
	@${NOP}

ifeq ($(VFPASM),TRUE)
ASFLAGS       = -PD "VFPAssembler SETL {TRUE}"
SA_DEPEND     = VFPData

# Only BASIC105 provides resources to avoid race conditions.
ifeq (${COMPONENT},BASIC105)
INSTRES_FILES = VFPData
INSTRES_DEPENDS = VFPData
endif

s.VFPData: VFPLib.VFPLib VFPLib.GenData
	BASIC { < VFPLib.GenData }

VFPData: s.VFPData
	${MKDIR} o
	${AS} ${ASFLAGS} -PD "BuildingVFPData SETL {TRUE}" -o o.VFPData s.VFPData
	${LD} -BIN -o $@ o.VFPData

clean::
	${RM} s.VFPData
	${RM} VFPData
endif

include StdTools
include AAsmModule

include Depends
