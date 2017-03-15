#!/bin/bash

set -e
(
timeout --foreground -sKILL 6 $* --nofork --noaborts << 'END' 2>&1 | tee /dev/fd/2 | grep -q GOOD
*ChangeDynamicArea -ramfssize 6M
*ChangeDynamicArea -ramfssize 4M
*ChangeDynamicArea -ramfssize 8M
*Echo GO<79>D
END
echo
) 2>&1
