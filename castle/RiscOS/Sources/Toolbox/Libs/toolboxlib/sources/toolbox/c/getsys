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
 * Name        : getsys.c
 * Description : calls SWI Toolbox_GetSysInfo
 * Author      : James Bye
 * Date        : 18-May-1994
 *
 * Copyright Acorn Computers Ltd, 1994
 *
 * History     : 16-Nov-94  NK  Created this source file
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


/*******************************************************
 * External functions                                  *
 *******************************************************/

/*
 * calls the SWI Toolbox_GetSysInfo
 */

extern _kernel_oserror *toolbox_get_sys_info ( unsigned int reason_code,
                                               _kernel_swi_regs *regs
                                              )

{
_kernel_swi_regs r;
_kernel_oserror *e;

  r = *regs;
  r.r[0] = reason_code;

  if((e = _kernel_swi(Toolbox_GetSysInfo,&r,&r)) == NULL)
  {
     *regs = r;
  }
  
  return(e);
}


/*******************************************************
 * End                                                 *
 *******************************************************/


