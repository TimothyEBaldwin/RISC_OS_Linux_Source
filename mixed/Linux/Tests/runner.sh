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

. Built/sandbox_config_sh

run() {
  if [[ $use_seccomp = "true" ]]; then
    seccomp="--seccomp 9"
  fi
  timeout --foreground -sKILL 60 \
  ${BWRAP:=bwrap} --unshare-all --proc /proc --dev /dev --dir /tmp --new-session $seccomp 9< <(Built/gen_seccomp $1) \
  --ro-bind "$risc_os" /RISC_OS --ro-bind mixed/Linux/Tests /Tests "${auto_bwrap_args[@]}" $QEMU \
  /RISC_OS "${@:2}"
}

set -x

if [[ $QEMU = "" ]]; then
  # Test ptrace SWI implemnation
  RISC_OS_Alias_IXFSBoot='BASIC -quit <Test$Dir>.Finish' run -p --abort-on-input --noaborts
fi

# Various tests that shouldn't cause data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' run '' --abort-on-input --noaborts

# Various tests that require data aborts
RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_Aborts' run ''
