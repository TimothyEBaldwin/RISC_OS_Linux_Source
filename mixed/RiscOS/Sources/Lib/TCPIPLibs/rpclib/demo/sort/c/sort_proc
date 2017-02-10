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
/* @(#)sort_proc.c	1.2 87/11/24 3.9 RPCSRC */
#include <rpc/rpc.h>
#include "sort.h"

static int
comparestrings(sp1, sp2)
    char **sp1, **sp2;
{
    return (strcmp(*sp1, *sp2));
}

struct sortstrings *
sort_1(ssp)
    struct sortstrings *ssp;
{
    static struct sortstrings ss_res;

    if (ss_res.ss.ss_val != (str *)NULL)
        free(ss_res.ss.ss_val);

    qsort(ssp->ss.ss_val, ssp->ss.ss_len, sizeof (char *), comparestrings);
    ss_res.ss.ss_len = ssp->ss.ss_len;
    ss_res.ss.ss_val = (str *)malloc(ssp->ss.ss_len * sizeof(str *));
    bcopy(ssp->ss.ss_val, ss_res.ss.ss_val,
        ssp->ss.ss_len * sizeof(str *));
    return(&ss_res);
}
