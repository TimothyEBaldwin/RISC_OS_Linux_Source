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
# Makefile for Internet resources
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date           Name   Description
# ----           ----   -----------
# 03-Jul-96      KJB    Derived from Scrap makefile
# 05-Oct-99      SNB    Updated to allow slimmed down STB !Internet to be built.
#                       Passing OPTIONS=STB builds a cut down structure.
#

#
# Program specific options:
#
COMPONENT  = Internet
APP        = !${COMPONENT}
RDIR       = Resources
LDIR       = ${RDIR}.${LOCALE}
SDIR       = Sources
INSTAPP    = ${INSTDIR}.${APP}
RESD       = ${RESDIR}.Internet

# Generic options:
#
MKDIR   = do mkdir -p
CHMOD   = Unix.chmod ${CHMODFLAGS}
CP      = copy
RM      = remove
WIPE    = x wipe
AWK     = GNU.gawk

CPFLAGS = ~cfr~v
WFLAGS  = ~c~v
CHMODFLAGS = -R 0777

COMMONFILES=\
 ${SDIR}.arp.ARP\
 ${SDIR}.ifconfig.IfConfig\
 ${SDIR}.inetstat.InetStat\
 ${SDIR}.ipvars.IPVars\
 ${SDIR}.ping.Ping\
 ${SDIR}.route.Route\
 ${SDIR}.showstat.ShowStat\
 ${SDIR}.sysctl.SysCtl\
 ${SDIR}.traceroute.TraceRoute

STBFILES=\
        ${RDIR}.!Boot\

DBFILES=\
        ${RDIR}.files.AUNMap\
        ${RDIR}.files.CertData\
        ${RDIR}.files.Hosts\
        ${RDIR}.files.MimeMap\
        ${RDIR}.files.Networks\
        ${RDIR}.files.Protocols\
        ${RDIR}.files.Services\

DISCFILES=\
        ${RDIR}.!Boot\
        ${LDIR}.!Help\
        ${LDIR}.!Run\
        ${RDIR}.!Sprites\
        ${RDIR}.!Sprites22\
        ${RDIR}.!Sprites11\
        ${SDIR}.gethost.GetHost\
        ${SDIR}.ifrconfig.IfRConfig\
        ${SDIR}.map-mbone.Map-MBone\
        ${SDIR}.md5.MD5\
        ${SDIR}.mrinfo.MRInfo\
        ${SDIR}.mtrace.MTrace\
        ${SDIR}.tftp.Tftp\
        ${SDIR}.utils.utl.RMFind\
        ${RDIR}.utils.BootNet\
        ${SDIR}.utils.utl.CheckMem\
        ${SDIR}.newfiler.NewFiler\
        ${SDIR}.utils.utl.ReadCMOSIP\
        ${SDIR}.utils.utl.TriggerCBs

FILES=\
        ${COMMONFILES} \
        ${DISCFILES} \
        ${DBFILES} \
        ${STBFILES}

EMERGENCYUTILS = \
        ${SDIR}.arp.ARP              \
        ${SDIR}.ifconfig.IfConfig    \
        ${SDIR}.ping.Ping            \
        ${SDIR}.utils.utl.CheckMem   \
        ${SDIR}.newfiler.NewFiler    \
        ${SDIR}.sysctl.SysCtl        \
        ${LDIR}.!Run                 \
  
NETUTILS = \
        ${SDIR}.arp.ARP              \
        ${SDIR}.ifrconfig.IfRConfig  \
        ${SDIR}.ifconfig.IfConfig    \
        ${SDIR}.inetstat.InetStat    \
        ${SDIR}.ipvars.IPVars        \
        ${SDIR}.map-mbone.Map-MBone  \
        ${SDIR}.md5.MD5              \
        ${SDIR}.mrinfo.MRInfo        \
        ${SDIR}.mtrace.MTrace        \
        ${SDIR}.ping.Ping            \
        ${SDIR}.utils.utl.RMFind     \
        ${SDIR}.route.Route          \
        ${SDIR}.showstat.ShowStat    \
        ${SDIR}.sysctl.SysCtl        \
        ${SDIR}.tftp.Tftp            \
        ${SDIR}.traceroute.TraceRoute \
        ${RDIR}.!Boot                 \
        ${LDIR}.!Run                  \
        ${RDIR}.!Sprites              \
        ${RDIR}.!Sprites11            \
        ${RDIR}.!Sprites22            \

#
# Main rules:
#
all: ${FILES}
        @echo ${COMPONENT}: All built (Disc)

install: install_${OPTIONS} install_common dirs
        ${CHMOD} ${INSTAPP}
        @echo ${COMPONENT}: All installed (Disc)

install_common: ${COMMONFILES}
        ${RM} ${INSTAPP}.!Help
        ${RM} ${INSTAPP}.!Run
        ${RM} ${INSTAPP}.!Boot
        ${RM} ${INSTAPP}.files.AUNMap
        ${CP} ${SDIR}.arp.ARP               ${INSTAPP}.bin.ARP          ${CPFLAGS}
        ${CP} ${SDIR}.ifconfig.IfConfig     ${INSTAPP}.bin.IfConfig     ${CPFLAGS}
        ${CP} ${SDIR}.inetstat.InetStat     ${INSTAPP}.bin.InetStat     ${CPFLAGS}
        ${CP} ${SDIR}.ipvars.IPVars         ${INSTAPP}.bin.IPVars       ${CPFLAGS}
        ${CP} ${SDIR}.ping.Ping             ${INSTAPP}.bin.Ping         ${CPFLAGS}
        ${CP} ${SDIR}.route.Route           ${INSTAPP}.bin.Route        ${CPFLAGS}
        ${CP} ${SDIR}.showstat.ShowStat     ${INSTAPP}.bin.ShowStat     ${CPFLAGS}
        ${CP} ${SDIR}.sysctl.SysCtl         ${INSTAPP}.bin.SysCtl       ${CPFLAGS}
        ${CP} ${SDIR}.traceroute.TraceRoute ${INSTAPP}.bin.TraceRoute   ${CPFLAGS}

install_STB: ${STBFILES} ${DBFILES}
        ${AWK} -f awk.Version LocalUserIFRes:!Boot > ${INSTAPP}.!Boot
        SetType ${INSTAPP}.!Boot Obey
        ${CP} LocalUserIFRes:CopyLocal ${INSTAPP}.CopyLocal       ${CPFLAGS}
        ${CP} LocalUserIFRes:RTime     ${INSTAPP}.bin.RTime       ${CPFLAGS}
        ${CP} ${RDIR}.files.Hosts      ${INSTAPP}.files.Hosts     ${CPFLAGS}
        ${CP} LocalUserIFRes:MimeMap   ${INSTAPP}.files.MimeMap   ${CPFLAGS}
        ${CP} ${RDIR}.files.Networks   ${INSTAPP}.files.Networks  ${CPFLAGS}
        ${CP} ${RDIR}.files.Protocols  ${INSTAPP}.files.Protocols ${CPFLAGS}
        ${CP} ${RDIR}.files.Services   ${INSTAPP}.files.Services  ${CPFLAGS}

install_: ${DISCFILES} ${DBFILES}
        ${AWK} -f awk.Version ${RDIR}.!Boot > ${INSTAPP}.!Boot
        SetType ${INSTAPP}.!Boot Obey
        ${AWK} -f awk.Version ${LDIR}.!Help > ${INSTAPP}.!Help
        ${AWK} -f awk.Version ${LDIR}.!Run >  ${INSTAPP}.!Run
        SetType ${INSTAPP}.!Run Obey
        |
        ${MKDIR} ${INSTAPP}.Themes
        ${CP} ${RDIR}.!Sprites   ${INSTAPP}.Themes.!Sprites   ${CPFLAGS}
        ${CP} ${RDIR}.!Sprites11 ${INSTAPP}.Themes.!Sprites11 ${CPFLAGS}
        ${CP} ${RDIR}.!Sprites22 ${INSTAPP}.Themes.!Sprites22 ${CPFLAGS}
        ${CP} ${LDIR}.Ursula     ${INSTAPP}.Themes.Ursula     ${CPFLAGS}
        ${CP} ${LDIR}.Morris4    ${INSTAPP}.Themes.Morris4    ${CPFLAGS}
        |
        ${CP} ${RDIR}.files      ${INSTAPP}.files      ${CPFLAGS}
        ${AWK} -f awk.Version ${RDIR}.files.AUNMap > ${INSTAPP}.files.AUNMap
        SetType ${INSTAPP}.files.AUNMap Obey
        ${CP} ${RDIR}.utils      ${INSTAPP}.utils      ${CPFLAGS}
        |
        ${CP} ${SDIR}.gethost.GetHost       ${INSTAPP}.bin.GetHost      ${CPFLAGS}
        ${CP} ${SDIR}.ifrconfig.IfRConfig   ${INSTAPP}.bin.IfRConfig    ${CPFLAGS}
        ${CP} ${SDIR}.map-mbone.Map-MBone   ${INSTAPP}.bin.Map-MBone    ${CPFLAGS}
        ${CP} ${SDIR}.md5.MD5               ${INSTAPP}.bin.MD5          ${CPFLAGS}
        ${CP} ${SDIR}.mrinfo.MRInfo         ${INSTAPP}.bin.MRInfo       ${CPFLAGS}
        ${CP} ${SDIR}.mtrace.MTrace         ${INSTAPP}.bin.MTrace       ${CPFLAGS}
        ${CP} ${SDIR}.tftp.Tftp             ${INSTAPP}.bin.Tftp         ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.RMFind      ${INSTAPP}.bin.RMFind       ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.CheckMem    ${INSTAPP}.utils.CheckMem   ${CPFLAGS}
        ${CP} ${SDIR}.newfiler.NewFiler     ${INSTAPP}.utils.NewFiler   ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.ReadCMOSIP  ${INSTAPP}.utils.ReadCMOSIP ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.TriggerCBs  ${INSTAPP}.utils.TriggerCBs ${CPFLAGS}

dirs:
        ${MKDIR} ${INSTAPP}
        ${MKDIR} ${INSTAPP}.bin
        ${MKDIR} ${INSTAPP}.files

clean:
        dir ${SDIR}
        !MkMods clean
        up
        @echo ${COMPONENT}: cleaned

resources: resources-${TYPE}

resources-:
        @echo ${COMPONENT}: No resource files to copy

resources-NetUtils: ${NETUTILS}
        ${MKDIR} ${RESD}.Themes
        ${MKDIR} ${RESD}.bin
        ${MKDIR} ${RESD}.files
        ${CP} ${SDIR}.arp.ARP               ${RESD}.bin.ARP          ${CPFLAGS}
        ${CP} ${SDIR}.ifconfig.IfConfig     ${RESD}.bin.IfConfig     ${CPFLAGS}
        ${CP} ${SDIR}.ifrconfig.IfRConfig   ${RESD}.bin.IfRConfig    ${CPFLAGS}
        ${CP} ${SDIR}.ipvars.IPVars         ${RESD}.bin.IPVars       ${CPFLAGS}
        ${CP} ${SDIR}.inetstat.InetStat     ${RESD}.bin.InetStat     ${CPFLAGS}
        ${CP} ${SDIR}.map-mbone.Map-MBone   ${RESD}.bin.Map-MBone    ${CPFLAGS}
        ${CP} ${SDIR}.md5.MD5               ${RESD}.bin.MD5          ${CPFLAGS}
        ${CP} ${SDIR}.mrinfo.MRInfo         ${RESD}.bin.MRInfo       ${CPFLAGS}
        ${CP} ${SDIR}.mtrace.MTrace         ${RESD}.bin.MTrace       ${CPFLAGS}
        ${CP} ${SDIR}.ping.Ping             ${RESD}.bin.Ping         ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.RMFind      ${RESD}.bin.RMFind       ${CPFLAGS}
        ${CP} ${SDIR}.route.Route           ${RESD}.bin.Route        ${CPFLAGS}
        ${CP} ${SDIR}.sysctl.SysCtl         ${RESD}.bin.SysCtl       ${CPFLAGS}
        ${CP} ${SDIR}.showstat.ShowStat     ${RESD}.bin.ShowStat     ${CPFLAGS}
        ${CP} ${SDIR}.traceroute.TraceRoute ${RESD}.bin.TraceRoute   ${CPFLAGS}
        ${CP} ${SDIR}.tftp.Tftp             ${RESD}.bin.Tftp         ${CPFLAGS}
        ${AWK} -f awk.Version ${RDIR}.files.AUNMap > ${RESD}.files.AUNMap
        SetType ${RESD}.files.AUNMap Obey
        ${CP} ${RDIR}.files.Hosts           ${RESD}.files.Hosts      ${CPFLAGS}
        ${CP} ${RDIR}.files.Networks        ${RESD}.files.Networks   ${CPFLAGS}
        ${CP} ${RDIR}.files.Protocols       ${RESD}.files.Protocols  ${CPFLAGS}
        ${CP} ${RDIR}.files.Services        ${RESD}.files.Services   ${CPFLAGS}
        ${AWK} -f awk.Version ${RDIR}.!Boot > ${RESD}.!Boot
        SetType ${RESD}.!Boot Obey
        ${AWK} -f awk.Version ${LDIR}.!Run > ${RESD}.!Run
        SetType ${RESD}.!Run Obey
        ${CP} ${RDIR}.!Sprites              ${RESD}.Themes.!Sprites   ${CPFLAGS}
        ${CP} ${RDIR}.!Sprites22            ${RESD}.Themes.!Sprites22 ${CPFLAGS}

resources-EmergencyUtils: ${EMERGENCYUTILS}
        ${MKDIR} ${RESD}
        ${MKDIR} ${RESD}.bin
        ${MKDIR} ${RESD}.utils
        ${MKDIR} ${RESD}.files
        ${CP} ${SDIR}.arp.ARP               ${RESD}.bin.ARP          ${CPFLAGS}
        ${CP} ${SDIR}.ifconfig.IfConfig     ${RESD}.bin.IfConfig     ${CPFLAGS}
        ${CP} ${SDIR}.ping.Ping             ${RESD}.bin.Ping         ${CPFLAGS}
        ${CP} ${SDIR}.utils.utl.CheckMem    ${RESD}.utils.CheckMem   ${CPFLAGS}
        ${CP} ${SDIR}.newfiler.NewFiler     ${RESD}.utils.NewFiler   ${CPFLAGS}
        ${CP} ${SDIR}.sysctl.SysCtl         ${RESD}.bin.SysCtl       ${CPFLAGS}
        ${AWK} -f awk.Version ${RDIR}.files.AUNMap > ${RESD}.files.AUNMap
        SetType ${RESD}.files.AUNMap Obey
        ${CP} ${RDIR}.files.Hosts           ${RESD}.files.Hosts      ${CPFLAGS}
        ${CP} ${RDIR}.files.Networks        ${RESD}.files.Networks   ${CPFLAGS}
        ${CP} ${RDIR}.files.Protocols       ${RESD}.files.Protocols  ${CPFLAGS}
        ${CP} ${RDIR}.files.Services        ${RESD}.files.Services   ${CPFLAGS}
        ${AWK} -f awk.Version ${LDIR}.!Run > ${RESD}.!Run
        SetType ${RESD}.!Run Obey

${SDIR}.arp.ARP: ${SDIR}.arp.c.ARP
        dir ${SDIR}.arp
        @amu_machine
        @up
        @up

${SDIR}.ifconfig.IfConfig: ${SDIR}.ifconfig.c.IfConfig
        dir ${SDIR}.ifconfig
        @amu_machine
        @up
        @up

${SDIR}.ifrconfig.IfRConfig: ${SDIR}.ifrconfig.c.IfRConfig
        dir ${SDIR}.ifrconfig
        @amu_machine
        @up
        @up

${SDIR}.gethost.GetHost: ${SDIR}.gethost.c.gethost
        dir ${SDIR}.gethost
        @amu_machine
        @up
        @up

${SDIR}.ipvars.IPVars: ${SDIR}.ipvars.c.ipvars
        dir ${SDIR}.ipvars
        @amu_machine
        @up
        @up

${SDIR}.inetstat.InetStat: ${SDIR}.inetstat.c.main \
        ${SDIR}.inetstat.c.if\
        ${SDIR}.inetstat.c.inet\
        ${SDIR}.inetstat.c.route\
        ${SDIR}.inetstat.c.mroute
        dir ${SDIR}.inetstat
        @amu_machine
        @up
        @up

${SDIR}.map-mbone.Map-MBone: ${SDIR}.map-mbone.c.Map-MBone \
        ${SDIR}.map-mbone.c.igmp \
        ${SDIR}.map-mbone.c.inet \
        ${SDIR}.map-mbone.c.kern
        dir ${SDIR}.map-mbone
        @amu_machine
        @up
        @up

${SDIR}.md5.MD5: ${SDIR}.md5.c.md5 \
        ${SDIR}.md5.c.md5c \
        ${SDIR}.md5.c.mdXhl
        dir ${SDIR}.md5
        @amu_machine
        @up
        @up

${SDIR}.mrinfo.MRInfo: ${SDIR}.mrinfo.c.MRInfo \
        ${SDIR}.mrinfo.c.igmp \
        ${SDIR}.mrinfo.c.inet \
        ${SDIR}.mrinfo.c.kern
        dir ${SDIR}.mrinfo
        @amu_machine
        @up
        @up

${SDIR}.mtrace.MTrace: ${SDIR}.mtrace.c.MTrace
        dir ${SDIR}.mtrace
        @amu_machine
        @up
        @up

${SDIR}.ping.Ping: ${SDIR}.ping.c.Ping
        dir ${SDIR}.ping
        @amu_machine
        @up
        @up

${SDIR}.pong.Pong: ${SDIR}.pong.c.Pong
        dir ${SDIR}.pong
        @amu_machine
        @up
        @up

${SDIR}.route.Route: ${SDIR}.route.c.Route
        dir ${SDIR}.route
        @amu_machine
        @up
        @up

${SDIR}.showstat.ShowStat:
        dir ${SDIR}.showstat
        @amu_machine 
        @up
        @up

${SDIR}.sysctl.SysCtl: ${SDIR}.sysctl.c.SysCtl
        dir ${SDIR}.sysctl
        @amu_machine
        @up
        @up

${SDIR}.tftp.Tftp: ${SDIR}.tftp.c.main \
        ${SDIR}.tftp.c.tftp \
        ${SDIR}.tftp.c.tftpsubs
        dir ${SDIR}.tftp
        @amu_machine
        @up
        @up

${SDIR}.traceroute.TraceRoute: ${SDIR}.traceroute.c.TraceRoute
        dir ${SDIR}.traceroute
        @amu_machine
        @up
        @up

${SDIR}.newfiler.NewFiler: ${SDIR}.newfiler.c.NewFiler
        dir ${SDIR}.newfiler
        @amu_machine
        @up
        @up

${SDIR}.utils.utl.CheckMem: ${SDIR}.utils.s.CheckMem
        dir ${SDIR}.utils
        @amu_machine utl.CheckMem
        @up
        @up

${SDIR}.utils.utl.ReadCMOSIP: ${SDIR}.utils.s.ReadCMOSIP
        dir ${SDIR}.utils
        @amu_machine utl.ReadCMOSIP
        @up
        @up

${SDIR}.utils.utl.RMFind: ${SDIR}.utils.s.RMFind
        dir ${SDIR}.utils
        @amu_machine utl.RMFind
        @up
        @up

${SDIR}.utils.utl.TriggerCBs: ${SDIR}.utils.s.TriggerCBs
        dir ${SDIR}.utils
        @amu_machine utl.TriggerCBs
        @up
        @up

${SDIR}.utils.utl.X: ${SDIR}.utils.s.X
        dir ${SDIR}.utils
        @amu_machine utl.X
        @up
        @up

# Dynamic dependencies:
