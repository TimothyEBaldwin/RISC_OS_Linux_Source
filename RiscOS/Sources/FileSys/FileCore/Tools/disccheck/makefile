CC=cc
LD=Link
AS=objasm

all:	main

main:	main.o discs.o
	$(LD) -o $@ main.o discs.o &.clib.o.stubs

main.o:	main.c types.h discs.h
	cc -o $@ -c $*.c

discs.o:	discs.c types.h discs.h
	cc -o $@ -c $*.c

