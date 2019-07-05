#ifndef types_H
#define types_H

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

/********************
 * Type definitions *
 ********************/
typedef unsigned int                            bits;
typedef int                                     osbool;
typedef unsigned char                           byte;

/* for backward compatibility with non C++ and pre-C99 code
** we can typedef |bool| as |osbool|. Anyone who wants to provide
** their own definition of |bool| can define BOOL_DEFINED prior to
** #includeing this header to prevent the typedef occurring.
*/

#if !defined BOOL_DEFINED
   /* C99 defines bool as a keyword */
   #if defined __STDC_VERSION__
      #if __STDC_VERSION__ >= 199901L
        #define BOOL_DEFINED
      #endif
   #endif
#endif

#if !defined BOOL_DEFINED
   /* <stdbool.h> defines bool */
   #if defined __bool_true_false_are_defined
      #define BOOL_DEFINED
   #endif
#endif

/* C++ (1998) defines bool as a keyword;
** many implementations included it earlier,
** but there are some exceptions
*/
#if !defined BOOL_DEFINED && defined __cplusplus
  /* C++; Assume its's fully compliant */
  #define BOOL_DEFINED

  /* CFront defines |__cplusplus| but not |bool| */
  /* We assume that CFront is only ever used with Norcroft C */
  /* any C99 version of Norcroft will have been trapped previously */
  #if defined __CC_NORCROFT
    #undef BOOL_DEFINED
  #endif

  /* GNU C++ defines bool as a keyword only from V2.7 onwards */
  #if defined __GNUG__
    #if __GNUG__ < 2 || ( __GNUG__ == 2 && __GNUC_MINOR__ < 7 )
      #undef BOOL_DEFINED
    #endif
  #endif

  /* any other exceptions here */
#endif

   /* if it's still not defined, then define our own version */
#if !defined BOOL_DEFINED
   #define BOOL_IS_OSBOOL
   typedef osbool bool;
#endif

/************************
 * Constant definitions *
 ************************/
#ifndef NULL
#define NULL                                    0
#endif
#ifndef FALSE
#define FALSE                                   ((osbool) 0)
#endif
#ifndef TRUE
#define TRUE                                    ((osbool) 1)
#endif
#ifndef NONE
#define NONE                                    0u
#endif
#ifndef ALL
#define ALL                                     (~0u)
#endif
#ifndef SKIP
#define SKIP                                    0
#endif
#ifndef _V
#define _V                                      0x10000000u
#endif
#ifndef _C
#define _C                                      0x20000000u
#endif
#ifndef _Z
#define _Z                                      0x40000000u
#endif
#ifndef _N
#define _N                                      0x80000000u
#endif
#ifndef ERROR
#define ERROR                                   (-2)
#endif
#ifndef UNKNOWN
#define UNKNOWN                                 1
#endif

/*********************
 * Macro definitions *
 *********************/

/*Macros that "change the language"*/
#define AS    .
#define ASREF ->
#define _     ,

/* __swi(x) is an optimisation hint unique to Norcroft C */
/* define it to nothing for other compilers */
#if defined  __swi || !defined __CC_NORCROFT || defined __cplusplus
  #undef  __swi
  #define __swi(x) extern
#endif

/*Macros that suppress compiler warnings*/
#define NOT_USED(x) {x = x;}
#define UNSET(x) {(void) &x;}

#endif
