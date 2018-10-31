# Copyright 1996 Acorn Computers Ltd
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
# Makefile for Net
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 24-Mar-95  JDavies      Created from main makefile

#
# Generic options:
#
MKDIR   = cdir
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
RM      = remove
WIPE    = x wipe

AFLAGS  = -depend !Depend -Stamp -quit
CFLAGS  = -c -depend !Depend -fahf -zps1 -pcc -zM ${INCLUDES} ${DFLAGS}
CPFLAGS = ~cfr~v
WFLAGS  = ~c~v

#
# Libraries
#
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
RSTUBS    = RISCOSLIB:o.rstubs
ROMSTUBS  = RISCOSLIB:o.romstubs
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.AbsSym

#
# Program specific options:
#
COMPONENT = NetP
TARGET    = rm.NetP

INCLUDES  = -IINetInc:
#DFLAGS    = -DDEBUG

OBJS   = o.mns o.mnscommon o.io o.swis o.configure o.netasm o.route o.showrt \
         o.text o.stubs o.inetfn o.debug


#
# Rule patterns
#
.c.o:;      ${CC} ${CFLAGS} -o $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@

#
# AUN build rules:
#
all:    rm.NetP


clean:
        ${WIPE} o.* ${WFLAGS}
        ${WIPE} rm.* ${WFLAGS}
        ${WIPE} map.* ${WFLAGS}
        ${RM} ${TARGET}
        @echo ${COMPONENT}: cleaned

rm.NetP: ${OBJS} cmhg.MNSHdr_p ${LCLIB}
         ${CMHG} cmhg.mnsHdr_p o.mnshdr_p
         ${LD} -o $@ -module -map o.mnshdr_p ${OBJS} ${CLIB} > map.linkmap_p


# Dynamic dependencies:
o.mns:	c.mns
o.mns:	C:h.kernel
o.mns:	C:h.swis
o.mns:	INetInc:sys.h.types
o.mns:	INetInc:sys.h.uio
o.mns:	INetInc:sys.h.socket
o.mns:	INetInc:sys.h.time
o.mns:	INetInc:sys.h.time
o.mns:	INetInc:sys.h.ioctl
o.mns:	INetInc:sys.h.ttychars
o.mns:	INetInc:sys.h.ttydev
o.mns:	INetInc:sys.h.dcistructs
o.mns:	INetInc:netinet.h.in
o.mns:	INetInc:net.h.if
o.mns:	INetInc:sys.h.mbuf
o.mns:	INetInc:net.h.if_arp
o.mns:	INetInc:sys.h.socket
o.mns:	INetInc:protocols.h.routed
o.mns:	h.netasm
o.mns:	h.module
o.mns:	h.mnscommon
o.mns:	h.configure
o.mns:	h.debug
o.mns:	h.inetfn
o.mns:	h.io
o.mns:	h.showrt
o.mns:	h.stubs
o.mns:	h.swicode
o.mns:	h.text
o.mns:	h.routecode
o.mns:	h.mns
o.mnscommon:	c.mnscommon
o.mnscommon:	C:h.kernel
o.mnscommon:	C:h.swis
o.mnscommon:	INetInc:sys.h.types
o.mnscommon:	INetInc:sys.h.socket
o.mnscommon:	INetInc:sys.h.ioctl
o.mnscommon:	INetInc:sys.h.ttychars
o.mnscommon:	INetInc:sys.h.ttydev
o.mnscommon:	INetInc:netinet.h.in
o.mnscommon:	INetInc:sys.h.dcistructs
o.mnscommon:	h.netasm
o.mnscommon:	h.module
o.mnscommon:	h.debug
o.mnscommon:	h.mns
o.mnscommon:	h.mnscommon
o.mnscommon:	h.text
o.io:	c.io
o.io:	INetInc:sys.h.types
o.io:	INetInc:sys.h.socket
o.io:	INetInc:netinet.h.in
o.io:	INetInc:netinet.h.in_systm
o.io:	INetInc:netinet.h.ip
o.io:	INetInc:netinet.h.in_systm
o.io:	INetInc:netinet.h.ip_var
o.io:	INetInc:netinet.h.udp
o.io:	INetInc:netinet.h.udp_var
o.io:	INetInc:sys.h.errno
o.io:	INetInc:sys.^.h.errno
o.io:	C:h.kernel
o.io:	INetInc:sys.h.mbuf
o.io:	C:h.kernel
o.io:	C:h.swis
o.io:	h.module
o.io:	h.io
o.io:	h.mns
o.io:	h.netasm
o.io:	h.stubs
o.swis:	c.swis
o.swis:	C:h.kernel
o.swis:	C:h.swis
o.swis:	INetInc:sys.h.types
o.swis:	h.module
o.swis:	h.debug
o.swis:	h.inetfn
o.swis:	h.mns
o.swis:	h.mnscommon
o.swis:	h.netasm
o.swis:	h.io
o.swis:	h.swicode
o.configure:	c.configure
o.configure:	C:h.kernel
o.configure:	C:h.swis
o.configure:	INetInc:sys.h.types
o.configure:	INetInc:sys.h.socket
o.configure:	INetInc:sys.h.ioctl
o.configure:	INetInc:sys.h.ttychars
o.configure:	INetInc:sys.h.ttydev
o.configure:	INetInc:sys.h.dcistructs
o.configure:	INetInc:net.h.if
o.configure:	INetInc:sys.h.mbuf
o.configure:	INetInc:net.h.if_arp
o.configure:	INetInc:sys.h.socket
o.configure:	h.configure
o.configure:	h.swicode
o.configure:	h.module
o.configure:	h.debug
o.netasm: s.netasm
o.netasm: Hdr:ListOpts
o.netasm: Hdr:Macros
o.netasm: Hdr:System
o.netasm: Hdr:SWIs
o.netasm: Hdr:CPU.Generic26
o.netasm: Hdr:IO.GenericIO
o.netasm: Hdr:RISCOS
o.netasm: Hdr:EnvNumbers
o.netasm: Hdr:FSNumbers
o.netasm: Hdr:NewErrors
o.netasm: Hdr:ModHand
o.netasm: Hdr:Econet
o.netasm: Hdr:MsgTrans
o.netasm: Hdr:Symbols
o.netasm: Hdr:CMOS
o.route:	c.route
o.route:	INetInc:sys.h.types
o.route:	INetInc:sys.h.socket
o.route:	INetInc:sys.h.ioctl
o.route:	INetInc:sys.h.ttychars
o.route:	INetInc:sys.h.ttydev
o.route:	INetInc:net.h.route
o.route:	INetInc:protocols.h.routed
o.route:	INetInc:netinet.h.in
o.route:	h.module
o.route:	h.routecode
o.route:	h.stubs
o.showrt:	c.showrt
o.showrt:	C:h.kernel
o.showrt:	INetInc:sys.h.types
o.showrt:	INetInc:sys.h.socket
o.showrt:	INetInc:sys.h.ioctl
o.showrt:	INetInc:sys.h.ttychars
o.showrt:	INetInc:sys.h.ttydev
o.showrt:	INetInc:sys.h.mbuf
o.showrt:	INetInc:net.h.route
o.showrt:	INetInc:netinet.h.in
o.showrt:	h.module
o.showrt:	h.mnscommon
o.showrt:	h.mns
o.showrt:	h.showrt
o.showrt:	h.stubs
o.text:	c.text
o.text:	INetInc:sys.h.types
o.text:	h.module
o.text:	h.text
o.stubs:	c.stubs
o.stubs:	C:h.kernel
o.stubs:	INetInc:sys.h.types
o.stubs:	INetInc:sys.h.errno
o.stubs:	INetInc:sys.^.h.errno
o.stubs:	C:h.kernel
o.stubs:	INetInc:sys.h.socket
o.stubs:	INetInc:sys.h.time
o.stubs:	INetInc:sys.h.time
o.stubs:	h.stubs
o.stubs:	h.debug
o.inetfn:	c.inetfn
o.inetfn:	INetInc:sys.h.types
o.inetfn:	INetInc:netinet.h.in
o.inetfn:	h.inetfn
o.debug:	c.debug
o.debug:	C:h.kernel
o.debug:	C:h.swis
o.debug:	h.debug
