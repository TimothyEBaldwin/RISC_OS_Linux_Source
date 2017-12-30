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
