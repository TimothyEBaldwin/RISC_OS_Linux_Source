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
# @(#)Makefile	1.3 87/11/30 3.9 RPCSRC
#
BIN = dir_svc rls
GEN = dir_clnt.c dir_svc.c dir_xdr.c dir.h
LIB = -lrpclib
RPCCOM = rpcgen

.SUFFIXES:	.o .c

.c.o:;       cc $(CFLAGS) -c -o $@ $<

all: $(BIN)

$(GEN): dir.x
	$(RPCCOM) dir.x

dir_svc: dir_proc.o dir_svc.o dir_xdr.o
	$(CC) -o $@ dir_proc.o dir_svc.o dir_xdr.o $(LIB)

rls: rls.o dir_clnt.o dir_xdr.o
	$(CC) -o $@ rls.o dir_clnt.o dir_xdr.o $(LIB)

rls.o: rls.c dir.h

dir_proc.o: dir_proc.c dir.h

clean cleanup:
	rm -f $(GEN) *.o $(BIN)

