#
# Copyright (c) 2018, Timothy Baldwin
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

COMPONENT = LinuxSupport

export: export_${PHASE}

export_hdrs:
	${MKDIR} <CExport$dir>.ix.h
	${CP} SocketKVM_Protocol/h <CExport$dir>.ix.h.SocketKVM_Protocol ${CPFLAGS}
	@Echo LinuxSupport header export complete

export_libs:
	@Echo LinuxSupport: no libraries

export_resources:
	@Echo LinuxSupport: no resources
