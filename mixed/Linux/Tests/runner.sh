#!/bin/bash

set -e

if [ "$RISC_OS_Test_NetOK" == "YES" ]; then
  # Configure network
  ip link set lo up
else
  # Create namespace if possible
  if unshare --user --net --mount --pid --fork --mount-proc --map-root-user true; then
    export RISC_OS_Test_NetOK=YES
    exec unshare --user --net --mount --pid --fork --mount-proc --map-root-user $0 $*
  fi
fi

export RISC_OS_Test_Dir='IXFS:$.proc.self.cwd.mixed.Linux.Tests'
export RISC_OS_Test_System='Linux'
export RISC_OS_Test_Log='IXFS:$.proc.self.fd.2'
export RISC_OS_Alias_TestLog='Echo %*0 { > <Test$Log> }'

# Tests break if redirected to a regular file, so ensure output though pipe
exec > >(cat) 2>&1

# Test ptrace SWI implemnation
RISC_OS_Alias_IXFSBoot='BASIC -quit <Test$Dir>.Finish' timeout --foreground -sKILL 30 $* --noseccomp --nofork --noaborts

# Various tests that shouldn't cause data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' timeout --foreground -sKILL 30 $* --nofork --noaborts

# Various tests that require data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_Aborts' timeout --foreground -sKILL 60 $* --nofork 3>/dev/null
