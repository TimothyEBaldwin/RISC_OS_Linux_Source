# This makefile made by Makatic3


CCExtra=-ff
Leafname=Lib



ProjectName		= !Normal

ObjectFiles	=	\
	Sources.o.ModMalloc\


Target		=	^.^.$(Leafname)


VPATH = @.^

.SUFFIXES:	.o .s .c .c++

All:	$(Target)

Dirs:
	cdir Sources
	cdir Sources.o

$(Target):	$(ObjectFiles) Dirs
	libfile -c -o $@ $(ObjectFiles)

.s.o:
	objasm  -depend !Depend -from $< -to $@

.c.o:
	$(MemCheckCC) cc -c $(CCExtra) -fahi -depend !Depend -I,@.^,C: -o $@ $<


# Dynamic dependencies:
