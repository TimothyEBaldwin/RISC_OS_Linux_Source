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
/*56 instructions*/

#include <kernel.h>

#include "colourtrans.h"
#include "font.h"
#include "os.h"
#include "pdriver.h"

_kernel_oserror *x (int page, char *t)

{  bool more;
   os_box req;
   _kernel_oserror *oserror = NULL;
   _kernel_swi_regs swi_regs;
   
   swi_regs.r [0] = 1;
   swi_regs.r [1] = (int) &req;
   swi_regs.r [2] = page;
   swi_regs.r [3] = (int) NULL;

   if ((oserror = _kernel_swi (PDriver_DrawPage, &swi_regs, &swi_regs)) !=
         NULL)
      goto finish;

   while (more)
   {  swi_regs.r [0] = os_COLOUR_BLACK;
      swi_regs.r [3] = colourtrans_SET_FG_GCOL;
      swi_regs.r [4] = os_ACTION_OVERWRITE;

      if ((oserror = _kernel_swi (ColourTrans_SetGCOL, &swi_regs, &swi_regs))
            != NULL)
         goto finish;

      swi_regs.r [1] = (int) t;
      swi_regs.r [2] = NONE;
      swi_regs.r [3] = 0;
      swi_regs.r [4] = 0;

      if ((oserror = _kernel_swi (Font_Paint, &swi_regs, &swi_regs)) != NULL)
         goto finish;

      swi_regs.r [1] = (int) &req;

      if ((oserror = _kernel_swi (PDriver_GetRectangle, &swi_regs,
            &swi_regs)) != NULL)
         goto finish;

      more = swi_regs.r [0];
   }

finish:
  return oserror;
}
