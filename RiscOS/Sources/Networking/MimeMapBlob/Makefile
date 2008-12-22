#
# Binary Build Environment Makefile for MimeMap
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


resources-MimeMap-UK:
	@echo MimeMap: no resources
	@| End of resource export for locale UK

rom_link-MimeMap:
	${MKDIR} linked
	link -o linked.${TARGET} -rmf -base ${ADDRESS} aof.${TARGET} <Lib$Dir>.RISC_OSLib.o.c_AbsSym
	@${CP} linked.${TARGET} ${LINKDIR}.${TARGET} ${CPFLAGS}

