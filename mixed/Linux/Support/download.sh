#!/bin/sh
set -e

leaf="$(basename "$1")"

mkdir -p "$(dirname "$1")"
wget --no-check-certificate -c -O "$leaf"  "$2"
echo "$3 *$leaf" | sha256sum -c
mv "$leaf" "$1"
