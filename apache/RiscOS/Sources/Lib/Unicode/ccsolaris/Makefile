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
# Project:   Unicode

ifeq ($(findstring riscos,$(TARGET)),riscos)
  GCCSDK_INSTALL_CROSSBIN ?= /home/riscos/cross/bin

  CC = $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*gcc)

  ifeq ($(findstring module,$(TARGET)),module)
    PlatCCflags = -mmodule
  endif

  PlatObjs = riscos.o
else
  CC = gcc

  PlatObjs = unix.o
endif

HOST_CC = gcc

CCflags = -funsigned-char -g -O0 $(PlatCCflags)

.c.o:;	$(CC) -c -DDEBUG=0 $(CCflags) -o $@ $<

Objects = autojp.o \
	unictype.o \
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
	debug.o \
	$(PlatObjs)

all:	ucodelib.a textconv

ucodelib.a: $(Objects)
	${AR} r $@ $(Objects)

textconv: textconv.o ucodelib.a
	${CC} $(CCflags) -o $@ textconv.o ucodelib.a

mkunictype: mkunictype.c
	${HOST_CC} -o $@ $<

clean:
	@-rm mkunictype textconv
	@-rm unictype.c
	@-rm *.o
	@-rm ucodelib.a
	echo Done clean

realclean: clean
	find . -type l -print | xargs rm
	echo Done realclean

unictype.c: ../data/UnicodeData mkunictype
	./mkunictype < ../data/UnicodeData > unictype.c
	echo Made unictype.c

links: ; ./mklinks
	echo made links

# Do not faff with the following comment as Make looks for it explicitly:
# Dynamic dependencies:
