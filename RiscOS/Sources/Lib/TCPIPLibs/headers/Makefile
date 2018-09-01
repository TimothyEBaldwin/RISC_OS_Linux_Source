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
# Makefile for include

# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date          Name         Description
# ----          ----         -----------
# 07-Feb-96     KJB          Created.
# 06-May-98     SNB          Copy ioctl_comp as ioctl_compat on export (long name)

LIBDIR = <Lib$Dir>

#
# Generic options:
#
MKDIR   = cdir
WIPE    = x wipe
CP      = copy
RM	= remove

WFLAGS  = ~c~v
CPFLAGS = ~cflnr~v

#
# Program specific options:
#
COMPONENT = include

HDRS = \
  arpa.h.ftp \
  arpa.h.inet \
  arpa.h.nameser \
  arpa.h.telnet \
  arpa.h.tftp \
  h.delay \
  h.errno \
  h.int_hndlr \
  h.ioc \
  h.netdb \
  h.pwd \
  h.riscos \
  h.sgtty \
  h.svcdebug \
  h.utmp \
  h.xcb \
  net.h.if \
  net.h.if_arp \
  net.h.netisr \
  net.h.raw_cb \
  net.h.route \
  netccitt.h.x25 \
  netinet.h.icmp_var \
  netinet.h.if_ether \
  netinet.h.in \
  netinet.h.in_pcb \
  netinet.h.in_systm \
  netinet.h.in_var \
  netinet.h.ip \
  netinet.h.ip_icmp \
  netinet.h.ip_var \
  netinet.h.tcp \
  netinet.h.tcpip \
  netinet.h.tcp_debug \
  netinet.h.tcp_fsm \
  netinet.h.tcp_seq \
  netinet.h.tcp_timer \
  netinet.h.tcp_var \
  netinet.h.udp \
  netinet.h.udp_var \
  netiso.h.iso \
  netiso.h.iso_var \
  netns.h.ns \
  netns.h.ns_if \
  protocols.h.routed \
  rpc.h.auth \
  rpc.h.auth_unix \
  rpc.h.clnt \
  rpc.h.netdb \
  rpc.h.pmap_clnt \
  rpc.h.pmap_prot \
  rpc.h.pmap_rmt \
  rpc.h.rpc \
  rpc.h.rpc_msg \
  rpc.h.svc \
  rpc.h.svc_auth \
  rpc.h.types \
  rpc.h.xdr \
  rpcsvc.h.bootparam \
  sys.arm.h.fp \
  sys.h.acct \
  sys.h.buf \
  sys.h.callout \
  sys.h.clist \
  sys.h.conf \
  sys.h.dcistructs \
  sys.h.dir \
  sys.h.domain \
  sys.h.errno \
  sys.h.fcntl \
  sys.h.file \
  sys.h.ioctl \
  sys.h.ipc \
  sys.h.mbuf \
  sys.h.mount \
  sys.h.namei \
  sys.h.param \
  sys.h.proc \
  sys.h.protosw \
  sys.h.resource \
  sys.h.sem \
  sys.h.signal \
  sys.h.socket \
  sys.h.socketvar \
  sys.h.stat \
  sys.h.syscall \
  sys.h.syslog \
  sys.h.systm \
  sys.h.time \
  sys.h.timeb \
  sys.h.times \
  sys.h.tty \
  sys.h.ttychars \
  sys.h.ttydev \
  sys.h.types \
  sys.h.uio \
  sys.h.un \
  sys.h.unpcb \
  sys.h.user \
  sys.h.wait

FILES = ${HDRS}

all: $(FILES)

release: ${FILES}
   ${CP} arpa       TCPIPLibs:arpa            ${CPFLAGS}
   ${CP} h          TCPIPLibs:h               ${CPFLAGS}
   ${CP} machine    TCPIPLibs:machine         ${CPFLAGS}
   ${CP} net        TCPIPLibs:net             ${CPFLAGS}
   ${CP} netinet    TCPIPLibs:netinet         ${CPFLAGS}
   ${CP} netns      TCPIPLibs:netns           ${CPFLAGS}
   ${CP} netiso     TCPIPLibs:netiso          ${CPFLAGS}
   ${CP} protocols  TCPIPLibs:protocols       ${CPFLAGS}
   ${CP} rpc        TCPIPLibs:rpc             ${CPFLAGS}
   ${CP} rpcsvc     TCPIPLibs:rpcsvc          ${CPFLAGS}
   ${CP} sys        TCPIPLibs:sys             ${CPFLAGS}

#------------------------------------------------------------------------
# RISC OS Build targets:
#

export: export_${PHASE}

clean:
        @echo ${COMPONENT}: no cleaning required

export_libs:
        @echo ${COMPONENT}: export complete (libs)

export_hdrs: ${HDRS} dirs
        ${CP} arpa       TCPIPLibs:arpa            ${CPFLAGS}
        ${CP} h          TCPIPLibs:h               ${CPFLAGS}
        ${CP} machine    TCPIPLibs:machine         ${CPFLAGS}
        ${CP} net        TCPIPLibs:net             ${CPFLAGS}
        ${CP} netccitt   TCPIPLibs:netccitt        ${CPFLAGS}
        ${CP} netinet    TCPIPLibs:netinet         ${CPFLAGS}
        ${CP} netiso     TCPIPLibs:netiso          ${CPFLAGS}
        ${CP} netns      TCPIPLibs:netns           ${CPFLAGS}
        ${CP} protocols  TCPIPLibs:protocols       ${CPFLAGS}
        ${CP} rpc        TCPIPLibs:rpc             ${CPFLAGS}
        ${CP} rpcsvc     TCPIPLibs:rpcsvc          ${CPFLAGS}
        ${CP} sys        TCPIPLibs:sys             ${CPFLAGS}
        ${RM} TCPIPLibs:sys.h.ioctl_comp
        ${RM} TCPIPLibs:sys.h.ttydefault
	${CP} sys.h.ioctl_comp TCPIPLibs:sys.h.ioctl_compat ${CPFLAGS}
	${CP} sys.h.ttydefault TCPIPLibs:sys.h.ttydefaults ${CPFLAGS}
        ${CP} ^.VersionNum TCPIPLibs:LibVersion    ${CPFLAGS}
        ${CP} ^.LibraryDoc TCPIPLibs:LibraryDoc    ${CPFLAGS}
        @echo ${COMPONENT}: export complete (hdrs)

dirs:
        ${MKDIR} ${LIBDIR}
        ${MKDIR} ${LIBDIR}.TCPIPLibs

install:
        ${MKDIR} ${INSTDIR}.TCPIPLibs
        ${CP} ${LIBDIR}.TCPIPLibs.* ${INSTDIR}.TCPIPLibs.* ${CPFLAGS}
        @echo ${COMPONENT}: installed

# End of RISC OS Build targets
#------------------------------------------------------------------------

