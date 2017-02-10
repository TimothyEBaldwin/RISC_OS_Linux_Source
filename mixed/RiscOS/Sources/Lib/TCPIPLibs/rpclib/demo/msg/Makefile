# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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

