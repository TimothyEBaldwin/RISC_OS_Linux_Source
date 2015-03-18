#!/bin/bash

binds=()
shopt -s nullglob
for i in /bin /lib* /usr /etc/machine-id /var/lib/dbus/machine-id ; do
  binds+=(--ro-bind "$i" "$i")
done
shopt -u nullglob

rpc_test() {
  cd /r
  timeout --foreground -sKILL 60 /r/rpcemu
  E=$?
  tr -d '\r' < /r/hostfs/tmp/log*
  exit $E
}
export -f rpc_test

exec ${BWRAP:=bwrap} --unshare-pid --unshare-net "${binds[@]}" \
--ro-bind /tmp/.X11-unix /tmp/.X11-unix \
--proc /proc \
--ro-bind Built/rpcemu /r \
--tmpfs /r/hostfs \
--dev-bind /dev/null /r/hd4.hdf \
--ro-bind "$1" /r/roms/ROM \
--ro-bind mixed/Linux/Tests /r/hostfs/Tests \
--dir /r/hostfs/tmp \
--symlink 'Tests/!Boot,feb' '/r/hostfs/!Boot,feb' \
bash -c rpc_test
