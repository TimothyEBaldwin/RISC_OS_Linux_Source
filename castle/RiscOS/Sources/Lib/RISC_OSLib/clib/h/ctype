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
#pragma force_top_level
#pragma include_only_once

/* ctype.h: ISO 'C' (9899:1999) library header, section 7.4 */
/* Copyright (C) Codemist Ltd. */
/* Copyright (C) Acorn Computers Ltd. 1991, 1992 */
/* version 2.01 */

/*
 * ctype.h declares several functions useful for testing and mapping
 * characters. In all cases the argument is an int, the value of which shall
 * be representable as an unsigned char or shall equal the value of the
 * macro EOF. If the argument has any other value, the behaviour is undefined.
 */

#ifndef __ctype_h
#define __ctype_h

/* N.B. - keep in step with <ctype.c> */

#define __S 1            /* whitespace           */
#define __P 2            /* punctuation          */
#define __B 4            /* blank                */
#define __L 8            /* lower case letter    */
#define __U 16           /* upper case letter    */
#define __N 32           /* (decimal) digit      */
#define __C 64           /* control chars        */
#define __X 128          /* A-F and a-f          */

#ifdef __cplusplus
extern "C" {
#endif
#ifdef SYSTEM_STATICS
extern unsigned char *__ctype;
#else
extern unsigned char __ctype[];
#endif

#define isalnum(c) (__ctype[c] & (__U+__L+__N))
    /* non-0 iff c is alphabetic or numeric */

#define isalpha(c) (__ctype[c] & (__U+__L))
    /* non-0 iff c is alphabetic */

int isblank(int /*c*/);
    /* non-0 iff c is a blank char: ' ', '\t'. */

#define iscntrl(c) (__ctype[c] & __C)
    /* non-0 iff c is a control character - in the ASCII locale */
    /*       this means (c < ' ') || (c > '~')                  */

#define isdigit(c) (__ctype[c] & __N)
    /* non-0 iff c is a decimal digit */

#define isgraph(c) (__ctype[c] & (__L+__U+__N+__P))
    /* non-0 iff c is any printing character other than ' ' */

#define islower(c) (__ctype[c] & __L)
    /* non-0 iff c is a lower-case letter */

#define isprint(c) (__ctype[c] & (__L+__U+__N+__P+__B))
    /* non-0 iff c is a printing character - in the ASCII locale */
    /*       this means 0x20 (space) -> 0x7E (tilde) */

#define ispunct(c) (__ctype[c] & __P)
    /* non-0 iff c is a non-space, non-alpha-numeric, printing character */

#define isspace(c) (__ctype[c] & __S)
    /* non-0 iff c is a white-space char: ' ', '\f', '\n', '\r', '\t', '\v'. */

#define isupper(c) (__ctype[c] & __U)
    /* non-0 iff c is an upper-case letter */

#define isxdigit(c) (__ctype[c] & (__N+__X))
    /* non-0 iff c is a digit, in 'a'..'f', or in 'A'..'F' */

#ifndef __cplusplus
int (isalnum)(int /*c*/);
int (isalpha)(int /*c*/);
int (iscntrl)(int /*c*/);
int (isdigit)(int /*c*/);
int (isgraph)(int /*c*/);
int (islower)(int /*c*/);
int (isprint)(int /*c*/);
int (ispunct)(int /*c*/);
int (isspace)(int /*c*/);
int (isupper)(int /*c*/);
int (isxdigit)(int /*c*/);
#endif

int tolower(int /*c*/);
    /* if c is an upper-case letter then return the corresponding */
    /* lower-case letter, otherwise return c.                     */

int toupper(int /*c*/);
    /* if c is an lower-case letter then return the corresponding */
    /* upper-case letter, otherwise return c.                     */
#ifdef __cplusplus
}
#endif

#endif

/* end of ctype.h */
