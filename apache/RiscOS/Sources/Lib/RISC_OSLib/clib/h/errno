/* Copyright 1996 Acorn Computers Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#pragma force_top_level
#pragma include_only_once

/* errno.h: ISO 'C' (9899:1999) library header, section 7.5 */
/* Copyright (C) Codemist Ltd. */
/* Copyright (C) Acorn Computers Ltd. 1991, 1992 */
/* version 2.00 */

#ifndef __errno_h
#define __errno_h

#ifndef errno
#ifdef SYSTEM_STATICS
#define errno *__errno
#ifdef __cplusplus
extern "C" int *__errno;
#else
extern volatile int *__errno;
#endif
#else
#define errno __errno
#ifdef __cplusplus
extern "C" int errno;
   /* CFront (3.0) doesn't understand volatile */
#else
extern volatile int errno;
#endif
#endif
#endif
   /*
    * expands to a modifiable lvalue that has type volatile int, the value of
    * which is set to a positive error code by several library functions. It is
    * initialised to zero at program startup, but is never set to zero by any
    * library function. The value of errno may be set to nonzero by a library
    * function call whether or not there is an error, provided the use of errno
    * is not documented in the description of the function in the Standard.
    */

#define EDOM    1
   /*
    * if a domain error occurs (an input argument is outside the domain over
    * which the mathematical function is defined) the integer expression errno
    * acquires the value of the macro EDOM and HUGE_VAL is returned. EDOM may
    * be used by non-mathematical functions.
    */

#define ERANGE 2
   /*
    * a range error occurs if the result of a function can not be represented
    * as a double value. If the result overflows (the magnitude of the result
    * is so large that it cannot be represented in an object of the specified
    * type), the function returns the value of the macro HUGE_VAL, with the
    * same sign as the correct value of the function; the integer expression
    * errno acquires the value of the macro ERANGE. If the result underflows
    * (the magnitude of the result is so small that it cannot be represented
    * in an object of the specified type), the function returns zero; the
    * integer expression errno acquires the value of the macro ERANGE. ERANGE
    * may be used by non-mathematical functions.
    */

#define ESIGNUM 3
   /*
    * a signal number error occurs if an unrecognised signal number is passed
    * to signal() or raise().
    */

#define EILSEQ 4
   /*
    * an illegal sequence error indicates that a multibyte character encoding
    * error has been detected.
    */

#define EOVERFLOW 5
   /*
    * an overflow error occurs if one or more fields of a data structure is
    * not large enough to hold the values required - for example, if you
    * attempt to open a file with fopen() whose size cannot be expressed using
    * an object of type off_t.
    */

#define EFBIG 6
   /*
    * a big file error occurs if a file is unbuffered or the file's buffer
    * needs to be flushed, and this would have resulted in a write occurring
    * at or beyond the maximum file pointer for this file descriptor.
    */

#endif

/* end of errno.h */
