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
# Makefile for Freeway
#

COMPONENT    = Freeway
OBJS         = module objects
CMHGDEPENDS  = module
HDRS         =
ASMHDRS      = Freeway
CINCLUDES    = -ITCPIPLibs:,C:
CUSTOMRES    = custom
RES_OBJ      =
LIBS        += ${INETLIB} ${SOCK4LIB} ${ASMUTILS}

include CModule

CFLAGS      += -wp -DAUTH32 -DCOMPAT_INET4
CDFLAGS     += -DDEBUG -DDEBUGSER


#RDIR       = Resources
#LDIR       = ${RDIR}.${LOCALE}
#RESDIR     = ^.^.AUNMsgs.Resources.${Locale}.Resources.${COMPONENT}
#CFLAGS  = -zM -zps1 -ffah -Wp ${INCLUDES} ${DFLAGS} ${THROWBACK}
#DFLAGS  = -DAUTH32 -DCOMPAT_INET4
# -DDEBUG -DDEBUGSER

#SOCKLIBZM = TCPIPLibs:o.socklibzm
#INETLIBZM = TCPIPLibs:o.inetlibzm
#DEBUGLIB  = C:DebugLib.o.DebugLibZM
#ASMUTILS  = C:AsmUtils.o.AsmUtilsZM


resources:
	@echo ${COMPONENT}: Resources in AUNMsgs

#
# Dynamic dependencies:
