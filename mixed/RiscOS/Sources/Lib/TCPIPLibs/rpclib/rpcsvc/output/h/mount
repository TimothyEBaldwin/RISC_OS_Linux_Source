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
#define MNTPATHLEN 1024
#define MNTNAMLEN 255
#define FHSIZE 32

typedef char fhandle[ FHSIZE ];
bool_t xdr_fhandle();


struct fhstatus {
	u_int fhs_status;
	union {
		fhandle fhs_fhandle;
	} fhstatus_u;
};
typedef struct fhstatus fhstatus;
bool_t xdr_fhstatus();


typedef char *dirpath;
bool_t xdr_dirpath();


typedef char *name;
bool_t xdr_name();


struct mountlist {
	name ml_hostname;
	dirpath ml_directory;
	struct mountlist *ml_next;
};
typedef struct mountlist mountlist;
bool_t xdr_mountlist();


typedef struct groupnode *groups;
bool_t xdr_groups();


struct groupnode {
	name gr_name;
	groups *gr_next;
};
typedef struct groupnode groupnode;
bool_t xdr_groupnode();


struct exports {
	dirpath ex_dir;
	groups ex_groups;
	struct exports *ex_next;
};
typedef struct exports exports;
bool_t xdr_exports();


#define MOUNTPROG ((u_long)100005)
#define MOUNTVERS ((u_long)1)
#define MOUNTPROC_NULL ((u_long)0)
extern void *mountproc_null_1();
#define MOUNTPROC_MNT ((u_long)1)
extern fhstatus *mountproc_mnt_1();
#define MOUNTPROC_DUMP ((u_long)2)
extern mountlist *mountproc_dump_1();
#define MOUNTPROC_UMNT ((u_long)3)
extern void *mountproc_umnt_1();
#define MOUNTPROC_UMNTALL ((u_long)4)
extern void *mountproc_umntall_1();
#define MOUNTPROC_EXPORT ((u_long)5)
extern exports *mountproc_export_1();
#define MOUNTPROC_EXPORTALL ((u_long)6)
extern exports *mountproc_exportall_1();

