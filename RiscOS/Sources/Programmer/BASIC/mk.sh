#!/bin/bash
# A script to simplify building a single component.
# Syntax: mk.sh [target] [environment]
# For more flexibility, use make directly.

TARGET=all
[[ "$1" =~ (all|clean|debug|export|export_hdrs|export_libs|gpa_debug|install|install_rom|links|resources|rom|standalone) ]] && TARGET=$1 && shift
[ -z "$1" ] || BUILD=$1 && shift
[ -n "$BUILD" ] || BUILD=ROOL/Disc
cd $(dirname $0)

# Two ways of doing the same thing
if [ -n "$BUILDUSINGSUBSHELL" ]; then
	HERE=`pwd`
	cd ../../../../..
	Env/$BUILD.sh "cd $HERE && make $TARGET -I\$MAKEFILEDIR --no-print-directory"
else
	pushd ../../../../.. > /dev/null
	source Env/$BUILD.sh
	popd > /dev/null
	make $TARGET -I$MAKEFILEDIR --no-print-directory
fi
