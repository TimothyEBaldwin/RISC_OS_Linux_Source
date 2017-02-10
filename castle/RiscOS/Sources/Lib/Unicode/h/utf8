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
/* > utf8.h */

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

#ifndef unicode_utf8_h
#define unicode_utf8_h

#include "iso10646.h"

/*
 * UCS4_to_UTF8 converts a UCS-4 code to UTF-8, storing the result
 * in the array pointed to by out. This array must be large enough
 * to store the resulting UTF-8 element (6 bytes will always be
 * sufficient). The return value is a pointer to the byte after
 * the last one written. Assumes code is a legal UCS value (ie
 * in the range 0-0x7FFFFFFF).
 */
extern char *UCS4_to_UTF8(char *out, UCS4 code);

/*
 * UTF8_codelen gives the length of a UCS-4 code when converted to UTF-8
 * using the above function.
 */
extern int UTF8_codelen(UCS4 code);

/*
 * UTF8_seqlen gives the length of a UTF-8 sequence, given its first
 * byte.
 */
extern int UTF8_seqlen(char c);

/*
 * UTF8_to_UCS4 takes a pointer to a UTF-8 sequence and outputs
 * the corresponding UCS4 code, returning the number of bytes consumed.
 * Incorrect sequences are dealt with by returning 1 and setting
 * *code_out to 0xFFFD.
 */
extern int UTF8_to_UCS4(const char *in, UCS4 *code_out);

/*
 * UTF8_next advances the pointer to the next UTF-8 code in a string.
 * If p points to the middle of a UTF-8 sequence, it will be advanced
 * to the next UTF-8 sequence.
 *
 * Note that p + UTF8_seqlen(p[0]) != UTF8_next(p) if p points to the
 * middle of a sequence.
 */
extern char *UTF8_next(const char *p);

/*
 * UTF8_prev reverses the pointer to the previous UTF-8 code in a string.
 * If p points to the middle of a UTF-8 sequence, it will be reversed
 * to the start of that UTF-8 sequence.
 */
extern char *UTF8_prev(const char *p);

/*
 * UTF8_next_n advances the pointer over 'n' UTF8 characters and returns the
 * new pointer. It uses UTF8_next so has its behaviour over starting conditions.
 */

extern char *UTF8_next_n(const char *p, int n_chars);

/*
 * Count the number of utf8 'characters' in the string
 */

extern int UTF8_strlen(const char *p);
extern int UTF8_strlen_n(const char *p, int n_bytes);

#endif
