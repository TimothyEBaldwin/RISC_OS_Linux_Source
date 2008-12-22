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
RAMBOTH = o.msgs

COMMON_OBJ = o.Modhdr_NoD o.auxiliary o.create o.delete o.events o.getstate\
 o.hide o.miscop o.show o.task

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMBOTH} ${COMMON_OBJ}

DBG_OBJS = od.main ${RAMBOTH} o.Modhdr od.auxiliary od.create od.delete od.events\
 od.getstate od.hide od.miscop od.show od.task

#
# Get main rules
#
include C:tboxlibint.TboxMake

#
# Module specific rules:
#
resources: resources-both
	@echo ${COMPONENT}: resource files copied to Messages module

clean: toolbox-clean
	@echo ${COMPONENT}: cleaned

#---------------------------------------------------------------------------
# Dynamic dependencies:
