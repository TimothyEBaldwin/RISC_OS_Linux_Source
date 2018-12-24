#
# Binary Build Environment Makefile for Resolver
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


resources-Resolver-UK:
	${MKDIR} ${RESDIR}.${TARGET}
	${TOKENCHECK} LocalRes:Messages
	${TOKENCHECK} LocalRes:CmdHelp
	${FAPPEND} ${RESDIR}.${TARGET}.Messages LocalRes:Messages LocalRes:CmdHelp

rom_link-Resolver:
	${MKDIR} linked
	link -o linked.${TARGET} -rmf -base ${ADDRESS} aof.${TARGET} RISC_OSLib:o.c_abssym
	@${CP} linked.${TARGET} ${LINKDIR}.${TARGET} ${CPFLAGS}

clean::
	${WIPE} linked ${WFLAGS}
