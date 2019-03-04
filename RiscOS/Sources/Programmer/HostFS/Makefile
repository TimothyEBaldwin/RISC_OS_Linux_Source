# Copyright 2019 RISC OS Open Ltd
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
# Makefile for TML_HostFS
#

COMPONENT ?= TML_HostFS

include StdTools

all: DumpFile SpewChars standalone

DumpFile:
	@${MAKE} -f app${EXT}mk COMPONENT=${COMPONENT} TARGET=DumpFile

SpewChars:
	@${MAKE} -f app${EXT}mk COMPONENT=${COMPONENT} TARGET=SpewChars

export_hdrs export_libs export resources rom rom_link standalone install debug gpa_debug prepro links:
	@${MAKE} -f mod${EXT}mk COMPONENT=${COMPONENT} $@

clean:
	@${MAKE} -f app${EXT}mk COMPONENT=${COMPONENT} TARGET=DumpFile clean
	@${MAKE} -f app${EXT}mk COMPONENT=${COMPONENT} TARGET=SpewChars clean
	@${MAKE} -f mod${EXT}mk COMPONENT=${COMPONENT} clean
