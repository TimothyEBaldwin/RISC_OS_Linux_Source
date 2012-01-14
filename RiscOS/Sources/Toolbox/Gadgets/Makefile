# Copyright 1997 Acorn Computers Ltd
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
RAMBOTH =

COMMON_OBJ = o.ModHdr o.glib o.glib3 o.MemMan o.riscos_uti o.Scrollbar \
 o.ScrollList o.Sizes o.TextArea o.TextMan \
 o.Font o.riscos_gra o.ScrollLisS o.TAsel_ven o.Text o.Utils

ROM_OBJS = o.mainROM ${COMMON_OBJ}

RAM_OBJS = o.main ${RAMBOTH} ${COMMON_OBJ}

DBG_OBJS = od.main ${RAMBOTH} od.ModHdr od.glib od.glib3 od.MemMan od.riscos_uti od.Scrollbar \
 od.ScrollList od.Sizes od.TextArea od.TextMan \
 od.Font od.riscos_gra od.ScrollLisS od.TAsel_ven od.Text od.Utils

EXTRARAMLIBS = c:tboxlibs.o.wimplib c:tboxlibs.o.toolboxlib

EXTRAROMLIBS = c:tboxlibs.o.wimplib c:tboxlibs.o.toolboxlib

#
# Get main rules
#
include C:tboxlibint.TboxMake

#
# Module specific rules:
#
resources:
	@echo ${COMPONENT}: not internationalised, so no files copied to Messages module

clean: toolbox-clean
	@echo ${COMPONENT}: cleaned

#---------------------------------------------------------------------------
# Dynamic dependencies:
