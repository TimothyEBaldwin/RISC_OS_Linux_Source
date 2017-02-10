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
/* Test long long support */

#include <stdio.h>
#include <stdint.h>

struct udivrem { uint64_t q; uint64_t r; };
struct  divrem {  int64_t q;  int64_t r; };

extern  int64_t _ll_from_u(uint32_t);
extern  int64_t _ll_from_l( int32_t);
extern uint32_t _ll_to_l  ( int64_t);

extern  int64_t _ll_add  ( int64_t,  int64_t);
extern  int64_t _ll_addlu( int64_t, uint32_t);
extern  int64_t _ll_addls( int64_t,  int32_t);
extern  int64_t _ll_adduu(uint32_t, uint32_t);
extern  int64_t _ll_addss( int32_t,  int32_t);

extern  int64_t _ll_sub  ( int64_t,  int64_t);
extern  int64_t _ll_sublu( int64_t, uint32_t);
extern  int64_t _ll_subls( int64_t,  int32_t);
extern  int64_t _ll_subuu(uint32_t, uint32_t);
extern  int64_t _ll_subss( int32_t,  int32_t);

extern  int64_t _ll_rsb  ( int64_t,  int64_t);
extern  int64_t _ll_rsblu( int64_t, uint32_t);
extern  int64_t _ll_rsbls( int64_t,  int32_t);
extern  int64_t _ll_rsbuu(uint32_t, uint32_t);
extern  int64_t _ll_rsbss( int32_t,  int32_t);

extern  int64_t _ll_mul  ( int64_t,  int64_t);
extern  int64_t _ll_mullu( int64_t, uint32_t);
extern  int64_t _ll_mulls( int64_t,  int32_t);
extern  int64_t _ll_muluu(uint32_t, uint32_t);
extern  int64_t _ll_mulss( int32_t,  int32_t);

extern __value_in_regs struct udivrem _ll_udiv  (uint64_t, uint64_t);
extern __value_in_regs struct udivrem _ll_urdv  (uint64_t, uint64_t);
extern __value_in_regs struct udivrem _ll_udiv10(uint64_t);
extern __value_in_regs struct  divrem _ll_sdiv  ( int64_t,  int64_t);
extern __value_in_regs struct  divrem _ll_srdv  ( int64_t,  int64_t);
extern __value_in_regs struct  divrem _ll_sdiv10( int64_t);

extern  int64_t _ll_not( int64_t);
extern  int64_t _ll_neg( int64_t);
extern  int64_t _ll_and( int64_t,  int64_t);
extern  int64_t _ll_or ( int64_t,  int64_t);
extern  int64_t _ll_eor( int64_t,  int64_t);

extern uint64_t _ll_shift_l (uint64_t, uint32_t);
extern uint64_t _ll_ushift_r(uint64_t, uint32_t);
extern  int64_t _ll_sshift_r( int64_t, uint32_t);

int main(void)
{
  FILE *f = fopen("inputs", "r");
  while (!feof(f))
  {
    int64_t a,b;
    fscanf(f, "%016llX %016llX\n", &a, &b);
    struct udivrem udr;
    struct divrem dr;
    printf("%016llX %016llX  "
           "%016llX %016llX %08X  "
           "%016llX %016llX %016llX %016llX %016llX  "
           "%016llX %016llX %016llX %016llX %016llX  "
           "%016llX %016llX %016llX %016llX %016llX  "
           "%016llX %016llX %016llX %016llX %016llX  ",
      a, b,
      _ll_from_u(a), _ll_from_l(a), _ll_to_l(a),
      _ll_add(a,b), _ll_addlu(a,b), _ll_addls(a,b), _ll_adduu(a,b), _ll_addss(a,b),
      _ll_sub(a,b), _ll_sublu(a,b), _ll_subls(a,b), _ll_subuu(a,b), _ll_subss(a,b),
      _ll_rsb(a,b), _ll_rsblu(a,b), _ll_rsbls(a,b), _ll_rsbuu(a,b), _ll_rsbss(a,b),
      _ll_mul(a,b), _ll_mullu(a,b), _ll_mulls(a,b), _ll_muluu(a,b), _ll_mulss(a,b));

    udr = b == 0 ? (struct udivrem) { 0, 0 } : _ll_udiv(a,b);
    printf("%016llX %016llX ", udr.q, udr.r);
    udr = a == 0 ? (struct udivrem) { 0, 0 } : _ll_urdv(a,b);
    printf("%016llX %016llX ", udr.q, udr.r);
    udr = _ll_udiv10(a);
    printf("%016llX %016llX ", udr.q, udr.r);
     dr = b == 0 ?  (struct divrem) { 0, 0 } : _ll_sdiv(a,b);
    printf("%016llX %016llX ",  dr.q,  dr.r);
     dr = a == 0 ?  (struct divrem) { 0, 0 } : _ll_srdv(a,b);
    printf("%016llX %016llX ",  dr.q,  dr.r);
     dr = _ll_sdiv10(a);
    printf("%016llX %016llX  ",  dr.q,  dr.r);

    printf("%016llX %016llX %016llX %016llX %016llX  "
           "%016llX %016llX %016llX\n",
      _ll_not(a), _ll_neg(a), _ll_and(a,b), _ll_or(a,b), _ll_eor(a,b),
      _ll_shift_l(a,b&0x3F), _ll_ushift_r(a,b&0x3F), _ll_sshift_r(a,b&0x3F));
  }
  fclose(f);
  return 0;
}
