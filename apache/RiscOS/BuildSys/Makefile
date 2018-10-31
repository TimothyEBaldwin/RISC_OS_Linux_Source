# Makefile for the Build System Binary Build Environment
#
# $Id: Makefile,v 1.3 2014/10/12 21:54:23 srevill Exp $
#
include StdTools

COMPONENT ?= BuildSys
INSTDIR   ?= <Install$Dir>
INSTTYPE  ?= Makefiles

install_Makefiles:
  ${MKDIR} ${INSTDIR}
  ${CP} Makefiles  ${INSTDIR}.Makefiles         ${CPFLAGS}
  ${CP} VersionNum ${INSTDIR}.Makefiles.Version ${CPFLAGS}

install: install_${INSTTYPE}
  @${ECHO} ${COMPONENT}: installed ${INSTTYPE}

BBETYPE = buildsys
bbe-buildsys: bbe-generic-resources-get-alias
  BBE_Export_Dir ImageName
  ${RM} ${BBEDIR}.ImageName.Version
  BBE_Export_Dir perl
  BBE_Export_Dir Makefiles
  ${RM} ${BBEDIR}.Makefiles.BBEExport
  ${MKDIR} ${BBEDIR}.Components
  BBE_Export_File VersionNum
ifeq (${COMPONENTFILE2},)
  ${FILTERCOMP} Components.${COMPONENTFILE} ModuleDB ${BBEDIR}.Components.${COMPONENTFILE} ${BBEDIR}.ModuleDB
else
  ${FILTERCOMP2} Components.${COMPONENTFILE} Components.${COMPONENTFILE2} ModuleDB ${BBEDIR}.Components.${COMPONENTFILE} ${BBEDIR}.Components.${COMPONENTFILE2} ${BBEDIR}.ModuleDB
endif

