#!/bin/bash

set -e

find mixed/Linux/Tests -depth -exec ./comma2attr -- '{}' +

timeout --foreground -sKILL 30 $* --nofork --noaborts << 'END'
*BASIC
*ChangeDynamicArea -ramfssize 8M
TIME=0
REPEAT:UNTIL TIME>10
SYS "IXSupport_LinuxSyscall",,,,,,,,1
!0=0
END

RISC_OS_Alias_IXFSBoot="Exec IXFS:$.proc.self.cwd.mixed.Linux.Tests.Exec" timeout --foreground -sKILL 60 $* --nofork 3>/dev/null 2>&1
