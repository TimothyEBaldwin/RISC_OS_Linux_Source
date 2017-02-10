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
/* > nvram.h */

/* NV-RAM module header file. */

#ifndef __nvram_h
#define __nvram_h

/* NVRAM SWI numbers. */
#ifndef NVRAMSWI_Base
  #define NVRAMSWI_Base           (0x4ee00)
#endif /* NVRAMSWI_Base */
#define NVRAM_Read              (NVRAMSWI_Base+0)
#define NVRAM_Write             (NVRAMSWI_Base+1)
#define NVRAM_Lookup            (NVRAMSWI_Base+2)
#define NVRAM_Get               (NVRAMSWI_Base+3)
#define NVRAM_Set               (NVRAMSWI_Base+4)
#define NVRAM_GetBytes          (NVRAMSWI_Base+5)
#define NVRAM_SetBytes          (NVRAMSWI_Base+6)

/* NVRAM_Read errors. */
#define NVRAM_READ_TAGERR       (-1)
#define NVRAM_READ_BUFERR       (-4)

/* NVRAM_Write errors. */
#define NVRAM_WRITE_TAGERR      (-1)
#define NVRAM_WRITE_LOCKERR     (-2)


/* Our errors. */
#define NVRAM_ERROR_BASE              0x00819200
#define NVRAM_ERROR_NOMEM             (NVRAM_ERROR_BASE+0)
#define NVRAM_ERROR_NOTAG             (NVRAM_ERROR_BASE+1)
#define NVRAM_ERROR_LOCKED            (NVRAM_ERROR_BASE+2)
#define NVRAM_ERROR_READBUF           (NVRAM_ERROR_BASE+4)
#define NVRAM_ERROR_NOTBYTE           (NVRAM_ERROR_BASE+5)
#define NVRAM_ERROR_NEEDBUF           (NVRAM_ERROR_BASE+6)

#endif
