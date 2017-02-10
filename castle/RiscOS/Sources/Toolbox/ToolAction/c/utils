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
/* > utils.c

 * © SJ Middleton, 1992

 */

#include <ctype.h>
#include <limits.h>
#include "swis.h"

#include "utils.h"

/* --------------------------------------------------------------------- */

/* compare and search functions */

int strncmpi(const char *s1, const char *s2, size_t n)
{
    if (s1 && s2)
    {
        int i;
        for (i = 0; i < n; i++)
        {
            int c1 = *s1++,
                c2 = *s2++;
            c1 = toupper(c1);
            c2 = toupper(c2);
            if (c1 != c2)
                return c1 - c2;
            else if (c1 == '\0')
                return 0;
        }
    }
    return 0;
}

int strcmpi(const char *s1, const char *s2)
{
    return strncmpi(s1, s2, UINT_MAX);
}

/* --------------------------------------------------------------------- */

struct lls_header
{
    struct lls_header *next;
};

void lls_unlink(void **i_pbase, void *i_hdr)
{
    struct lls_header **pbase = (struct lls_header **)i_pbase;
    struct lls_header *hdr = i_hdr;

    struct lls_header *l = *pbase;
    struct lls_header *prev = NULL;

    while (l)
    {
        if (l == hdr)
        {
            if (prev)
            	prev->next = l->next;
            else
            	*pbase = l->next;
            break;
    	}

        l = l->next;
    }
}

void lls_link(void **i_pbase, void *i_hdr)
{
    struct lls_header **pbase = (struct lls_header **)i_pbase;
    struct lls_header *hdr = i_hdr;

    hdr->next = *pbase;
    *pbase = hdr;
}

// -----------------------------------------------------------------------------------

struct lld_header
{
    struct lld_header *prev;
    struct lld_header *next;
};

void lld_unlink(void **i_pbase, void *i_hdr)
{
    struct lld_header **pbase = (struct lld_header **)i_pbase;
    struct lld_header *hdr = i_hdr;

    if (hdr->prev)
    	hdr->prev->next = hdr->next;
    else if (*pbase == hdr)
    	*pbase = hdr->next;

    if (hdr->next)
    	hdr->next->prev = hdr->prev;
}

void lld_link(void **i_pbase, void *i_hdr)
{
    struct lld_header **pbase = (struct lld_header **)i_pbase;
    struct lld_header *hdr = i_hdr;

    hdr->next = *pbase;
    if (*pbase)
    	(*pbase)->prev = hdr;
    *pbase = hdr;
}

/* --------------------------------------------------------------------- */

/* eof utils.c */
