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
/*
 * Name        : wtotbox
 * Description : SWI veneer for Window_WimpToToolbox
 * Author      : James Bye
 * Date        : 17-Aug-1994
 *
 * Copyright Acorn Computers Ltd, 1994
 *
 * History     : 17-Aug-94  JAB  Created this source file
 *
 *
 */
 
 
/*-- from CLib --*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"


/*-- from ToolBoxLib --*/

#include "toolbox.h"
#include "window.h"


/*******************************************************
 * External functions                                  *
 *******************************************************/

/*
 * Name        : window_wimp_to_toolbox
 * Description : Gets the object handle and component id that contains the
 *               specified icon
 * Parameters  : unsigned int flags
 *               int window_handle
 *               int icon_handle
 *               ObjectId *object
 *               ComponentId *component
 * Returns     : pointer to error block
 */
 
extern _kernel_oserror *window_wimp_to_toolbox ( unsigned int flags,
                                                 int window_handle,
                                                 int icon_handle,
                                                 ObjectId *object,
                                                 ComponentId *component
                                               )
{
_kernel_swi_regs r;
_kernel_oserror *e;

  r.r[0] = flags;
  r.r[1] = window_handle;
  r.r[2] = icon_handle;
  
  if((e = _kernel_swi(Window_WimpToToolbox,&r,&r)) == NULL)
  {
    if(object != NULL) *object = (ObjectId) r.r[0];
    if(component != NULL) *component = (ComponentId) r.r[1];
  }
  
  return(e);
}
 
/*-- end --*/

