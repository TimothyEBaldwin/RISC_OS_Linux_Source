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
# Makefile for PDumperDM
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date         Name  Description
# ----         ----  -----------
# 27-May-94    AMcC  Created.
# 27 Jun 1997  RWB   Build seperatly from rest of dumpers
# 08 Nov 2002  SAR   Now uses objasm and shared makefiles

COMPONENT = PDumperDM

include StdTools
include AAsmModule

clean::
	${XWIPE} o ${WFLAGS}
	${XWIPE} rm ${WFLAGS}

export_hdrs:: ^.hdr.PDumper
	${CP} ^.hdr.PDumper ${EXP_HDR}.PDumper ${CPFLAGS}
	@${ECHO} ${COMPONENT}: header export complete

# Dynamic dependencies:
