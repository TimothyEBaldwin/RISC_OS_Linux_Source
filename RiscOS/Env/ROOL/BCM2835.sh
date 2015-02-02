#!/bin/bash
# Environment to build ROM for Raspberry Pi (BCM2835-based board)
#
# This can either be applied to the current shell using the "source" command,
# or executed directly. In the latter case, you will want to describe a
# a command to be executed by a subshell using the parameters to this script.
# In either case, the working directory must be set to the root of your sandbox on entry.

export LOCALE=UK
export KEYBOARD=All
export MACHINE=RPi
export SYSTEM=Ursula
export USERIF=Raspberry
export DISPLAYTYPE=PAL
export IMAGESIZE=5120K
export HALSIZE=64K
export BUILD=ROOL/BCM2835
export APCS=APCS-32

. Env/!Common.sh

[ -z "$@" ] || bash -c "$@"
