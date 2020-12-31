#!/usr/bin/make -f

# Copyright (c) 2017, Timothy Baldwin
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
#


LinuxSyscalls h/syscall_defs: gen_headers
	mkdir -p h
	./gen_headers

syscall_list.h: $(wildcard /usr/include/asm/unistd.h /usr/include/asm/unistd-eabi.h /usr/include/asm/unistd-common.h /usr/include/arm-linux-gnu*/asm/unistd.h /usr/include/arm-linux-gnu*/asm/unistd-eabi.h /usr/include/arm-linux-gnu*/asm/unistd-common.h) MkHeaders
	sort -u $^ | sed -n -e 's/^\#define \(_\(_ARM\)\?_NR_[_a-z0-9]*\)[ \t].*$$/#ifdef \1\nSYSDEF(\1)\n#endif/p' > syscall_list.h

gen_headers: gen_headers.c syscall_list.h
	$(CC) gen_headers.c -o gen_headers
