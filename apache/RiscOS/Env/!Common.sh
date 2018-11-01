# Common setup for build environment
# Include from an Env file, with "RiscOS" as the current directory
#

[ "$MACHINE" != "" ] || { echo "No build selected - Run an Env file"; exit 1; }

export TOOLSDIR=$BUILDDIR/Library

export ROOL_BIN=/opt/rool/bin
[ "$GCCSDK_INSTALL_CROSSBIN" != "" ] || export GCCSDK_INSTALL_CROSSBIN=/opt/gccsdk/cross/bin

# Replace existing entries on PATH to prevent it growing indefinitely
export PATH=$TOOLSDIR/Build:$TOOLSDIR/Misc:$ROOL_BIN:$GCCSDK_INSTALL_CROSSBIN:`echo -n $PATH | awk 'BEGIN{P="('$TOOLSDIR'|'$ROOL_BIN'|'$GCCSDK_INSTALL_CROSSBIN')";RS=":";ORS=":"}$0!~P' | sed 's/:$//'`

export APPDIR=$BUILDDIR/Apps
export MAKEFILEDIR=$BUILDDIR/BuildSys/GNUmakefiles
#export SRCDIR=$BUILDDIR/Sources
export INSTALLDIR=$BUILDDIR/Install

if [ "$APCS" = "APCS-R" ]; then
	TOOLOPTIONS="-26bit"
	ASASM_TOOLOPTIONS="-apcs26 -apcsfpv2"
	CMUNGE_TOOLOPTIONS="-26bit -apcs 3/26bit/fpe2"
	GCC_TOOLOPTIONS="-mapcs-26 -march=armv2 -mfpu=fpe2"
	NCC_TOOLOPTIONS="-APCS 3/26bit/fpe2"
	OBJASM_TOOLOPTIONS="-APCS 3/26bit"
elif [ "$APCS" = "APCS-32" ]; then
	TOOLOPTIONS="-32bit"
	ASASM_TOOLOPTIONS="-apcs32 -apcsfpv3"
	CMUNGE_TOOLOPTIONS="-32bit -apcs 3/32bit/fpe3"
	case "$MACHINE" in
	'Archimedes')
		GCC_TOOLOPTIONS="-march=armv2 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -memaccess -L22-S22+L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit"
		;;
	'All32')
		GCC_TOOLOPTIONS="-march=armv3 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 3 -memaccess -L22-S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit -cpu 3"
		;;
	'32')
		GCC_TOOLOPTIONS="-march=armv3 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 3 -memaccess -L22-S22+L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit -cpu 3"
		;;
	'Tungsten')
		GCC_TOOLOPTIONS="-march=armv5te -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 5TE -memaccess +L22+S22+L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit -cpu 5TE"
		;;
	'ARM11ZF')
		GCC_TOOLOPTIONS="-march=armv6 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 6 -memaccess +L22+S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 6Z --fpu VFPv2"
		;;
	'CortexA8')
		GCC_TOOLOPTIONS="-march=armv7 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 7 -memaccess +L22+S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu Cortex-A8"
		;;
	'CortexA9')
		GCC_TOOLOPTIONS="-march=armv7 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 7 -memaccess +L22+S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu Cortex-A9"
		;;
	'CortexA7')
		GCC_TOOLOPTIONS="-march=armv7 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu 7 -memaccess +L22+S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit/fpe3 -cpu Cortex-A7"
		;;
	*)
		GCC_TOOLOPTIONS="-march=armv2 -mfpu=fpe3"
		NCC_TOOLOPTIONS="-APCS 3/32bit/fpe3 -memaccess -L22-S22-L41"
		OBJASM_TOOLOPTIONS="-APCS 3/32bit"
		;;
	esac
fi
export TOOLOPTIONS
export ASASM_TOOLOPTIONS
export CMUNGE_TOOLOPTIONS
export GCC_TOOLOPTIONS
export NCC_TOOLOPTIONS
export OBJASM_TOOLOPTIONS

export APCSEXPORTDIR=$BUILDDIR/Export/$APCS
export HDRDIR=$APCSEXPORTDIR/Hdr
export EXPORTDIR=$HDRDIR/Interface
export GLOBALHDRDIR=$HDRDIR/Global
export CEXPORTDIR=$APCSEXPORTDIR/C
export LIBDIR=$APCSEXPORTDIR/Lib

# This enables you to simply type "make all" from the command line
alias make="make -I$MAKEFILEDIR --no-print-directory"

# This is similar, but infers COMPONENT, TARGET and INSTDIR from the ModuleDB
# if possible. Where a source directory occurs multiple times within the
# ModuleDB, make is invoked once for each possible COMPONENT, unless a single
# COMPONENT is specified in the environment. Settings of TARGET and INSTDIR
# from the environment also override those from the ModuleDB. You can also
# use the -C switch to avoid having to cd to a component first, just like
# with make. Any additional arguments (make targets etc) are passed to make.
mk ()
{(
    COMPONENTDIR=`pwd`
    if [ "$1" = "-C" ]; then
        COMPONENTDIR="$(cd $2 && pwd)"
        shift
        shift
    fi
    RELPATH=`echo ${COMPONENTDIR#*$BUILDDIR/} | tr / .`
    MYTMP=$(mktemp)
    
    if [ -n "$COMPONENT" ]; then
        grep "^$COMPONENT " $BUILDDIR/BuildSys/ModuleDB > $MYTMP
    else
        grep "$RELPATH" $BUILDDIR/BuildSys/ModuleDB | grep -v "$RELPATH\." > $MYTMP
    fi
    
    if [ $? -ne 0 ]; then
        # Component not found in ModuleDB - can't infer anything
        make -C $COMPONENTDIR $@
    else
        while read -r DB_COMPONENT _ _ DB_INSTDIR DB_TARGET; do
            ARGS=""
            if [ -z "$COMPONENT" ]; then
                ARGS="$ARGS COMPONENT=$DB_COMPONENT"
            fi
            if [ -z "$TARGET" ]; then
                ARGS="$ARGS TARGET=$DB_TARGET"
            fi
            if [ -z "$INSTDIR" ]; then
                ARGS="$ARGS INSTDIR=$INSTALLDIR/$DB_INSTDIR"
            fi
            make -C $COMPONENTDIR $ARGS $@
        done < $MYTMP
    fi
    rm $MYTMP
)}
