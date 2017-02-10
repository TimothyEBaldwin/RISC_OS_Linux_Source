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
 * Name        : setevent.c
 * Purpose     : Veneer for method ActionButton_SetEvent
 * Description : Sets the toolbox event that will be raised when the button is clicked
 */


#include "kernel.h"
#include "toolbox.h"
#include "gadgets.h"




/*
 * Name        : actionbutton_set_event
 * Description : Sets the toolbox event that will be raised when the button is clicked 
 * In          : unsigned int flags
 *               ObjectId window
 *               ComponentId action_button
 *               int event
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *actionbutton_set_event ( unsigned int flags,
                                                 ObjectId window,
                                                 ComponentId action_button,
                                                 int event
                                               )
{
_kernel_swi_regs r;

  r.r[0] = flags;
  r.r[1] = (int) window;
  r.r[2] = ActionButton_SetEvent;
  r.r[3] = (int) action_button;
  r.r[4] = (int) event;
  return(_kernel_swi(Toolbox_ObjectMiscOp,&r,&r));
}

