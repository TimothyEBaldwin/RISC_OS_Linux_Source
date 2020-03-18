# Environment to build 32-bit HAL ROM for Acorn IOMD (RiscPC/A7k/A7k+/RPCEmu)
#
# This script is applied to the current shell using the "." or "source" builtin shell commands.

export LOCALE=UK
export KEYBOARD=All
export MACHINE=IOMD
export SYSTEM=Ursula
export USERIF=Sovereign
export DISPLAYTYPE=PAL
export IMAGESIZE=4096K
export HALSIZE=64K
export BUILD=ROOL/IOMD32
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
