#!/bin/bash

set -e

export RISC_OS_Test_Dir='IXFS:$.Tests'
export RISC_OS_Test_TmpDir='IXFS:$.tmp'
export RISC_OS_Test_System='Linux'
export RISC_OS_Test_Log='IXFS:$.proc.self.fd.2'
export RISC_OS_Alias_TestLog='Echo %*0 { > <Test$Log> }'
export RISC_OS_Test_NetOK=YES
export risc_os="$1"

# cat is needed here as stdout is reopened, which would reset the pointer of regular files.
exec </dev/null 3>/dev/null 2>&1 > >(cat)

. Built/qemu_sandbox

run() {
  timeout --foreground -sKILL 60 \
  ${BWRAP:=bwrap} --unshare-all --proc /proc --dev /dev --dir /tmp --seccomp 9 9< <(Built/gen_seccomp -p) \
  --ro-bind "$risc_os" /RISC_OS --ro-bind mixed/Linux/Tests /Tests "${QEMU_sandbox[@]}" $QEMU \
  /RISC_OS "$@"
}

set -x

# Test ptrace SWI implemnation
RISC_OS_Alias_IXFSBoot='BASIC -quit <Test$Dir>.Finish' run --noseccomp --nofork --noaborts

# Various tests that shouldn't cause data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' run --nofork --noaborts

# Various tests that require data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_Aborts' run --nofork
