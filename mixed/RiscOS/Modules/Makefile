# Makefile for the Build System Binary Build Environment
#
# $Id: Makefile,v 1.2 2011/03/17 16:30:24 srevill Exp $
#

include Makefiles:StdTools

BBETYPE = modules
bbe-modules: bbe-generic-resources-get-alias
  ${CP} * ${BBEDIR}.* ${CPFLAGS}
  IfThere Testing then ${CP} Testing ${BBEDIR}.Testing ${CPFLAGS}
  ${RM} ${BBEDIR}.Makefile
