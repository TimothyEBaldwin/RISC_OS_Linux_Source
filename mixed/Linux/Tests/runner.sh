#!/bin/bash

set -e

find mixed/Linux/Tests -depth -exec ./comma2attr -- '{}' +
export RISC_OS_Test_Dir='IXFS:$.proc.self.cwd.mixed.Linux.Tests'

RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' timeout --foreground -sKILL 30 $* --nofork --noaborts

RISC_OS_Alias_IXFSBoot="Exec IXFS:$.proc.self.cwd.mixed.Linux.Tests.Exec" timeout --foreground -sKILL 60 $* --nofork 3>/dev/null 2>&1
