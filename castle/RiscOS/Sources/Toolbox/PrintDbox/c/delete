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
/* Title:   delete.c
 * Purpose: delete a PrintDbox Object
 * Author:  TGR
 * History: 2-Jun-94: TGR: created
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/printdbox.h"

#include "auxiliary.h"
#include "object.h"
#include "task.h"

#include "delete.h"


extern _kernel_oserror *delete_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to delete an object
     * R0 = 1
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 = flags
     *           bit 0 set => do not recursively delete the object
     *      R1 = Object ID
     */

    /*
     * The Toolbox has already checked that this is not just a delete
     * call for a shared Object.
     * We delete Object from the list of Objects for this
     * task.
     * If recursive delete is requested then we also call Toolbox_Delete
     * for any Objects "attached" to this Object.
     */

   _kernel_oserror       *e;
   _kernel_swi_regs       regs,
                         *user_regs       = (_kernel_swi_regs *) r->r[4];
   PrintDboxInternal     *internal   = (PrintDboxInternal *) r->r[2];

   /* Firstly delete dependant objects (if any) */

   if (internal->further_options && (user_regs->r[0] & 1)) {
      regs.r[0] = 0;
      regs.r[1] = internal->further_options;

      if ((e = _kernel_swi (Toolbox_DeleteObject, &regs, &regs)) != NULL)
         return e;
   }
   if (internal->flags & PrintDboxInternal_IsShowing) {

      regs.r[0] = 0;
      regs.r[1] = (int) internal->sub_object_id;

      if ((e = _kernel_swi (Toolbox_HideObject, &regs, &regs)) != NULL)
         return e;
   }
   regs.r[0] = 0;
   regs.r[1] = (int) internal->sub_object_id;

   e = _kernel_swi (Toolbox_DeleteObject, &regs, &regs);

   if (internal->forward == internal) { /* Unlinking from the list is regarded as imperative */

      regs.r[0] = 1; /* No longer interested in events */
      regs.r[1] = PrintDbox_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_WimpEvent;
      regs.r[4] = (int) events_of_interest;

      if ((e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs)) != NULL)
         return e;      /* register interest in pre-filter */

      regs.r[0] = 1; /* No longer interested in events */
      regs.r[1] = PrintDbox_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_ToolboxEvent;
      regs.r[4] = (int) toolbox_events_of_interest;

      _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);

      regs.r[0] = 1;
      regs.r[1] = PrintDbox_PreFilter;
      regs.r[2] = (int) t;

      _kernel_swi (Toolbox_RegisterPreFilter, &regs, &regs);

      t->object_list = NULL;
   } else {
      if (t->object_list == internal) {
         t->object_list = internal->forward;
      }
      internal->forward->backward = internal->backward;
      internal->backward->forward = internal->forward;
   }

   mem_freek (internal);

   return e;
}

