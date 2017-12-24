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
# Makefile for wimplib
#
# *****************************************
# ***       C h a n g e   L i s t       ***
# *****************************************
# Date		Name		Description
# ----		----		-----------
# 1997-09-03	BAL		Created
# 09 Oct 1997   RWB		Removed some reduntant phases
#


# ------------------------------------------------------------------------------
# Paths
#

EXP_HDR		= <export$dir>
LIBDIR		= <Lib$Dir>


# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= do mkdir -p
AS		= objasm
CP		= copy
CC		= cc
CM		= cmhg
RM		= remove
LD		= link
LB		= libfile
WIPE		= x wipe

CFLAGS		= -c -depend !Depend -ffah -strict ${INCLUDES} ${DFLAGS}
AFLAGS		= -depend !Depend -Stamp -quit
CPFLAGS		= ~CLFNR~V
LBFLAGS		= -c
WFLAGS		= ~CFR~V


# ------------------------------------------------------------------------------
# Libraries
#

CLIB		= CLIB:o.stubs
RLIB		= RISCOSLIB:o.risc_oslib
RSTUBS		= RISCOSLIB:o.rstubs
ROMSTUBS	= RISCOSLIB:o.romstubs
ROMCSTUBS	= RISCOSLIB:o.romcstubs
ABSSYM		= RISC_OSLib:o.AbsSym


# ------------------------------------------------------------------------------
# Include files
#

INCLUDES	= -IC:
DFLAGS		= 


# ------------------------------------------------------------------------------
# Program specific options:
#

COMPONENT	= wimplib
TARGET		= ${COMPONENT}
EXPORTS		= ${EXP_HDR}.${COMPONENT}

OBJS		=\
 o.waddmsg\
 o.wbasesp\
 o.wblockcpy\
 o.wclosedown\
 o.wclosete\
 o.wclosew\
 o.wcommw\
 o.wcreatei\
 o.wcreatem\
 o.wcreatesm\
 o.wcreatew\
 o.wdecodem\
 o.wdeletei\
 o.wdeletew\
 o.wdragbox\
 o.wforcere\
 o.wforcere2\
 o.wgetcarp\
 o.wgeticst\
 o.wgetmenu\
 o.wgetpoi\
 o.wgetrec\
 o.wgetwinf\
 o.wgetwinfni\
 o.wgetwino\
 o.wgetwst\
 o.wgetwst2\
 o.winit\
 o.wloadte\
 o.wopente\
 o.wopenw\
 o.wopenw2\
 o.wplotic\
 o.wpoll\
 o.wpollidle\
 o.wprocessk\
 o.wreadpal\
 o.wredraww\
 o.wremmsg\
 o.wreporte\
 o.wresizeic\
 o.wsendm\
 o.wsetcarp\
 o.wsetcol\
 o.wsetcolm\
 o.wsetext\
 o.wsetfon\
 o.wseticst\
 o.wsetmode\
 o.wsetpal\
 o.wsetpos\
 o.wslotsize\
 o.wspriteop\
 o.wstartt\
 o.wsysinfo\
 o.wtextcol\
 o.wtextop\
 o.wtransbl\
 o.wupdatew\
 o.wwhichi\
 o.!!version
 

# ------------------------------------------------------------------------------
# Rule patterns
#

.SUFFIXES: .o .s .h .cmhg .c .z
.c.o:;     ${CC} ${CFLAGS} -o $@ $<
.s.o:;     ${AS} ${AFLAGS} -o $@ $<
.cmhg.o:;  ${CM} ${CMHGFLAGS} -o $@ $<
.cmhg.h:;  ${CM} ${CMHGFLAGS} -d $@ $<


# ------------------------------------------------------------------------------
# RISC OS ROM build rules
#

export: export_${PHASE}

clean:
	${WIPE} o.* ${WFLAGS}
	${RM} ${TARGET}
	@echo ${COMPONENT}: cleaned

export_hdrs: h.wimplib dirs
	${CP}	h.wimplib	${LIBDIR}.tboxlibs.h.wimplib	${CPFLAGS}
	@echo ${COMPONENT}: export complete (hdrs)

export_libs: ${TARGET} dirs
	${CP}	${TARGET}	${LIBDIR}.tboxlibs.o.${TARGET}	${CPFLAGS}
	@echo ${COMPONENT}: export complete (libs)

local_dirs:
	${MKDIR} o

dirs:
	${MKDIR} ${LIBDIR}
	${MKDIR} ${LIBDIR}.tboxlibs
	${MKDIR} ${LIBDIR}.tboxlibs.h
	${MKDIR} ${LIBDIR}.tboxlibs.o
        

# ------------------------------------------------------------------------------
# Final link
#

${TARGET}: ${OBJS} local_dirs
	${LB} ${LBFLAGS} -o ${TARGET} ${OBJS}

${EXP_HDR}.${COMPONENT}: hdr.${COMPONENT}
	${CP} hdr.${COMPONENT} $@ ${CPFLAGS}


# ------------------------------------------------------------------------------
# Dynamic dependencies:
