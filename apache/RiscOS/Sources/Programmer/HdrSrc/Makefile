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
# Makefile for Global Assembler Header files
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 26-May-94  AMcC   Created.
# 28-Jul-94  AMcC   removed build rules for h.swis (done by RISC_OSLib)
# 11-Aug-94  AMcC   Don't create an Arthur directory in Export.Hdr.Global
# 19-Oct-94  AMcC   Export ImageSize hdrs
# 31-Oct-94  AMcC   Export IO.IOMDL (IOMD for Morris)
# 03-Dec-96  RWB    Don't derive headers, import them instead.
# 21-Aug-99  SNB    Restored derived headers now that our master copies
#                   are in CVS. Added use of OPTIONS=ALL to force all
#                   Machine and ImageSize headers to be exported.
# 24-Aug 99  SBF    Added export of C headers, and support for StripDepnd tool
# 25-Aug 99  SBF    Created "Register.Keyboard"; added this to makefile
# 11-Jan-00  BJGA   Exports Global.IO.h.GenericIO
# 28-Jan-00  BJGA   Exports Global.IO.h.IOMD
# 23-Feb-01  SBF    Exports Hdr:UserIF.UserIF plus UI-specific files; added to this makefile
# 28-Aug-02  KJB    Added Hdr:GraphicsV

#
# Paths
#
ifeq ("${MAKECMDGOALS}","install")
INSTDIR ?= <Install$Dir>.Export.<APCS>
TOPDIR   = ${INSTDIR}.Hdr
HDRDIR   = ${TOPDIR}.Global
HDIR     = ${INSTDIR}.C
LIBDIR   = ${INSTDIR}.Lib
else
# i.e. this is an export phase, not install
TOPDIR  = <hdr$dir>
HDRDIR  = ${TOPDIR}.Global
HDIR    = <CExport$dir>
LIBDIR  = <Lib$Dir>
endif

include StdTools

#
# Program specific options:
#
COMPONENT = HdrSrc

EXPORTS   = \
 ${HDRDIR}.APCS.<APCS> \
 ${HDRDIR}.APCS.Common \
 ${HDRDIR}.AUN \
 ${HDRDIR}.CMOS \
 ${HDRDIR}.Countries \
 ${HDRDIR}.CPU.Arch \
 ${HDRDIR}.CPU.ARM600 \
 ${HDRDIR}.CPU.FPA \
 ${HDRDIR}.CPU.Generic26 \
 ${HDRDIR}.CPU.Generic32 \
 ${HDRDIR}.DDVMacros \
 ${HDRDIR}.Debug \
 ${HDRDIR}.Devices \
 ${HDRDIR}.DevNos \
 ${HDRDIR}.DrawObj \
 ${HDRDIR}.ExtraLong \
 ${HDRDIR}.FDC.FDC711 \
 ${HDRDIR}.FileTypes \
 ${HDRDIR}.FSNumbers \
 ${HDRDIR}.GraphicsV \
 ${HDRDIR}.HALSize.<HALSize> \
 ${HDRDIR}.Heap \
 ${HDRDIR}.ImageSize.<ImageSize> \
 ${HDRDIR}.IO.GenericIO \
 ${HDRDIR}.IO.IOC \
 ${HDRDIR}.IO.IOC-A1 \
 ${HDRDIR}.IO.IOEB \
 ${HDRDIR}.IO.IOMD \
 ${HDRDIR}.IO.IOMDL \
 ${HDRDIR}.Keyboard \
 ${HDRDIR}.ListOpts \
 ${HDRDIR}.MEMM.ARM600 \
 ${HDRDIR}.MEMM.MEMC1 \
 ${HDRDIR}.MEMM.VMSAv6 \
 ${HDRDIR}.Machine.<Machine> \
 ${HDRDIR}.Machine.All \
 ${HDRDIR}.Machine.All32 \
 ${HDRDIR}.Machine.Machine \
 ${HDRDIR}.Macros \
 ${HDRDIR}.Messages \
 ${HDRDIR}.NdrDebug \
 ${HDRDIR}.NewErrors \
 ${HDRDIR}.OsBytes \
 ${HDRDIR}.OsWords \
 ${HDRDIR}.PaletteV \
 ${HDRDIR}.PDriverReg \
 ${HDRDIR}.PDumperReg \
 ${HDRDIR}.PoduleReg \
 ${HDRDIR}.Pointer \
 ${HDRDIR}.Proc \
 ${HDRDIR}.Services \
 ${HDRDIR}.Sprite \
 ${HDRDIR}.Symbols \
 ${HDRDIR}.System \
 ${HDRDIR}.SWIs \
 ${HDRDIR}.Tokens \
 ${HDRDIR}.UpCall \
 ${HDRDIR}.UserIF.<UserIF> \
 ${HDRDIR}.UserIF.UserIF \
 ${HDRDIR}.VIDC.VIDC1a \
 ${HDRDIR}.VIDC.VIDC20 \
 ${HDIR}.Global.h.AUN \
 ${HDIR}.Global.h.CMOS \
 ${HDIR}.Global.h.Countries \
 ${HDIR}.Global.h.Devices \
 ${HDIR}.Global.h.DevNos \
 ${HDIR}.Global.h.DrawObj \
 ${HDIR}.Global.h.EnvNumbers \
 ${HDIR}.Global.h.FileTypes \
 ${HDIR}.Global.h.FreewayReg \
 ${HDIR}.Global.h.FSNumbers \
 ${HDIR}.Global.h.GraphicsV \
 ${HDIR}.Global.h.Heap \
 ${HDIR}.Global.h.Keyboard \
 ${HDIR}.Global.h.NewErrors \
 ${HDIR}.Global.h.OsBytes \
 ${HDIR}.Global.h.OsWords \
 ${HDIR}.Global.h.PaletteV \
 ${HDIR}.Global.h.PDriverReg \
 ${HDIR}.Global.h.PDumperReg \
 ${HDIR}.Global.h.PoduleReg \
 ${HDIR}.Global.h.Pointer \
 ${HDIR}.Global.h.Services \
 ${HDIR}.Global.h.Sprite \
 ${HDIR}.Global.h.SWIs \
 ${HDIR}.Global.h.Upcall \
 ${HDIR}.Global.h.Tokens \
 ${HDIR}.Global.h.IOCtl \
 ${HDIR}.Global.IO.h.GenericIO \
 ${HDIR}.Global.IO.h.IOMD \

#
# Generic rules:
#

export: ${OPTIONS} ${EXPORTS} Dirs
ifeq ("${OPTIONS}","")
        @echo ${COMPONENT}: export complete
else
        @echo ${COMPONENT}: export complete (${OPTIONS})
endif

Dirs:
        @echo TOPDIR ${TOPDIR}
        @echo HDRDIR ${HDRDIR}
        @echo HDIR   ${HDIR}
        @echo LIBDIR ${LIBDIR}
        ${MKDIR} ${HDRDIR}
        ${MKDIR} ${TOPDIR}.Interface
        ${MKDIR} ${TOPDIR}.Interface2
        ${MKDIR} ${HDRDIR}.APCS
        ${MKDIR} ${HDRDIR}.CPU
        ${MKDIR} ${HDRDIR}.FDC
        ${MKDIR} ${HDRDIR}.HALSize
        ${MKDIR} ${HDRDIR}.IO
        ${MKDIR} ${HDRDIR}.ImageSize
        ${MKDIR} ${HDRDIR}.Machine
        ${MKDIR} ${HDRDIR}.MEMM
        ${MKDIR} ${HDRDIR}.UserIF
        ${MKDIR} ${HDRDIR}.VIDC
        ${MKDIR} ${HDIR}.h
        ${MKDIR} ${HDIR}.o
        ${MKDIR} ${HDIR}.Global.h
        ${MKDIR} ${HDIR}.Global.IO.h
        ${MKDIR} ${HDIR}.Interface.h
        ${MKDIR} ${LIBDIR}

install: ${OPTIONS} ${EXPORTS} Dirs
ifeq ("${OPTIONS}","")
        @echo ${COMPONENT}: installed
else
        @echo ${COMPONENT}: installed (${OPTIONS})
endif

clean:
        @echo ${COMPONENT}: nothing to clean

#
# Special rule for exporting all ImageSize, Machine and UserIF files.
# Trigger by invoking the export (or install) phase with OPTIONS=ALL.
#
ALL: ${HDRDIR}.Machine.Machine ${HDRDIR}.UserIF.UserIF ${HDRDIR}.HALSize.<HALSize> ${HDRDIR}.ImageSize.<ImageSize> ${HDRDIR}.APCS.<APCS>
        ${CP} hdr.Machine ${HDRDIR}.Machine ${CPFLAGS}
        ${CP} hdr.UserIF ${HDRDIR}.UserIF ${CPFLAGS}
        ${CP} hdr.HALSize ${HDRDIR}.HALSize ${CPFLAGS}
        ${CP} hdr.ImageSize ${HDRDIR}.ImageSize ${CPFLAGS}
        ${CP} hdr.APCS ${HDRDIR}.APCS ${CPFLAGS}

#
# Rules for exporting:
#

# Registration headers:
${HDRDIR}.AUN:        hdr.AUN;         ${CP} hdr.AUN        $@ ${CPFLAGS}
${HDRDIR}.Countries:  hdr.Countries;   ${CP} hdr.Countries  $@ ${CPFLAGS}
${HDRDIR}.Devices:    hdr.Devices;     ${CP} hdr.Devices    $@ ${CPFLAGS}
${HDRDIR}.DevNos:     hdr.DevNos;      ${CP} hdr.DevNos     $@ ${CPFLAGS}
${HDRDIR}.DrawObj:    hdr.DrawObj;     ${CP} hdr.DrawObj    $@ ${CPFLAGS}
${HDRDIR}.FileTypes:  hdr.FileTypes;   ${CP} hdr.FileTypes  $@ ${CPFLAGS}
${HDRDIR}.FSNumbers:  hdr.FSNumbers;   ${CP} hdr.FSNumbers  $@ ${CPFLAGS}
${HDRDIR}.GraphicsV:  hdr.GraphicsV;   ${CP} hdr.GraphicsV  $@ ${CPFLAGS}
${HDRDIR}.Keyboard:   hdr.Keyboard;    ${CP} hdr.Keyboard   $@ ${CPFLAGS}
${HDRDIR}.Messages:   hdr.Messages;    ${CP} hdr.Messages   $@ ${CPFLAGS}
${HDRDIR}.NewErrors:  hdr.NewErrors;   ${CP} hdr.NewErrors  $@ ${CPFLAGS}
${HDRDIR}.OsBytes:    hdr.OsBytes;     ${CP} hdr.OsBytes    $@ ${CPFLAGS}
${HDRDIR}.OsWords:    hdr.OsWords;     ${CP} hdr.OsWords    $@ ${CPFLAGS}
${HDRDIR}.PaletteV:   hdr.PaletteV;    ${CP} hdr.PaletteV   $@ ${CPFLAGS}
${HDRDIR}.PDriverReg: hdr.PDriverReg;  ${CP} hdr.PDriverReg $@ ${CPFLAGS}
${HDRDIR}.PDumperReg: hdr.PDumperReg;  ${CP} hdr.PDumperReg $@ ${CPFLAGS}
${HDRDIR}.PoduleReg:  hdr.PoduleReg;   ${CP} hdr.PoduleReg  $@ ${CPFLAGS}
${HDRDIR}.Pointer:    hdr.Pointer;     ${CP} hdr.Pointer    $@ ${CPFLAGS}
${HDRDIR}.Services:   hdr.Services;    ${CP} hdr.Services   $@ ${CPFLAGS}
${HDRDIR}.SWIs:       hdr.SWIs;        ${CP} hdr.SWIs       $@ ${CPFLAGS}
${HDRDIR}.UpCall:     hdr.UpCall;      ${CP} hdr.UpCall     $@ ${CPFLAGS}

# The C versions of registration headers:
${HDIR}.Global.h.AUN:        hdr.AUN;         ${HDR2H} hdr.AUN        $@
${HDIR}.Global.h.Countries:  hdr.Countries;   ${HDR2H} hdr.Countries  $@
${HDIR}.Global.h.Devices:    hdr.Devices;     ${HDR2H} hdr.Devices    $@
${HDIR}.Global.h.DevNos:     hdr.DevNos;      ${HDR2H} hdr.DevNos     $@
${HDIR}.Global.h.DrawObj:    hdr.DrawObj;     ${HDR2H} hdr.DrawObj    $@
${HDIR}.Global.h.EnvNumbers: hdr.EnvNumbers;  ${HDR2H} hdr.EnvNumbers $@
${HDIR}.Global.h.FileTypes:  hdr.FileTypes;   ${HDR2H} hdr.FileTypes  $@
${HDIR}.Global.h.FreewayReg: hdr.FreewayReg;  ${HDR2H} hdr.FreewayReg $@
${HDIR}.Global.h.FSNumbers:  hdr.FSNumbers;   ${HDR2H} hdr.FSNumbers  $@
${HDIR}.Global.h.GraphicsV:  hdr.GraphicsV;   ${HDR2H} hdr.GraphicsV  $@
${HDIR}.Global.h.Keyboard:   hdr.Keyboard;    ${HDR2H} hdr.Keyboard   $@
${HDIR}.Global.h.Messages:   hdr.Messages;    ${HDR2H} hdr.Messages   $@
${HDIR}.Global.h.NewErrors:  hdr.NewErrors;   ${HDR2H} hdr.NewErrors  $@
# NewErrors still has a few problems.  Partial support is there.
${HDIR}.Global.h.OsBytes:    hdr.OsBytes;     ${HDR2H} hdr.OsBytes    $@
${HDIR}.Global.h.OsWords:    hdr.OsWords;     ${HDR2H} hdr.OsWords    $@
${HDIR}.Global.h.PaletteV:   hdr.PaletteV;    ${HDR2H} hdr.PaletteV   $@
${HDIR}.Global.h.PDriverReg: hdr.PDriverReg;  ${HDR2H} hdr.PDriverReg $@
${HDIR}.Global.h.PDumperReg: hdr.PDumperReg;  ${HDR2H} hdr.PDumperReg $@
${HDIR}.Global.h.PoduleReg:  hdr.PoduleReg;   ${HDR2H} hdr.PoduleReg  $@
${HDIR}.Global.h.Pointer:    hdr.Pointer;     ${HDR2H} hdr.Pointer    $@
${HDIR}.Global.h.Services:   hdr.Services;    ${HDR2H} hdr.Services   $@
${HDIR}.Global.h.SWIs:       hdr.SWIs;        ${HDR2H} hdr.SWIs       $@
${HDIR}.Global.h.UpCall:     hdr.UpCall;      ${HDR2H} hdr.UpCall     $@


# The C versions of local header files.
# Files which don't work yet:
#   No files remaining which do not work at all.
# Files which work with some warnings (which indicate incorrect constants have been declared)
#   Sprite
# Files which have no equivalent.
#   DDVMacros   Debug       ExtraLong   ListOpts    Macros      NdrDebug    Proc        Symbols
${HDIR}.Global.h.Heap:         hdr.Heap;         ${HDR2H} hdr.Heap         $@
${HDIR}.Global.h.Sprite:       hdr.Sprite;       ${HDR2H} hdr.Sprite       $@
${HDIR}.Global.h.Tokens:       hdr.Tokens;       ${HDR2H} hdr.Tokens       $@
${HDIR}.Global.h.CMOS:         hdr.CMOS;         ${HDR2H} hdr.CMOS         $@
${HDIR}.Global.IO.h.GenericIO: hdr.IO.GenericIO; ${HDR2H} hdr.IO.GenericIO $@
${HDIR}.Global.IO.h.IOMD:      hdr.IO.IOMD;      ${HDR2H} hdr.IO.IOMD      $@


# C headers:
${HDIR}.Global.h.IOCtl:      h.IOCtl;               ${CP} h.IOCtl                  $@ ${CPFLAGS}

# Machine/UI/hardware specific headers:
${HDRDIR}.Machine.<Machine>: hdr.Machine.<Machine>; ${CP} hdr.Machine.<Machine>    $@ ${CPFLAGS}
${HDRDIR}.Machine.All:       hdr.Machine.All;       ${CP} hdr.Machine.All          $@ ${CPFLAGS}
${HDRDIR}.Machine.All32:     hdr.Machine.All32;     ${CP} hdr.Machine.All32        $@ ${CPFLAGS}
${HDRDIR}.Machine.Machine:   hdr.Machine.Machine;   ${CP} hdr.Machine.Machine      $@ ${CPFLAGS}
${HDRDIR}.HALSize.<HALSize>: hdr.HALSize.<HALSize>; ${CP} hdr.HALSize.<HALSize>    $@ ${CPFLAGS}
${HDRDIR}.ImageSize.<ImageSize>: hdr.ImageSize.<ImageSize>; ${CP} hdr.ImageSize.<ImageSize> $@ ${CPFLAGS}
${HDRDIR}.APCS.<APCS>:       hdr.APCS.<APCS>;       ${CP} hdr.APCS.<APCS>          $@ ${CPFLAGS}
${HDRDIR}.APCS.Common:       hdr.APCS.Common;       ${CP} hdr.APCS.Common          $@ ${CPFLAGS}
${HDRDIR}.CPU.Arch:          hdr.CPU.Arch;          ${CP} hdr.CPU.Arch             $@ ${CPFLAGS}
${HDRDIR}.CPU.ARM600:        hdr.CPU.ARM600;        ${CP} hdr.CPU.ARM600           $@ ${CPFLAGS}
${HDRDIR}.CPU.FPA:           hdr.CPU.FPA;           ${CP} hdr.CPU.FPA              $@ ${CPFLAGS}
${HDRDIR}.CPU.Generic26:     hdr.CPU.Generic26;     ${CP} hdr.CPU.Generic26        $@ ${CPFLAGS}
${HDRDIR}.CPU.Generic32:     hdr.CPU.Generic32;     ${CP} hdr.CPU.Generic32        $@ ${CPFLAGS}
${HDRDIR}.FDC.FDC711:        hdr.FDC.FDC711;        ${CP} hdr.FDC.FDC711           $@ ${CPFLAGS}
${HDRDIR}.IO.GenericIO:      hdr.IO.GenericIO;      ${CP} hdr.IO.GenericIO         $@ ${CPFLAGS}
${HDRDIR}.IO.IOC:            hdr.IO.IOC;            ${CP} hdr.IO.IOC               $@ ${CPFLAGS}
${HDRDIR}.IO.IOC-A1:         hdr.IO.IOC-A1;         ${CP} hdr.IO.IOC-A1            $@ ${CPFLAGS}
${HDRDIR}.IO.IOEB:           hdr.IO.IOEB;           ${CP} hdr.IO.IOEB              $@ ${CPFLAGS}
${HDRDIR}.IO.IOMD:           hdr.IO.IOMD;           ${CP} hdr.IO.IOMD              $@ ${CPFLAGS}
${HDRDIR}.IO.IOMDL:          hdr.IO.IOMDL;          ${CP} hdr.IO.IOMDL             $@ ${CPFLAGS}
${HDRDIR}.MEMM.ARM600:       hdr.MEMM.ARM600;       ${CP} hdr.MEMM.ARM600          $@ ${CPFLAGS}
${HDRDIR}.MEMM.MEMC1:        hdr.MEMM.MEMC1;        ${CP} hdr.MEMM.MEMC1           $@ ${CPFLAGS}
${HDRDIR}.MEMM.VMSAv6:       hdr.MEMM.VMSAv6;       ${CP} hdr.MEMM.VMSAv6          $@ ${CPFLAGS}
${HDRDIR}.VIDC.VIDC1a:       hdr.VIDC.VIDC1a;       ${CP} hdr.VIDC.VIDC1a          $@ ${CPFLAGS}
${HDRDIR}.VIDC.VIDC20:       hdr.VIDC.VIDC20;       ${CP} hdr.VIDC.VIDC20          $@ ${CPFLAGS}

# User interface specific headers:
${HDRDIR}.UserIF.<UserIF>:   hdr.UserIF.<UserIF>;   ${CP} hdr.UserIF.<UserIF>      $@ ${CPFLAGS}
${HDRDIR}.UserIF.UserIF:     hdr.UserIF.UserIF;     ${CP} hdr.UserIF.UserIF        $@ ${CPFLAGS}

# Macros:
${HDRDIR}.DDVMacros:         hdr.DDVMacros;         ${CP} hdr.DDVMacros            $@ ${CPFLAGS}
${HDRDIR}.Debug:             hdr.Debug;             ${CP} hdr.Debug                $@ ${CPFLAGS}
${HDRDIR}.ExtraLong:         hdr.ExtraLong;         ${CP} hdr.ExtraLong            $@ ${CPFLAGS}
${HDRDIR}.Macros:            hdr.Macros;            ${CP} hdr.Macros               $@ ${CPFLAGS}
${HDRDIR}.NdrDebug:          hdr.NdrDebug;          ${CP} hdr.NdrDebug             $@ ${CPFLAGS}
${HDRDIR}.Proc:              hdr.Proc;              ${CP} hdr.Proc                 $@ ${CPFLAGS}

# The rest:
${HDRDIR}.CMOS:              hdr.CMOS;              ${CP} hdr.CMOS                 $@ ${CPFLAGS}
${HDRDIR}.Heap:              hdr.Heap;              ${CP} hdr.Heap                 $@ ${CPFLAGS}
${HDRDIR}.ListOpts:          hdr.ListOpts;          ${CP} hdr.ListOpts             $@ ${CPFLAGS}
${HDRDIR}.Sprite:            hdr.Sprite;            ${CP} hdr.Sprite               $@ ${CPFLAGS}
${HDRDIR}.Symbols:           hdr.Symbols;           ${CP} hdr.Symbols              $@ ${CPFLAGS}
${HDRDIR}.System:            hdr.System;            ${CP} hdr.System               $@ ${CPFLAGS}
${HDRDIR}.Tokens:            hdr.Tokens;            ${CP} hdr.Tokens               $@ ${CPFLAGS}

# Dynamic dependencies:
