#!/bin/bash

. Built/rpcemu_sandbox
timeout --foreground -sKILL 60 $RPCEMU_sandbox --unshare-net --tmpfs /r/hostfs --ro-bind mixed/Linux/Tests /r/hostfs/Tests --dir /r/hostfs/tmp --symlink 'Tests/!Boot,feb' '/r/hostfs/!Boot,feb' /r/rpcemu
E=$?
tr -d '\r' < Support/mnt/dev/fd/8/tmp/log*
exit $E
