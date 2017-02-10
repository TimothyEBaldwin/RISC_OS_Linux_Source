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
// Generate test data for long long support
// Run this on a known good C library

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>

uint64_t rand63(void)
{
  // Generate a 63-bit random number
  uint32_t a, b;
  a = rand();
  b = rand();
  return 0x4000000000000000 | ((uint64_t) a << 31) | b;
}

int main(void)
{
  // We want to create pairs of random 64-bit numbers with
  // every combination of 1-64 leading 0s and 1-64 leading 1s
  assert(RAND_MAX == 0x7FFFFFFF);
  srand(42);
  bool invertb = false;
  do
  {
    bool inverta = false;
    do
    {
      for (size_t bbits = 1; bbits <= 64; bbits++)
        for (size_t abits = 1; abits <= 64; abits++)
        {
          uint64_t a = rand63() >> (abits - 1);
          uint64_t b = rand63() >> (bbits - 1);
          if (inverta) a = ~a;
          if (invertb) b = ~b;
          printf("%016llX %016llX\n", a, b);
        }
    }
    while (!inverta++);
  }
  while (!invertb++);
  return 0;
}
