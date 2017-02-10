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
/* -> c.discs
 *
 * Disc related swis etc.
 */

#include <stdio.h>
#include <string.h>
#include "types.h"
#include "discs.h"
#include "kernel.h"

int read_disc_shape(int32 disc_number, char *result)
{
  char disc[20];
  _kernel_swi_regs r;
  _kernel_oserror *err;
  sprintf(disc, ":%d", disc_number);
  r.r[0] = (int)disc;
  r.r[1] = (int)result;
  err = _kernel_swi(ADFS_Describe_Disc, &r, &r);
  if (err) {
    printf("Error 0x%x (%s) in ADFS_Describe_Disc\n", err->errnum,
      err->errmess);
  };
  return (err == NULL);
}

int read_sectors(int32 disc_address,
  void *ram_address,
  int32 number,
  unsigned int32 drive,
  char *disc_shape)
{
  _kernel_swi_regs r;
  _kernel_oserror *err;
  unsigned int32 temp1 = Read_Sectors,
                 temp2 = disc_address | (drive << 29),
                 temp3 = (unsigned int32)disc_shape;
  r.r[3] = (int)ram_address;
  r.r[4] = number;
  temp1 |= temp3 << 6;
  memcpy(&(r.r[1]), &temp1, 4);
  memcpy(&(r.r[2]), &temp2, 4);
  err = _kernel_swi(ADFS_Disc_Op, &r, &r);
  if (err)  {
    printf("Error 0x%x (%s) in ADFS_Disc_Op\n", err->errnum,
      err->errmess);
  };
  return (err == NULL);
}

/* End discs.c */
