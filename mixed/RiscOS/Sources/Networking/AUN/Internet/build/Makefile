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
