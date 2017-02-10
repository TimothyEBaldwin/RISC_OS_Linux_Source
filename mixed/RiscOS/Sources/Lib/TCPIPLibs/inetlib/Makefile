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
CMHG	= cmhg

WFLAGS  = ~c~v
CPFLAGS = ~cflnr~v

INCLUDES=	TCPIPLibs:,C:

CFLAGS=		-depend !Depend -Wap -zps0 -I${INCLUDES} -fah -Fn -DINET -DCOMPAT_INET4
CFLAGSZM=	-depend !Depend -Wap -zps1 -I${INCLUDES} -ffah -DINET -DCOMPAT_INET4 -zM

CCZM=		${CC} ${CFLAGSZM}

CFILES=		gethent.c gethnad.c getnbyad.c getnbyna.c getnent.c \
		getprent.c getprnam.c getproto.c getsbyna.c getsbypo.c \
		getsent.c htonl.c inet_addr.c inet_lnaof.c inet_maddr.c \
		inet_nof.c inet_ntoa.c inet_nwork.c rresvport.c \
		linkaddr.c ns_addr.c ns_ntoa.c iso_addr.c sysctlbyna.c \
		inet_nntop.c inet_npton.c inet_ntop.c inet_pton.c

OFILES=		gethent.o gethnad.o getnbyad.o getnbyna.o getnent.o \
		getprent.o getprnam.o getproto.o getsbyna.o getsbypo.o \
		getsent.o htonl.o inet_addr.o inet_lnaof.o inet_maddr.o \
		inet_nof.o inet_ntoa.o inet_nwork.o rresvport.o \
		linkaddr.o ns_addr.o ns_ntoa.o iso_addr.o sysctlbyna.o \
		inet_nntop.o inet_npton.o inet_ntop.o inet_pton.o

ZFILES=		z.gethent z.gethnad z.getnbyad z.getnbyna z.getnent \
		z.getprent z.getprnam z.getproto z.getsbyna z.getsbypo \
		z.getsent z.htonl z.inet_addr z.inet_lnaof z.inet_maddr \
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
