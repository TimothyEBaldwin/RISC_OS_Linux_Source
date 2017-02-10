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

/* Title: c.visdelay
 *
 * Title: visdelay.c
 * Purpose: Visual indication of some delay
 * History: IDJ: 07-Feb-92: prepared for source release
 *
 */

#include "os.h"
#include "visdelay.h"

#define Hourglass_On         (0x406C0 + os_X)
#define Hourglass_Off        (0x406C1 + os_X)
#define Hourglass_Smash      (0x406C2 + os_X)
#define Hourglass_Start      (0x406C3 + os_X)
#define Hourglass_Percentage (0x406C4 + os_X)
#define Hourglass_LEDs       (0x406C5 + os_X)

#pragma -s1

void visdelay_begin(void)
{
   /* Indicate to the user that there will be a short, computation-intensive
      delay. The cursor changes to an hourglass. */

   os_swi0(Hourglass_On) ;
}



void visdelay_percent(int p)
{
   /* Indicate to the user that the delay is p/100 complete */
   os_swi1(Hourglass_Percentage,p) ;
}


void visdelay_end(void)
{
   /* End the delay indication. */

   os_swi0(Hourglass_Off) ;
}

void visdelay_init(void)
{
   /* do nothing */
}

#pragma -s0

/* end */
