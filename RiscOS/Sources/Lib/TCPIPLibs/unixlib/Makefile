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
#
# Copyright (c) 1995 Acorn Computers Ltd., Cambridge, England
#
# Makefile for unixlib.a
#
# Makefile,v
# Revision 1.1  95/04/20  09:50:39  kwelton
# Initial revision
#
#
LIBDIR = <Lib$Dir>

#
# Generic options:
#
MKDIR   = do mkdir -p
WIPE    = x wipe
RM      = x remove
CP      = copy
CC	= cc
AS	= objasm
LD	= link
LIB	= libfile
CMHG	= cmhg

WFLAGS  = ~c~v
CPFLAGS = ~cflnr~v

INCLUDES=	TCPIPLibs:,C:

CFLAGS=		-depend !Depend -Wp -zps0 -I${INCLUDES} -fah -Fn -DINET -DCOMPAT_INET4
CFLAGSZM=	-depend !Depend -Wp -zps1 -I${INCLUDES} -ffah -DINET -DCOMPAT_INET4 -zM

AFLAGS=		-depend !Depend
AFLAGSZM=	-depend !Depend -PD "module SETL {TRUE}"

CCZM=		${CC} ${CFLAGSZM}
ASZM=		${AS} ${AFLAGSZM}

CFILES=		access.c chdir.c chmod.c close.c filestat.c flushinput.c \
		fstat.c getdtabsiz.c getegid.c geteuid.c getgroups.c \
		gethostnam.c getlogin.c getpass.c getpid.c getpwent.c \
		getpwnam.c getpwuid.c getuid.c getusernam.c getwd.c \
		gtimeofday.c herror.c index.c ioctl.c killfile.c lseek.c \
		memops.c osreadc.c read.c readdir.c readv.c strcasecmp.c \
		stubs.c write.c writev.c xgets.c xperror.c xputchar.c \
		getopt.c strsep.c kvm.c err.c errlst.c xstrerror.c \
		strdup.c sleep.c ffs.c getifaddrs.c asm.s

OFILES=		access.o chdir.o chmod.o close.o filestat.o flushinput.o \
		fstat.o getdtabsiz.o getegid.o geteuid.o getgroups.o \
		gethostnam.o getlogin.o getpass.o getpid.o getpwent.o \
		getpwnam.o getpwuid.o getuid.o getusernam.o getwd.o \
		gtimeofday.o herror.o index.o ioctl.o killfile.o lseek.o \
		memops.o osreadc.o read.o readdir.o readv.o strcasecmp.o \
		stubs.o write.o writev.o xgets.o xperror.o xputchar.o \
		getopt.o strsep.o kvm.o err.o errlst.o xstrerror.o \
		strdup.o sleep.o ffs.o getifaddrs.o asm.o

ZFILES=		z.access z.chdir z.chmod z.close z.filestat z.flushinput \
		z.fstat z.getdtabsiz z.getegid z.geteuid z.getgroups \
		z.gethostnam z.getlogin z.getpass z.getpid z.getpwent \
		z.getpwnam z.getpwuid z.getuid z.getusernam z.getwd \
		z.gtimeofday z.herror z.index z.ioctl z.killfile z.lseek \
		z.memops z.osreadc z.read z.readdir z.readv z.strcasecmp \
		z.stubs z.write z.writev z.xgets z.xperror z.xputchar \
		z.getopt z.strsep z.kvm z.err z.errlst z.xstrerror \
		z.strdup z.sleep z.ffs z.getifaddrs z.asm

.SUFFIXES:	.z .o .c .s

.c.z:;	     ${CCZM} -c -o $@ $<
.c.o:;       ${CC} ${CFLAGS} -c -o $@ $<
.s.z:;       ${ASZM} -o $@ $<
.s.o:;       ${AS} ${AFLAGS} -o $@ $<

COMPONENT = unixlib
LIBDIR = <Lib$Dir>

all:	unixlib unixlibzm

unixlib:	${OFILES} local_dirs
	${LIB} -c unixlib ${OFILES}
	${LIB} -o unixlib

unixlibzm:	${ZFILES} local_dirs
	${LIB} -c unixlibzm ${ZFILES}
	${LIB} -o unixlibzm

export: export_${PHASE}

export_hdrs:
	${CP} h.unixlib	TCPIPLibs:h.unixlib	${CPFLAGS}
        @echo ${COMPONENT}: export complete (hdrs)

export_libs: unixlib unixlibzm dirs
	${CP} unixlib	TCPIPLibs:o.unixlib	${CPFLAGS}
	${CP} unixlibzm	TCPIPLibs:o.unixlibzm	${CPFLAGS}

dirs:
	${MKDIR} $(LIBDIR)
	${MKDIR} $(LIBDIR).TCPIPLibs
	${MKDIR} $(LIBDIR).TCPIPLibs.o

local_dirs:
        ${MKDIR} o
        ${MKDIR} z
        Create local_dirs

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} z.* ${WFLAGS}
	${RM} local_dirs
	${RM} unixlib
	${RM} unixlibzm


# Dynamic dependencies:
