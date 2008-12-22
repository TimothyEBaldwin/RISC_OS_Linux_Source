#
# Binary Build Environment Makefile for ShareFS
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


resources-ShareFS-UK:
	@echo ShareFS: resource export complete (Resources in AUNMsgs)
	@| End of resource export for locale UK

rom_link-ShareFS:
	${MKDIR} linked
	link -o linked.${TARGET} -rmf -base ${ADDRESS} aof.${TARGET} RISCOSLIB:o.c_abssym
	@${CP} linked.${TARGET} ${LINKDIR}.${TARGET} ${CPFLAGS}

