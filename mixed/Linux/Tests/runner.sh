#!/bin/bash

set -e

export RISC_OS_Test_Dir='IXFS:$.proc.self.cwd.mixed.Linux.Tests'

RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' timeout --foreground -sKILL 30 $* --nofork --noaborts

RISC_OS_Alias_IXFSBoot='Exec <Test$Dir>.Exec' timeout --foreground -sKILL 60 $* --nofork 3>/dev/null 2>&1
