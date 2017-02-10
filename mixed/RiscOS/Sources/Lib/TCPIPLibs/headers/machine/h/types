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
#ifndef _MACHINE_TYPES_H_
#define _MACHINE_TYPES_H_

#ifdef KERNEL
#define _BSD_CLOCK_T_ unsigned int
#define _BSD_TIME_T_ unsigned int
#else
#include <time.h>
#endif
#ifndef __size_t
#  define __size_t 1
#  define _BSD_SIZE_T_ unsigned int
#endif
#define _BSD_SSIZE_T_ int
typedef unsigned int vm_offset_t;

#if __STDC_VERSION__ >= 199901
#include <stdint.h>
typedef uint32_t u_int32_t;
typedef uint16_t u_int16_t;
typedef uint8_t  u_int8_t;
#else
typedef unsigned int u_int32_t;
typedef signed int int32_t;
typedef unsigned short u_int16_t;
typedef signed short int16_t;
typedef unsigned char u_int8_t;
typedef signed char int8_t;
#endif

#endif
