#!/bin/bash

set -e

timeout --foreground -sKILL 30 $* --nofork --noaborts << 'END'
*BASIC
1 *ChangeDynamicArea -ramfssize 6M
2 *ChangeDynamicArea -ramfssize 4M
3 *ChangeDynamicArea -ramfssize 8M
4 TIME=0
5 REPEAT:UNTIL TIME>10
6 A%=0:H%=1:CALL &33000050
RUN
!0=0
END
