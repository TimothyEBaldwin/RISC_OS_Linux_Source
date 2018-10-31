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

COMPONENT   = Internet
VPATH       = ^.build ^.kern ^.net ^.netinet ^.sys ^.riscos ^.lib ^.whoami
LIBS        = ${ASMUTILS}
OBJS        = poduleirq kern_subr kern_mib sysctl sys_socket uipc_mbuf kvm unixenv \
              tick_entry if if_loop if_module radix raw_cb raw_usrreq route rtsock \
              if_ether igmp in in_cksum ip_mroute in_pcb in_proto in_rmx ip_icmp \
              ip_input ip_output raw_ip tcp_debug tcp_input tcp_output tcp_subr tcp_timer \
              tcp_usrreq udp_usrreq globdata mbuf module setsoft socket_swi init swiveneers \
              domain socket socket1 whoami #svcprint ip_fw tcp_debug
CINCLUDES   = -ITCPIPLibs:,C:
HDRS        =
CFLAGS      = -Wacnp 
ROMCDEFINES = -DROM
CMHGFILE    = InetHdr
CMHGDEPENDS = module socket_swi
CDEFINES    = -DKERNEL -DINET -DGATEWAY -DCOMPAT_43 -DCOMPAT_OLDSOCK -DDIRECTED_BROADCAST \
              -DMULTICAST -DDELAY_EVENTS #-DMROUTING -DIPFIREWALL -DIPFIREWALL_VERBOSE \
              -DFLASHY_SCROLLLOCK -DTCPTDEBUG -DTCPDEBUG -DDIAGNOSTIC -DDEBUG_MTUDISC 

include CModule

# Dynamic dependencies:
