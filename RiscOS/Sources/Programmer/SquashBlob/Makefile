#
# Binary Build Environment Makefile for Squash
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


resources-Squash-UK:
	cdir <Resource$Dir>.Resources2.Squash
	TokenCheck LocalRes:Messages
	copy LocalRes:Messages  <Resource$Dir>.Resources2.Squash.Messages  ~cfr~v
	@echo Squash: resource files copied
	@| End of resource export for locale UK

