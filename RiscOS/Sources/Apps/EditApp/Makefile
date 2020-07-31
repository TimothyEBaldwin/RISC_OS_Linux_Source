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
# Makefile for Edit

COMPONENT       = Edit
override TARGET = !RunImage
CFLAGS         += ${C_NOWARN_NON_ANSI_INCLUDES}
CDFLAGS         = -DTRACE=1
OBJS            = edit editv message slist
LIBS            = ${RLIB}
INSTTYPE        = app
INSTAPP_FILES   = !Boot !Help !Run !RunImage !Sprites !Sprites22 Export Messages Templates
INSTAPP_VERSION = Messages
RES_FILES       = Export Messages Templates
RESAPP_FILES    = !Boot !Help !Run

include CApp

# Dynamic dependencies:
