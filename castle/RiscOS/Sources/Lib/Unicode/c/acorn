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
/* > acorn.c */

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

#include "eightbit.h"
#include "acorn.h"

typedef struct
{
    UCS2 u;
    unsigned char c;
} key_pair;

static key_pair fuzzy_specials[] =
{
    /* exact matches */
    { 0x0174, 0x81 },
    { 0x0175, 0x82 },
    { 0x0176, 0x85 },
    { 0x0177, 0x86 },
    { 0x2026, 0x8C },
    { 0x2122, 0x8D },
    { 0x2030, 0x8E },
    { 0x2022, 0x8F },
    { 0x2018, 0x90 },
    { 0x2019, 0x91 },
    { 0x2039, 0x92 },
    { 0x203A, 0x93 },
    { 0x201C, 0x94 },
    { 0x201D, 0x95 },
    { 0x201E, 0x96 },
    { 0x2013, 0x97 },
    { 0x2014, 0x98 },
    { 0x2212, 0x99 },
    { 0x0152, 0x9A },
    { 0x0153, 0x9B },
    { 0x2020, 0x9C },
    { 0x2021, 0x9D },
    { 0xFB01, 0x9E },
    { 0xFB02, 0x9F },

    /* less exact matches */
    { 0x201A, ',' },		/* sq lower */
    { 0x0192, 'f' },		/* guilder */
    { 0x02C6, '^' },		/* circumflex */
    { 0x0160, 'S' },		/* S hacek */
    { 0x02DC, '~' },		/* tilde */
    { 0x0161, 's' },		/* s hacek */
    { 0x0110, 0xD0 },           /* D stroke -> Eth */

    { 0, 0 }
};

static int acorn_write(EncodingPriv *e, UCS4 u, unsigned char **s, int *bufsize)
{
    unsigned char c;

    if (u == NULL_UCS4)
	return 0;

    if ( --(*bufsize) < 0 || !s)
	return 0;

    if (u < 0x100)
	c = u;			/* all Latin1 go straight through */
    else
    {
	key_pair *kp;
	c = 143;		/* bullet character */
	for (kp = fuzzy_specials; kp->u; kp++)
	{
	    if (kp->u == u)
	    {
		c = kp->c;
		break;
	    }
	}
    }

    (*s)[0] = c;
    (*s)++;
    return 1;

    NOT_USED(e);
}

EncodingPriv enc_acorn =
{
    eightbit_read,
    eightbit_read_in_multibyte_sequence,
    eightbit_reset,
    sizeof(EightBit_Encoding) - sizeof(EncodingPriv),
    eightbit_delete,
    0,
    acorn_write,
    0,
    0,
    0
};
