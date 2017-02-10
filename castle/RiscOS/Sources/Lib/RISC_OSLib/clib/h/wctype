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

/* wctype.h: ISO 'C' (9899:1999) library header, section 7.25 */
/* Copyright (C) Acorn Computers Ltd. 2002 */
/* version 1.00 */

#ifndef __wctype_h
#define __wctype_h

typedef int wint_t;
typedef unsigned int wctrans_t;
typedef unsigned int wctype_t;

#ifndef __S
#define __S 1            /* whitespace           */
#define __P 2            /* punctuation          */
#define __B 4            /* blank                */
#define __L 8            /* lower case letter    */
#define __U 16           /* upper case letter    */
#define __N 32           /* (decimal) digit      */
#define __C 64           /* control chars        */
#define __X 128          /* A-F and a-f          */
#endif

#ifndef WEOF
#define WEOF (-1)
#endif

int iswalnum(wint_t);
int iswalpha(wint_t);
int iswblank(wint_t);
int iswcntrl(wint_t);
int iswdigit(wint_t);
int iswgraph(wint_t);
int iswlower(wint_t);
int iswprint(wint_t);
int iswpunct(wint_t);
int iswspace(wint_t);
int iswupper(wint_t);
int iswxdigit(wint_t);

#define iswalnum(wc) iswctype(wc, __U+__L+__N)
#define iswalpha(wc) iswctype(wc, __U+__L)
#define iswblank(wc) iswctype(wc, __B)
#define iswcntrl(wc) iswctype(wc, __C)
#define iswdigit(wc) iswctype(wc, __N)
#define iswgraph(wc) iswctype(wc, __L+__U+__N+__P)
#define iswlower(wc) iswctype(wc, __L)
#define iswprint(wc) iswctype(wc, (__L+__U+__N+__P+__B)+(__C<<16))
#define iswpunct(wc) iswctype(wc, __P)
#define iswspace(wc) iswctype(wc, __S)
#define iswupper(wc) iswctype(wc, __U)
#define iswxdigit(wc) iswctype(wc, __N+__X)

int iswctype(wint_t, wctype_t);
wctype_t wctype(const char *);

wint_t towlower(wint_t);
wint_t towupper(wint_t);
wint_t towctrans(wint_t, wctrans_t);
wctrans_t wctrans(const char *);

#endif

/* end of wctype.h */
