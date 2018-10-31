# Environment to build user disc image (also useful for any other soft-loadable binaries)
#
# This script is applied to the current shell using the "." or "source" builtin shell commands.

export LOCALE=UK
export KEYBOARD=All
export MACHINE=All
export SYSTEM=Ursula
export USERIF=Iyonix
export DISPLAYTYPE=PAL
export IMAGESIZE=4096K
export HALSIZE=64K
export BUILD=ROOL/Disc
export APCS=APCS-32

# Get the location of this script when sourced from a variety of common Posix shells: bash, dash, ksh or zsh

if [ -n "$BASH" ]; then script=$BASH_SOURCE
elif [ -n "$TMOUT" ]; then script=${.sh.file}
elif [ -n "$ZSH_NAME" ]; then script=${(%):-%x}
elif [ ${0##*/} = dash ]; then x=$(lsof -p $$ -Fn0 | tail -1); script=${x#*n}
fi

export BUILDDIR="$(cd $(dirname $(readlink -f "$script"))/../../../.. && pwd)"

. $BUILDDIR/Env/!Common.sh
