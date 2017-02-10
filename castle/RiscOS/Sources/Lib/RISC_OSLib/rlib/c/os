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
/************************************************************************/
/* © Acorn Computers Ltd, 1992.                                         */
/*                                                                      */
/* This file forms part of an unsupported source release of RISC_OSLib. */
/*                                                                      */
/* It may be freely used to create executable images for saleable       */
/* products but cannot be sold in source form or as an object library   */
/* without the prior written consent of Acorn Computers Ltd.            */
/*                                                                      */
/* If this file is re-distributed (even if modified) it should retain   */
/* this copyright notice.                                               */
/*                                                                      */
/************************************************************************/

/*
 * Title  : c.os
 * Purpose: provides general access to low-level RISC OS routines
 * History: IDJ: 06-Feb-92: prepared for source release
 *
 */


#define BOOL int
#define TRUE 1
#define FALSE 0

#include "os.h"

#define OS_CLI  0x05
#define OS_Byte 0x06
#define OS_Word 0x07
#define OS_File 0x08
#define OS_Args 0x09
#define OS_GBPB 0x0C
#define OS_Find 0x0D

os_error * os_gbpb(os_gbpbstr *p)
{
  return os_swix(OS_GBPB, (os_regset *) p);
}

os_error * os_file(os_filestr *p)
{
  return os_swix(OS_File, (os_regset *) p);
}

os_error * os_args(os_regset *p)
{
  return os_swix(OS_Args, (os_regset *) p);
}

os_error * os_find(os_regset *p)
{
  return os_swix(OS_Find, (os_regset *) p);
}


os_error * os_cli(char * command)
{
  return os_swix1(OS_CLI, (int)command);
}

/* end of c.os */
