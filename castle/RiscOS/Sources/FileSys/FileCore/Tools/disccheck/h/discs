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
/* -> h.discs
 *
 * Disc related swis etc.
 */

#ifndef _discs_h
#define _discs_h

#define ADFS_Describe_Disc 0x40245
#define ADFS_Disc_Op       0x40240

#define Verify       0
#define Read_Sectors 1
#define directory_bit 8

extern int read_disc_shape(int32 disc_number, char *result);

extern int read_sectors(int32 disc_address,
  void *ram_address,
  int32 number,
  unsigned int32 drive,
  char *disc_shape);

#endif

/* End discs.h */
