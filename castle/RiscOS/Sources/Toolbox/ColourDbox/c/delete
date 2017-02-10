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
 * Purpose: delete a ColourDbox Object
 * Author:  TGR
 * History: 8-Mar-94: TGR: created
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
#include "objects/colourdbox.h"

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

   _kernel_oserror          *e = NULL;
   ColourDboxInternal       *internal   = (ColourDboxInternal *) r->r[2];
   ObjectID                  object_id  = (ObjectID) r->r[1];

   if (internal->flags & ColourDboxInternal_IsShowing) {
      close_dialogue (internal, t);
/*
      internal->flags &= ~ColourDboxInternal_IsShowing;

      if (internal->flags & ColourDboxInternal_GenerateHideEvent)
         if ((e = dialogue_completed (object_id)) != NULL)
            return e;

      regs.r[0] = 0;
      regs.r[1] = (int) internal->dialogue_handle;

      DEBUG debug_output ("d","ColourDbox: about to close ColourPicker\n");

      e = _kernel_swi (ColourPicker_CloseDialogue, &regs, &regs);

      DEBUG debug_output ("d","ColourDbox: ColourPicker should now have closed, error may follow\n");
      if (!(--t->window_count))
         e = deregister_task(t);
*/
   }
   if (object_id == global_menu) global_menu = 0;
   if (internal->forward == internal) { /* Unlinking from the list is regarded as imperative */

      t->object_list = NULL;
      e = deregister_task (t);
   } else {
      if (t->object_list == internal) {
         t->object_list = internal->forward;
      }
      internal->forward->backward = internal->backward;
      internal->backward->forward = internal->forward;
   }
   if (internal->title) mem_freek (internal->title);
   if (internal->colour_block_extd) mem_freek (internal->colour_block_extd);
   if (internal->colour_model_block) mem_freek (internal->colour_model_block);
   mem_freek (internal);

   return e;
}

