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

include Makefiles:StdTools
include Makefiles:HostTools

COMPONENT = LinuxSyscalls

export: export_${PHASE}

h.syscalls: GenSyscall
	CDir h
	${PERL} GenSyscall > h.syscalls

h.syscall_list: Makefile <Lib$Dir>.Linux.asm.h.unistd
	CDir h
	do sed -n -e 's/^\(.\)define \(_\(_ARM\)\?_NR_[_a-z0-9]*\)[ \t].*$/\1ifdef \2\nDEF(\2)\n\1endif/p' < <Lib$Dir>.Linux.asm.h.unistd > h.syscall_list

gen_header: c.gen_header h.syscall_list h.syscalls <Lib$Dir>.Linux.asm.h.unistd
	CDir o
	${CC} -Wpn -I<Lib$Dir>.Linux c.gen_header -o gen_header

LinuxSyscalls: gen_header
	Run gen_header > LinuxSyscalls

<Export$Dir>.LinuxSyscalls: LinuxSyscalls
	-${DIFF} $@ LinuxSyscalls
	If "<AMU$ReturnCode>" <> "0" Then ${CP} LinuxSyscalls $@ ${CPFLAGS}

<Lib$Dir>.Linux.h.syscalls: h.syscalls
	${MKDIR} <Lib$Dir>.Linux.h
	-${DIFF} $@ h.syscalls
	If "<AMU$ReturnCode>" <> "0" Then ${CP} h.syscalls $@ ${CPFLAGS}

export_hdrs: <Lib$Dir>.Linux.h.syscalls <Export$Dir>.LinuxSyscalls
	@Echo LinuxSyscalls header export complete

export_libs:
	@Echo LinuxSyscalls: no libraries

export_resources:
	@Echo LinuxSyscalls: no resources

include Depends
