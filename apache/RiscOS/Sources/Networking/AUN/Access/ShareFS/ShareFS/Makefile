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

resources:
	${MKDIR} ${RESDIR}.ShareFS
	${CP} LocalRes:!Boot     ${RESDIR}.${TARGET}.!Boot     ${CPFLAGS}
	${CP} LocalRes:Messages  ${RESDIR}.${TARGET}.Messages  ${CPFLAGS}
	${CP} LocalRes:Templates ${RESDIR}.${TARGET}.Templates ${CPFLAGS}
	@echo ${COMPONENT}: resources copied to Messages module

rom_link: rom_link-${TARGET}
	@echo ${COMPONENT}: rom_link complete

rom_link-ShareFS:
	${MKDIR} linked
	link -o linked.${TARGET} -rmf -base ${ADDRESS} aof.${TARGET} RISCOSLIB:o.c_abssym
	@${CP} linked.${TARGET} ${LINKDIR}.${TARGET} ${CPFLAGS}

clean::
	${WIPE} linked ${WFLAGS}
