# Copyright 1998 Acorn Computers Ltd
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
# Makefile for LanManFS
#

COMPONENT    = LanManFS
OBJS         = Xlate Transact Stats SMB RPC Printers Omni NetBIOS NBIP \
               NameCache Logon LLC LanMan CoreFn buflib Attr \
               Interface MyResObj
CINCLUDES    = -ITCPIPLibs:,C:
HDRS         =
CMHGFILE     = Lanman_MH
CMHGDEPENDS  = LanMan LLC Logon NBIP Omni
LIBS         = ${NET4LIBS} ${ASMUTILS}
RES_PATH     = ThirdParty.OmniClient.LanManFS
RES_OBJ      =
CUSTOMRES    = custom
CDEFINES     = -DCOMPAT_INET4 -DLONGNAMES ${OPTIONS}
CFLAGS       = -Wp
CDFLAGS      = -DDEBUG -DDEBUGLIB -DTRACE -Dprintf=module_printf
ROMCDEFINES  = -DROM
CMHGDEFINES  = ${OPTIONS}
ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

include CModule

# Static dependencies
o.MyResObj od.MyResObj: LocalRes:ROM.Sprites ${MERGEDMSGS} ${DIRS}
	${RESGEN} ${RES_AREA} $@ ${MERGEDMSGS} ${RES_PATH}.Messages LocalRes:ROM.Sprites ${RES_PATH}.Sprites 

# Dynamic dependencies:
