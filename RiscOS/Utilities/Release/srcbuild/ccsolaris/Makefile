# Copyright 2001 Pace Micro Technology plc
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
# Copyright (C) Pace Micro Technology plc. 2001

TARGET=armsrcbuild

CLX=${CLXPATH}/clx.a

CFLAGS=-DUNIX -c -g -I${CLXPATH} ${CFL}
CC=gcc
INSTALL=install
TOLOCAL=cp
OBJALL=srcbuild.o riscos.o parse.o build.o

EXTLIB1=${CLX}

noarg: ${TARGET}
	@echo "Made ${TARGET} (the default target)"

# Dependencies

${TARGET}: $(OBJALL)
${TARGET}: $(EXTLIB1)
	$(CC) -g -o ${TARGET} $(OBJALL) $(EXTLIB1)
	@echo "Made ${TARGET}"

install: ${TARGET}
	${INSTALL} ${TARGET} ${RISCOS_BUILD_TOOLS}/${TARGET}
	#strip ${RISCOS_BUILD_TOOLS}/${TARGET}

clean:
	-rm ${OBJALL}
	-rm ${TARGET}
	@echo cleaned ${TARGET}

realclean: clean
	-find . -type l -print | xargs rm
	@echo cleaned ${TARGET} links

links:
	./mklinks
	@echo made ${TARGET} links

