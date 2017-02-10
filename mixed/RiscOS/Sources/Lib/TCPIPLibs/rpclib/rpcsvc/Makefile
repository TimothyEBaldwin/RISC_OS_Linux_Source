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
# @(#)Makefile	1.6 87/11/30 3.9 RPCSRC
#
#
RPCCOM = rpcgen
LIB = -lrpclib

DESTDIR=

HDRS= klm_prot.h mount.h nfs_prot.h nlm_prot.h rex.h rquota.h rnusers.h\
      rquota.h rstat.h sm_inter.h spray.h yppasswd.h yp.h
XFILES= bootparam_prot.x klm_prot.x mount.x nfs_prot.x nlm_prot.x \
      rex.x rnusers.x rquota.x rstat.x sm_inter.x spray.x yppasswd.x yp.x
BIN= rstat_svc
GEN= rstat_svc.c rstat_xdr.c

all:	$(HDRS) $(BIN)

install: $(HDRS) $(XFILES)
	@echo "Creating RPC service headers directory"
	-mkdir ${DESTDIR}/usr/include/rpcsvc && \
		chown bin ${DESTDIR}/usr/include/rpcsvc && \
		chmod 755 ${DESTDIR}/usr/include/rpcsvc
	@echo "Installing RPC service header and definition files"
	for i in $(HDRS) $(XFILES); do \
		(install -c -m 644 $$i ${DESTDIR}/usr/include/rpcsvc) done
	-mkdir ${DESTDIR}/etc && chown bin ${DESTDIR}/etc && \
		chmod 755 ${DESTDIR}/etc
	@echo "Installing RPC services in ${DESTDIR}/etc"
	@set -x;for i in ${BIN}; do \
		(install -c -s $$i ${DESTDIR}/etc/$$i); done

rstat_svc: rstat_proc.o rstat_svc.o rstat_xdr.o
	$(CC) $(LDFLAGS) -o $@ rstat_proc.o rstat_svc.o rstat_xdr.o $(LIB)

rstat_proc.c:	rstat.h

klm_prot.h:
	$(RPCCOM) -h klm_prot.x -o $@
mount.h:
	$(RPCCOM) -h mount.x -o $@
nfs_prot.h:
	$(RPCCOM) -h nfs_prot.x -o $@
nlm_prot.h:
	$(RPCCOM) -h nlm_prot.x -o $@
rex.h:
	$(RPCCOM) -h rex.x -o $@
rnusers.h:
	$(RPCCOM) -h rnusers.x -o $@
rquota.h:
	$(RPCCOM) -h rquota.x -o $@
rstat.h:
	$(RPCCOM) -h rstat.x -o $@
sm_inter.h:
	$(RPCCOM) -h sm_inter.x -o $@
spray.h:
	$(RPCCOM) -h spray.x -o $@
yp.h:
	$(RPCCOM) -h yp.x -o $@
yppasswd.h:
	$(RPCCOM) -h yppasswd.x -o $@

rstat_svc.c:	rstat.x
	$(RPCCOM) -s udp rstat.x -o $@
rstat_xdr.c:	rstat.x
	$(RPCCOM) -c rstat.x -o $@

clean cleanup:
	rm -f *.o $(GEN) $(BIN)
