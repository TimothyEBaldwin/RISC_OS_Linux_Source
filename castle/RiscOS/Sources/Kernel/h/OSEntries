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
#ifndef GLOBAL_OSENTRIES_H

#include <stdbool.h>
#include <stdint.h>

typedef struct {
  uint32_t Magic;
  uint32_t Flags;
  uint32_t ImageSize;
  uint32_t Entries;
  uint32_t NumEntries;
  uint32_t CompressedSize;
  uint32_t DecompressHdr;
  uint32_t CompressOffset;
} OSHdr;

typedef struct {
  uint32_t WSSize;
  uint32_t Code;
} OSDecompHdr;

#define OSHdr_Magic_Value (0x6d49534f) /* 'OSIm' */

typedef struct {
  uint32_t AddrFlags;
#define OSIICOpDesc_Addr_Shift    (0)
#define OSIICOpDesc_Addr_Mask     (0xFF)
#define OSIICOpDesc_Reserved_Mask (0x1FFFFF00uL)
#define OSIICOpDesc_Flag_Retry    (1uL<<29)
#define OSIICOpDesc_Flag_SumOnly  (1uL<<30)
#define OSIICOpDesc_Flag_NoStart  (1uL<<31)
  union {
    void    *Data;
    uint32_t CheckSum;
  } d;
  uint32_t Length;
} OSIICOpDesc;

#endif
/* In the exported copy of this file, the Hdr2H translation of hdr.OSEntries will follow. */
