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

/* stddef.h: ISO 'C' (9899:1999) library header, section 7.17 */
/* Copyright (C) Codemist Ltd. */
/* Copyright (C) Acorn Computers Ltd. 1991, 1992 */
/* version 2.01 */

/*
 * The following types and macros are defined in several headers referred to in
 * the descriptions of the functions declared in that header. They are also
 * defined in this header file.
 */

#ifndef __stddef_h
#define __stddef_h

typedef int ptrdiff_t;
#ifndef __STDC__
#   define ptrdiff_t int   /* ANSI bans this -- delete unless pcc wants.   */
#endif
   /* the signed integral type of the result of subtracting two pointers. */

#ifndef __size_t
#  define __size_t 1
typedef unsigned int size_t;   /* others (e.g. <stdio.h>) define */
   /* the unsigned integral type of the result of the sizeof operator. */
#endif

#ifndef __wchar_t
#  define __wchar_t 1
typedef int wchar_t;                         /* also in <stdlib.h> */
   /*
    * An integral type whose range of values can represent distinct codes for
    * all members of the largest extended character set specified among the
    * supported locales; the null character shall have the code value zero and
    * each member of the basic character set shall have a code value when used
    * as the lone character in an integer character constant.
    */
#endif

#ifndef NULL  /* this hack is so that <stdio.h> can also define it */
#  define NULL 0
   /* null pointer constant. */
#endif

#ifdef __cplusplus
#define offsetof(type, member) \
    ((size_t)((char *)&(((type *)0)->member) - (char *)0))
#else
#define offsetof(type, member) \
    ((size_t)((char *)&(((___type type *)0)->member) - (char *)0))
#endif
   /*
    * expands to an integral constant expression that has type size_t, the
    * value of which is the offset in bytes, from the beginning of a structure
    * designated by type, of the member designated by the identifier (if the
    * specified member is a bit-field, the behaviour is undefined).
    */
#endif

/* end of stddef.h */
