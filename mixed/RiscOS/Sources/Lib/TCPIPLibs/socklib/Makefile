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
# Copyright (c) 1995 Acorn Computers Ltd., Cambridge, England
#
# Makefile for socklib.a
#

include StdTools

COMPONENT=	socklib
LIBDIR=		<Lib$Dir>
INCLUDES=	TCPIPLibs:,C:
DIRS=		o._dirs

CFLAGS=		-depend !Depend ${THROWBACK} -pcc -zps0 -I${INCLUDES} -fah -Fn -DINET
CFLAGSZM=	-depend !Depend ${THROWBACK} -pcc -zps1 -I${INCLUDES} -ffah -DINET -zM
ASFLAGS=	-depend !Depend ${THROWBACK}
ASFLAGSZM=	-depend !Depend ${THROWBACK} -predefine "module SETL {TRUE}"

OFILES4=	accept.o bind.o connect.o copyerror.o getpeernam.o \
		getsocknam.o getsockopt.o getstabsiz.o listen.o makecall.o \
		recv.o recvfrom.o recvmsg.o select.o send.o sendmsg.o \
		sendto.o setsockopt.o shutdown.o sockclose.o socket.o \
		socketstat.o sockioctl.o sockread.o sockreadv.o sockwrite.o \
		sockwritev.o sendtosm.o sysctl.o naccept.o nrecvfrom.o \
		nrecvmsg.o nsendmsg.o ngetpeerna.o ngetsockna.o kvm_nlist.o \
		sockver.o _inet_err.o

ZFILES4=	z.accept z.bind z.connect z.copyerror z.getpeernam \
		z.getsocknam z.getsockopt z.getstabsiz z.listen z.makecall \
		z.recv z.recvfrom z.recvmsg z.select z.send z.sendmsg \
		z.sendto z.setsockopt z.shutdown z.sockclose z.socket \
		z.socketstat z.sockioctl z.sockread z.sockreadv z.sockwrite \
		z.sockwritev z.sendtosm z.sysctl z.naccept z.nrecvfrom \
		z.nrecvmsg z.nsendmsg z.ngetpeerna z.ngetsockna z.kvm_nlist \
		z.sockver z._inet_err

OFILES5=	accept5.o bind.o connect.o copyerror.o getpeerna5.o \
		getsockna5.o getsockopt.o getstabsiz.o listen.o makecall.o \
		recv5.o recvfrom5.o recvmsg5.o select.o send5.o sendmsg5.o \
		sendto.o setsockopt.o shutdown.o sockclose.o socket.o \
		socketstat.o sockioctl.o sockread.o sockreadv.o sockwrite.o \
		sockwritev.o sendtosm.o sysctl.o \
		oaccept.o ogetpeerna.o ogetsockna.o orecvmsg.o osendmsg.o \
		orecvfrom.o kvm_nlist.o sockver.o _inet_err.o

ZFILES5=	z.accept5 z.bind z.connect z.copyerror z.getpeerna5 \
		z.getsockna5 z.getsockopt z.getstabsiz z.listen z.makecall \
		z.recv5 z.recvfrom5 z.recvmsg5 z.select z.send5 z.sendmsg5 \
		z.sendto z.setsockopt z.shutdown z.sockclose z.socket \
		z.socketstat z.sockioctl z.sockread z.sockreadv z.sockwrite \
		z.sockwritev z.sendtosm z.sysctl \
		z.oaccept z.ogetpeerna z.ogetsockna z.orecvmsg z.osendmsg \
		z.orecvfrom z.kvm_nlist z.sockver z._inet_err

.SUFFIXES:	.z .o .s .sz .sn .c

.c.z:;		${CC} ${CFLAGSZM} -c -o $@ $<
.c.o:;		${CC} ${CFLAGS} -c -o $@ $<
.s.z:;		${AS} ${ASFLAGSZM} $< $@
.sz.z:;		${AS} ${ASFLAGSZM} $< $@
.s.o:;		${AS} ${ASFLAGS} $< $@
.sn.o:;		${AS} ${ASFLAGS} $< $@

all:		veneers socklib socklibzm socklib5 socklib5zm

${OFILES4}:	veneers
${ZFILES4}:	veneers
${OFILES5}:	veneers
${ZFILES5}:	veneers

socklib: ${OFILES4} ${DIRS}
	${AR} -c socklib ${OFILES4}
	${AR} -o socklib

socklibzm: ${ZFILES4} ${DIRS}
	${AR} -c socklibzm ${ZFILES4}
	${AR} -o socklibzm

socklib5: ${OFILES5} ${DIRS}
	${AR} -c socklib5 ${OFILES5}
	${AR} -o socklib5

socklib5zm: ${ZFILES5} ${DIRS}
	${AR} -c socklib5zm ${ZFILES5}
	${AR} -o socklib5zm

veneers: mkveneers Prototypes
	${PERL}  mkveneers Prototypes
	${TOUCH} veneers

export: export_${PHASE}

export_hdrs:
	${CP} h.socklib TCPIPLibs:h.socklib ${CPFLAGS}
	@${ECHO} ${COMPONENT}: header export complete

export_libs: socklib socklibzm socklib5 socklib5zm
	${MKDIR} ${LIBDIR}
	${MKDIR} ${LIBDIR}.TCPIPLibs
	${MKDIR} ${LIBDIR}.TCPIPLibs.o
	${CP} socklib	 TCPIPLibs:o.socklib	${CPFLAGS}
	${CP} socklibzm	 TCPIPLibs:o.socklibzm	${CPFLAGS}
	${CP} socklib5	 TCPIPLibs:o.socklib5	${CPFLAGS}
	${CP} socklib5zm TCPIPLibs:o.socklib5zm	${CPFLAGS}
	@${ECHO} ${COMPONENT}: library export complete

o._dirs:
	${MKDIR} o
	${MKDIR} z
	${MKDIR} sn
	${MKDIR} sz
	${TOUCH} $@

clean:
	${WIPE} o  ${WFLAGS}
	${WIPE} z  ${WFLAGS}
	${WIPE} sn ${WFLAGS}
	${WIPE} sz ${WFLAGS}
	${RM} veneers
	${RM} socklib
	${RM} socklibzm
	${RM} socklib5
	${RM} socklib5zm

# Dynamic dependencies:
