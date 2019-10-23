# Copyright 2003 Tematic Ltd
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
# Makefile for SoundCtrl
#

COMPONENT   = SoundCtrl
TARGET      = ${COMPONENT}
OBJS        = global mess module
RES_AREA    = resmess_ResourcesFiles
CMHGFILE    = modhdr
CMHGDEPENDS = module
ROMCDEFINES = -DROM_MODULE
ASMHDRS     = MixerDevice SoundCtrl
HDRS        = MixerDevice

include CModule

CDFLAGS    += -DDEBUGLIB
CFLAGS     += -IC:
DBG_LIBS   += ${NET5LIBS}

# Dynamic dependencies:
