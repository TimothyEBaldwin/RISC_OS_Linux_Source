# Copyright 1999 Element 14 Ltd
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
# Makefile for DHCP
#

COMPONENT    = DHCP
OBJS         = dhcp dhcpinform module interfaces\
               iparp packets sockets voting
CMHGDEPENDS  = module
#
# Available build options (passed in OPTIONS)
#
# -DMINIMUM_OPTIONS_LENGTH=4
#    Sets the length of options check.  Set this to 4 to disable the
#    length checks.  Defaults to 64 (what the DHCP standard requires)
#
CDEFINES     = ${OPTIONS} -UTRACE
CINCLUDES    = -ITCPIPLibs:,C:
C_EXP_HDR    = <cexport$dir>.h
HDRS         = DHCP
CMHGAUTOHDR  = DHCP
ROMCDEFINES  = -DROM
LIBS        += ${NET5LIBS} ${ASMUTILS}
ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

include CModule

CFLAGS      += -wp

# Dynamic dependencies:
