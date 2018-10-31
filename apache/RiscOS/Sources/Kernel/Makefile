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
# Makefile for Kernel
#

COMPONENT       = Kernel

ifeq (${MAKECMDGOALS},install)
EXP_HDR         = ${INSTDIR}.Hdr.Interface
C_EXP_HDR       = ${INSTDIR}.C.Global.h
else
C_EXP_HDR       = <cexport$dir>.Global.h
endif

TOKHELPSRC      = ${TOKENSOURCE}
HELPSRC         = HelpStrs
ROM_SOURCE      = GetAll.s
KERNEL_MODULE   = bin${SEP}${COMPONENT}
ASFLAGS        += -PD "FreezeDevRel SETL {${FREEZE_DEV_REL}}"
CUSTOMROM       = custom
CUSTOMEXP       = custom
CUSTOMSA        = custom
EXPORTS         = ${EXP_HDR}.DBellDevice \
                  ${EXP_HDR}.EnvNumbers \
                  ${EXP_HDR}.HALDevice \
                  ${EXP_HDR}.HALEntries \
                  ${EXP_HDR}.ModHand \
                  ${EXP_HDR}.OSEntries \
                  ${EXP_HDR}.OSMem \
                  ${EXP_HDR}.OSMisc \
                  ${EXP_HDR}.OSRSI6 \
                  ${EXP_HDR}.PL310 \
                  ${EXP_HDR}.PublicWS \
                  ${EXP_HDR}.RISCOS \
                  ${EXP_HDR}.Variables \
                  ${EXP_HDR}.VduExt \
                  ${EXP_HDR}.VIDCList \
                  ${EXP_HDR}.VideoDevice \
                  ${C_EXP_HDR}.HALDevice \
                  ${C_EXP_HDR}.HALEntries \
                  ${C_EXP_HDR}.ModHand \
                  ${C_EXP_HDR}.OSEntries \
                  ${C_EXP_HDR}.OSMem \
                  ${C_EXP_HDR}.OSMisc \
                  ${C_EXP_HDR}.OSRSI6 \
                  ${C_EXP_HDR}.RISCOS \
                  ${C_EXP_HDR}.Variables \
                  ${C_EXP_HDR}.VduExt \
                  ${C_EXP_HDR}.VIDCList

include StdTools
include AAsmModule

# Override this to "TRUE" in the components file if
# you want an odd-numbered (development) build to be
# a 'freezable' build - e.g. with no ROM debug output
FREEZE_DEV_REL ?= FALSE

#
# Custom ROM:
#
rom: ${KERNEL_MODULE}
        @${ECHO} ${COMPONENT}: rom module built

install_rom: ${KERNEL_MODULE}
        ${CP} ${KERNEL_MODULE} ${INSTDIR}${SEP}${TARGET} ${CPFLAGS}
        ${CP} ${KERNEL_MODULE}_gpa ${INSTDIR}${SEP}${TARGET}_gpa ${CPFLAGS}
        @${ECHO} ${COMPONENT}: rom module installed

inst_dirs:
        ${MKDIR} ${EXP_HDR}
        ${MKDIR} ${C_EXP_HDR}

install: ${EXPORTS} inst_dirs
        @${ECHO} ${COMPONENT}: header files installed

${KERNEL_MODULE}: ${ROM_OBJECT} ${DIRS}
        ${MKDIR} bin
        ${LD} -bin -o $@ ${ROM_OBJECT}
        ${LD} -aif -bin -d -o ${KERNEL_MODULE}_aif ${ROM_OBJECT}
        ${TOGPA} -s ${KERNEL_MODULE}_aif ${KERNEL_MODULE}_gpa

#
# Custom exports:
#
export: ${EXPORTS}
        @${ECHO} ${COMPONENT}: export complete

${EXP_HDR}.EnvNumbers: hdr.EnvNumbers
        ${CP} hdr.EnvNumbers $@ ${CPFLAGS}

${EXP_HDR}.DBellDevice: hdr.DBellDevice
        ${CP} hdr.DBellDevice $@ ${CPFLAGS}

${EXP_HDR}.HALDevice: hdr.HALDevice
        ${CP} hdr.HALDevice $@ ${CPFLAGS}

${EXP_HDR}.HALEntries: hdr.HALEntries
        ${CP} hdr.HALEntries $@ ${CPFLAGS}

${EXP_HDR}.ModHand: hdr.ModHand
        ${CP} hdr.ModHand $@ ${CPFLAGS}

${EXP_HDR}.OSEntries: hdr.OSEntries
        ${CP} hdr.OSEntries $@ ${CPFLAGS}

${EXP_HDR}.OSMem: hdr.OSMem
        ${CP} hdr.OSMem $@ ${CPFLAGS}

${EXP_HDR}.OSMisc: hdr.OSMisc
        ${CP} hdr.OSMisc $@ ${CPFLAGS}

${EXP_HDR}.OSRSI6: hdr.OSRSI6
        ${CP} hdr.OSRSI6 $@ ${CPFLAGS}

${EXP_HDR}.PL310: hdr.PL310
        ${CP} hdr.PL310 $@ ${CPFLAGS}

${EXP_HDR}.PublicWS: hdr.PublicWS
        ${CP} hdr.PublicWS $@ ${CPFLAGS}

${EXP_HDR}.RISCOS: hdr.RISCOS
        ${CP} hdr.RISCOS $@ ${CPFLAGS}

${EXP_HDR}.Variables: hdr.Variables
        ${CP} hdr.Variables $@ ${CPFLAGS}

${EXP_HDR}.VduExt: hdr.VduExt
        ${CP} hdr.VduExt $@ ${CPFLAGS}

${EXP_HDR}.VIDCList: hdr.VIDCList
        ${CP} hdr.VIDCList $@ ${CPFLAGS}

${EXP_HDR}.VideoDevice: hdr.VideoDevice
        ${CP} hdr.VideoDevice $@ ${CPFLAGS}

${C_EXP_HDR}.HALDevice: Global.h.HALDevice h.HALDevice
        ${FAPPEND} $@ h.HALDevice Global.h.HALDevice

${C_EXP_HDR}.HALEntries: hdr.HALEntries
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.HALEntries $@

${C_EXP_HDR}.ModHand: hdr.ModHand
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.ModHand $@

${C_EXP_HDR}.OSEntries: Global.h.OSEntries h.OSEntries
        ${FAPPEND} $@ h.OSEntries Global.h.OSEntries

${C_EXP_HDR}.OSMem: hdr.OSMem
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.OSMem $@

${C_EXP_HDR}.OSMisc: hdr.OSMisc
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.OSMisc $@

${C_EXP_HDR}.OSRSI6: hdr.OSRSI6
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.OSRSI6 $@

${C_EXP_HDR}.RISCOS: hdr.RISCOS
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.RISCOS $@

${C_EXP_HDR}.Variables: hdr.Variables
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.Variables $@

${C_EXP_HDR}.VduExt: hdr.VduExt
        ${MKDIR} ${C_EXP_HDR}
        ${HDR2H} hdr.VduExt $@

${C_EXP_HDR}.VIDCList: Global.h.VIDCList h.VIDCList
        ${FAPPEND} $@ h.VIDCList Global.h.VIDCList

Global.h.HALDevice: hdr.HALDevice
        ${MKDIR} Global.h
        ${HDR2H} hdr.HALDevice $@

Global.h.OSEntries: hdr.OSEntries
        ${MKDIR} Global.h
        ${HDR2H} hdr.OSEntries $@

Global.h.VIDCList: hdr.VIDCList
        ${MKDIR} Global.h
        ${HDR2H} hdr.VIDCList $@

clean::
        ${XWIPE} Global ${WFLAGS}
        ${XWIPE} bin    ${WFLAGS}

# Dynamic dependencies:
