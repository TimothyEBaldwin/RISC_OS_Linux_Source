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
 * Name        : init.c
 * Description : calls SWI Toolbox_Initialise
 * Author      : James Bye
 * Date        : 18-May-1994
 *
 * Copyright Acorn Computers Ltd, 1994
 *
 * History     : 18-May-94  JAB  Created this source file
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
 * calls the SWI Toolbox_Initialise
 */

extern _kernel_oserror *toolbox_initialise ( unsigned int flags,
                                             int wimp_version,
                                             int *wimp_messages,
                                             int *toolbox_events,
                                             char *directory,
                                             MessagesFD *mfd,
                                             IdBlock *idb,
                                             int *current_wimp_version,
                                             int *task,
                                             void **sprite_area
                                           )
{
_kernel_swi_regs r;
_kernel_oserror *e;

  r.r[0] = flags;
  r.r[1] = wimp_version;
  r.r[2] = (int) wimp_messages;
  r.r[3] = (int) toolbox_events;
  r.r[4] = (int) directory;
  r.r[5] = (int) mfd;
  r.r[6] = (int) idb;
  
  if((e = _kernel_swi(Toolbox_Initialise,&r,&r)) == NULL)
  {
    if(current_wimp_version != NULL) *current_wimp_version = r.r[0];
    if(task != NULL) *task = r.r[1];
    if(sprite_area != NULL) *sprite_area = (void *) r.r[2];
  }
  
  return(e);
}

/*******************************************************
 * End                                                 *
 *******************************************************/


