#
# Copyright (c) 2013, Timothy Baldwin
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

include Makefiles:StdTools

COMPONENT = LinuxSyscalls

export: export_${PHASE}

h.syscalls: GenSyscall
	${PERL} GenSyscall > h.syscalls

export_hdrs: h.syscalls
	${MKDIR} <CExport$dir>.ix.h
	${CP} LinuxSyscalls <Export$Dir>.LinuxSyscalls ${CPFLAGS}
	${CP} LinuxDefs <Export$Dir>.LinuxDefs ${CPFLAGS}
	${CP} h.syscalls <CExport$dir>.ix.h.syscalls ${CPFLAGS}
	${CP} h.syscall_defs <CExport$dir>.ix.h.syscall_defs ${CPFLAGS}
	${CP} h.syscall_types <CExport$dir>.ix.h.syscall_types ${CPFLAGS}
	@Echo LinuxSyscalls header export complete

export_libs:
	@Echo LinuxSyscalls: no libraries

export_resources:
	@Echo LinuxSyscalls: no resources

clean:
	${RM} h.syscalls
