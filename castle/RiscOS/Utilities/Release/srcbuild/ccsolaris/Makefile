# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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

