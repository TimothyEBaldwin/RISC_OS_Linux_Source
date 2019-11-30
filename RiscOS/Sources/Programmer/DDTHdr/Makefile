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
# Makefile for DDT
#

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
