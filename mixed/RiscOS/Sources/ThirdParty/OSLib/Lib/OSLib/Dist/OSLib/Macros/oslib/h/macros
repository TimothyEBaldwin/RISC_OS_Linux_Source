#ifndef macros_H
#define macros_H

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

/************************
 * Constant definitions *
 ************************/
#ifndef SIG_LIMIT
#define SIG_LIMIT                               11
#endif
#ifndef DEC_WIDTH
#define DEC_WIDTH                               10
#endif
#ifndef SHORT_DEC_WIDTH
#define SHORT_DEC_WIDTH                         5
#endif
#ifndef LONG_DEC_WIDTH
#define LONG_DEC_WIDTH                          10
#endif
#ifndef OCT_WIDTH
#define OCT_WIDTH                               11
#endif
#ifndef SHORT_OCT_WIDTH
#define SHORT_OCT_WIDTH                         6
#endif
#ifndef LONG_OCT_WIDTH
#define LONG_OCT_WIDTH                          11
#endif
#ifndef UNSIGNED_WIDTH
#define UNSIGNED_WIDTH                          10
#endif
#ifndef SHORT_UNSIGNED_WIDTH
#define SHORT_UNSIGNED_WIDTH                    5
#endif
#ifndef LONG_UNSIGNED_WIDTH
#define LONG_UNSIGNED_WIDTH                     10
#endif
#ifndef HEX_WIDTH
#define HEX_WIDTH                               8
#endif
#ifndef SHORT_HEX_WIDTH
#define SHORT_HEX_WIDTH                         4
#endif
#ifndef LONG_HEX_WIDTH
#define LONG_HEX_WIDTH                          8
#endif
#ifndef FLT_WIDTH
#define FLT_WIDTH                               7
#endif
#ifndef DBL_WIDTH
#define DBL_WIDTH                               17
#endif
#ifndef LDBL_WIDTH
#define LDBL_WIDTH                              17
#endif
#ifndef FLT_EXP_WIDTH
#define FLT_EXP_WIDTH                           2
#endif
#ifndef DBL_EXP_WIDTH
#define DBL_EXP_WIDTH                           3
#endif
#ifndef LDBL_EXP_WIDTH
#define LDBL_EXP_WIDTH                          3
#endif

/*********************
 * Macro definitions *
 *********************/

/* ------------------------------------------------------------------------
 * Macro:         ABS()
 *
 * Description:   Absolute value of a number
 */

#define ABS(a) ((a) >= 0? (a): -(a))

/* ------------------------------------------------------------------------
 * Macro:         ALIGN()
 *
 * Description:   Rounds an integer up to the next multiple of 4
 */

#define ALIGN(b) ((b) + 3 & ~3)

/* ------------------------------------------------------------------------
 * Macro:         BINEXP()
 *
 * Description:   2 to the power of an integer
 */

#define BINEXP(n) (1 << (n))

/* ------------------------------------------------------------------------
 * Macro:         BIT()
 *
 * Description:   The value of a bit at an offset from a pointer (cf CLR,
 *                SET)
 */

#define BIT(p, i) (((bits *) (p)) [(i) >> 5] &    1 << ((i) & 31))

/* ------------------------------------------------------------------------
 * Macro:         BOOL()
 *
 * Description:   Converts non-0 values to 1
 */

#define BOOL(c) ((c) != 0? TRUE: FALSE)

/* ------------------------------------------------------------------------
 * Macro:         CLEAR()
 *
 * Description:   Clears the contents of a string
 */

#define CLEAR(s) ((s) [0] = '\0')

/* ------------------------------------------------------------------------
 * Macro:         CLR()
 *
 * Description:   Clears the bit at an offset from a pointer (cf BIT, SET)
 *
 * Other notes:   5 = x: 2^^x == CHAR_BIT*sizeof (bits); 31 =
 *                CHAR_BIT*sizeof (bits) - 1
 */

#define CLR(p, i) (((bits *) (p)) [(i) >> 5] &= ~(1 << ((i) & 31)))

/* ------------------------------------------------------------------------
 * Macro:         COUNT()
 *
 * Description:   The number of elements in an array
 */

#define COUNT(a) (sizeof (a)/sizeof *(a))

/* ------------------------------------------------------------------------
 * Macro:         DBLEQ()
 *
 * Description:   Tests floating point numbers for approximate equality
 */

#define DBLEQ(a, b, e) (fabs ((a) - (b)) <= (e)*(fabs (a) + fabs (b)))

/* ------------------------------------------------------------------------
 * Macro:         DIGIT()
 *
 * Description:   The decimal digit corresponding to a character
 */

#define DIGIT(c) ((c) - '0')

/* ------------------------------------------------------------------------
 * Macro:         DIM()
 *
 * Description:   Positive difference
 */

#define DIM(a, b) ((a) > (b)? (a) - (b): 0)

/* ------------------------------------------------------------------------
 * Macro:         DIV_DOWN_POS_()
 *
 * Description:   Helper macro for DIV_DOWN, DIV_UP
 */

#define DIV_DOWN_POS_(a, b) ((a)/(b))

/* ------------------------------------------------------------------------
 * Macro:         DIV_UP_POS_()
 *
 * Description:   Helper macro for DIV_DOWN, DIV_UP
 */

#define DIV_UP_POS_(a, b) (((a) + (b) - 1)/(b))

/* ------------------------------------------------------------------------
 * Macro:         DIV_DOWN()
 *
 * Description:   Integer division, rounding down (towards -infinity)
 */

#define DIV_DOWN(a, b) ((a) >= 0? DIV_DOWN_POS_ (a, b): -DIV_UP_POS_ (-(a), b))

/* ------------------------------------------------------------------------
 * Macro:         DIV_UP()
 *
 * Description:   Integer division, rounding up (towards +infinity)
 */

#define DIV_UP(a, b) ((a) > 0? DIV_UP_POS_ (a, b): -DIV_DOWN_POS_ (-(a), b))

/* ------------------------------------------------------------------------
 * Macro:         EMPTY()
 *
 * Description:   Is a string empty?
 */

#define EMPTY(s) ((s) [0] == '\0')

/* ------------------------------------------------------------------------
 * Macro:         ISDIGIT()
 *
 * Description:   A decimal digit?
 */

#define ISDIGIT(c) ('0' <= (c) && (c) <= '9')

/* ------------------------------------------------------------------------
 * Macro:         ISXDIGIT()
 *
 * Description:   A hexadecimal digit?
 */

#define ISXDIGIT(c) (('0' <= (c) && (c) <= '9') || \
      ('a' <= (c) && (c) <= 'f') || ('A' <= (c) && (c) <= 'F'))

/* ------------------------------------------------------------------------
 * Macro:         LCHAR()
 *
 * Description:   The character corresponding to a digit, preferring lower
 *                case
 */

#define LCHAR(i) ("0123456789abcdef" [i])

/* ------------------------------------------------------------------------
 * Macro:         MAX()
 *
 * Description:   The larger of two values
 */

#define MAX(a, b) ((a) > (b)? (a): (b))

/* ------------------------------------------------------------------------
 * Macro:         MAXAB()
 *
 * Description:   The larger of two values and assign
 */

#define MAXAB(a, b) ((a) < (b)? (a) = (b): (a))

/* ------------------------------------------------------------------------
 * Macro:         MIN()
 *
 * Description:   The smaller of two values
 */

#define MIN(a, b) ((a) < (b)? (a): (b))

/* ------------------------------------------------------------------------
 * Macro:         MINAB()
 *
 * Description:   The smaller of two values and assign
 */

#define MINAB(a, b) ((a) > (b)? (a) = (b): (a))

/* ------------------------------------------------------------------------
 * Macro:         NCOPY()
 *
 * Description:   Copy a string of limited length
 */

#define NCOPY(s1, s2, n) (sprintf (s1, "%.*s", n, s2), s1)

/* ------------------------------------------------------------------------
 * Macro:         OFFSETOF()
 *
 * Description:   Offset of a member in a variable of structure type
 */

#define OFFSETOF(var, mem) ((char *) &(var).mem - (char *) &(var))

/* ------------------------------------------------------------------------
 * Macro:         RATIO()
 *
 * Description:   Integer division, rounding to nearest
 */

#define RATIO(a, b) ((2*(a) + (b))/(2*(b)))

/* ------------------------------------------------------------------------
 * Macro:         SET()
 *
 * Description:   Sets the bit at an offset from a pointer (cf BIT, CLR)
 */

#define SET(p, i) (((bits *) (p)) [(i) >> 5] |=   1 << ((i) & 31))

/* ------------------------------------------------------------------------
 * Macro:         SGN()
 *
 * Description:   Signum
 */

#define SGN(a) ((a) > 0? 1: (a) < 0? -1: 0)

/* ------------------------------------------------------------------------
 * Macro:         SHORT()
 *
 * Description:   Assembles a short from an unaligned pointer
 */

#define SHORT(ptr) ((int) (((byte *) (ptr)) [0] | \
      ((byte *) (ptr)) [1] << 8) << 16 >> 16)

/* ------------------------------------------------------------------------
 * Macro:         SQR()
 *
 * Description:   Square
 */

#define SQR(a) ((a)*(a))

/* ------------------------------------------------------------------------
 * Macro:         STR_()
 *
 * Description:   Helper macro for STR
 */

#define STR_(s) #s

/* ------------------------------------------------------------------------
 * Macro:         STR()
 *
 * Description:   Stringise a macro
 */

#define STR(s) STR_ (s)

/* ------------------------------------------------------------------------
 * Macro:         STRLEN()
 *
 * Description:   The length of a string constant, as a constant
 */

#define STRLEN(s) (sizeof (s) - 1)

/* ------------------------------------------------------------------------
 * Macro:         UCHAR()
 *
 * Description:   The character corresponding to a hexadecimal digit,
 *                preferring upper case
 */

#define UCHAR(i) ("0123456789ABCDEF" [i])

/* ------------------------------------------------------------------------
 * Macro:         WORD()
 *
 * Description:   Assembles a word at an unaligned character pointer
 */

#define WORD(ptr) ((int) (((byte *) (ptr)) [0] | \
      ((byte *) (ptr)) [1] << 8 | ((byte *) (ptr)) [2] << 16 | \
      ((byte *) (ptr)) [3] << 24))

/* ------------------------------------------------------------------------
 * Macro:         XDIGIT()
 *
 * Description:   The hexadecimal digit corresponding to a character
 */

#define XDIGIT(c) ((byte) (c) < 'A'? (c) - '0': \
      (byte) (c) < 'a'? (c) - 'A' + 10: (c) - 'a' + 10)

/* ------------------------------------------------------------------------
 * Macro:         WHETHER()
 *
 * Description:   Converts a boolean value to a string
 */

#define WHETHER(c) ((c)? "TRUE": "FALSE")

#endif
