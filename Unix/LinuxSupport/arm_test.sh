#!/bin/bash

# Copyright (c) 2020, Timothy Baldwin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex
cd "$( dirname "$0")"

as arm_test.s -o arm_test.o
ld -static -Ttext=0x100054 arm_test.o -o arm_test
strip -s --remove-section=!.text arm_test
objdump -d arm_test

assert() {
  echo "${@:2}"
  "${@:2}"
  e=$?
  if [[ $e != $1 ]]; then
    echo "Return code is $e not $1" >&2
    fail="exit 1"
  fi
  echo
}

set +ex
./arm_test
assert 0 strace ./arm_test
assert 0 strace -e inject=prctl:error=ENOSYS ./arm_test
assert 0 strace -e inject=prctl,ptrace:error=EINVAL ./arm_test
assert 0 strace -e inject=prctl:error=EFAULT -e inject=ptrace:error=ENOSYS ./arm_test
assert 1 strace -e inject=getpid:error=ENOSYS ./arm_test
assert 3 strace -e inject=prctl:error=EINVAL -e inject=ptrace:error=ENOSYS ./arm_test
assert 5 strace -e inject=prctl,ptrace,exit_group:error=ENOSYS ./arm_test

$fail
echo arm_test tests successfully completed
