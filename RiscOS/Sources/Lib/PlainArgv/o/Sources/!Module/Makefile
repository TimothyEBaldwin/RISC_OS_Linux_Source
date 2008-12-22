# This makefile made by Makatic3


CCExtra=-ff -zm -DDesk__MODULE_CLIENT
Leafname=Lib_M



ProjectName		= !Module

ObjectFiles	=	\
	Sources.o.CFilename\
	Sources.o.CopyPArgv\
	Sources.o.Find\
	Sources.o.Get\
	Sources.o.StrTok\
	Sources.o.ToBuffer\


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
	objasm  -depend !Depend -throwback -from $< -to $@

.c.o:
	$(MemCheckCC) cc -c $(CCExtra) -fahi -depend !Depend -throwback -I,@.^,C: -o $@ $<


# Dynamic dependencies:
