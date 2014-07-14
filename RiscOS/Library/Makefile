#
# Binary Build Environment Makefile
#
# The Library needs to participate in the generation of the BBE by exporting
# those tools required by the BBE.
#
COMPONENT = Library

include StdTools

install: install_${TYPE}
	@echo ${COMPONENT}: Install phase complete (${TYPE}).

install_:
	${NOP}

install_STB:
	${MKDIR} ${INSTDIR}
	${CP} Unix.chmod ${INSTDIR}.chmod ${CPFLAGS}
	${CP} Unix.df    ${INSTDIR}.df    ${CPFLAGS}
	${CP} Unix.du    ${INSTDIR}.du    ${CPFLAGS}
	${CP} Unix.mkdir ${INSTDIR}.mkdir ${CPFLAGS}
	${CP} Unix.pwd   ${INSTDIR}.pwd   ${CPFLAGS}
	${CP} Unix.rm    ${INSTDIR}.rm    ${CPFLAGS}

BBETYPE = library
bbe-library: bbe-generic-resources-get-alias
	BBE_Export_Dir ARM
	BBE_Export_Dir Build
	BBE_Export_Dir DrSmiths
	BBE_Export_Dir GNU
	BBE_Export_Dir Misc
	BBE_Export_Dir Unix
	${MKDIR} ${BBEDIR}.Acorn
	BBE_Export_File Acorn.amu
	BBE_Export_File Acorn.c++
	BBE_Export_File Acorn.cfront
	BBE_Export_File Acorn.cmhg
	BBE_Export_File Acorn.debugaif
	BBE_Export_File Acorn.decaof
	BBE_Export_File Acorn.deccf
	BBE_Export_File Acorn.diff
	BBE_Export_Dir Acorn.Docs
	BBE_Export_File Acorn.find
	BBE_Export_File Acorn.libfile
	BBE_Export_File Acorn.link
	BBE_Export_File Acorn.modsqz
	BBE_Export_File Acorn.objasm
	BBE_Export_File Acorn.objsize
	BBE_Export_File Acorn.resgen
	BBE_Export_File Acorn.rpcgen
	BBE_Export_File Acorn.Squash
	BBE_Export_File Acorn.squeeze
	BBE_Export_File Acorn.toansi
	BBE_Export_File Acorn.topcc
	BBE_Export_File Acorn.unmodsqz
	BBE_Export_File Acorn.xpand
	${MKDIR} ${BBEDIR}.ToolOptions
	BBE_Export_File ToolOptions.${APCS}
	BBE_Export_File VersionNum
	${NOP} end of Library export
