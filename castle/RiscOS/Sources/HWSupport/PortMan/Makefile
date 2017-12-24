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
# PortMan OBJASM/C Makefile
#

#
# Paths
#
EXP_HDR = <export$dir>.^.Interface2
EXP_C_H = <Cexport$dir>.h
EXP_C_O = <Cexport$dir>.o

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe
CD	= dir
CHMOD	= access

AFLAGS     = -depend !Depend ${THROWBACK} -Stamp -quit
CFLAGS     = -c -depend !Depend ${THROWBACK} -zM -ff ${INCLUDES} ${DFLAGS}
CMHGFLAGS  = -p ${DFLAGS} ${THROWBACK} ${INCLUDES}
CPFLAGS    = ~cfr~v
WFLAGS     = ~c~vr
CHMODFLAGS = RW/R

DFLAGS  = ${DEBUG}
#
# Libraries
#
CLIB       = CLIB:o.stubs
RLIB       = RISCOSLIB:o.risc_oslib
RSTUBS     = RISCOSLIB:o.rstubs
ROMSTUBS   = RISCOSLIB:o.romstubs
ROMCSTUBS  = RISCOSLIB:o.romcstubs
ABSSYM     = RISC_OSLib:o.AbsSym
REMOTEDB   = C:debug.o.remotezm
#
# Include files
#
INCLUDES = -IC:

# Program specific options:
#
COMPONENT = PortMan
TARGET    = aof.${COMPONENT}
SATARGET  = rm.${COMPONENT}SA
RMTARGET  = rm.${COMPONENT}
EXPORTS   = ${EXP_C_H}.${COMPONENT} ${EXP_HDR}.${COMPONENT}
RDIR      = ${RESDIR}.${COMPONENT}

OBJS      =	\
o.msgfile	\
o.tags

ROMOBJS	=	\
o.module	\
o.header

RAMOBJS	=	\
sao.module	\
sao.header	\
o<Machine>.resfiles

#
# Rule patterns
#
.SUFFIXES: .sao .o<Machine>

.c.o:;		${CC}	${CFLAGS} -o $@ $<
.cmhg.o:;	${CMHG}	${CMHGFLAGS} -o $@ $< h.$*
.s.o:;		${AS}	${AFLAGS} $< $@
.s.o<Machine>:;	${AS}	${AFLAGS} $< $@
.c.sao:;	${CC}	${CFLAGS} -DSTANDALONE -o $@ $<
.cmhg.sao:;	${CMHG}	${CMHGFLAGS} -DSTANDALONE -o $@ $< h.sa$*

# build a relocatable module:
#
all: ${SATARGET} dirs
        @echo ${COMPONENT}: all complete

ram: ${RMTARGET} dirs
        @echo ${COMPONENT}: ram complete
#
# RISC OS ROM build rules:
#
rom: ${TARGET} dirs
        @echo ${COMPONENT}: rom complete

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install: ${RMTARGET} dirs
        ${CP} ${RMTARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: ram module installed

install_rom: ${TARGET} dirs
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${WIPE} aof          ${WFLAGS}
        ${WIPE} linked       ${WFLAGS}
        ${WIPE} o            ${WFLAGS}
        ${WIPE} o<Machine>   ${WFLAGS}
        ${WIPE} rm           ${WFLAGS}
        ${WIPE} sao          ${WFLAGS}
        ${RM} h.header
        ${RM} h.saheader
        ${RM} ${RMTARGET}
        ${RM} ${TARGET}
        @echo ${COMPONENT}: cleaned

dirs:
	${MKDIR}	aof
	${MKDIR}	linked
	${MKDIR}	o
	${MKDIR}	o<Machine>
	${MKDIR}	rm
	${MKDIR}	sao


resources: LocalRes:Messages Resources.<Machine>.Tags
        ${MKDIR} ${RDIR}
        ${CP} Resources.<Machine>.Tags ${RDIR}.Tags ${CPFLAGS}
        ${CP} LocalRes:* ${RDIR}.* ${CPFLAGS}
        @echo ${COMPONENT}: resource files copied

# dummy target
h.header: o.header	;@
h.saheader: sao.header	;@

#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS} ${ROMOBJS} ${ROMCSTUBS} 
        ${LD} -o $@ -aof ${OBJS} ${ROMOBJS} ${ROMCSTUBS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

#
# Relocatable module target
#
${SATARGET}: ${OBJS} ${RAMOBJS}
        ${LD} -rmf -o $@ ${OBJS} ${RAMOBJS} ${CLIB}
        ${CHMOD} $@ ${CHMODFLAGS}

${EXP_C_H}.${COMPONENT}:	h.${COMPONENT}
        ${CP} h.${COMPONENT} $@ ${CPFLAGS}

${EXP_HDR}.${COMPONENT}:	hdr.${COMPONENT}
        ${CP} hdr.${COMPONENT} $@ ${CPFLAGS}

${RMTARGET}: ${OBJS} ${ROMOBJS} ${CLIB}
        ${LD} -rmf -o $@ ${OBJS} ${ROMOBJS} ${CLIB}
        ${CHMOD} $@ ${CHMODFLAGS}

BBETYPE = local
bbe-local: bbe-generic
  BBE_Export_Dir Resources.<Machine>

# Extra dependencies:
o.module: h.header
sao.module: h.saheader
o<Machine>.resfiles: Resources.<Machine>.Tags
o<Machine>.resfiles: LocalRes:Messages

# Dynamic dependencies:
