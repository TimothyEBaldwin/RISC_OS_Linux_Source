#!/bin/bash

timeout --foreground -sKILL 60 rpcemu/rpcemu 7<$1 8<mixed/Linux/Tests
E=$?
tr -d '\r' < mixed/Linux/Tests/log*
exit $E
