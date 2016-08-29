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
# Makefile for ColourPicker
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 23-Nov-99  SNB          Created

COMPONENT = Picker
RAM_MODULE = rm.${COMPONENT}
ROM_MODULE = aof.${COMPONENT}
DBG_MODULE = rm.${COMPONENT}D

FULL_COMPONENT = ColourPicker

#
# Paths
#
EXP_HDR = <export$dir>

VPATH=@ Support011
WINEDIT = /Apps:!WinEdit

#
# Export Paths for Messages module
#
RESDIR = <resource$dir>.Resources2.${COMPONENT}
RESFSDIR   = Resources.${COMPONENT}

include StdTools

#
# Include files
#
INCLUDES=       -IC:AsmUtils,Support011,icons,OS:,C:

#
# Libraries
#
CLIB            = Clib:o.Stubs
ROMCSTUBS       = RISCOSLIB:o.romcstubs
ABSSYM          = RISC_OSLib:o.AbsSym
OSLIB           = OSLib:o.OSLib
ASMUTILS        = C:AsmUtils.o.AsmUtilsZM

DEPEND          = -depend !Depend
DBGFLAGS        = -DTRACE
DEFINES         = 
CENV            = ${DEPEND} ${THROWBACK}

ASFLAGS         = ${DEPEND} ${THROWBACK}
CFLAGS          = -W -c -ffh -zM -zps1 -Wcp ${INCLUDES} ${DEFINES} ${CENV}
CMHGFLAGS       = ${OPTIONS} ${DEPEND} ${THROWBACK} -p

OTHER_OBJS      = o.veneer o.header

ROM_OBJS        = or.cmyk  or.dialogue  or.helpreply  or.hsv              \
                  or.main  or.model     or.rgb        or.tables           \
                           or.callback  or.lookup     or.realloc          \
                  or.task  or.riscos    or.window     or.resource         \
                  or.icon  or.steppable or.relocate   ${OTHER_OBJS}
RAM_OBJS        = o.cmyk   o.dialogue   o.helpreply   o.hsv               \
                  o.main   o.model      o.rgb         o.tables    o.msgs  \
                           o.callback   o.lookup      o.realloc           \
                  o.task   o.riscos     o.window      o.resource          \
                  o.icon   o.steppable  o.relocate    ${OTHER_OBJS}
DBG_OBJS        = od.cmyk  od.dialogue  od.helpreply  od.hsv              \
                  od.main  od.model     od.rgb        od.tables   o.msgs  \
                  od.m     od.callback  od.lookup     od.realloc          \
                  od.task  od.riscos    od.window     od.resource         \
                  od.icon  od.steppable od.relocate   ${OTHER_OBJS}

RESOURCEFILES   = \
  Resources.CMYK.Messages\
  Resources.CMYK.Templates\
  Resources.HSV.Messages\
  Resources.HSV.Templates\
  Resources.RGB.Messages\
  Resources.RGB.Templates\
  Resources.MergedMsgs\
  Resources.Sprites\
  Resources.Templates

#
# Rule patterns
#
.SUFFIXES:      .o .od .or .s .c .cmhg .h
.c.o:;          ${CC} ${CFLAGS} -o $@ $<
.c.or:;         ${CC} ${CFLAGS} -DROM -o $@ $<
.c.od:;         ${CC} ${CFLAGS} ${DBGFLAGS} -o $@ $<
.cmhg.o:;       ${CMHG} ${CMHGFLAGS} -o $@ $< -d h.header
.cmhg.h:;       ${CMHG} ${CMHGFLAGS} -d $@ $< -o null:
.cmhg.od:;      ${CMHG} ${CMHGFLAGS} -o $@ $< -d h.header ${DBGFLAGS}
.s.o:;          ${AS} ${ASFLAGS} -o $@ $<

header.h: header.o
        ${TOUCH} $@
        
o.header od.header: VersionNum

ICONS=icons.h.dialogue_i icons.h.cmyk_i icons.h.rgb_i icons.h.hsv_i

icons.h.dialogue_i: Resources.Templates
        ${WINEDIT} "-h??=define dialogue_%w_%n ((wimp_i) %i)" Resources.Templates >$@
        ${PERL} Resources.perlscript $@

icons.h.cmyk_i: Resources.CMYK.Templates
        ${WINEDIT} "-h??=define cmyk_%w_%n ((wimp_i) %i)" Resources.CMYK.Templates >$@
        ${PERL} Resources.perlscript $@

icons.h.rgb_i: Resources.RGB.Templates
        ${WINEDIT} "-h??=define rgb_%w_%n ((wimp_i) %i)" Resources.RGB.Templates >$@
        ${PERL} Resources.perlscript $@

icons.h.hsv_i: Resources.HSV.Templates
        ${WINEDIT} "-h??=define hsv_%w_%n ((wimp_i) %i)" Resources.HSV.Templates >$@
        ${PERL} Resources.perlscript $@

#
# Main rules:
#
all: ${RAM_MODULE} o.dirs
        @${ECHO} ${FULL_COMPONENT}: Module built (RAM)

install: ${RAM_MODULE} o.dirs
        ${CP} ${RAM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${FULL_COMPONENT}: Module installed (RAM)

ramtrace: ${DBG_MODULE} o.dirs
        @${ECHO} ${FULL_COMPONENT}: Module built (TRACE)

rom: ${ROM_MODULE} o.dirs
        @${ECHO} ${FULL_COMPONENT}: Module built (ROM)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${FULL_COMPONENT}: Module installed (ROM)

resources: ${RESOURCEFILES}
        ${MKDIR} ${RESDIR}
        ${MKDIR} ${RESDIR}.CMYK
        ${MKDIR} ${RESDIR}.HSV
        ${MKDIR} ${RESDIR}.RGB
        ${CP} Resources.CMYK.Messages   ${RESDIR}.CMYK.Messages  ${CPFLAGS}
        ${CP} Resources.CMYK.Templates  ${RESDIR}.CMYK.Templates ${CPFLAGS}
        ${CP} Resources.HSV.Templates   ${RESDIR}.HSV.Templates  ${CPFLAGS}
        ${CP} Resources.HSV.Messages    ${RESDIR}.HSV.Messages   ${CPFLAGS}
        ${CP} Resources.RGB.Templates   ${RESDIR}.RGB.Templates  ${CPFLAGS}
        ${CP} Resources.RGB.Messages    ${RESDIR}.RGB.Messages   ${CPFLAGS}
        ${CP} Resources.MergedMsgs      ${RESDIR}.Messages       ${CPFLAGS}
        ${CP} Resources.Sprites         ${RESDIR}.Sprites        ${CPFLAGS}
        ${CP} Resources.Templates       ${RESDIR}.Templates      ${CPFLAGS}
        @${ECHO} ${FULL_COMPONENT}: resources copied to Messages module

clean:
        ${WIPE} o ${WFLAGS}
        ${WIPE} od ${WFLAGS}
        ${WIPE} or ${WFLAGS}
        ${WIPE} aof ${WFLAGS}
        ${WIPE} rm ${WFLAGS}
        ${WIPE} h.header ${WFLAGS}
        ${WIPE} linked ${WFLAGS}
        ${WIPE} icons ${WFLAGS}
        ${WIPE} Resources.MergedMsgs ${WFLAGS}
        @${ECHO} ${FULL_COMPONENT}: cleaned

export:
        ${CP} hdr.ColourPick ${EXP_HDR}.ColourPick ${CPFLAGS}
        @${ECHO} ${FULL_COMPONENT}: export complete

rom_link:
        ${MKDIR} linked
        ${LD} -o linked.${COMPONENT} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom_link complete

BBETYPE = picker
bbe-picker: bbe-generic
        BBE_Export_Dir Resources

#
# Static dependencies:
#
ifeq (${OPTIONS},-DNO_INTERNATIONAL_HELP)                  
Resources.MergedMsgs:
        ${CP} Resources.Messages  Resources.MergedMsgs    ${CPFLAGS}
else
Resources.MergedMsgs:
        ${FAPPEND} Resources.MergedMsgs Resources.Messages Resources.CmdHelp
endif

o.dirs:
        ${MKDIR} o
        ${MKDIR} od
        ${MKDIR} or
        ${MKDIR} icons
        ${MKDIR} icons.h
        ${TOUCH} $@

o.msgs: ${RESOURCEFILES}
        ${RESGEN} resourcefs_files $@ \
 Resources.CMYK.Messages   ${RESFSDIR}.CMYK.Messages    \
 Resources.CMYK.Templates  ${RESFSDIR}.CMYK.Templates   \
 Resources.HSV.Templates   ${RESFSDIR}.HSV.Templates    \
 Resources.HSV.Messages    ${RESFSDIR}.HSV.Messages     \
 Resources.RGB.Templates   ${RESFSDIR}.RGB.Templates    \
 Resources.RGB.Messages    ${RESFSDIR}.RGB.Messages     \
 Resources.MergedMsgs      ${RESFSDIR}.Messages         \
 Resources.Sprites         ${RESFSDIR}.Sprites          \
 Resources.Templates       ${RESFSDIR}.Templates

#
# Targets
#
${RAM_MODULE}:  ${RAM_OBJS} ${CLIB} ${OSLIB} ${ICONS} ${ASMUTILS}
        ${MKDIR} rm
        $(LD) -o $@ -rmf ${RAM_OBJS} ${CLIB} ${OSLIB} ${ASMUTILS}
        ${MODSQZ} $@

${ROM_MODULE}:  ${ROM_OBJS} ${OSLIB} ${ROMCSTUBS} ${ICONS} ${ASMUTILS}
        ${MKDIR} aof
        $(LD) -o $@ -aof ${ROM_OBJS} ${OSLIB} ${ROMCSTUBS} ${ASMUTILS}

${DBG_MODULE}:  ${DBG_OBJS} ${CLIB} ${OSLIB} ${ICONS} ${ASMUTILS}
        ${MKDIR} rm
        $(LD) -o $@ -rmf ${DBG_OBJS} ${OSLIB} ${CLIB} ${ASMUTILS}

include Depends
