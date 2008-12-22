# Makefile for the Build System Binary Build Environment
#
# $Id$
#
include Makefiles:StdTools

BBETYPE = buildsys
# override definition of PERL for the time being - the FilterComp2 command line is too long for argument passing via the do command
PERL = perl
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

