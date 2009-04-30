#
# Binary Build Environment Makefile for FPEmulator
#
#
# Copyright © 2001-2004 Castle Technology Ltd. All rights reserved.
#

include StdTools

all:
	@| Do nothing by default

install_rom:
	${CP} rm.${MACHINE}.${TARGET} ${INSTDIR}.${TARGET} ${CPFLAGS}
	@echo ${COMPONENT}: installed

# Resource export phases

resources: resources-${TARGET}-${LOCALE}
	@echo ${COMPONENT}: ${LOCALE} resources exported


rom_link: rom_link-${TARGET}
	@echo ${COMPONENT}: rom_link complete


resources-FPEmulator-UK:
	do mkdir -p <Resource$Dir>.Resources.FPEmulator
	TokenCheck LocalRes:Messages
	Copy LocalRes:Messages  <Resource$Dir>.Resources.FPEmulator.Messages  ~cfr~v
	@echo FPEmulator: resource files copied
	@| End of resource export for locale UK

