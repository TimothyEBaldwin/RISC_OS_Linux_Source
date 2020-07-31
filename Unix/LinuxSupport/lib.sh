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

arm_test() {
  "${BASH_SOURCE%%lib.sh}arm_test"
  case $? in
    0 ) QEMU=/usr/bin/env ;;
    1 ) echo "This Linux is ancient, EABI system calls don't work!" 1>&2; false;;
    2 ) echo "Bug in arm_test? - mystery SIGILL" 1>&2; false;;
    3 ) echo "Can't intercept SWIs, no SECCOMP, no ptrace, QEMU hack raises SIGILL" 1>&2; false;;
    4 ) echo "Can't intercept SWIs, no SECCOMP, no ptrace, QEMU hack is EABI system call" 1>&2; false;;
    5 ) echo "Can't intercept SWIs, no SECCOMP, no ptrace, QEMU hack returns ENOSYS" 1>&2; false;;
    6 ) echo "Systems which implement FPA instructions currently don't work" 1>&2; false;;
    126 )
      if [[ "$(uname)" != Linux ]]; then
        echo "This is the Linux Port of RISC OS, not for some other operating system."
        false
      elif [[ "$(uname -m)" == arm* ]]; then
        echo "Weird or ancient ARM system can't execute ARM ELF executables"
        false
      else
        QEMU="$(command -v qemu-arm)"
        "$QEMU" "${BASH_SOURCE%%lib.sh}arm_test" || QEMU=Built/qemu-arm
        true
      fi
  esac
}
