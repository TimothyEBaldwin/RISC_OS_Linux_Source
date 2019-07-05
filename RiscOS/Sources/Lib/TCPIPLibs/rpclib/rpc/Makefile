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
LIBDIR = <Lib$Dir>

#
# Generic options:
#
MKDIR   = cdir
WIPE    = x wipe
RM      = -remove
CP      = copy
CC	= cc
AS	= objasm
LD	= link
LIB	= libfile
CMHG	= cmhg

WFLAGS  = ~c~v
CPFLAGS = ~cflnr~v
ASFLAGS = -quit -depend !Depend ${THROWBACK}

INCLUDES=	TCPIPLibs:,C:

OPTIONS=-DSUPPORT_TCP

DEFINES=-Darm -DRISCOS -DCOMPAT_INET4 ${OPTIONS}

CFLAGS = -c -pcc -I${INCLUDES} ${DEFINES} -depend !Depend ${THROWBACK} 
CFLAGSM = -c -pcc -ff -zps1 -zM -I${INCLUDES} ${DEFINES} -depend !Depend ${THROWBACK}

CFILES = c.auth_none c.auth_unix  c.authunix_p c.bindresvpo \
        c.clnt_gener c.clnt_perro c.clnt_raw c.clnt_simpl\
        c.clnt_udp c.rpc_dtable c.get_myaddr c.getrpcent c.getrpcport \
        c.pmap_clnt c.pmap_getma c.pmap_getpo c.pmap_prot \
        c.pmap_prot2 c.pmap_rmt c.rpc_prot c.rpc_common c.rpc_callms \
        c.xdr c.xdr_array c.xdr_float c.xdr_mem c.clnt_tcp \
        c.xdr_rec c.xdr_refere c.xdr_stdio

OFILES = o.auth_none o.auth_unix  o.authunix_p o.bindresvpo \
        o.clnt_gener o.clnt_perro o.clnt_raw o.clnt_simpl \
        o.clnt_udp o.rpc_dtable o.get_myaddr o.getrpcent o.getrpcport \
        o.pmap_clnt o.pmap_getma o.pmap_getpo o.pmap_prot \
        o.pmap_prot2 o.pmap_rmt o.rpc_prot o.rpc_common o.rpc_callms \
        o.xdr o.xdr_array o.xdr_mem o.clnt_tcp \
        o.xdr_rec o.xdr_refere o.xdr_stdio o.rpclibmem 

ZFILES = z.auth_none z.auth_unix  z.authunix_p z.bindresvpo \
        z.clnt_gener z.clnt_perro z.clnt_raw z.clnt_simpl \
        z.clnt_udp z.rpc_dtable z.get_myaddr z.getrpcent z.getrpcport \
        z.pmap_clnt z.pmap_getma z.pmap_getpo z.pmap_prot \
        z.pmap_prot2 z.pmap_rmt z.rpc_prot z.rpc_common z.rpc_callms \
        z.xdr z.xdr_array z.xdr_mem z.clnt_tcp \
        z.xdr_rec z.xdr_refere z.xdr_stdio o.rpclibmem 

HDRS = h.auth h.auth_unix h.clnt h.pmap_clnt \
        h.pmap_prot h.pmap_rmt h.rpc h.rpc_msg h.types h.xdr

.SUFFIXES:	.z .o .s .c
.c.z:;       $(CC) $(CFLAGSM) -c -o $@ $<
.c.o:;       $(CC) $(CFLAGS) -c -o $@ $<
.s.o:;	     ${AS} ${ASFLAGS} -o $@ $<

COMPONENT = rpclib
LIBDIR = <Lib$Dir>

all:	rpclib rpclibzm

rpclib: ${OFILES} o._dirs
     ${LIB} -c rpclib ${OFILES}
     ${LIB} -d rpclib o.rpc_common
     ${LIB} -o rpclib

rpclibzm: ${ZFILES} o._dirs
     ${LIB} -c rpclibzm ${ZFILES}
     ${LIB} -d rpclibzm z.rpc_common
     ${LIB} -o rpclibzm

export: export_${PHASE}

export_hdrs:
        @echo ${COMPONENT}: export complete (hdrs)

export_libs: rpclib rpclibzm dirs
	${CP} rpclib	   TCPIPLibs:rpc.o.rpclib        ${CPFLAGS}
        ${CP} o.rpc_common TCPIPLibs:rpc.o.rpc_data      ${CPFLAGS}
	${CP} rpclibzm	   TCPIPLibs:rpc.o.rpclibzm	 ${CPFLAGS}
        ${CP} z.rpc_common TCPIPLibs:rpc.o.rpc_datazm    ${CPFLAGS}
        ${CP} copyright    TCPIPLibs:rpc.copyright       ${CPFLAGS}

dirs:
	${MKDIR} $(LIBDIR)
	${MKDIR} $(LIBDIR).TCPIPLibs
	${MKDIR} TCPIPLibs:rpc
        ${MKDIR} TCPIPLibs:rpc.o

o._dirs:
        ${MKDIR} o
        ${MKDIR} z
        create $@

clean:
	${WIPE} o.* ${WFLAGS}
	${WIPE} z.* ${WFLAGS}
        ${RM}   rpclib
        ${RM}   rpclibzm

# Dynamic dependencies:
