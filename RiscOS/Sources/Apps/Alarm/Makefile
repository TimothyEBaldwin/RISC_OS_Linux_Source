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
# Makefile for Alarm

COMPONENT      ?= Alarm
override TARGET = !RunImage
SRCS            = Main Dialogues Utils Clock Alarms
INSTTYPE        = app
INSTAPP_FILES   = !Boot !Help !Run !RunImage          Alarms Code Messages Templates
INSTAPP_DEPENDS = Resources${SEP}Code${SUFFIX_DATA}
INSTAPP_VERSION = Messages
RES_FILES       =                  !RunImage !RunLink        Code Messages Templates
RES_DEPENDS     = Resources${SEP}Code${SUFFIX_DATA}
RESAPP_FILES    = !Boot !Help !Run

include BasicApp

Resources${SEP}Code${SUFFIX_DATA}:
	@${MAKE} -f code${EXT}mk

clean::
	@${MAKE} -f code${EXT}mk clean
	@${STRIPDEPEND} code${EXT}mk

# Dynamic dependencies:
