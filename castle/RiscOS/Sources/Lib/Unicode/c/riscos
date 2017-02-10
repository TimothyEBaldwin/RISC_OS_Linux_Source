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
/* > riscos.c (layers/riscos/encodingmap.c in branched tree) */

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

#include "kernel.h"
#include "swis.h"

#include <string.h>
#include <stdio.h>

#include "encpriv.h"

int encoding__load_map_file(const char *leaf, UCS2 **ptable, int *pn_entries, int *palloc)
{
    int ftype = 0, flen, fh, filesys;
    void *inthandle;
    char fname[256];
    _kernel_oserror *e;

    void *table;
    int n_entries;
    int alloc;

    strcpy(fname, "Unicode:Encodings.");
    strncat(fname, leaf, sizeof(fname));
    fname[sizeof(fname)-1] = 0;

    /* Check it's a file, and get it's length */
    _swix(OS_File, _INR(0,1)|_OUT(0)|_OUT(4), 23, fname, &ftype, &flen);

    UNIDBG(("encoding__load_map_file: '%s' type %d len %d\n", fname, ftype, flen));

    if ((ftype & 1) == 0)
        return 0;

    /* Open the file for input */
    e = _swix(OS_Find, _INR(0,1)|_OUT(0), 0x4F, fname, &fh);
    if (e)
        return 0;

    table = NULL;
    n_entries = 0;
    alloc = 0;

    /* Obtain the filing system number and internal handle */
    e = _swix(OS_FSControl, _INR(0,1)|_OUTR(1,2), 21, fh, &inthandle, &filesys);
    if (!e)
    {
	/* If it's ResourceFS, return a direct pointer */
	if ((filesys & 0xFF) == 46)
	{
	    table = (UCS2 *)inthandle;
	    n_entries = (((const int *)table)[-1] - 4)/2;
	}
	else
	{
	    /* Otherwise, load it */
	    table = encoding__alloc(flen);
	    if (table)
	    {
		alloc = 1;
		n_entries = flen/2;

		e = _swix(OS_GBPB, _INR(0,3), 4, fh, table, flen);
		if (e)
		{
		    encoding__free(table);
		    table = NULL;
		}
	    }
	}
    }
    /* Close the file */
    _swix(OS_Find, _INR(0,1), 0, fh);

    *ptable = table;
    *pn_entries = n_entries;
    *palloc = alloc;

    return table != NULL;
}

int encoding_current_alphabet(void)
{
    int a = 0;

    _swix(OS_Byte, _INR(0,1)|_OUT(1), 71, 127, &a);

    return a;
}

const UCS4 *encoding_alphabet_ucs_table(int a)
{
    const UCS4 *table = NULL;
    int ret;

    _swix(OS_ServiceCall, _INR(1,3)|_OUT(1)|_OUT(4), 0x43, 8, a, &ret, &table);

    /* Check it was claimed */
    if (ret != 0) table = NULL;

    return table;
}

/* eof riscos.c */
