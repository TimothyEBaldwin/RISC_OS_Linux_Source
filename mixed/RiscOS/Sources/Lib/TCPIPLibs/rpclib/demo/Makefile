# Copyright 1997 Acorn Computers Ltd
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
#
# @(#)Makefile	1.4 87/11/30 3.9 RPCSRC
#
#
#   Build all demo services
#
MAKE = make
LIB=-lrpclib

SUBDIR= dir msg sort

all:	${SUBDIR}

clean cleanup:
	cd dir; $(MAKE) ${MFLAGS} cleanup
	cd msg; $(MAKE) ${MFLAGS} cleanup
	cd sort; $(MAKE) ${MFLAGS} cleanup

install:
	@echo "No installations done."

${SUBDIR}:	FRC
	cd $@; $(MAKE) ${MFLAGS} LIB=$(LIB)

FRC:
