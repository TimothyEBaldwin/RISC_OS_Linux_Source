# Makefile for International Keyboard
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 14-Jun-01  SNB          Temporary makefile
#

#
# Component specific details
#
COMPONENT  = InternationalKeyboard
TARGET     = IntKey
ROM_SOURCE = Source/IntKeyMod
RESOURCES  = no

.SUFFIXES:
.SUFFIXES: .o .s .c .layout

KBD       = -PD "Keyboard SETS \"${KEYBOARD}\""
ASFLAGS   = ${KBD}

include StdTools
include AAsmModule

KEYGEN     = ./keygen
KEYCONVERT = ./keyconvert
NCC        = gcc
NCCFLAGS   = -I${APCSExportDir}/Lib -c -DUNIX

#
# Static dependencies and specialist rules
#

LAYOUTS   = UK.s Italy.s Spain.s France.s Germany.s Esperanto.s Greece.s \
            Swed-Finl.s Denmark.s Norway.s Iceland.s Turkey.s Russia.s \
            Israel.s LatinAm.s Belgium.s Netherlands.s Japan.s \
            Switzerland.s Wales.s USA.s DvorakUK.s DvorakUSA.s

${ROM_OBJECT}: ${LAYOUTS}
${LAYOUTS}: keygen

.layout.s:
	${KEYGEN} ${STDTOOLOPTIONS} ${EXTRAKEYS} $< $@
.c.o:
	${NCC} ${NCCFLAGS} -o $@ $<

clean::
	${RM} -f ${KEYGEN} ${KEYCONVERT} *.s *.o
	find . -type l -exec rm -f {} \;
	@echo ${COMPONENT}: cleaned

keygen: keygen.o throwback.o unicdata.o
	${NCC} -o $@ keygen.o throwback.o unicdata.o

keyconvert: keyconvert.o unicdata.o
	${NCC} -o $@ keyconvert.o unicdata.o

links:
	for i in layout/*; do ln -s $$i `basename $$i`.layout; done
	ln -s c/unicdata unicdata.c
	ln -s h/unicdata unicdata.h
	ln -s c/keygen keygen.c
	ln -s c/keyconvert keyconvert.c
	ln -s h/structures structures.h
	ln -s h/throwback throwback.h
	ln -s c/throwback throwback.c

# Dynamic dependencies:
