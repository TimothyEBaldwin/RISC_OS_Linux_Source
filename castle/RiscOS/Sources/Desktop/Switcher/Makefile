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
# Makefile for Task Manager
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 18-Oct-94  AMcC         Templates copied to Resources as 'Templates' not 'Template3D'
#

COMPONENT = TaskManager
TARGET    = Switcher
HEADER1  = ${TARGET}

CMDHELP := special

include StdTools
include AAsmModule

resources-special:
	${MKDIR} ${RESFSDIR}
	Set SwitcherRes$Path LocalUserIFRes:,LocalRes:
	${CP} SwitcherRes:Messages  ${RESFSDIR}.Messages ${CPFLAGS}
	${CP} SwitcherRes:Templates ${RESFSDIR}.Templates ${CPFLAGS}
	Unset SwitcherRes$Path
	@echo ${COMPONENT}: resource files copied


# Dynamic dependencies:
