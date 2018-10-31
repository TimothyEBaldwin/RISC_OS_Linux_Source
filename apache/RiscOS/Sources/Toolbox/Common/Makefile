# Copyright 1996 Acorn Computers Ltd
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
# Makefile for tboxlib and debuglib
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 09 Oct 1997  RWB        Tidied up old Toolbox.Common build
#

#
# Paths
#
LIBDIR  = <Lib$Dir>
EXP_HDR = <export$dir>

#
# Generic options:
#
MKDIR   = do mkdir -p
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = -wipe
XWIPE   = x wipe
CD      = dir
LIBFILE = libfile

CFLAGS   = -c -depend !Depend -Wap -zps0 ${INCLUDES} -ffah ${DFLAGS}
CFLAGSZM = -c -depend !Depend -Wap -zps1 ${INCLUDES} -ffah ${DFLAGS} -zM
CPFLAGS  = ~cfr~v
WFLAGS   = ~c~v
LIBFILEFLAGS = -c -o $@

CCZM=           ${CC} ${CFLAGSZM}

#
# Libraries
#
CLIB            = CLIB:o.stubs
RLIB            = RISCOSLIB:o.risc_oslib
RSTUBS          = RISCOSLIB:o.rstubs
ROMSTUBS        = RISCOSLIB:o.romstubs
ROMCSTUBS       = RISCOSLIB:o.romcstubs
ABSSYM          = RISC_OSLib:o.AbsSym
#
# Include files
#
INCLUDES        = -IC:,<Lib$Dir>.tboxlibint.
DFLAGS          =

# Program specific options:
#
TBOXLIB   = tboxlib
TBOXLIBZM = tboxlibm
DEBUGLIB  = debuglib
DEBUGLIBZM = debuglibm

EXPORTS     = ${LIBDIR}.tboxlibint

OBJ      = o.mem o.messages o.string32 o.rmensure o.objmodule o.objsupport o.slist o.toolboxmem
OBJZM    = z.mem z.messages z.string32 z.rmensure z.objmodule z.objsupport z.slist z.toolboxmem

DBG_OBJ   = o.debug
DBG_OBJZM = z.debug

#
# Rule patterns
#
.SUFFIXES: .z .o .c .s
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.c.z:;      ${CCZM} -c -o $@ $<
.s.o:;      ${AS} ${ASFLAGS} -o $@ $<
.s.z:;      ${AS} ${ASFLAGS} -o $@ $<

#
# Build
#

${TBOXLIB}: ${OBJ}
   ${LIBFILE} ${LIBFILEFLAGS} ${OBJ}

${TBOXLIBZM}: ${OBJZM}
   ${LIBFILE} ${LIBFILEFLAGS} ${OBJZM}

${DEBUGLIB}: ${OBJ} ${DBG_OBJ}
   ${LIBFILE} ${LIBFILEFLAGS} ${OBJ} ${DBG_OBJ}

${DEBUGLIBZM}: ${OBJZM} ${DBG_OBJZM}
   ${LIBFILE} ${LIBFILEFLAGS} ${OBJZM} ${DBG_OBJZM}

clean: dirs
        ${XWIPE} o.* ${WFLAGS}
        ${XWIPE} z.* ${WFLAGS}
        ${XWIPE} ${DEBUGLIB} ${WFLAGS}
        ${XWIPE} ${DEBUGLIBZM} ${WFLAGS}
        ${XWIPE} ${TBOXLIB} ${WFLAGS}
        ${XWIPE} ${TBOXLIBZM} ${WFLAGS}
        @echo ${DEBUGLIB} and ${TBOXLIB}: cleaned

export: export_${PHASE}

export_hdrs: dirs
        ${CP} objects   ${EXPORTS}.objects   ${CPFLAGS}
        ${CP} h.*       ${EXPORTS}.h.*   ${CPFLAGS}
        ${CP} hdr.*     ${EXP_HDR}.*    ${CPFLAGS}
        ${CP} VersionNum ${EXPORTS}.LibVersion ${CPFLAGS}
        @echo ${DEBUGLIB} and ${TBOXLIB}: export complete (hdrs)

export_libs: ${TBOXLIB} ${TBOXLIBZM} ${DEBUGLIB} ${DEBUGLIBZM} dirs
        ${CP} ${TBOXLIB}    ${EXPORTS}.o.${TBOXLIB}    ${CPFLAGS}
        ${CP} ${TBOXLIBZM}  ${EXPORTS}.o.${TBOXLIBZM}  ${CPFLAGS}
        ${CP} ${DEBUGLIB} ${EXPORTS}.o.${DEBUGLIB} ${CPFLAGS}
        ${CP} ${DEBUGLIBZM} ${EXPORTS}.o.${DEBUGLIBZM} ${CPFLAGS}
        @echo ${DEBUGLIB} and ${TBOXLIB}: export complete (libs)


dirs:
        ${MKDIR} ${LIBDIR}
        ${MKDIR} ${EXPORTS}
        ${MKDIR} ${EXPORTS}.h
        ${MKDIR} ${EXPORTS}.o
#
# Dynamic dependencies:
