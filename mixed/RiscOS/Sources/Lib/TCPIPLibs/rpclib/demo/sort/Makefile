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

BIN =  rsort sort_svc
GEN = sort_clnt.c sort_svc.c sort_xdr.c sort.h
LIB = -lrpclib
RPCCOM = rpcgen

all: $(BIN)

rsort: rsort.o sort_clnt.o sort_xdr.o
	$(CC) $(LDFLAGS) -o $@ rsort.o sort_clnt.o sort_xdr.o $(LIB)

rsort.o: rsort.c sort.h

sort_clnt.c:
	$(RPCCOM) -l sort.x >$@

sort_svc: sort_proc.o sort_svc.o sort_xdr.o
	$(CC) $(LDFLAGS) -o $@ sort_proc.o sort_svc.o sort_xdr.o $(LIB)

sort_proc.o: sort_proc.c sort.h

sort_svc.c:
	$(RPCCOM) -s udp sort.x >$@

sort_xdr.c:
	$(RPCCOM) -c sort.x >$@

sort.h:
	$(RPCCOM) -h sort.x >$@

clean cleanup:
	rm -f $(GEN) *.o $(BIN)

