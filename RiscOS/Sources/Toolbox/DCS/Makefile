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
# Makefile for a Toolbox Object module
#
# $Id$
#
# Component specific options:
#
RAMRESOURCES = o.msgs

COMMON_OBJ = o.Modhdr_NoD o.create o.delete o.events o.getstate\
 o.hide o.miscop o.show o.task

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMRESOURCES} ${COMMON_OBJ}

DBG_OBJS = od.main ${RAMRESOURCES} o.Modhdr od.create od.delete od.events od.getstate\
 od.hide od.miscop od.show od.task

#
# Get main rules
#
include C:tboxlibint.TboxMake

DCSRESDIR = <resource$dir>.Resources2

#
# Module specific rules:
#
resources: LocalRes:DCS.Messages LocalRes:DCS.Res LocalRes:Quit.Messages LocalRes:Quit.Res
	${MKDIR} ${DCSRESDIR}
	${CP} Resources.${LOCALE}.*   ${DCSRESDIR}.*  ${CPFLAGS}
	@echo ${COMPONENT}: resource files copied to Messages module

${RAMRESOURCES}: LocalRes:DCS.Messages LocalRes:DCS.Res LocalRes:Quit.Messages LocalRes:Quit.Res
	resgen res_files $@ \
          LocalRes:DCS.Res Resources.DCS.Res \
          LocalRes:DCS.Messages Resources.DCS.Messages \
          LocalRes:Quit.Res Resources.Quit.Res \
          LocalRes:Quit.Messages Resources.Quit.Messages

clean: toolbox-clean
	@echo ${COMPONENT}: cleaned

#---------------------------------------------------------------------------
# Dynamic dependencies:
