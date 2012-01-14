# Copyright 1998 Acorn Computers Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Makefile for DebugLib
#

# ------------------------------------------------------------------------------
# Paths
#

EXP_HDR		= <Export$Dir>
LIBDIR		= <Lib$Dir>
EXPORT_DIR	= <Lib$Dir>.DebugLib


# ------------------------------------------------------------------------------
# Generic options
#

MKDIR		= cdir
AS		= objasm
CP		= copy
CC		= ${MemCheckCC} cc
CM		= cmhg
RM		= remove
LD		= link
LB		= libfile
WIPE		= x wipe
AOF2ALF		= aof.AOF2ALF
STRIP		= stripdepnd

CCFLAGS		= -c -depend !Depend -ffah $(INCLUDES) $(DFLAGS) $(THROWBACK)
ASFLAGS		= -depend !Depend -Stamp -quit
CPFLAGS		= ~cf~nr~v
LBFLAGS		= -o -c
LNFLAGS		= -aof
WFLAGS		= ~CFR~V


# ------------------------------------------------------------------------------
# Libraries
#

LIBDIR		= <Lib$Dir>
CLIB		= CLIB:o.stubs
RLIB		= RISCOSLIB:o.risc_oslib
RSTUBS		= RISCOSLIB:o.rstubs
ROMSTUBS	= RISCOSLIB:o.romstubs
ROMCSTUBS	= RISCOSLIB:o.romcstubs
ABSSYM		= RISC_OSLib:o.AbsSym

REMOTEDBLIB	= $(LIBDIR).debug.o.lremote
PDEBUG		= $(LIBDIR).PDebug.o.Lib
PDEBUGZM	= $(LIBDIR).PDebug.o.Lib_M
TRACELIB	= $(LIBDIR).Trace.o.Trace
TRACELIBZM	= $(LIBDIR).Trace.o.Trace_M

# ------------------------------------------------------------------------------
# Include files
#

INCLUDES	= -Itbox:,C:
DFLAGS		=
#DFLAGS		= -g

DIRS		= o._dirs

# ------------------------------------------------------------------------------
# Program specific options:
#

COMPONENT	= DebugLib
TARGET		= DebugLib
TARGETZ		= DebugLibzm
TARGETD		= DebugLibD
TARGETMC	= DebugLibMC
TARGETMCD	= DebugLibMCD
AOFFile		= AOF_File
AOFFileZ	= AOF_FileZ
EXPORTS		= $(EXP_HDR).$(COMPONENT)

OBJS =\
 o.debug\
 o.serial_lib\
 o.buffering\
 o.misc\
 o.options\
 o.debugit\
 o.file\
 o.pdebug\
 o.printf\
 o.serial\
 o.socket\
 o.tml\
 o.tracker\
 o.parse\
 o.dadebug\
 o.brainlink\
 o.reporter\
 o.syslog\
 o.hal\

OBJSZ =\
 oz.debug\
 oz.serial_lib\
 oz.buffering\
 oz.misc\
 oz.options\
 oz.debugit\
 oz.file\
 oz.pdebug\
 oz.printf\
 oz.serial\
 oz.socket\
 oz.tml\
 oz.tracker\
 oz.parse\
 oz.dadebug\
 oz.brainlink\
 oz.reporter\
 oz.syslog\
 oz.hal\

OBJSD =\
 od.debug\
 od.serial_lib\
 od.buffering\
 od.misc\
 od.options\
 od.debugit\
 od.file\
 od.pdebug\
 od.printf\
 od.serial\
 od.socket\
 od.tml\
 od.tracker\
 od.parse\
 od.dadebug\
 od.brainlink\
 od.reporter\
 od.syslog\
 od.hal\

OBJSMC =\
 oMC.debug\
 oMC.serial_lib\
 oMC.buffering\
 oMC.misc\
 oMC.options\
 oMC.debugit\
 oMC.file\
 oMC.pdebug\
 oMC.printf\
 oMC.serial\
 oMC.socket\
 oMC.tml\
 oMC.tracker\
 oMC.parse\
 oMC.dadebug\
 oMC.brainlink\
 oMC.reporter\
 oMC.syslog\
 oMC.hal\

OBJSMCD =\
 oMCD.debug\
 oMCD.serial_lib\
 oMCD.buffering\
 oMCD.misc\
 oMCD.options\
 oMCD.debugit\
 oMCD.file\
 oMCD.pdebug\
 oMCD.printf\
 oMCD.serial\
 oMCD.socket\
 oMCD.tml\
 oMCD.tracker\
 oMCD.parse\
 oMCD.dadebug\
 oMCD.brainlink\
 oMCD.reporter\
 oMCD.syslog\
 oMCD.hal\

LIBS = \
 $(PDEBUG)\
 $(TRACELIB)\
 $(REMOTEDBLIB)\

LIBSZ = \
 $(PDEBUGZM)\
 $(TRACELIBZM)\
 $(REMOTEDBLIB)zm\

# ------------------------------------------------------------------------------
# Rule patterns
#

.SUFFIXES: .o .oz .od .oMC .oMCD .s .h .c
.c.o:;		$(CC) $(CCFLAGS) ${EXTRAFLAGS} -o $@ $<
.c.oz:;		$(CC) $(CCFLAGS) ${EXTRAFLAGS} -zm -o $@ $<
.c.od:;		${CC} ${CCFLAGS} ${EXTRAFLAGS} -DDEBUG -fn -o $@ $<
.c.oMC:;	${CC} ${CCFLAGS} ${EXTRAFLAGS} -fn -o $@ $<
.c.oMCD:;	${CC} ${CCFLAGS} ${EXTRAFLAGS} -DDEBUG -fn -o $@ $<
.s.o:;		$(AS) $(ASFLAGS) -o $@ $<


# ------------------------------------------------------------------------------
# Build all the library
#

all:		${TARGET} ${TARGETZ}

dbg:		${TARGETD}

memcheck:	${TARGETMC} ${TARGETMCD}

# ------------------------------------------------------------------------------
# RISC OS ROM build rules
#

export: export_$(PHASE)

install_rom: $(TARGET)
	$(CP) 	$(TARGET) $(INSTDIR).$(COMPONENT) 		$(CPFLAGS)
	@echo $(COMPONENT): rom module installed

clean:
	$(WIPE) o $(WFLAGS)
	$(WIPE) oz $(WFLAGS)
	${WIPE} od ${WFLAGS}
	${WIPE} oMC ${WFLAGS}
	${WIPE} oMCD ${WFLAGS}
	$(RM) $(TARGET)
	$(RM) $(TARGETZ)
	${RM} ${TARGETD}
	${RM} ${TARGETMC}
	${RM} ${TARGETMCD}
	${STRIP}
	@echo $(COMPONENT): cleaned

export_hdrs: h.DebugLib export_dirs
	$(CP)	h.DebugLib	$(EXPORT_DIR).h.DebugLib 	$(CPFLAGS)
	$(CP)   VersionNum      $(EXPORT_DIR).LibVersion 	$(CPFLAGS)
	$(CP)	Docs.DebugLib	$(EXPORT_DIR).DebugLib		$(CPFLAGS)
	@echo * $(COMPONENT): export complete (hdrs)

export_libs: export_libs-${NOLIBS}
	@echo * $(COMPONENT): export complete (libs)

export_libs-: $(TARGET) $(TARGETZ) export_dirs
	$(CP)	$(TARGET)	$(EXPORT_DIR).o.$(TARGET)	$(CPFLAGS)
	$(CP)	$(TARGETZ)	$(EXPORT_DIR).o.$(TARGETZ)	$(CPFLAGS)

export_libs-NOLIBS:
	@echo * $(COMPONENT): library export disabled (export_libs)

${DIRS}:
	$(MKDIR) o
	${MKDIR} od
	${MKDIR} oMC
	${MKDIR} oMCD
	$(MKDIR) oz
	create ${DIRS}
	stamp  ${DIRS}

export_dirs:
	$(MKDIR) $(LIBDIR)
	$(MKDIR) $(EXPORT_DIR)
	$(MKDIR) $(EXPORT_DIR).h
	$(MKDIR) $(EXPORT_DIR).o

# ------------------------------------------------------------------------------
# Final link
#

$(TARGET): $(OBJS) $(LIBS) ${DIRS}
	$(LD) $(LNFLAGS) -o $(AOFFile) $(OBJS) $(LIBS)
	$(LB) $(LBFLAGS) $(TARGET) $(AOFFile)
	$(RM) $(AOFFile)

$(TARGETZ): $(OBJSZ) $(LIBSZ) ${DIRS}
	$(LD) $(LNFLAGS) -o $(AOFFileZ) $(OBJSZ) $(LIBSZ)
	$(LB) $(LBFLAGS) $(TARGETZ) $(AOFFileZ)
	$(RM) $(AOFFileZ)

$(TARGETD): $(OBJSD) $(LIBS) ${DIRS}
	$(LD) $(LNFLAGS) -o $(AOFFile) $(OBJSD) $(LIBS)
	$(LB) $(LBFLAGS) $(TARGETD) $(AOFFile)
	$(RM) $(AOFFile)

$(TARGETMC): $(OBJSMC) $(LIBS) ${DIRS}
	$(LD) $(LNFLAGS) -o $(AOFFile) $(OBJSMC) $(LIBS)
	$(LB) $(LBFLAGS) $(TARGETMC) $(AOFFile)
	$(RM) $(AOFFile)

$(TARGETMCD): $(OBJSMCD) $(LIBS) ${DIRS}
	$(LD) $(LNFLAGS) -o $(AOFFile) $(OBJSMCD) $(LIBS)
	$(LB) $(LBFLAGS) $(TARGETMCD) $(AOFFile)
	$(RM) $(AOFFile)

$(EXP_HDR).$(COMPONENT): hdr.$(COMPONENT)
	$(CP) hdr.$(COMPONENT) $@ $(CPFLAGS)


# ------------------------------------------------------------------------------
# Dynamic dependencies:
