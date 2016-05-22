#!/bin/bash
# A script to simplify building a single component.
# Syntax: mk.sh [target] [environment]
# For more flexibility, use make directly.

TARGET=all
[[ "$1" =~ (all|install|debug|clean|links) ]] && TARGET=$1 && shift
[ -z "$1" ] || BUILD=$1 && shift
[ -n "$BUILD" ] || BUILD=ROOL/Disc
cd $(dirname $0)

# Two ways of doing the same thing
if [ -n "$BUILDUSINGSUBSHELL" ]; then
	HERE=`pwd`
	cd $RISCOS
	if [ $TARGET == "install" ]; then
		Env/$BUILD.sh "cd $HERE && make install INSTDIR=$INSTALLDIR/!System/310/Modules -I\$MAKEFILEDIR --no-print-directory"
	else
		Env/$BUILD.sh "cd $HERE && make $TARGET -I\$MAKEFILEDIR --no-print-directory"
	fi
else
	pushd $RISCOS > /dev/null
	source Env/$BUILD.sh
	popd > /dev/null
	if [ $TARGET == "install" ]; then
		make install INSTDIR=$INSTALLDIR/!System/310/Modules -I$MAKEFILEDIR --no-print-directory
	else
		make $TARGET -I$MAKEFILEDIR --no-print-directory
	fi
fi
