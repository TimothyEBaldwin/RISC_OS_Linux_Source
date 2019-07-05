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
# Project:   Unicode

CC = armcc
AS = armasm
LD = armlink
CLIB=${RISCOS_BUILD_EXPORT}/Lib/CLib/stubs.o
CCflags = -c -I$(RISCOS_BUILD_EXPORT)/Lib/CLib \
	-ffa -Wsc -Ospace -DRISCOS -Fn

ASflags = -Stamp -quit

.SUFFIXES: .c .s .o .oz .od .odz

.c.o:;	$(CC) -DROM=0 -DDEBUG=0 $(CCflags) -o $@ $<

.c.od:;	$(CC) -DROM=0 -DDEBUG=1 -Fn $(CCflags) -o $@ $<

.c.oz:;	$(CC) -zM -DROM=1 -DDEBUG=0 $(CCflags) -o $@ $<

.s.o:;	$(AS) $(ASflags) -from $< -to $@

Objects =  autojp.o unictype.o \
	utf8.o \
	utf16.o \
	encoding.o \
	iso2022.o \
	eightbit.o \
	iso6937.o \
	shiftjis.o \
	johab.o \
	bigfive.o \
	enc_utf7.o \
	enc_utf8.o \
	enc_ascii.o \
	enc_utf16.o \
	enc_ucs4.o \
	enc_scsu.o \
	enc_system.o \
	acorn.o \
	combine.o \
	riscos.o

ObjectsD =  autojp.od unictype.od \
	utf8.od \
	utf16.od \
	encoding.od \
	iso2022.od \
	eightbit.od \
	iso6937.od \
	shiftjis.od \
	johab.od \
	bigfive.od \
	enc_utf7.od \
	enc_utf8.od \
	enc_ascii.od \
	enc_utf16.od \
	enc_ucs4.od \
	enc_scsu.od \
	enc_system.od \
	acorn.od \
	combine.od \
	riscos.od

ObjectsZ =  autojp.oz unictype.oz \
	utf8.oz \
	utf16.oz \
	encoding.oz \
	iso2022.oz \
	eightbit.oz \
	iso6937.oz \
	shiftjis.oz \
	johab.oz \
	bigfive.oz \
	enc_utf7.oz \
	enc_utf8.oz \
	enc_ascii.oz \
	enc_utf16.oz \
	enc_ucs4.oz \
	enc_scsu.oz \
	enc_system.oz \
	acorn.oz \
	combine.oz \
	riscos.oz

all: riscos_libs TextConv,ff8

ucodelib: $(Objects)
	armlib -c -o ucodelib $(Objects)

ucodelibd: $(ObjectsD)
	armlib -c -o ucodelibd $(ObjectsD)

ucodelibz: $(ObjectsZ)
	armlib -c -o ucodelibz $(ObjectsZ)

TextConv,ff8: textconv.o ucodelib ${CLIB}
	${LD} -o $@ textconv.o ucodelib ${CLIB}

riscos_libs: ucodelib ucodelibd ucodelibz

riscos_export: riscos_libs
	@-mkdir $(RISCOS_BUILD_EXPORT)
	@-mkdir $(RISCOS_BUILD_EXPORT)/Lib
	@-mkdir $(RISCOS_BUILD_EXPORT)/Lib/Unicode
	@echo Made export directories
	@-cp -p ucodelib $(RISCOS_BUILD_EXPORT)/Lib/Unicode/ucodelib
	@-cp -p ucodelibd $(RISCOS_BUILD_EXPORT)/Lib/Unicode/ucodelibd
	@-cp -p ucodelibz $(RISCOS_BUILD_EXPORT)/Lib/Unicode/ucodelibz
	@cp -p autojp.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p charsets.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p combine.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p unictype.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p encoding.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p iso10646.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p iso3166.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p languages.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p utf8.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@cp -p utf16.h $(RISCOS_BUILD_EXPORT)/Lib/Unicode/
	@echo Copied libraries

clean:
	@-rm mkunictype 
	@-rm unictype.c
	@-rm *.o
	@-rm *.od
	@-rm *.oz
	@-rm ucodelib ucodelibd ucodelibz
	@-rm TextConv,ff8
	echo Done clean

realclean: clean
	find . -type l -print | xargs rm
	echo Done realclean

unictype.c: ../data/UnicodeData mkunictype
	./mkunictype < ../data/UnicodeData > unictype.c
	echo Made unictype.c

mkunictype: mkunictype.c
	gcc -o mkunictype mkunictype.c
	echo Made mkunictype

links: ; ./mklinks
	echo made links

# Do not faff with the following comment as Make looks for it explicitly:
# Dynamic dependencies:
