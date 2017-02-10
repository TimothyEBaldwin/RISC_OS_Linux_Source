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
# Makefile for PDebugM
# ====================
#

# ------------------------------------------------------------------------------
# Paths
#

EXP_C_H = <CExport$dir>.h

# ------------------------------------------------------------------------------
# Generic options:
#

MKDIR		= cdir
AS		= objasm
CC		= ${MemCheckCC} cc
CMHG		= cmhg
CP		= copy
LD		= link #${MemCheckLD} link
RM		= remove
MODSQZ		= modsqz
RESGEN		= resgen
WIPE    	= x wipe

AFLAGS		= -depend !Depend -Stamp -quit ${THROWBACK}
CFLAGS		= -c -depend !Depend -zM -zps1 -ffah ${INCLUDES} ${THROWBACK} 
CMHGFLAGS	=
CPFLAGS		= ~cfr~v
WFLAGS		= ~c~v

DFLAGS		= -fn
DDFLAGS		= -fn

# -----------------------------------------------------------------------------
# Libraries
#

LIBDIR		= <Lib$Dir>
CLIB		= CLIB:o.stubs
CPPLIB		= CPPLib:o.c++lib
RLIB		= RISCOSLIB:o.risc_oslib
RSTUBS		= RISCOSLIB:o.rstubs
ROMSTUBS	= RISCOSLIB:o.romstubs
ROMCSTUBS	= RISCOSLIB:o.romcstubs
ABSSYM		= RISC_OSLib:o.c_AbsSym
WRAPPER		= RISC_OSLib:s.ModuleWrap

PDEBUG		= ${LIBDIR}.PDebug.o.PDebugzm
DESK		= ${LIBDIR}.Desk.o.Desk_M

LIBS = \
 ${PDEBUG} \
 ${DESK}

LIBSD = \
 ${PDEBUG} \
 ${DESK} \


# ------------------------------------------------------------------------------
# Include files
#

INCLUDES 	= -IC:

HDR		= h.CMHGHead


# ------------------------------------------------------------------------------
# Program specific options:
#

COMPONENT 	= PDebugM
TARGET		= aof.PDebugM
TARGET_D	= aof.PDebugMD
TARGETSA	= rm.PDebugM
TARGETSA_D	= rm.PDebugMD

OBJS = \
 o.CMHGHead \
 o.Module \
 

OBJSD = \
 o.CHMGHead \
 od.Module \


EXPORTS =

# ------------------------------------------------------------------------------
# Rule patterns
#

.SUFFIXES:	.o .od .s .h .cmhg .c .z
.c.o:;		${CC} ${CFLAGS} ${DFLAGS} ${EXTRAFLAGS} -o $@ $<
.c.od:;		$(CC) ${CFLAGS} ${DDFLAGS} ${EXTRAFLAGS} -o $@ $<
.s.o:;		${AS} ${AFLAGS} -to $@ $<
.cmhg.o:;	${CMHG} ${CMHGFLAGS} -o $@ $<
.cmhg.h:;	${CMHG} ${CMHGFLAGS} -d $@ $<

# ------------------------------------------------------------------------------
# Main rules
#

all: ${TARGETSA}
        @echo ${COMPONENT}: module built

debug: $(TARGETSA_D)
        @echo ${COMPONENT}: debug module built

normal: ${TARGETSA}
        @echo ${COMPONENT}: normal module built

rom: ${TARGET}
        @echo ${COMPONENT}: rom module built

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install: ${TARGETSA}
        ${CP} ${TARGETSA} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: module installed

install_rom: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

o.dirs:
	${MKDIR} h
	${MKDIR} o
	${MKDIR} od
	${MKDIR} rm
	${MKDIR} linked
	${MKDIR} aof
	${MKDIR} map
	create o.dirs
	stamp o.dirs

clean:
	${WIPE} h ${WFLAGS}
        ${WIPE} o ${WFLAGS}
        ${WIPE} od ${WFLAGS}
        ${WIPE} rm ${WFLAGS}
        ${WIPE} linked ${WFLAGS}
        ${WIPE} map ${WFLAGS}
        ${WIPE} aof ${WFLAGS}
        @echo ${COMPONENT}: cleaned

resources:
        @echo ${COMPONENT}: resource files copied


# ------------------------------------------------------------------------------
# Stand-alone module
#

${TARGETSA}: ${OBJS} ${HDR} ${LIBS} ${CLIB} o.dirs
        ${LD} -o $@ -module ${OBJS} ${LIBS} ${CLIB}

${TARGETSA_D}: ${OBJSD} ${HDR} ${LIBSD} ${CLIB} o.dirs
        ${LD} -o $@ -module ${OBJSD} ${LIBSD} ${CLIB}

# ------------------------------------------------------------------------------
# Final link for the ROM Image (re-linked at ROM Image build time)
#

${TARGET}: ${OBJS} ${HDR} ${LIBS} ${ROMCSTUBS} o.dirs
        ${LD} -o $@ -aof ${OBJS} ${LIBS} ${ROMCSTUBS}

${TARGET_D}: ${OBJSD} ${HDR} ${LIBSD} ${ROMCSTUBS} o.dirs
        ${LD} -o $@ -aof ${OBJSD} ${LIBSD} ${ROMCSTUBS}

# ------------------------------------------------------------------------------
# Final link for the ROM Image (using given base address)
#

rom_link:
        ${LD} -o linked.${COMPONENT} -map -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM} \
              > map.${COMPONENT}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

# Dynamic dependencies:
