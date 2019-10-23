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
# Makefile for ScrSaver
#

COMPONENT   = ScrSaver
OBJS        = module
CINCLUDES   = -IC:
CMHGFILE    = header
CMHGDEPENDS = module
HDRS        =
CUSTOMRES   = no

include CModule

clean::
	${XWIPE} !SaverAni ${WFLAGS}

app:
	${MKDIR} o
	${MKDIR} !SaverAni
	${CC} -c -IRISC_OSLib: app.c
	${LD} -o !SaverAni.!RunImage -aif app.o ${RLIB} ${CLIB}
	${CP} LocalRes:!Run !SaverAni.!Run ${CPFLAGS}
	${CP} LocalRes:Templates !SaverAni.Templates ${CPFLAGS}

# Dynamic dependencies:
