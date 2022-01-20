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
exec </dev/null 3>/dev/null > >(cat) 2>&1

binds=()
for i in /usr /bin /lib*; do
  binds+=(--ro-bind "$i" "$i")
done


run() {
  timeout --foreground -sKILL 60 \
  bwrap --unshare-all --proc /proc --dev /dev --dir /tmp --seccomp 9 9< <(Built/gen_seccomp $1) \
  --ro-bind "$risc_os" /RISC_OS --ro-bind mixed/Linux/Tests /Tests --die-with-parent --cap-drop ALL \
  --ro-bind Built /Built  "${binds[@]}" \
  /Built/qemu-link /RISC_OS "${@:2}"
}

set -x

for i in '"-p"' '"" --cswi' '""'
do

  # Various tests that shouldn't cause data aborts
  RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_NoAbort' eval run $i --abort-on-input --noaborts

  # Various tests that require data aborts
  RISC_OS_Alias_IXFSBoot='Obey -v <Test$Dir>.PreDesk_Aborts' eval run $i

done
