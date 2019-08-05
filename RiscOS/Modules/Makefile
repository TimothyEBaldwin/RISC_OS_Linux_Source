# Makefile for the Build System Binary Build Environment

include Makefiles:StdTools

BBETYPE = modules
bbe-modules: bbe-generic-resources-get-alias
	${CP} * ${BBEDIR}.* ${CPFLAGS}
	IfThere Testing then ${CP} Testing ${BBEDIR}.Testing ${CPFLAGS}
	${RM} ${BBEDIR}.Makefile
