#!/bin/bash
# A script to simplify building a single component.
# Syntax: mk.sh [target] [environment]
# For more flexibility, use make directly.

TARGET=export
[[ "$1" =~ (all_libs|export(_hdrs|_libs)?|clean|links) ]] && TARGET=$1 && shift
[ -z "$1" ] || BUILD=$1 && shift
[ -n "$BUILD" ] || BUILD=ROOL/CTools
cd $(dirname $0)

# Two ways of doing the same thing
if [ -n "$BUILDUSINGSUBSHELL" ]; then
	HERE=`pwd`
	cd ../../../../..
	if [ $TARGET == "export" ]; then
		Env/$BUILD.sh "cd $HERE && make export_hdrs -I\$MAKEFILEDIR --no-print-directory"
		Env/$BUILD.sh "cd $HERE && make export_libs -I\$MAKEFILEDIR --no-print-directory"
	else
		Env/$BUILD.sh "cd $HERE && make $TARGET -I\$MAKEFILEDIR --no-print-directory"
	fi
else
	pushd ../../../../.. > /dev/null
	source Env/$BUILD.sh
	popd > /dev/null
	if [ $TARGET == "export" ]; then
		make export_hdrs -I$MAKEFILEDIR --no-print-directory
		make export_libs -I$MAKEFILEDIR --no-print-directory
	else
		make $TARGET -I$MAKEFILEDIR --no-print-directory
	fi
fi
