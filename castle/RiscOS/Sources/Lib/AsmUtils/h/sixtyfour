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
/*
 *  AsmUtils (sixtyfour.h)
 *
 * Copyright (C) Pace Micro Technology plc. 1999
 *
 */
#ifndef asmutils_sixtyfour_h_inluded
#define asmutils_sixtyfour_h_inluded

#ifdef __cplusplus
extern "C" {
#endif

/* 64-bit arithmetic support.  Note that not all of the support for signed
 * 64-bit arithmetic has been added so far.
 */

#ifndef NO_SIXTYFOUR_TYPE_DECLS
/* Signed 64-bit integer representation */
typedef struct _int64_t {
        unsigned long low;
        signed long   high;
} int64_t;

/* Unsigned 64-bit integer representation */
typedef struct {
        unsigned long low;
        unsigned long high;
} u_int64_t;
#endif /* !NO_SIXTYFOUR_TYPE_DECLS */

/* All functions with the exception of [su]i64_value return their first
 * parameter as the function result.
 */

/* Constructors.  First numeric parameter is the least-significant 32 bits,
 * the second (where provided) is the most-significant 32 bits.
 * Note: si64_create performs sign extension
 */
extern u_int64_t *ui64_create2(u_int64_t *, unsigned long, unsigned long);
extern u_int64_t *ui64_create(u_int64_t *, unsigned long);
extern int64_t *si64_create2(int64_t *, unsigned long, long);
extern int64_t *si64_create(int64_t *, unsigned long);

/* Add a 32-bit quantity to a 64-bit quantity */
extern u_int64_t *ui64_add(u_int64_t *, unsigned long);
extern int64_t *si64_add(int64_t *, unsigned long);

/* Add two 64-bit quantities */
extern u_int64_t *ui64_add_u64u64(u_int64_t *, const u_int64_t *, const u_int64_t *);
extern int64_t *si64_add_s64s64(int64_t *, const int64_t *, const int64_t *);

/* Subtract two 64-bit quantities */
extern u_int64_t *ui64_subtract_u64u64(u_int64_t *, const u_int64_t *, const u_int64_t *);
extern int64_t *si64_subtract_s64s64(int64_t *, const int64_t *, const int64_t *);

/* 32x32->64 unsigned multiplication. */
extern u_int64_t *ui64_multiply_uu(u_int64_t *, unsigned long, unsigned long);

/* 64x64->64 unsigned multiplication. */
extern u_int64_t *ui64_multiply_u64u64(u_int64_t *, u_int64_t *, u_int64_t *);

/* Right shifting of 64-bit quantities */
extern u_int64_t *ui64_shift_right(u_int64_t *, unsigned);
extern int64_t *si64_shift_right(int64_t *, unsigned);

/* Narrowing cast to 32 bits - both long and int as return values */
extern unsigned long ui64_value(const u_int64_t *);
extern long si64_value(const int64_t *);
extern unsigned int ui64_value_as_int(const u_int64_t *);
extern int si64_value_as_int(const int64_t *);

#ifdef __cplusplus
}
#endif

#endif
