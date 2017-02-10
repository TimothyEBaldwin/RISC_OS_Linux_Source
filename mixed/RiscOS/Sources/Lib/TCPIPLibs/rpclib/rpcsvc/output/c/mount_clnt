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
#include <rpc/rpc.h>
#include <sys/time.h>
#include "mount.h"

static struct timeval TIMEOUT = { 25, 0 };

void *
mountproc_null_1(argp, clnt)
        void *argp;
        CLIENT *clnt;
{
        static char res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_NULL, xdr_void, argp, xdr_void, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return ((void *)&res);
}


fhstatus *
mountproc_mnt_1(argp, clnt)
        dirpath *argp;
        CLIENT *clnt;
{
        static fhstatus res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_MNT, xdr_dirpath, argp, xdr_fhstatus, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return (&res);
}


mountlist *
mountproc_dump_1(argp, clnt)
        void *argp;
        CLIENT *clnt;
{
        static mountlist res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_DUMP, xdr_void, argp, xdr_mountlist, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return (&res);
}


void *
mountproc_umnt_1(argp, clnt)
        dirpath *argp;
        CLIENT *clnt;
{
        static char res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_UMNT, xdr_dirpath, argp, xdr_void, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return ((void *)&res);
}


void *
mountproc_umntall_1(argp, clnt)
        void *argp;
        CLIENT *clnt;
{
        static char res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_UMNTALL, xdr_void, argp, xdr_void, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return ((void *)&res);
}


exports *
mountproc_export_1(argp, clnt)
        void *argp;
        CLIENT *clnt;
{
        static exports res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_EXPORT, xdr_void, argp, xdr_exports, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return (&res);
}


exports *
mountproc_exportall_1(argp, clnt)
        void *argp;
        CLIENT *clnt;
{
        static exports res;

        bzero(&res, sizeof(res));
        if (clnt_call(clnt, MOUNTPROC_EXPORTALL, xdr_void, argp, xdr_exports, &res, TIMEOUT) != RPC_SUCCESS) {
                return (NULL);
        }
        return (&res);
}

