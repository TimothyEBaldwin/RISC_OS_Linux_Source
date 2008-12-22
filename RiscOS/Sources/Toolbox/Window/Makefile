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
VPATH = @ gadgets

RAMMESSAGES = o.msgs

COMMON_OBJ = o.Modhdr_NoD o.actbut o.adjuster o.button o.create o.delete o.display o.draggable o.events\
 o.gadgets o.getstate o.globals o.hide o.label o.labelbox o.miscop o.numrange o.optbut\
 o.popupmenu o.radiobut o.show o.simple o.slider o.slider_ven o.stringset o.task\
 o.toolbar o.toolbox o.utils o.writable ${WIMPLIB}

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMMESSAGES} ${COMMON_OBJ}

DBG_OBJS = od.main ${RAMMESSAGES} o.Modhdr\
 od.actbut od.adjuster od.button od.create od.delete od.display od.draggable od.events\
 od.gadgets od.getstate od.globals od.hide od.label od.labelbox od.miscop od.numrange od.optbut\
 od.popupmenu od.radiobut od.show od.simple od.slider od.slider_ven od.stringset od.task\
 od.toolbar o.toolbox od.utils od.writable ${WIMPLIB}

CDEFINES=-D${SYSTEM} ${STYLE}

#
# Get main rules
#
include C:tboxlibint.TboxMake

#
# Module specific rules:
#
resources: resources-messages
	@echo ${COMPONENT}: resource files copied to Messages module

clean: toolbox-clean
	@echo ${COMPONENT}: cleaned

#---------------------------------------------------------------------------
# Dynamic dependencies:
