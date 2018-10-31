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
BIN = printmsg msg_svc rprintmsg
GEN = msg_clnt.c msg_svc.c msg.h
LIB = -lrpclib
RPCCOM = rpcgen

all: $(BIN)

#
# This is the non-networked version of the program
#
printmsg: printmsg.o
	$(CC) -o $@ printmsg.o

#
# note: no xdr routines are generated here, due this service's
#       use of basic data types.
#
$(GEN): msg.x
	$(RPCCOM) msg.x

msg_svc: msg_proc.o msg_svc.o
	$(CC) -o $@ msg_proc.o msg_svc.o $(LIB)

rprintmsg: rprintmsg.o msg_clnt.o
	$(CC) -o $@ rprintmsg.o msg_clnt.o $(LIB)

rprintmsg.o: rprintmsg.c msg.h

msg_proc.o: msg_proc.c msg.h

clean cleanup:
	rm -f $(GEN) *.o $(BIN)

