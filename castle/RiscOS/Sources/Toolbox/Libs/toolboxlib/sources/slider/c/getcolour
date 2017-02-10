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
/************************************************************************
 * © Acorn Computers Ltd, 1994.                                         *
 *                                                                      *
 * It may be freely used to create executable images for saleable       *
 * products but cannot be sold in source form or as an object library   *
 * without the prior written consent of Acorn Computers Ltd.            *
 *                                                                      *
 * If this file is re-distributed (even if modified) it should retain   *
 * this copyright notice.                                               *
 *                                                                      *
 ************************************************************************/


/*
 * Name        : getcolour.c
 * Purpose     : Veneer for method Slider_GetColour
 * Description : Gets the desktop colour that is used for the drabbable part of the slider
 */


#include "kernel.h"
#include "toolbox.h"
#include "gadgets.h"




/*
 * Name        : slider_get_colour
 * Description : Gets the desktop colour that is used for the drabbable part of the slider 
 * In          : unsigned int flags
 *               ObjectId window
 *               ComponentId slider
 * Out         : int *bar_colour
 *               int *back_colour
 * Returns     : pointer to error block
 */

extern _kernel_oserror *slider_get_colour ( unsigned int flags,
                                            ObjectId window,
                                            ComponentId slider,
                                            int *bar_colour,
                                            int *back_colour
                                          )
{
_kernel_swi_regs r;
_kernel_oserror *e;

  r.r[0] = flags;
  r.r[1] = (int) window;
  r.r[2] = Slider_GetColour;
  r.r[3] = (int) slider;
  if((e = _kernel_swi(Toolbox_ObjectMiscOp,&r,&r)) == NULL)
  {
    if(bar_colour != NULL) *bar_colour = (int) r.r[0];
    if(back_colour != NULL) *back_colour = (int) r.r[1];
  }

  return(e);
}

