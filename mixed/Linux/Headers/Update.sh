#!/bin/bash
#
# Copyright (c) 2013, Timothy Baldwin
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of RISC OS Open Ltd nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

# Exit on error
set -e

work="$(dirname $0)/work"

rm -rf "$work"
mkdir "$work"

cp -al "$1" "$(dirname $0)/work/linux"

# Set current directory to one containing this script
cd "$work"

touch stamp
sleep 2

cat linux/COPYING > /dev/null

mkdir build
make -C linux O=../build ARCH=arm headers_install INSTALL_HDR_PATH=..
rm -rf headers build
find linux \! \( -anewer stamp -o -newer stamp -o -cnewer stamp \) -delete || true
find  linux -type d -delete || true 2> /dev/null

mkdir build
make -C linux O=../build ARCH=arm headers_install INSTALL_HDR_PATH=..

find include -type d -delete || true 2> /dev/null
find include \( -name '.install' -or -name '..install.cmd' \) -delete || true
find include linux -type d -exec mkdir -p '../{}' \; || true
find include linux -type f \! -exec cmp '{}' '../{}' \; -exec cp '{}' '../{}' \; || true

cd ..
rm -rf work
