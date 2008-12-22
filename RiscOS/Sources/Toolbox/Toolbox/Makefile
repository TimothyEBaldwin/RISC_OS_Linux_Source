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
# Makefile for Toolbox module
#
# Component specific options:
#
RAMMESSAGES = o.msgs

COMMON_OBJ = o.Modhdr_NoD o.base o.callback o.event o.filters o.filter_ven o.globals\
 o.memory o.memswis o.object o.resf o.task

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMMESSAGES} ${COMMON_OBJ}

DBG_OBJS = o.Modhdr o.base o.callback od.event od.filters o.filter_ven od.globals\
 od.main od.memory o.memswis od.object od.resf od.task ${RAMMESSAGES}

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
