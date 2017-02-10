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
# Makefile for Filer Action
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
# 30-Aug-94  AMcC         Added rom_link rule.

#
# Paths
#
EXP_HDR = <export$dir>

#
# Generic options:
#
include StdTools

#DFLAGS  = -Ddebugfile="\"RAM::0.$.out\""
AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -throwback -depend !Depend -ffah ${INCLUDES} ${DFLAGS} 
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
CLIB     = CLIB:o.stubs
RLIB     = RISC_OSLIB:o.risc_oslib
RSTUBS   = RISC_OSLIB:o.rstubs
ROMSTUBS = RISC_OSLIB:o.romstubs
ABSSYM   = RISC_OSLib:o.AbsSym

#
# Include files
#
INCLUDES = -IC:

# Note: the wrapper contains filer action specific code!
WRAPPER   = RISCOSLIB:s.ModuleWrap

#
# Program specific options:
#
COMPONENT = FilerAct
TARGET    = aof.FilerAct
EXPORTS   = ${EXP_HDR}.FilerAct

OBJS =\
 o.actionwind\
 o.Initialise\
 o.Buttons\
 o.allerrs\
 o.memmanage\
 o.listfiles\
 o.Chains\
 o.dboxlong\
 o.debug

APP_OBJS =\
 oa.actionwind\
 oa.Initialise\
 oa.Buttons\
 o.allerrs\
 oa.memmanage\
 oa.listfiles\
 oa.Chains\
 oa.dboxlong\
 oa.debug

#
# Rule patterns
#
.SUFFIXES: .oa

.c.o:;      ${CC} ${CFLAGS} -zM -o $@ $<
.c.oa:;     ${CC} ${CFLAGS} -o $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@

#
# Test/development rules:
#
all: rm.FilerAct
        @echo ${COMPONENT}: relocatable module built

app: app.FilerAct
        @echo ${COMPONENT}: application built

test: app.FilerAct
        Set FilerAct$Path <Obey$Dir>.Resources.UK.
        Set Alias$Filer_Action <Obey$Dir>.app.FilerAct %%*0

reset:
        Set FilerAct$Path Resources:$.Resources.FilerAct.
        UnSet Alias$Filer_Action

#
# RISC OS ROM build rules:
#
rom: ${TARGET}
        @echo ${COMPONENT}: rom module built

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install_rom: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

clean:
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} oa.* ${WFLAGS}
        ${XWIPE} app.* ${WFLAGS}
        ${XWIPE} rm.* ${WFLAGS}
        ${XWIPE} linked.* ${WFLAGS}
        ${XWIPE} map.* ${WFLAGS}
        ${RM} ${TARGET}
        ${RM} s.ModuleWrap
        @echo ${COMPONENT}: cleaned

resources: resources-${CMDHELP}
        @echo ${COMPONENT}: resource files copied

resources_common:
        ${MKDIR} ${RESDIR}.${COMPONENT}
        ${CP} LocalRes:Messages  ${RESDIR}.${COMPONENT}.Messages  ${CPFLAGS}
        ${CP} LocalRes:Templates ${RESDIR}.${COMPONENT}.Templates ${CPFLAGS}

resources-None: resources_common
        @

resources-: resources_common
        print LocalRes:CmdHelp { >> ${RESDIR}.${COMPONENT}.Messages }

${EXP_HDR}.FilerAct: hdr.FilerAct
        ${CP} hdr.FilerAct $@ ${CPFLAGS}
#
# ROM target (re-linked at ROM Image build time)
#
${TARGET}: ${OBJS} o.ModuleWrap ${ROMSTUBS}
        ${LD} -o $@ -aof ${OBJS} o.ModuleWrap ${ROMSTUBS}

#
# Final link for the ROM Image (using given base address)
#
rom_link:
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${TARGET} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

rm.FilerAct: ${OBJS} o.ModuleWrap ${RSTUBS}
        ${LD} -o $@ -module ${OBJS} o.ModuleWrap ${RSTUBS}

# Application
#
app.FilerAct: ${APP_OBJS} ${CLIB} ${RLIB}
        ${LD} -o $@ ${APP_OBJS} ${CLIB} ${RLIB}

o.ModuleWrap: s.ModuleWrap
        ${AS} ${AFLAGS} s.ModuleWrap $@

s.ModuleWrap: ${WRAPPER}
        ${CP} ${WRAPPER} $@ ${CPFLAGS}

# Dynamic dependencies:
