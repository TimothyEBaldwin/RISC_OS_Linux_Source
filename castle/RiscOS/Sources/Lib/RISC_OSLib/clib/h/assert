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

/* assert.h: ISO 'C' (9899:1999) library header, section 7.2 */
/* Copyright (C) Codemist Ltd. */
/* Copyright (C) Acorn Computers Ltd. 1991, 1992 */
/* version 2.01 */

/*
 * The assert macro puts diagnostics into programs. When it is executed,
 * if its argument expression is false, it writes information about the
 * call that failed (including the text of the argument, the name of the
 * source file, the source line number, and the name of the enclosing
 * function - the latter are respectively the values of the preprocessing
 * macros __FILE__ and __LINE__ and of the identifier __func__) on the
 * standard error stream. It then calls the abort function.
 * The assert macro returns no value.
 */

/*
 * Note that <assert.h> may be included more that once in a program with
 * different setting of NDEBUG. Hence the slightly unusual first-time
 * only flag.
 */

#ifndef __assert_h
#  define __assert_h
#ifdef __cplusplus
   extern "C" void __assert(const char *, const char *, int);
   extern "C" void __assert2(const char *, const char *, const char *, int);
#else
   extern void __assert(const char *, const char *, int);
   extern void __assert2(const char *, const char *, const char *, int);
#endif
#else
#  undef assert
#endif

#ifdef NDEBUG
#  define assert(ignore) ((void)0)
#else
#    define assert(e) ((e) ? (void)0 : __assert(#e, __FILE__, __LINE__))
#    if __STDC_VERSION__ >= 199901
#      undef assert
#      define assert(e) ((e) ? (void)0 : __assert2(#e, __func__, __FILE__, __LINE__))
#    endif
#endif

/* end of assert.h */
