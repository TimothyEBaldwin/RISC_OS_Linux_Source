# Cross-compiling makefile for Global Assembler Header files
#
# Where the native makefile uses TOPDIR we retain !Common's name HDRDIR
# Where the native makefile uses HDRDIR we use !Common's name GLOBALHDRDIR 
# Where the native makefile uses HDIR we use !Common's name CEXPORTDIR

#
# Paths
#
ifeq ("${MAKECMDGOALS}","install")
APCSEXPORTDIR = ${INSTDIR}
endif

ifeq ("${INCLUDED_STDTOOLS}","")
include StdTools
endif

# Until every single component that uses our headers (pretty much everything
# that uses assembly!) is converted to use the shared makefiles, or is
# otherwise modified to pass the appropriate paths to the headers to objasm
# via the -I switch, native builds will require the headers to continue to
# use RISC OS specific paths. However, these will not work when cross-
# compiling. Instead, we do the conversion during the export phase, for
# cross-compiling builds only, by overriding the ${CP} tool.

CP = @process () { echo process $$1 $$2; sed -e 's,Hdr:\([^.]*\)\.,\1/,g' -e 's,Hdr:,,g' -e 's,<Machine>,$$Machine,g' < $$1 > $$2; }; process

#
# Program specific options:
#
COMPONENT = HdrSrc

EXPORTS   = \
 ${GLOBALHDRDIR}/APCS/${APCS} \
 ${GLOBALHDRDIR}/APCS/Common \
 ${GLOBALHDRDIR}/AUN \
 ${GLOBALHDRDIR}/CMOS \
 ${GLOBALHDRDIR}/Countries \
 ${GLOBALHDRDIR}/CPU/Arch \
 ${GLOBALHDRDIR}/CPU/ARM600 \
 ${GLOBALHDRDIR}/CPU/FPA \
 ${GLOBALHDRDIR}/CPU/Generic26 \
 ${GLOBALHDRDIR}/CPU/Generic32 \
 ${GLOBALHDRDIR}/DDVMacros \
 ${GLOBALHDRDIR}/Debug \
 ${GLOBALHDRDIR}/Devices \
 ${GLOBALHDRDIR}/DevNos \
 ${GLOBALHDRDIR}/DrawObj \
 ${GLOBALHDRDIR}/ExtraLong \
 ${GLOBALHDRDIR}/FDC/FDC711 \
 ${GLOBALHDRDIR}/FileTypes \
 ${GLOBALHDRDIR}/FSNumbers \
 ${GLOBALHDRDIR}/GraphicsV \
 ${GLOBALHDRDIR}/HALSize/${HALSIZE} \
 ${GLOBALHDRDIR}/Heap \
 ${GLOBALHDRDIR}/ImageSize/${IMAGESIZE} \
 ${GLOBALHDRDIR}/IO/GenericIO \
 ${GLOBALHDRDIR}/IO/IOC \
 ${GLOBALHDRDIR}/IO/IOC-A1 \
 ${GLOBALHDRDIR}/IO/IOEB \
 ${GLOBALHDRDIR}/IO/IOMD \
 ${GLOBALHDRDIR}/IO/IOMDL \
 ${GLOBALHDRDIR}/Keyboard \
 ${GLOBALHDRDIR}/ListOpts \
 ${GLOBALHDRDIR}/MEMM/ARM600 \
 ${GLOBALHDRDIR}/MEMM/MEMC1 \
 ${GLOBALHDRDIR}/MEMM/VMSAv6 \
 ${GLOBALHDRDIR}/Machine/${MACHINE} \
 ${GLOBALHDRDIR}/Machine/All \
 ${GLOBALHDRDIR}/Machine/All32 \
 ${GLOBALHDRDIR}/Machine/Machine \
 ${GLOBALHDRDIR}/Macros \
 ${GLOBALHDRDIR}/Messages \
 ${GLOBALHDRDIR}/NdrDebug \
 ${GLOBALHDRDIR}/NewErrors \
 ${GLOBALHDRDIR}/OsBytes \
 ${GLOBALHDRDIR}/OsWords \
 ${GLOBALHDRDIR}/PaletteV \
 ${GLOBALHDRDIR}/PDriverReg \
 ${GLOBALHDRDIR}/PDumperReg \
 ${GLOBALHDRDIR}/PoduleReg \
 ${GLOBALHDRDIR}/Pointer \
 ${GLOBALHDRDIR}/Proc \
 ${GLOBALHDRDIR}/Services \
 ${GLOBALHDRDIR}/Sprite \
 ${GLOBALHDRDIR}/Symbols \
 ${GLOBALHDRDIR}/System \
 ${GLOBALHDRDIR}/SWIs \
 ${GLOBALHDRDIR}/Tokens \
 ${GLOBALHDRDIR}/UpCall \
 ${GLOBALHDRDIR}/UserIF/${USERIF} \
 ${GLOBALHDRDIR}/UserIF/UserIF \
 ${GLOBALHDRDIR}/VIDC/VIDC1a \
 ${GLOBALHDRDIR}/VIDC/VIDC20 \
 ${CEXPORTDIR}/Global/AUN.h \
 ${CEXPORTDIR}/Global/CMOS.h \
 ${CEXPORTDIR}/Global/Countries.h \
 ${CEXPORTDIR}/Global/Devices.h \
 ${CEXPORTDIR}/Global/DevNos.h \
 ${CEXPORTDIR}/Global/DrawObj.h \
 ${CEXPORTDIR}/Global/EnvNumbers.h \
 ${CEXPORTDIR}/Global/FileTypes.h \
 ${CEXPORTDIR}/Global/FreewayReg.h \
 ${CEXPORTDIR}/Global/FSNumbers.h \
 ${CEXPORTDIR}/Global/GraphicsV.h \
 ${CEXPORTDIR}/Global/Heap.h \
 ${CEXPORTDIR}/Global/Keyboard.h \
 ${CEXPORTDIR}/Global/NewErrors.h \
 ${CEXPORTDIR}/Global/OsBytes.h \
 ${CEXPORTDIR}/Global/OsWords.h \
 ${CEXPORTDIR}/Global/PaletteV.h \
 ${CEXPORTDIR}/Global/PDriverReg.h \
 ${CEXPORTDIR}/Global/PDumperReg.h \
 ${CEXPORTDIR}/Global/PoduleReg.h \
 ${CEXPORTDIR}/Global/Pointer.h \
 ${CEXPORTDIR}/Global/Services.h \
 ${CEXPORTDIR}/Global/Sprite.h \
 ${CEXPORTDIR}/Global/SWIs.h \
 ${CEXPORTDIR}/Global/UpCall.h \
 ${CEXPORTDIR}/Global/Tokens.h \
 ${CEXPORTDIR}/Global/IOCtl.h \
 ${CEXPORTDIR}/Global/IO/GenericIO.h \
 ${CEXPORTDIR}/Global/IO/IOMD.h \

#
# Generic rules:
#

export: export_${PHASE}
	${NOP}

export_: export_hdrs export_libs
	${NOP}

export_hdrs: Dirs ${EXPORTS} ${OPTIONS}
ifeq ("${OPTIONS}","")
	@echo ${COMPONENT}: header export complete
else
	@echo ${COMPONENT}: header export complete (${OPTIONS})
endif

export_libs:
	@echo ${COMPONENT}: library export complete

Dirs:
	@echo HDRDIR ${HDRDIR}
	@echo GLOBALHDRDIR ${GLOBALHDRDIR}
	@echo CEXPORTDIR   ${CEXPORTDIR}
	@echo LIBDIR ${LIBDIR}
	${MKDIR} ${GLOBALHDRDIR}
	${MKDIR} ${HDRDIR}/Interface
	${MKDIR} ${GLOBALHDRDIR}/APCS
	${MKDIR} ${GLOBALHDRDIR}/CPU
	${MKDIR} ${GLOBALHDRDIR}/FDC
	${MKDIR} ${GLOBALHDRDIR}/HALSize
	${MKDIR} ${GLOBALHDRDIR}/IO
	${MKDIR} ${GLOBALHDRDIR}/ImageSize
	${MKDIR} ${GLOBALHDRDIR}/Machine
	${MKDIR} ${GLOBALHDRDIR}/MEMM
	${MKDIR} ${GLOBALHDRDIR}/UserIF
	${MKDIR} ${GLOBALHDRDIR}/VIDC
	${MKDIR} ${CEXPORTDIR}/Global
	${MKDIR} ${CEXPORTDIR}/Global/IO
	${MKDIR} ${CEXPORTDIR}/Interface
	${MKDIR} ${LIBDIR}
	${TOUCH} $@

install: Dirs ${EXPORTS} ${OPTIONS}
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
ALL:
	for file in hdr/Machine;   do leaf=$${file##*/}; ${CP} $$file ${GLOBALHDRDIR}/Machine/$$leaf   ${CPFLAGS}; done
	for file in hdr/UserIF;    do leaf=$${file##*/}; ${CP} $$file ${GLOBALHDRDIR}/UserIF/$$leaf    ${CPFLAGS}; done
	for file in hdr/HALSize;   do leaf=$${file##*/}; ${CP} $$file ${GLOBALHDRDIR}/HALSize/$$leaf   ${CPFLAGS}; done
	for file in hdr/ImageSize; do leaf=$${file##*/}; ${CP} $$file ${GLOBALHDRDIR}/ImageSize/$$leaf ${CPFLAGS}; done
	for file in hdr/APCS;      do leaf=$${file##*/}; ${CP} $$file ${GLOBALHDRDIR}/APCS/$$leaf      ${CPFLAGS}; done

#
# Rules for exporting:
#

# Registration headers:
${GLOBALHDRDIR}/AUN:        hdr/AUN;         ${CP} hdr/AUN        $@ ${CPFLAGS}
${GLOBALHDRDIR}/Countries:  hdr/Countries;   ${CP} hdr/Countries  $@ ${CPFLAGS}
${GLOBALHDRDIR}/Devices:    hdr/Devices;     ${CP} hdr/Devices    $@ ${CPFLAGS}
${GLOBALHDRDIR}/DevNos:     hdr/DevNos;      ${CP} hdr/DevNos     $@ ${CPFLAGS}
${GLOBALHDRDIR}/DrawObj:    hdr/DrawObj;     ${CP} hdr/DrawObj    $@ ${CPFLAGS}
${GLOBALHDRDIR}/FileTypes:  hdr/FileTypes;   ${CP} hdr/FileTypes  $@ ${CPFLAGS}
${GLOBALHDRDIR}/FSNumbers:  hdr/FSNumbers;   ${CP} hdr/FSNumbers  $@ ${CPFLAGS}
${GLOBALHDRDIR}/GraphicsV:  hdr/GraphicsV;   ${CP} hdr/GraphicsV  $@ ${CPFLAGS}
${GLOBALHDRDIR}/Keyboard:   hdr/Keyboard;    ${CP} hdr/Keyboard   $@ ${CPFLAGS}
${GLOBALHDRDIR}/Messages:   hdr/Messages;    ${CP} hdr/Messages   $@ ${CPFLAGS}
${GLOBALHDRDIR}/NewErrors:  hdr/NewErrors;   ${CP} hdr/NewErrors  $@ ${CPFLAGS}
${GLOBALHDRDIR}/OsBytes:    hdr/OsBytes;     ${CP} hdr/OsBytes    $@ ${CPFLAGS}
${GLOBALHDRDIR}/OsWords:    hdr/OsWords;     ${CP} hdr/OsWords    $@ ${CPFLAGS}
${GLOBALHDRDIR}/PaletteV:   hdr/PaletteV;    ${CP} hdr/PaletteV   $@ ${CPFLAGS}
${GLOBALHDRDIR}/PDriverReg: hdr/PDriverReg;  ${CP} hdr/PDriverReg $@ ${CPFLAGS}
${GLOBALHDRDIR}/PDumperReg: hdr/PDumperReg;  ${CP} hdr/PDumperReg $@ ${CPFLAGS}
${GLOBALHDRDIR}/PoduleReg:  hdr/PoduleReg;   ${CP} hdr/PoduleReg  $@ ${CPFLAGS}
${GLOBALHDRDIR}/Pointer:    hdr/Pointer;     ${CP} hdr/Pointer    $@ ${CPFLAGS}
${GLOBALHDRDIR}/Services:   hdr/Services;    ${CP} hdr/Services   $@ ${CPFLAGS}
${GLOBALHDRDIR}/SWIs:       hdr/SWIs;        ${CP} hdr/SWIs       $@ ${CPFLAGS}
${GLOBALHDRDIR}/UpCall:     hdr/UpCall;      ${CP} hdr/UpCall     $@ ${CPFLAGS}

# The C versions of registration headers:
${CEXPORTDIR}/Global/AUN.h:        hdr/AUN;         ${HDR2H} hdr/AUN        $@
${CEXPORTDIR}/Global/Countries.h:  hdr/Countries;   ${HDR2H} hdr/Countries  $@
${CEXPORTDIR}/Global/Devices.h:    hdr/Devices;     ${HDR2H} hdr/Devices    $@
${CEXPORTDIR}/Global/DevNos.h:     hdr/DevNos;      ${HDR2H} hdr/DevNos     $@
${CEXPORTDIR}/Global/DrawObj.h:    hdr/DrawObj;     ${HDR2H} hdr/DrawObj    $@
${CEXPORTDIR}/Global/EnvNumbers.h: hdr/EnvNumbers;  ${HDR2H} hdr/EnvNumbers $@
${CEXPORTDIR}/Global/FileTypes.h:  hdr/FileTypes;   ${HDR2H} hdr/FileTypes  $@
${CEXPORTDIR}/Global/FreewayReg.h: hdr/FreewayReg;  ${HDR2H} hdr/FreewayReg $@
${CEXPORTDIR}/Global/FSNumbers.h:  hdr/FSNumbers;   ${HDR2H} hdr/FSNumbers  $@
${CEXPORTDIR}/Global/GraphicsV.h:  hdr/GraphicsV;   ${HDR2H} hdr/GraphicsV  $@
${CEXPORTDIR}/Global/Keyboard.h:   hdr/Keyboard;    ${HDR2H} hdr/Keyboard   $@
${CEXPORTDIR}/Global/Messages.h:   hdr/Messages;    ${HDR2H} hdr/Messages   $@
${CEXPORTDIR}/Global/NewErrors.h:  hdr/NewErrors;   ${HDR2H} hdr/NewErrors  $@
# NewErrors still has a few problems.  Partial support is there.
${CEXPORTDIR}/Global/OsBytes.h:    hdr/OsBytes;     ${HDR2H} hdr/OsBytes    $@
${CEXPORTDIR}/Global/OsWords.h:    hdr/OsWords;     ${HDR2H} hdr/OsWords    $@
${CEXPORTDIR}/Global/PaletteV.h:   hdr/PaletteV;    ${HDR2H} hdr/PaletteV   $@
${CEXPORTDIR}/Global/PDriverReg.h: hdr/PDriverReg;  ${HDR2H} hdr/PDriverReg $@
${CEXPORTDIR}/Global/PDumperReg.h: hdr/PDumperReg;  ${HDR2H} hdr/PDumperReg $@
${CEXPORTDIR}/Global/PoduleReg.h:  hdr/PoduleReg;   ${HDR2H} hdr/PoduleReg  $@
${CEXPORTDIR}/Global/Pointer.h:    hdr/Pointer;     ${HDR2H} hdr/Pointer    $@
${CEXPORTDIR}/Global/Services.h:   hdr/Services;    ${HDR2H} hdr/Services   $@
${CEXPORTDIR}/Global/SWIs.h:       hdr/SWIs;        ${HDR2H} hdr/SWIs       $@
${CEXPORTDIR}/Global/UpCall.h:     hdr/UpCall;      ${HDR2H} hdr/UpCall     $@


# The C versions of local header files.
# Files which don't work yet:
#   No files remaining which do not work at all.
# Files which work with some warnings (which indicate incorrect constants have been declared)
#   Sprite
# Files which have no equivalent.
#   DDVMacros   Debug       ExtraLong   ListOpts    Macros      NdrDebug    Proc        Symbols
${CEXPORTDIR}/Global/Heap.h:         hdr/Heap;         ${HDR2H} hdr/Heap         $@
${CEXPORTDIR}/Global/Sprite.h:       hdr/Sprite;       ${HDR2H} hdr/Sprite       $@
${CEXPORTDIR}/Global/Tokens.h:       hdr/Tokens;       ${HDR2H} hdr/Tokens       $@
${CEXPORTDIR}/Global/CMOS.h:         hdr/CMOS;         ${HDR2H} hdr/CMOS         $@
${CEXPORTDIR}/Global/IO/GenericIO.h: hdr/IO/GenericIO; ${HDR2H} hdr/IO/GenericIO $@
${CEXPORTDIR}/Global/IO/IOMD.h:      hdr/IO/IOMD;      ${HDR2H} hdr/IO/IOMD      $@


# C headers:
${CEXPORTDIR}/Global/IOCtl.h:      h/IOCtl;               ${CP} h/IOCtl                  $@ ${CPFLAGS}

# Machine/UI/hardware specific headers:
${GLOBALHDRDIR}/Machine/${MACHINE}: hdr/Machine/${MACHINE}; ${CP} hdr/Machine/${MACHINE} $@ ${CPFLAGS}
ifneq (${MACHINE},All)
${GLOBALHDRDIR}/Machine/All:       hdr/Machine/All;       ${CP} hdr/Machine/All          $@ ${CPFLAGS}
endif
ifneq (${MACHINE},All32)
${GLOBALHDRDIR}/Machine/All32:     hdr/Machine/All32;     ${CP} hdr/Machine/All32        $@ ${CPFLAGS}
endif
${GLOBALHDRDIR}/Machine/Machine:   hdr/Machine/Machine;   ${CP} hdr/Machine/Machine      $@ ${CPFLAGS}
${GLOBALHDRDIR}/HALSize/${HALSIZE}: hdr/HALSize/${HALSIZE}; ${CP} hdr/HALSize/${HALSIZE} $@ ${CPFLAGS}
${GLOBALHDRDIR}/ImageSize/${IMAGESIZE}: hdr/ImageSize/${IMAGESIZE}; ${CP} hdr/ImageSize/${IMAGESIZE} $@ ${CPFLAGS}
ifeq (${APCS},Host)
${GLOBALHDRDIR}/APCS/${APCS}:;     @${NOP}
else
${GLOBALHDRDIR}/APCS/${APCS}:      hdr/APCS/${APCS};      ${CP} hdr/APCS/${APCS}         $@ ${CPFLAGS}
endif
${GLOBALHDRDIR}/APCS/Common:       hdr/APCS/Common;       ${CP} hdr/APCS/Common          $@ ${CPFLAGS}
${GLOBALHDRDIR}/CPU/Arch:          hdr/CPU/Arch;          ${CP} hdr/CPU/Arch             $@ ${CPFLAGS}
${GLOBALHDRDIR}/CPU/ARM600:        hdr/CPU/ARM600;        ${CP} hdr/CPU/ARM600           $@ ${CPFLAGS}
${GLOBALHDRDIR}/CPU/FPA:           hdr/CPU/FPA;           ${CP} hdr/CPU/FPA              $@ ${CPFLAGS}
${GLOBALHDRDIR}/CPU/Generic26:     hdr/CPU/Generic26;     ${CP} hdr/CPU/Generic26        $@ ${CPFLAGS}
${GLOBALHDRDIR}/CPU/Generic32:     hdr/CPU/Generic32;     ${CP} hdr/CPU/Generic32        $@ ${CPFLAGS}
${GLOBALHDRDIR}/FDC/FDC711:        hdr/FDC/FDC711;        ${CP} hdr/FDC/FDC711           $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/GenericIO:      hdr/IO/GenericIO;      ${CP} hdr/IO/GenericIO         $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/IOC:            hdr/IO/IOC;            ${CP} hdr/IO/IOC               $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/IOC-A1:         hdr/IO/IOC-A1;         ${CP} hdr/IO/IOC-A1            $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/IOEB:           hdr/IO/IOEB;           ${CP} hdr/IO/IOEB              $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/IOMD:           hdr/IO/IOMD;           ${CP} hdr/IO/IOMD              $@ ${CPFLAGS}
${GLOBALHDRDIR}/IO/IOMDL:          hdr/IO/IOMDL;          ${CP} hdr/IO/IOMDL             $@ ${CPFLAGS}
${GLOBALHDRDIR}/MEMM/ARM600:       hdr/MEMM/ARM600;       ${CP} hdr/MEMM/ARM600          $@ ${CPFLAGS}
${GLOBALHDRDIR}/MEMM/MEMC1:        hdr/MEMM/MEMC1;        ${CP} hdr/MEMM/MEMC1           $@ ${CPFLAGS}
${GLOBALHDRDIR}/MEMM/VMSAv6:       hdr/MEMM/VMSAv6;       ${CP} hdr/MEMM/VMSAv6          $@ ${CPFLAGS}
${GLOBALHDRDIR}/VIDC/VIDC1a:       hdr/VIDC/VIDC1a;       ${CP} hdr/VIDC/VIDC1a          $@ ${CPFLAGS}
${GLOBALHDRDIR}/VIDC/VIDC20:       hdr/VIDC/VIDC20;       ${CP} hdr/VIDC/VIDC20          $@ ${CPFLAGS}

# User interface specific headers:
${GLOBALHDRDIR}/UserIF/${USERIF}:  hdr/UserIF/${USERIF};  ${CP} hdr/UserIF/${USERIF}     $@ ${CPFLAGS}
${GLOBALHDRDIR}/UserIF/UserIF:     hdr/UserIF/UserIF;     ${CP} hdr/UserIF/UserIF        $@ ${CPFLAGS}

# Macros:
${GLOBALHDRDIR}/DDVMacros:         hdr/DDVMacros;         ${CP} hdr/DDVMacros            $@ ${CPFLAGS}
${GLOBALHDRDIR}/Debug:             hdr/Debug;             ${CP} hdr/Debug                $@ ${CPFLAGS}
${GLOBALHDRDIR}/ExtraLong:         hdr/ExtraLong;         ${CP} hdr/ExtraLong            $@ ${CPFLAGS}
${GLOBALHDRDIR}/Macros:            hdr/Macros;            ${CP} hdr/Macros               $@ ${CPFLAGS}
${GLOBALHDRDIR}/NdrDebug:          hdr/NdrDebug;          ${CP} hdr/NdrDebug             $@ ${CPFLAGS}
${GLOBALHDRDIR}/Proc:              hdr/Proc;              ${CP} hdr/Proc                 $@ ${CPFLAGS}

# The rest:
${GLOBALHDRDIR}/CMOS:              hdr/CMOS;              ${CP} hdr/CMOS                 $@ ${CPFLAGS}
${GLOBALHDRDIR}/Heap:              hdr/Heap;              ${CP} hdr/Heap                 $@ ${CPFLAGS}
${GLOBALHDRDIR}/ListOpts:          hdr/ListOpts;          ${CP} hdr/ListOpts             $@ ${CPFLAGS}
${GLOBALHDRDIR}/Sprite:            hdr/Sprite;            ${CP} hdr/Sprite               $@ ${CPFLAGS}
${GLOBALHDRDIR}/Symbols:           hdr/Symbols;           ${CP} hdr/Symbols              $@ ${CPFLAGS}
${GLOBALHDRDIR}/System:            hdr/System;            ${CP} hdr/System               $@ ${CPFLAGS}
${GLOBALHDRDIR}/Tokens:            hdr/Tokens;            ${CP} hdr/Tokens               $@ ${CPFLAGS}

# This component doesn't use a link farm
links:
	${NOP}

