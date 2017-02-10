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
/* > unix.c (Not in branched tree) */

/**************************************************************************/
/*                                                                        */
/* Copyright [1997-2000] Pace Micro Technology PLC.  All rights reserved. */
/*                                                                        */
/* The copyright in this material is owned by Pace Micro Technology PLC   */
/* ("Pace").  This material is regarded as a highly confidential trade    */
/* secret of Pace.  It may not be reproduced, used, sold or in any        */
/* other way exploited or transferred to any third party without the      */
/* prior written permission of Pace.                                      */
/**************************************************************************/

#ifdef LAYERS
#include "layers.h"
#include "layers_dbg.h"
#endif

#include <dirent.h>

#include <string.h>
#include <stdio.h>

#include "encpriv.h"

int encoding__load_map_file(const char *leaf, UCS2 **ptable, int *pn_entries, int *palloc)
{
    DIR *dir;
    FILE *fh;
    int flen;
    char fname[1024];
    char *slash;
    struct dirent *dp;

    void *table;
    int n_entries;
    int alloc;

    char *s = getenv("UNICODE_DIR");
    if (s == NULL)
	s = "/usr/local/etc/unicode";

    strncpy(fname, s, sizeof(fname));
    if ( fname[ strlen(fname)-1 ] != '/' )
	strcat( fname, "/" );
    strncat(fname, "Encodings/", sizeof(fname));
    strncat(fname, leaf, sizeof(fname));
    fname[sizeof(fname)-1] = 0;

    /* We get to search the directory, because the leafname may be a prefix */
    slash = strrchr(fname, '/');
    if (!slash) return 0;

    *slash = '\0';
    slash++;

    dir = opendir(fname);
    if (!dir) return 0;

    while ((dp = readdir(dir)) != NULL) {
        if (strncmp(dp->d_name, slash, strlen(slash)) == 0) {
            *(slash - 1) = '/';
            *slash = '\0';
            strncat(fname, dp->d_name, sizeof(fname));
            break;
        }
    }

    closedir(dir);

    fh = fopen(fname, "rb");
    if (!fh)
	return 0;

    fseek(fh, 0, SEEK_END);
    flen = ftell(fh);
    fseek(fh, 0, SEEK_SET);

    alloc = 1;
    n_entries = flen/2;
    table = encoding__alloc(flen);

    if (table)
    {
	if (fread(table, flen, 1, fh) != 1)
	{
	    encoding__free(table);
	    table = NULL;
	}
    }

    fclose(fh);

    *ptable = table;
    *pn_entries = n_entries;
    *palloc = alloc;

    return table != NULL;
}

int encoding_current_alphabet(void)
{
    return 0;
}

const UCS4 *encoding_alphabet_ucs_table(int a)
{
    return NULL;
}

/* eof unix.c */
