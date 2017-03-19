#!/bin/bash

set -e

timeout --foreground -sKILL 30 $* --nofork --noaborts << 'END'
*BASIC
0 ON ERROR PRINT REPORT$;" at line ";ERL:?0=0
1 *ChangeDynamicArea -ramfssize 6M
2 *ChangeDynamicArea -ramfssize 4M
3 *ChangeDynamicArea -ramfssize 8M
4 TIME=0
5 REPEAT:UNTIL TIME>10
RUN
TEXTLOAD "IXFS:$.proc.self.cwd.mixed.Linux.Tests.TTest"
RUN
SYS "IXSupport_LinuxSyscall",,,,,,,,1
!0=0
END

RISC_OS_Alias_IXFSBoot="Exec IXFS:$.proc.self.cwd.mixed.Linux.Tests.Exec" timeout --foreground -sKILL 60 $* --nofork 3>/dev/null 2>&1
