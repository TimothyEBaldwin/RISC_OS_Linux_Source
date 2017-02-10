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
/* Title:   create.c
 * Purpose: create a ColourMenu Object
 * Author:  TGR
 * History: 13-Jan-94: TGR: created
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
#include "objects/toolbox.h"
#include "objects/colourmenu.h"

#include "object.h"
#include "auxiliary.h"
#include "task.h"

#include "create.h"


extern _kernel_oserror *create_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to create an object
     * R0 = 0
     * R1 = Object ID
     * R2 = 0  (will be internal handle for other SWIs
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 = flags
     *           bit 0 set => create from memory
     *      R1 -> description block
     */

    /*
     * The Toolbox has already checked that this is not just a create
     * call for a shared Object which already exists.
     * We create a new Object, and add it to the list of Objects for this
     * task.
     * We need to remember the ObjectID passed to us by the Toolbox, so
     * that we can identify this Object if we are given an ID from the
     * client's "id block".
     * Note that if any template names are held in the Object, then we
     * create an Object from that template, and store its ID.
     * Note also that the Toolbox has changed the client's R1 to point
     * at an in-core template, if it wasn't already!
     */
   _kernel_swi_regs             *user_regs,
                                 regs;
    ColourMenuTemplate          *menu_temp;
    ObjectTemplateHeader        *obj_temp_hdr;
    ColourMenuInternal          *menu_int;
    ObjectID                     object_id;
    _kernel_oserror             *e;

   user_regs    = (_kernel_swi_regs *) r->r[4];
   obj_temp_hdr = (ObjectTemplateHeader *)user_regs->r[1];
   menu_temp    = (ColourMenuTemplate *) obj_temp_hdr->body;
   object_id    = (ObjectID) r->r[1];

   DEBUG debug_output ("f","ColourMenu: entering create\n");

   if ((menu_int=mem_alloc(sizeof(ColourMenuInternal))) == NULL) {
      return make_error(ColourMenu_AllocFailed,0);
   }

   DEBUG debug_output ("f","ColourMenu: creating object, 0x%x, @0x%x\n",object_id,menu_int);

   menu_int->object_id = object_id;
   menu_int->flags
    = ((menu_temp->flags & ColourMenu_GenerateShowEvent) ? ColourMenuInternal_GenerateShowEvent : 0)
    | ((menu_temp->flags & ColourMenu_GenerateHideEvent) ? ColourMenuInternal_GenerateHideEvent : 0)
    | ((menu_temp->flags & ColourMenu_NoneEntry)     ? ColourMenuInternal_NoneEntry         : 0);

   if (!menu_temp->title || !menu_temp->max_title) {
      menu_int->title = NULL;
   } else if ((menu_int->title = mem_alloc (menu_temp->max_title)) == NULL) {
      e = make_error(ColourMenu_AllocFailed,0);
      goto clearup1;
   } else if (!string_copy_chk (menu_int->title, menu_temp->title, menu_temp->max_title)) {
      e = make_error (ColourMenu_ShortBuffer,0);
      goto clearup2;
   }
   menu_int->colour    = menu_temp->colour;
   menu_int->title_len = menu_temp->max_title;

  if (t->object_list) { /* If there are already menus attached to the task ... */

      menu_int->forward                        = t->object_list;
      menu_int->backward                       = t->object_list->backward;
      t->object_list->backward->forward        = menu_int;
      t->object_list->backward                 = menu_int;

   } else {              /* ... if not ... */

      /* register interest in toolbox events */

      regs.r[0] = 0;
      regs.r[1] = ColourMenu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_ToolboxEvent;
      regs.r[4] = (int) toolbox_events_of_interest;

      if ((e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs)) != NULL) {
         goto clearup2;
      }
      /* register interest in wimp events */

      regs.r[0] = 0;
      regs.r[1] = ColourMenu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_WimpEvent;
      regs.r[4] = (int) events_of_interest;

      if ((e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs)) != NULL) {
         goto clearup2;
      }

      /* register interest in wimp messages */

      regs.r[0] = 0;
      regs.r[1] = ColourMenu_PostFilter;
      regs.r[2] = (int) t;
      regs.r[3] = Toolbox_RegisterPostFilter_WimpMessage;
      regs.r[4] = (int) messages_of_interest;

      if ((e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs)) != NULL) {
          DEBUG debug_output ("f","ColourMenu: handling error from final post-filter register\n");
       goto clearup2;
      }

      /* register interest in pre-filter */

      regs.r[0] = 0;
      regs.r[1] = ColourMenu_PreFilter;
      regs.r[2] = (int) t;

      if ((e = _kernel_swi (Toolbox_RegisterPreFilter, &regs, &regs)) != NULL) {
         DEBUG debug_output ("f","ColourMenu: handling error from registering pre-filter\n");
         goto clearup2;
      }

      DEBUG debug_output ("f","ColourMenu: object_list should be set here\n");

      t->object_list     = menu_int;
      menu_int->forward  = menu_int;
      menu_int->backward = menu_int;
   }

   user_regs->r[0] = r->r[1];

   r->r[0] = (int) menu_int;

   return NULL;

   clearup2:
      mem_freek (menu_int->title);
   clearup1:
      mem_freek (menu_int);
      return e;
}
