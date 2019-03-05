COMPONENT = DDT

ifeq (,${MAKE_VERSION})
EXPORTDIR = <export$dir>
endif

EXPORTS = ${EXPORTDIR}${SEP}DDT

include StdTools

export: export_${PHASE}
	${NOP}

export_: export_hdrs export_libs
	${NOP}

export_hdrs: ${EXPORTS}
	@${ECHO} ${COMPONENT}: header export complete

export_libs:
	@${ECHO} ${COMPONENT}: library export complete

${EXPORTDIR}${SEP}DDT: hdr${SEP}DDT
	${CP} hdr${SEP}DDT $@ ${CPFLAGS}

include Depends
