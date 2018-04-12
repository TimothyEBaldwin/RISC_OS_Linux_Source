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
# Makefile for Floating Point Accelerator Support Code (FPASC)

COMPONENT ?= FPEmulator
SA_MODULE  = FPERAM${SUFFIX_MODULE}
ifeq (,${MAKE_VERSION})
ROM_SOURCE = s.${MACHINE}
else
ROM_SOURCE = ${MACHINE}.s
endif
HEADER1    = FPEmulator

FPEANCHOR ?= Low
# 32bit-compatible RAM builds store FPEAnchor locally, so that they're compatible with kernels which use high or low zero page workspace. But this means the module must write to its own image to set its workspace pointer.
# 26bit-only builds can stick with the legacy low FPEAnchor location, avoiding the need for the module to self-modify.
ifeq (${FPE_APCS},3/26bit)
FPEANCHOR_RAM ?= Low
else
FPEANCHOR_RAM ?= Local
endif

ifeq (,$(filter ${MAKECMDGOALS},rom install_rom))
ASFLAGS += -PD "FPEAnchorType SETS \"${FPEANCHOR_RAM}\""
else
ASFLAGS += -PD "FPEAnchorType SETS \"${FPEANCHOR}\""
endif
ASFLAGS += -APCS ${FPE_APCS}

ifeq (,${MAKE_VERSION})
ASFLAGS += -PD "CoreDir SETS \"^.coresrc.s.\"" -PD "VeneerDir SETS \"^.vensrc.riscos.\"" -PD "FileExt SETS \"\""   -I^
else
ASFLAGS += -PD "CoreDir SETS \"coresrc/\""     -PD "VeneerDir SETS \"vensrc/riscos/\""   -PD "FileExt SETS \".s\""
# The layout of source files in this component is rather non-standard!

SYMLINK_DEPEND = symlink_extra
symlink_extra:
	$(foreach linksource,$(wildcard ../coresrc/s/*), \
		$(shell \
			leaf=`basename ${linksource}`; \
			[ -d ${linksource} ] || [ -L objs/coresrc/$$leaf.s ] || mkdir -p objs/coresrc; \
			[ -d ${linksource} ] || [ -L objs/coresrc/$$leaf.s ] || ln -s ../../${linksource} objs/coresrc/$$leaf.s; \
		) \
	)
	$(foreach linksource,$(wildcard ../vensrc/riscos/*), \
		$(shell \
			leaf=`basename ${linksource}`; \
			[ -d ${linksource} ] || [ -L objs/vensrc/riscos/$$leaf.s ] || mkdir -p objs/vensrc/riscos; \
			[ -d ${linksource} ] || [ -L objs/vensrc/riscos/$$leaf.s ] || ln -s ../../../${linksource} objs/vensrc/riscos/$$leaf.s; \
		) \
	)
	@[ -L objs/VersionASM ] || ln -s ../../VersionASM objs/VersionASM
endif

include AAsmModule

# Dynamic dependencies:
