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
/* > enc_ascii.c */

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

#include "enc_ascii.h"

/*
 * Routines for encoding US-ASCII
 * Number: 3
 * Names: US-ASCII
 *        ANSI_X3.4-1968
 *        iso-ir-6
 *        ISO_646.irv:1991
 *        ASCII
 *        ISO646-US
 *        us
 *        IBM367
 *        cp367
 *        csASCII
 */

static unsigned int ascii_read(Encoding *e,
			       encoding_read_callback_fn ucs_out,
                               const unsigned char *s,
                               unsigned int n,
                               void *handle)
{
    unsigned int count;

    for (count = n; count; count--)
    {
        unsigned char c = *s++;
        UCS4 u = c < 0x80 ? c : 0xFFFD;

        if (ucs_out)
            if (ucs_out(handle, u))
            {
                /* Character has been used, so ensure its counted */
                count--;
                break;
            }
    }

    return n - count;

    NOT_USED(e);
}

static int ascii_read_in_multibyte_sequence(EncodingPriv *e)
{
    return 0;

    NOT_USED(e);
}

static int ascii_write(EncodingPriv *e, UCS4 u, unsigned char **s, int *bufsize)
{
    int c;

    if (u == NULL_UCS4)
	return 0;

    if (--(*bufsize) < 0 || !s)
	return 0;

    if (u < 0x80)
	c = u;
    else if (e->for_encoding == encoding_WRITE_STRICT)
	return -1;
    else
	c = '?';

    (*s)[0] = c;
    (*s)++;

    return 1;

    NOT_USED(e);
}

EncodingPriv enc_ascii =
{
    ascii_read,
    ascii_read_in_multibyte_sequence,
    0, /* ascii_reset, */
    0,
    0, /* ascii_delete */
    0,
    ascii_write,
    0,
    0,
    0
};
