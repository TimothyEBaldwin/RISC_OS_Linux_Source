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
/* Title:   miscop.c
 * Purpose: miscellanaous operations on a Scale Object
 * Author:  TGR
 * History: 15-Feb-94: TGR: created
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
#include "objects/window.h"
#include "objects/scale.h"

#include "object.h"
#include "task.h"

#include "miscop.h"
#define MAX_MISCOP_METHODS 7

extern _kernel_oserror *miscop_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * do a "miscellaneous (ie object-specific) operation on an object
     * R0 = 6
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 =  flags
     *      R1 =  Object ID
     *      R2 =  method code
     *      R3-R9 method-specific data
     */

    /*
     * This is the routine which deals with all object-specific operations.
     *
     *
     */

   _kernel_oserror      *e;
   _kernel_swi_regs      regs,
                        *user_regs        = (_kernel_swi_regs *) r->r[4];
   ScaleInternal        *internal         = (ScaleInternal *) r->r[2];
   int                   method    = user_regs->r[2];

   DEBUG debug_output ("y","Scale: miscop method = 0x%x\n",method);

   if (method < 0 || method >= MAX_MISCOP_METHODS) {
      return make_error_hex(Scale_NoSuchMiscOpMethod,1,method);
   }
   if (method == Scale_GetWindowID) {
      user_regs->r[0] = (int) internal->sub_object_id;
      return NULL;
   }
   regs.r[0] = 0;
   regs.r[1] = (int) internal->sub_object_id;
   switch (method) {
      case Scale_SetValue:
         regs.r[2] = NumberRange_SetValue;
         regs.r[3] = Scale_NumberRange_Scale;
         regs.r[4] = user_regs->r[3];
         break;
      case Scale_GetValue:
         regs.r[2] = NumberRange_GetValue;
         regs.r[3] = Scale_NumberRange_Scale;

         if ((e = _kernel_swi (Toolbox_ObjectMiscOp, &regs, &regs)) != NULL)
            return e;

         user_regs->r[0] = regs.r[0];
      case Scale_SetBounds:
         regs.r[0] = user_regs->r[0] & 0x7;
         regs.r[2] = NumberRange_SetBounds;
         regs.r[3] = Scale_NumberRange_Scale;
         regs.r[4] = user_regs->r[3];
         regs.r[5] = user_regs->r[4];
         regs.r[6] = user_regs->r[5];
         break;
      case Scale_GetBounds:
      {
         int                   r0;

         r0 = user_regs->r[0];

         regs.r[0] = r0;
         regs.r[2] = NumberRange_GetBounds;
         regs.r[3] = Scale_NumberRange_Scale;

         if ((e = _kernel_swi (Toolbox_ObjectMiscOp, &regs, &regs)) != NULL)
            return e;

         if (r0 & 1) user_regs->r[0] = regs.r[0];
         if (r0 & 2) user_regs->r[1] = regs.r[1];
         if (r0 & 4) user_regs->r[2] = regs.r[2];
         return NULL;
      }
      case Scale_SetTitle:
         regs.r[2] = Window_SetTitle;
         regs.r[3] = user_regs->r[3];
         break;
      case Scale_GetTitle:
         regs.r[2] = Window_GetTitle;
         regs.r[3] = user_regs->r[3];
         regs.r[4] = user_regs->r[4];

         if ((e = _kernel_swi (Toolbox_ObjectMiscOp, &regs, &regs)) != NULL)
            return e;

         user_regs->r[3] = regs.r[3];
         user_regs->r[4] = regs.r[4];
         return NULL;
   }
   IGNORE(t);
   return _kernel_swi (Toolbox_ObjectMiscOp, &regs, &regs);
}
