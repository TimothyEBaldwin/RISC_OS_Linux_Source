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
/* Title:   auxiliary.c
 * Purpose: support functions for the ProgInfo object class
 * Author:  TGR
 * History: 14-Feb-94: TGR: created
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"

#include "debug.h"
#include "mem.h"
#include "string32.h"
#include "messages.h"
#include "twimp.h"
#include "style.h"
#include "objects/toolbox.h"
#include "objects/proginfo.h"

#include "auxiliary.h"
#include "object.h"
#include "task.h"

ProgInfoInternal  *global_next;

EventInterest   events_of_interest[] = {
                 {wimp_ETOOLBOX_EVENT ,  0},
                 {-1                  , -1}
                };

EventInterest   toolbox_events_of_interest[] = {
                 {ProgInfo_AboutToBeShown, ProgInfo_ObjectClass},
                 {Window_HasBeenHidden   , Window_ObjectClass  },
                 {ActionButton_Selected  , Window_ObjectClass  },
                 {-1                     ,                   -1}
                };

extern ProgInfoInternal *find_internal (TaskDescriptor *t, ObjectID sub_object_id) {

   ProgInfoInternal *i = t->object_list,
                    *j;

   DEBUG debug_output ("a","ProgInfo: find internal, searching for sub_object_id = 0x%x\n",sub_object_id);

   if (!i) return NULL;

   do {
      j = i->forward;
      DEBUG debug_output ("a","ProgInfo: internal = 0x%x, sub_object_id = 0x%x\n",i,i->sub_object_id);
      if (i->sub_object_id == sub_object_id) return i;
   } while ((i=j) != t->object_list);

   return NULL;
}

/*
_kernel_oserror *find_underlying_window (IDBlock *id_block, ObjectID *sub_object_id) {

   _kernel_oserror    *e;
   _kernel_swi_regs    regs;

   regs.r[0] = 0;
   regs.r[1] = (int) id_block->self_id;

   if ((e = _kernel_swi (Toolbox_GetInternalHandle, &regs, &regs)) != NULL)
      return e;

   *sub_object_id = ((ProgInfoInternal *) regs.r[0])->sub_object_id;

   return NULL;
}
*/

_kernel_oserror *show_actual (void) {

   _kernel_oserror    *e;
   _kernel_swi_regs    regs;
   void               *show_info;
   int                 show_type;

   DEBUG debug_output ("e","ProgInfo: attempting to actually show the dbox\n");

   regs.r[0] = 0;
   regs.r[1] = global_next->sub_object_id;

   if ((e = _kernel_swi (Toolbox_GetParent, &regs, &regs)) != NULL) {
      return e;
   }
   show_info = global_next->show_info;
   show_type = global_next->show_type;

   regs.r[4] =       regs.r[0]; /* parent id */
   regs.r[5] =       regs.r[1]; /* parent component */
   regs.r[0] =        (global_next->flags & ProgInfoInternal_MenuSemantics)    ? 1 :
                     ((global_next->flags & ProgInfoInternal_SubMenuSemantics) ? 2 : 0);
   regs.r[1] = (int) global_next->sub_object_id;
   regs.r[2] =       show_type;
   regs.r[3] = (int) show_info;

   DEBUG {
      debug_output ("a","ProgInfo: showing, semantics %d",show_type);
      if (show_type == 2) {
         debug_output ("a"," at (%d,%d)\n",*((int *) show_info), *((int *) show_info + 1));
      } else {
         debug_output ("a","\n");
      }
   }
   global_next->flags         |= ProgInfoInternal_IsShowing;

   if ((e = _kernel_swi (Toolbox_ShowObject, &regs, &regs)) != NULL)
      return e;

   if (show_info) {
      mem_freek (show_info);
      global_next->show_info = NULL;
   }
   global_next                 = NULL;

   return NULL;
}

