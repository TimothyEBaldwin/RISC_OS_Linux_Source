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
# Makefile for inetlib.a
#
# Makefile,v
# Revision 1.3  95/06/01  15:37:14  kwelton
# Added rresvport(), remade dependencies.
#
# Revision 1.2  95/04/20  12:40:17  kwelton
# All library functions are now prototyped in inetlib.h.
#
# Revision 1.1  95/04/18  16:48:06  kwelton
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

WFLAGS  = ~c~v
CPFLAGS = ~cflnr~v

INCLUDES=	TCPIPLibs:,C:

CFLAGS=		-depend !Depend -Wap -zps0 -I${INCLUDES} -fah -Fn -DINET -DCOMPAT_INET4
CFLAGSZM=	-depend !Depend -Wap -zps1 -I${INCLUDES} -ffah -DINET -DCOMPAT_INET4 -zM

CCZM=		${CC} ${CFLAGSZM}

CFILES=		getadinfo.c gethent.c gethnad.c getipnode.c getnainfo.c \
		getnbyad.c getnbyna.c getnent.c getprent.c getprnam.c \
		getproto.c getsbyna.c getsbypo.c getsent.c htonl.c \
		if_indextoname.c if_nameindex.c if_nametoindex.c \
		in6addr.c inet_addr.c inet_lnaof.c inet_maddr.c \
		inet_nof.c inet_ntoa.c inet_nwork.c rresvport.c \
		linkaddr.c ns_addr.c ns_ntoa.c iso_addr.c sysctlbyna.c \
		inet_nntop.c inet_npton.c inet_ntop.c inet_pton.c

OFILES=		getadinfo.o gethent.o gethnad.o getipnode.o getnainfo.o \
		getnbyad.o getnbyna.o getnent.o getprent.o getprnam.o \
		getproto.o getsbyna.o getsbypo.o getsent.o htonl.o \
		if_indextoname.o if_nameindex.o if_nametoindex.o \
		in6addr.o inet_addr.o inet_lnaof.o inet_maddr.o \
		inet_nof.o inet_ntoa.o inet_nwork.o rresvport.o \
		linkaddr.o ns_addr.o ns_ntoa.o iso_addr.o sysctlbyna.o \
		inet_nntop.o inet_npton.o inet_ntop.o inet_pton.o

ZFILES=		z.getadinfo z.gethent z.gethnad z.getipnode z.getnainfo \
		z.getnbyad z.getnbyna z.getnent z.getprent z.getprnam \
		z.getproto z.getsbyna z.getsbypo z.getsent z.htonl \
		z.if_indextoname z.if_nameindex z.if_nametoindex \
		z.in6addr z.inet_addr z.inet_lnaof z.inet_maddr \
		z.inet_nof z.inet_ntoa z.inet_nwork z.rresvport \
		z.linkaddr z.ns_addr z.ns_ntoa z.iso_addr z.sysctlbyna \
		z.inet_nntop z.inet_npton z.inet_ntop z.inet_pton

.SUFFIXES:	.z .o .c .s

.c.z:;       ${CCZM} -c -o $@ $<
.c.o:;       ${CC} ${CFLAGS} -c -o $@ $<

COMPONENT = inetlib
LIBDIR = <Lib$Dir>

all:	inetlib inetlibzm

inetlib:	${OFILES} local_dirs
	${LIB} -c inetlib ${OFILES}
	${LIB} -o inetlib

inetlibzm:	${ZFILES} local_dirs
	${LIB} -c inetlibzm ${ZFILES}
	${LIB} -o inetlibzm

export: export_${PHASE}

export_hdrs:
	${CP} h.inetlib	TCPIPLibs:h.inetlib	${CPFLAGS}
        @echo ${COMPONENT}: export complete (hdrs)

export_libs: inetlib inetlibzm dirs
	${CP} inetlib	TCPIPLibs:o.inetlib	${CPFLAGS}
	${CP} inetlibzm	TCPIPLibs:o.inetlibzm	${CPFLAGS}

dirs:
	${MKDIR} $(LIBDIR)
	${MKDIR} $(LIBDIR).TCPIPLibs
	${MKDIR} $(LIBDIR).TCPIPLibs.o

local_dirs:
        ${MKDIR} o
        ${MKDIR} z

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} z.* ${WFLAGS}
	${RM} inetlib
	${RM} inetlibzm


# Dynamic dependencies:
