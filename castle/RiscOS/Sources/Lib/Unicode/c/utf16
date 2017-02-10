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
/* > utf16.c */

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

#include "utf16.h"

/*
 * UCS4_to_UTF16 converts a UCS-4 code to UTF-16, storing the result
 * in the array pointed to by out. This array must be large enough
 * to store the resulting UTF-16 element (4 bytes will always be
 * sufficient). The return value is a pointer to the code after
 * the last one written.
 */
UCS2 *UCS4_to_UTF16(UCS2 *out, UCS4 code)
{
    if (code < 0x10000u)
    {
        *out++ = (UCS2)code;
        return out;
    }

    if (code < 0x110000u)
    {
        code -= 0x10000u;
        *out++ = (UCS2)(0xD800u | (code >> 10));
        *out++ = (UCS2)(0xDC00u | (code & 0x3FFu));
        return out;
    }

    *out++ = 0xFFFDu;
    return out;
}

/*
 * UTF16_to_UCS4 takes a pointer to a UTF-16 sequence and outputs
 * the corresponding UCS4 code, returning the number of 16-bit words consumed.
 */
int UTF16_to_UCS4(const UCS2 *c, UCS4 *r)
{
    UCS4 c0 = c[0];
    UCS4 cn;

    /* If it's not in the S-zone, just return the code */
    if (c0 < 0xD800u || c0 >= 0xE000u)
    {
        *r = c0;
        return 1;
    }

    /* If it's a low-half RC-element, we're broken */
    if (c0 < 0xDC00u)
        goto badutf;

    /* Check second code is a low-half RC-element */
    cn = c[1] ^ 0xDC00u;

    if (cn & 0x0400u)
        goto badutf;

    /* Add them up */
    *r = (c0 << 10) + cn + 0x10000u;
    return 2;

  badutf:
    *r = 0xFFFDu;
    return 1;
}

/*
 * UTF16_codelen gives the length of a UCS-4 code when converted to UTF-16
 * using UCS4_to_UTF16.
 */
int UTF16_codelen(UCS4 code)
{
    if (code < 0x10000u) return 1;
    if (code < 0x110000u) return 2;
    return 1;
}

/*
 * UTF16_seqlen gives the length of a UTF-16 sequence, given its first
 * word.
 */
int UTF16_seqlen(UCS2 c)
{
    if (c < 0xD800u || c >= 0xDC00u) return 1;
    return 2;
}

/*
 * UTF16_next advances the pointer to the next UTF-16 code in a string.
 */
UCS2 *UTF16_next(const UCS2 *p)
{
    while ((*++p ^ 0xDC00u) < 0x400u)
        continue;

    return (UCS2 *) p;
}

/*
 * UTF16_prev reverses the pointer to the previous UTF-16 code in a string.
 */
UCS2 *UTF16_prev(const UCS2 *p)
{
    while ((*--p ^ 0xDC00u) < 0x400u)
        continue;

    return (UCS2 *) p;
}
