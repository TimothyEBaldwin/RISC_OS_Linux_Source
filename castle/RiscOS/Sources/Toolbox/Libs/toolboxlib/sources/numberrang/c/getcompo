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
 * Name        : getcompo.c
 * Purpose     : Veneer for method NumberRange_GetComponents
 * Description : Gets the component id's for the components which make the number range
 */


#include "kernel.h"
#include "toolbox.h"
#include "gadgets.h"




/*
 * Name        : numberrange_get_components
 * Description : Gets the component id's for the components which make the number range 
 * In          : unsigned int flags
 *               ObjectId window
 *               ComponentId number_range
 * Out         : ComponentId *numeric_field
 *               ComponentId *left_adjuster
 *               ComponentId *right_adjuster
 *               ComponentId *slider
 * Returns     : pointer to error block
 */

extern _kernel_oserror *numberrange_get_components ( unsigned int flags,
                                                     ObjectId window,
                                                     ComponentId number_range,
                                                     ComponentId *numeric_field,
                                                     ComponentId *left_adjuster,
                                                     ComponentId *right_adjuster,
                                                     ComponentId *slider
                                                   )
{
_kernel_swi_regs r;
_kernel_oserror *e;

  r.r[0] = flags;
  r.r[1] = (int) window;
  r.r[2] = NumberRange_GetComponents;
  r.r[3] = (int) number_range;
  if((e = _kernel_swi(Toolbox_ObjectMiscOp,&r,&r)) == NULL)
  {
    if(numeric_field != NULL) *numeric_field = (ComponentId) r.r[0];
    if(left_adjuster != NULL) *left_adjuster = (ComponentId) r.r[1];
    if(right_adjuster != NULL) *right_adjuster = (ComponentId) r.r[2];
    if(slider != NULL) *slider = (ComponentId) r.r[3];
  }

  return(e);
}

