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
/* @(#)dir_proc.c	1.3 87/11/16 3.9 RPCSRC */
/*
 * dir_proc.c: remote readdir implementation
 */
#include <rpc/rpc.h>
#include <sys/dir.h>
#include "dir.h"

extern int errno;
extern char *malloc();
extern char *strcpy();

readdir_res *
readdir_1(dirname)
	nametype *dirname;
{
	DIR *dirp;
	struct direct *d;
	namelist nl;
	namelist *nlp;
	static readdir_res res; /* must be static! */
	
	/*
	 * Open directory
	 */
	dirp = opendir(*dirname);
	if (dirp == NULL) {
		res.errno = errno;
		return (&res);
	}

	/*
	 * Free previous result
	 */
	xdr_free(xdr_readdir_res, &res);

	/*
	 * Collect directory entries
	 */
	nlp = &res.readdir_res_u.list;
	while (d = readdir(dirp)) {
		nl = *nlp = (namenode *) malloc(sizeof(namenode));
		nl->name = malloc(strlen(d->d_name)+1);
		strcpy(nl->name, d->d_name);
		nlp = &nl->next;
	}
	*nlp = NULL;

	/*
	 * Return the result
	 */
	res.errno = 0;
	closedir(dirp);
	return (&res);
}
