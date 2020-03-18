# Environment to build ROM for Freescale iMx6 board
#
# This script is applied to the current shell using the "." or "source" builtin shell commands.

export LOCALE=UK
export KEYBOARD=All
export MACHINE=CortexA9
export SYSTEM=Ursula
export USERIF=Sovereign
export DISPLAYTYPE=PAL
export IMAGESIZE=5120K
export HALSIZE=96K
export BUILD=ROOL/iMx6
export APCS=APCS-32

# Get the location of this script when sourced from a variety of common Posix shells: bash, dash, ksh or zsh

if [ -n "$BASH" ]; then script=${BASH_SOURCE[0]}
elif [ -n "$TMOUT" ]; then script=${.sh.file}
elif [ -n "$ZSH_NAME" ]; then script=${(%):-%x}
elif [ ${0##*/} = dash ]; then x=$(lsof -p $$ -Fn0 | tail -1); script=${x#*n}
fi

BUILDDIR="$(cd "$(dirname "$(readlink -f "$script")")"/../.. && pwd)"
export BUILDDIR

. "$BUILDDIR/Env/!Common.sh"
