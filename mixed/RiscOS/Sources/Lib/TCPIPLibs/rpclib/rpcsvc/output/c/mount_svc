/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
#include <stdio.h>
#include <rpc/rpc.h>
#include "mount.h"

static void mountprog_1();

main()
{
	SVCXPRT *transp;

	pmap_unset(MOUNTPROG, MOUNTVERS);

	transp = svcudp_create(RPC_ANYSOCK);
	if (transp == NULL) {
		fprintf(stderr, "cannot create udp service.\n");
		exit(1);
	}
	if (!svc_register(transp, MOUNTPROG, MOUNTVERS, mountprog_1, IPPROTO_UDP)) {
		fprintf(stderr, "unable to register (MOUNTPROG, MOUNTVERS, udp).\n");
		exit(1);
	}

	transp = svctcp_create(RPC_ANYSOCK, 0, 0);
	if (transp == NULL) {
		fprintf(stderr, "cannot create tcp service.\n");
		exit(1);
	}
	if (!svc_register(transp, MOUNTPROG, MOUNTVERS, mountprog_1, IPPROTO_TCP)) {
		fprintf(stderr, "unable to register (MOUNTPROG, MOUNTVERS, tcp).\n");
		exit(1);
	}
	svc_run();
	fprintf(stderr, "svc_run returned\n");
	exit(1);
}

static void
mountprog_1(rqstp, transp)
	struct svc_req *rqstp;
	SVCXPRT *transp;
{
	union {
		dirpath mountproc_mnt_1_arg;
		dirpath mountproc_umnt_1_arg;
	} argument;
	char *result;
	bool_t (*xdr_argument)(), (*xdr_result)();
	char *(*local)();

	switch (rqstp->rq_proc) {
	case MOUNTPROC_NULL:
		xdr_argument = xdr_void;
		xdr_result = xdr_void;
		local = (char *(*)()) mountproc_null_1;
		break;

	case MOUNTPROC_MNT:
		xdr_argument = xdr_dirpath;
		xdr_result = xdr_fhstatus;
		local = (char *(*)()) mountproc_mnt_1;
		break;

	case MOUNTPROC_DUMP:
		xdr_argument = xdr_void;
		xdr_result = xdr_mountlist;
		local = (char *(*)()) mountproc_dump_1;
		break;

	case MOUNTPROC_UMNT:
		xdr_argument = xdr_dirpath;
		xdr_result = xdr_void;
		local = (char *(*)()) mountproc_umnt_1;
		break;

	case MOUNTPROC_UMNTALL:
		xdr_argument = xdr_void;
		xdr_result = xdr_void;
		local = (char *(*)()) mountproc_umntall_1;
		break;

	case MOUNTPROC_EXPORT:
		xdr_argument = xdr_void;
		xdr_result = xdr_exports;
		local = (char *(*)()) mountproc_export_1;
		break;

	case MOUNTPROC_EXPORTALL:
		xdr_argument = xdr_void;
		xdr_result = xdr_exports;
		local = (char *(*)()) mountproc_exportall_1;
		break;

	default:
		svcerr_noproc(transp);
		return;
	}
	bzero(&argument, sizeof(argument));
	if (!svc_getargs(transp, xdr_argument, &argument)) {
		svcerr_decode(transp);
		return;
	}
	result = (*local)(&argument, rqstp);
	if (result != NULL && !svc_sendreply(transp, xdr_result, result)) {
		svcerr_systemerr(transp);
	}
	if (!svc_freeargs(transp, xdr_argument, &argument)) {
		fprintf(stderr, "unable to free arguments\n");
		exit(1);
	}
}

