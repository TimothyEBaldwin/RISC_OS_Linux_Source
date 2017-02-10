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
/* -*-C-*-
 *
 * Copyright (c) 1995 Acorn Computers Ltd., Cambridge, England
 *
 * :RCS Log discontinued:
 * Revision 1.1  95/01/11  10:18:45  kwelton
 * Initial revision
 *
 */

#include <rpc/types.h>
#include <sys/time.h>
#include <sys/errno.h>
#ifndef __riscos
#include <nfs/nfs.h>
#endif
#define MAX_MACHINE_NAME 255
#define MAX_PATH_LEN 1024
#define MAX_FILEID 32
#define IP_ADDR_TYPE 1

typedef char *bp_machine_name_t;
bool_t xdr_bp_machine_name_t();


typedef char *bp_path_t;
bool_t xdr_bp_path_t();


typedef char *bp_fileid_t;
bool_t xdr_bp_fileid_t();


struct ip_addr_t {
        char net;
        char host;
        char lh;
        char impno;
};
typedef struct ip_addr_t ip_addr_t;
bool_t xdr_ip_addr_t();


struct bp_address {
        int address_type;
        union {
                ip_addr_t ip_addr;
        } bp_address_u;
};
typedef struct bp_address bp_address;
bool_t xdr_bp_address();


struct bp_whoami_arg {
        bp_address client_address;
};
typedef struct bp_whoami_arg bp_whoami_arg;
bool_t xdr_bp_whoami_arg();


struct bp_whoami_res {
        bp_machine_name_t client_name;
        bp_machine_name_t domain_name;
        bp_address router_address;
};
typedef struct bp_whoami_res bp_whoami_res;
bool_t xdr_bp_whoami_res();


struct bp_getfile_arg {
        bp_machine_name_t client_name;
        bp_fileid_t file_id;
};
typedef struct bp_getfile_arg bp_getfile_arg;
bool_t xdr_bp_getfile_arg();


struct bp_getfile_res {
        bp_machine_name_t server_name;
        bp_address server_address;
        bp_path_t server_path;
};
typedef struct bp_getfile_res bp_getfile_res;
bool_t xdr_bp_getfile_res();


#define BOOTPARAMPROG ((u_long)100026)
#define BOOTPARAMVERS ((u_long)1)
#define BOOTPARAMPROC_WHOAMI ((u_long)1)
extern bp_whoami_res *bootparamproc_whoami_1();
#define BOOTPARAMPROC_GETFILE ((u_long)2)
extern bp_getfile_res *bootparamproc_getfile_1();

/* EOF bootparam.h */
