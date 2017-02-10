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
/* > utf16.h */

/**************************************************************************/
/*                                                                        */
/* Copyright [1997-2003] All rights reserved.                             */
/*                                                                        */
/* This file may be included in profit making or non profit making        */
/* software on any system running any version of RISC OS, provided it was */
/* used along with a licensed binary of Unicode Lib                       */
/* It is supplied "as is" without warranty, express or implied, of        */
/* merchantability for any purpose.                                       */
/* No liability can be claimed for any direct or indirect loss            */
/**************************************************************************/

#ifndef unicode_utf16_h
#define unicode_utf16_h

#include "iso10646.h"

/*
 * UCS4_to_UTF16 converts a UCS-4 code to UTF-16, storing the result
 * in the array pointed to by out. This array must be large enough
 * to store the resulting UTF-16 element (4 bytes will always be
 * sufficient). The return value is a pointer to the byte after
 * the last one written. If code is not representable in UTF-16
 * (ie u >= 11000), it will output the UTF-16 element FFFD (replacement
 * character).
 */
extern UCS2 *UCS4_to_UTF16(UCS2 *out, UCS4 code);

/*
 * UTF16_codelen gives the length of a UCS-4 code (in 16-bit words) when
 * converted to UTF-16 using the above function. If not representable in
 * UTF-16, it will return 1, the length of FFFD (see above).
 */
extern int UTF16_codelen(UCS4 code);

/*
 * UTF16_seqlen gives the length of a UTF-16 sequence, given its first
 * 16-bit word.
 */
extern int UTF16_seqlen(UCS2 c);

/*
 * UTF16_to_UCS4 takes a pointer to a UTF-16 sequence and outputs
 * the corresponding UCS4 code, returning the number of 16-bit words
 * consumed. Incorrect sequences are dealt with by returning 1 and setting
 * *code_out to FFFD.
 */
extern int UTF16_to_UCS4(const UCS2 *in, UCS4 *code_out);

/*
 * UTF16_next advances the pointer to the next UTF-16 code in a string.
 * If p points to the middle of a UTF-16 sequence, it will be advanced
 * to the next UTF-16 sequence.
 */
UCS2 *UTF16_next(const UCS2 *p);

/*
 * UTF16_prev reverses the pointer to the previous UTF-16 code in a string.
 * If p points to the middle of a UTF-16 sequence, it will be reversed
 * to the start of that UTF-16 sequence.
 */
UCS2 *UTF16_prev(const UCS2 *p);

#endif
