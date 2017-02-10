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
/* > enc_ucs4.c */

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

#include <stdlib.h>

#include "encpriv.h"

#include "enc_ucs4.h"

typedef struct UCS4_Encoding
{
    EncodingPriv e;
    union
    {
        unsigned char byte[4];
        UCS4 word;
    } code;
    unsigned char sync;
    unsigned char first;
} UCS4_Encoding;

/*
 * Routines for encoding UCS-4
 * Number: 1001
 * Names: ISO-10646-UCS-4
 *        csUCS4
 */
static int ucs4_reset(Encoding *e, int for_encoding)
{
    UCS4_Encoding *ue = (UCS4_Encoding *) e;

    ue->code.word = 0;
    ue->sync = 3;
    ue->first = 1;

    return 1;

    NOT_USED(for_encoding);
}

static unsigned int ucs4_read(Encoding *e,
                              encoding_read_callback_fn ucs_out,
                              const unsigned char *s,
                              unsigned int n,
                              void *handle)
{
    UCS4_Encoding *ue = (UCS4_Encoding *) e;
    unsigned int count;

    for (count = n; count; count--)
    {
        unsigned char c = *s++;
        UCS4 u;

        if (ue->e.flags & encoding_FLAG_LITTLE_ENDIAN)
            ue->code.byte[3 - ue->sync] = c;
        else
            ue->code.byte[(unsigned int)ue->sync] = c;

        if (ue->sync)
        {
            ue->sync--;
            continue;
        }

        ue->sync = 3;
        u = ue->code.word;

        if (u == 0xFFFE0000)
        {
            ue->e.flags ^= encoding_FLAG_LITTLE_ENDIAN;
            u = 0xFEFF;
        }
        else if (u & 0x80000000)
            u = 0xFFFD;

        /* Strip BOM */
        if (ue->first && u == 0xFEFF)
        {
            ue->first = 0;
            continue;
        }

        ue->first = 0;

        if (ucs_out)
            if (ucs_out(handle, u))
            {
                /* Character has been used, so ensure its counted */
                count--;
                break;
            }
    }

    return n - count;
}

static int ucs4_read_in_multibyte_sequence(EncodingPriv *e)
{
    UCS4_Encoding *ue = (UCS4_Encoding *) e;

    return ue->sync != 3;
}

static unsigned char *write_be(unsigned char *p, UCS4 u)
{
    *p++ = (u >> 24) & 0xff;
    *p++ = (u >> 16) & 0xff;
    *p++ = (u >> 8) & 0xff;
    *p++ = u & 0xff;

    return p;
}

static unsigned char *write_le(unsigned char *p, UCS4 u)
{
    *p++ = u & 0xff;
    *p++ = (u >> 8) & 0xff;
    *p++ = (u >> 16) & 0xff;
    *p++ = (u >> 24) & 0xff;

    return p;
}

static int ucs4_write(EncodingPriv *e, UCS4 u, unsigned char **pucs4, int *bufsize)
{
    UCS4_Encoding *ue = (UCS4_Encoding *) e;
    unsigned char *ucs4;
    int size = ue->first && !(ue->e.flags & encoding_FLAG_NO_HEADER) ? 8 : 4;

    if (u == NULL_UCS4)
	return 0;

    if ((*bufsize -= size) < 0 || !pucs4)
	return 0;

    ucs4 = *pucs4;

    if (ue->first && !(ue->e.flags & encoding_FLAG_NO_HEADER))
    {
        if (ue->e.flags & encoding_FLAG_LITTLE_ENDIAN)
            ucs4 = write_le(ucs4, 0xFEFF);
        else
            ucs4 = write_be(ucs4, 0xFEFF);
    }

    ue->first = 0;

    /* convert all illegal sequences (except NULL_UCS4) to the
       illegal/replacement character */
    if (u & 0x80000000)
	u = 0xFFFD;

    if (ue->e.flags & encoding_FLAG_LITTLE_ENDIAN)
        ucs4 = write_le(ucs4, u);
    else
        ucs4 = write_be(ucs4, u);

    (*pucs4) = ucs4;

    return 1;
}

EncodingPriv enc_ucs4 =
{
    ucs4_read,
    ucs4_read_in_multibyte_sequence,
    ucs4_reset,
    sizeof(UCS4_Encoding) - sizeof(EncodingPriv),
    0, /* ucs4_delete */
    0,
    ucs4_write,
    0,
    0,
    0
};
