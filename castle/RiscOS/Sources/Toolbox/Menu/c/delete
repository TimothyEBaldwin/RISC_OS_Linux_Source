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
 * Purpose: delete a Menu Object
 * Author:  TGR
 * History: 3-Nov-93: TGR: created
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"
#include "string32.h"
#include "messages.h"
#include "objects/toolbox.h"
#include "objects/menu.h"
#include "debug.h"
#include "mem.h"

#include "auxiliary.h"
#include "object.h"
#include "task.h"
#include "hide.h"

#include "delete.h"


extern _kernel_oserror *delete_menu (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to delete an object
     * R0 = 1
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 =  flags
     *      R1 =  Object ID
     */

    /*
     * The Toolbox has already checked that this is not just a delete
     * call for a shared Object.
     * We delete Object from the list of Objects for this
     * task.
     * If recursive delete is requested then we also call Toolbox_Delete
     * for any Objects "attached" to this Object.
     */

   _kernel_swi_regs  *user_regs   = (_kernel_swi_regs *) r->r[4],
                      regs;
   _kernel_oserror   *l,*e           = NULL;
   MenuInternal      *menu_int   = (MenuInternal *) r->r[2];
   MenuInternalEntry *int_entry;
   int                i;


   DEBUG debug_output ("d","Menu: Entering delete with internal menu handle = 0x%x\n",(int) menu_int);
   if (menu_showing(menu_int)) {
      DEBUG debug_output ("d","Menu: hiding menus\n");
      regs.r[1] = -1;
      _kernel_swi (Wimp_CreateMenu, &regs, &regs);
      has_been_hidden ();
   }
   if (!(user_regs->r[0]&Toolbox_DeleteObject_DontRecurse)) { /* Recursive deletion */
      DEBUG debug_output ("d","Menu: recursive deletion, no. of entries = %d\n",menu_int->hdr.num_entries);
      for (i=0; i<menu_int->hdr.num_entries; i++) {
         int_entry = menu_internal_entry (menu_int, i);
         DEBUG debug_output ("d","Menu: entry %d's submenu = 0x%x\n",i,(int)int_entry->submenu_show);
         if (int_entry->submenu_show) {
            regs.r[0] = user_regs->r[0];
            regs.r[1] = (int) int_entry->submenu_show;
            if ((l = _kernel_swi (Toolbox_DeleteObject, &regs, &regs)) != NULL)
               /* If an error occurs in deletion, we get out of the loop ...*/
               e=l;
         }
         if (int_entry->click_show) {
            regs.r[0] = user_regs->r[0];
            regs.r[1] = (int) int_entry->click_show;
            if ((l = _kernel_swi (Toolbox_DeleteObject, &regs, &regs)) != NULL)
               /* If an error occurs in deletion, we get out of the loop ...*/
               e=l;
         }
      }
   }

   DEBUG debug_output ("d","Menu: immediately after recursive delete routine\n");
   if (menu_int->hdr.forward == menu_int) { /* Unlinking from the list is regarded as imperative */

      DEBUG debug_output ("d","Menu: about to register disinterest\n");
      regs.r[0] = 1; /* No longer interested in events */
      regs.r[1] = Menu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_ToolboxEvent;
      regs.r[4] = (int) toolbox_events_of_interest;

      _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);

      regs.r[0] = 1; /* No longer interested in events */
      regs.r[1] = Menu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_WimpEvent;
      regs.r[4] = (int) events_of_interest;

      _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);

      regs.r[0] = 1; /* No longer interested in events */
      regs.r[1] = Menu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_WimpMessage;
      regs.r[4] = (int) messages_of_interest;

      _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);

      regs.r[0] = 1;
      regs.r[1] = Menu_PreFilter;
      regs.r[2] = (int) t;

      _kernel_swi (Toolbox_RegisterPreFilter, &regs, &regs);

      t->object_list = NULL;
   } else {
      if (t->object_list == menu_int) {
         t->object_list = menu_int->hdr.forward;
      }
      menu_int->hdr.forward->hdr.backward = menu_int->hdr.backward;
      menu_int->hdr.backward->hdr.forward = menu_int->hdr.forward;
   }

   for (i=0; i<menu_int->hdr.num_entries; i++) {
      remove_menu_entry(wimp_menu_entry(menu_int->hdr.wimp_menu,i),menu_internal_entry(menu_int,i));
   }

   if (menu_int->hdr.wimp_menu->hdr.title.indirect_text.buffer)
      mem_freek (menu_int->hdr.wimp_menu->hdr.title.indirect_text.buffer);
   mem_freek (menu_int->hdr.wimp_menu);
   if (menu_int->hdr.entries) mem_freek (menu_int->hdr.entries);
   if (menu_int->hdr.help_message) mem_freek (menu_int->hdr.help_message);
   mem_freek (menu_int);

   return e;
}

