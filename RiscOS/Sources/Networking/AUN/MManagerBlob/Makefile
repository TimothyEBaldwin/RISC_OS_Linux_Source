#
# Binary Build Environment Makefile for MManager
#
#
# Copyright © 2001-2004 Castle Technology Ltd. All rights reserved.
#

include StdTools

all:
	@| Do nothing by default

install_rom:
	${CP} rm.${TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
	@echo ${COMPONENT}: installed

# Resource export phases

resources: resources-${TARGET}-${LOCALE}
	@echo ${COMPONENT}: ${LOCALE} resources exported


rom_link: rom_link-${TARGET}
	@echo ${COMPONENT}: rom_link complete


resources-MManager-UK:
	${MKDIR} ${RESDIR}.${TARGET}
	${TOKENCHECK} LocalRes:Messages
	${CP} LocalRes:Messages ${RESDIR}.${TARGET}.Messages ${CPFLAGS}
