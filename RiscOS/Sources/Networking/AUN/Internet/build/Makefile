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
# Makefile for Internet
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name   Description
# ----       ----   -----------
# 18-Nov-94  AMcC   Created
# 05-Jan-95  AMcC   Added resources: rule and paths
# 21-Feb-95  AMcC   Resources now copied to AUNMsgs
# 22-Feb-95  AMcC   Added rules to build from sources
#

#
# Component specific options:
#
COMPONENT  = Internet
ROM_MODULE = aof.Internet
TARGET     = rm.Internet
RDIR       = Resources
LDIR       = ${RDIR}.${LOCALE}
RESDIR    = ^.^.AUNMsgs.Resources.${Locale}.Resources.${COMPONENT}

# amu version 5.02 can't cope with @ in VPATH so we have to use ^.build
#
VPATH     = ^.build ^.kern ^.net ^.netinet ^.sys ^.riscos ^.lib ^.whoami

#
# Generic options:
#
AS      = objasm
CC      = cc
CMHG    = cmhg
CP      = copy
LD      = link
MKDIR   = cdir
MODSQZ  = modsqz
RM      = remove
WIPE    = -wipe

AFLAGS   = -depend !Depend -I<Hdr$Dir>.Global.,<Hdr$Dir>.Interface. -Stamp -quit
CFLAGS   = -depend !Depend -zps1 -zM -ffa -Wacnp ${INCLUDES} ${DFLAGS} ${OPTS} ${THROWBACK}
DFLAGS   = -DKERNEL -DINET -DGATEWAY -DCOMPAT_43 -DCOMPAT_OLDSOCK \
 -DDIRECTED_BROADCAST -DMULTICAST -DDELAY_EVENTS #-DMROUTING -DIPFIREWALL \
 -DIPFIREWALL_VERBOSE -DFLASHY_SCROLLLOCK -DTCPTDEBUG -DTCPDEBUG \
 #-DDIAGNOSTIC -DDEBUG_MTUDISC
INCLUDES = -ITCPIPLibs:,C:
CPFLAGS  = ~cfr~v
LDFLAGS  = -linkversion 514
WFLAGS   = ~c~v

#
# Libraries
#
ANSILIB   = CLib:o.ansilib
CLIB      = CLIB:o.stubs
RLIB      = RISCOSLIB:o.risc_oslib
ROMCSTUBS = RISCOSLIB:o.romcstubs
ABSSYM    = RISC_OSLib:o.abssym

OBJS =\
 InetHdr.o\
 poduleirq.o\
 kern_subr.o\
 kern_mib.o\
 sysctl.o\
 sys_socket.o\
 uipc_mbuf.o\
 kvm.o\
 unixenv.o\
 tick_entry.o\
 if.o\
 if_loop.o\
 if_module.o\
 radix.o\
 raw_cb.o\
 raw_usrreq.o\
 route.o\
 rtsock.o\
 if_ether.o\
 igmp.o\
 in.o\
 in_cksum.o\
 ip_mroute.o\
 in_pcb.o\
 in_proto.o\
 in_rmx.o\
 ip_icmp.o\
 ip_input.o\
 ip_output.o\
 raw_ip.o\
 tcp_debug.o\
 tcp_input.o\
 tcp_output.o\
 tcp_subr.o\
 tcp_timer.o\
 tcp_usrreq.o\
 udp_usrreq.o\
 globdata.o\
 mbuf.o\
 module.o\
 setsoft.o\
 socket_swi.o\
 init.o\
 swiveneers.o\
 domain.o\
 socket.o\
 socket1.o\
 whoami.o
#svcprint.o
#ip_fw.o\
#tcp_debug.o

#
# Rule patterns
#
.c.o:;      ${CC} -c ${CFLAGS} -o $@ $<
.c.s:;      ${CC} -S ${CFLAGS} $<
.cmhg.o:;   ${CMHG} -p -o $@ $<
.s.o:;      ${AS} ${AFLAGS} $< $@
.cmhg.h:;   ${CMHG} -p -d $@ $<

#
# Main rules:
#
all: ${TARGET}
	@echo ${COMPONENT}: Module built (Relocatable)

${TARGET}: ${OBJS} ${CLIB}
        ${LD} ${LDFLAGS} -rmf -o $@ ${OBJS} ${CLIB} -s Syms
        ${MODSQZ} $@
        Access $@ WR/r

rom: ${ROM_MODULE}
        @echo ${COMPONENT}: Module built (ROM)

install: ${TARGET}
        ${CP} ${TARGET} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: Module installed (RAM)

install_rom: ${ROM_MODULE}
        ${CP} ${ROM_MODULE} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: Module installed (ROM)

resources:
        @echo ${COMPONENT}: Resources in AUNMsgs

clean:
        ${RM} ${ROM_MODULE}
        ${RM} ${TARGET}
        ${RM} Syms
        ${WIPE} linked.* ${WFLAGS}
        ${WIPE} map.* ${WFLAGS}
        ${WIPE} o.* ${WFLAGS}
        ${RM} h.InetHdr
        @echo ${COMPONENT}: cleaned

${ROM_MODULE}: ${OBJS} ${ROMCSTUBS}
        ${LD} ${LDFLAGS} -o $@ -aof ${OBJS} ${ROMCSTUBS}

o.socket_swi: InetHdr.h


# final link for ROM Image (using given base address)
rom_link:
        ${MKDIR} linked
        ${MKDIR} map
        ${LD} -o linked.${COMPONENT} ${LDFLAGS} -rmf -base ${ADDRESS} ${ROM_MODULE} ${ABSSYM} \
              -map > map.${COMPONENT}
        ${CP} linked.${COMPONENT} ${LINKDIR}.${COMPONENT} ${CPFLAGS}
        @echo ${COMPONENT}: rom_link complete

BBETYPE = internet
bbe-internet: bbe-generic
        BBE_Export_File ^.VersionNum

#---------------------------------------------------------------------------
# Dynamic dependencies:
