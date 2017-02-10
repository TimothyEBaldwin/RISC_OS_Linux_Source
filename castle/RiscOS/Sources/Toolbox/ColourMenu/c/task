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
/* Title:   task.c
 * Purpose: task handling for the ColourMenu module
 * Author:  TGR
 * History: 18-Jan-94: TGR: created from IDJ template
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
#include "string32.h"
#include "messages.h"
#include "objects/toolbox.h"
#include "objects/colourmenu.h"

#include "object.h"
#include "auxiliary.h"
#include "task.h"

/*
 * This module has a linked list of client tasks.
 * task_add gets called when a Service_ToolboxTaskBorn
 * service call goes round.
 * The task is removed when the Service_WimpCloseDown is
 * received.
 * Each task keeps an Object list
 */


static TaskDescriptor *task__list = NULL;


extern BOOL task_any_active(void)
{
    return task__list != NULL;
}

extern TaskDescriptor *task_find (int task_handle)
{

   /*
    * Function to return a TaskDescriptor corresponding to
    * a task with a given Wimp handle
    */

   TaskDescriptor *t;

   t = task__list;

   while (t != NULL)
   {
      if (t->task_handle == task_handle)
         break;

      t = t->next;
   }

   return t;
}


extern void task_remove (int task_handle)
{
   /*
    * Function to remove a task descriptor from the list, given its
    * Wimp task handle.  Memory is freed, and we also delete any objects
    * owned by the exiting task.
    */

   TaskDescriptor *t = task__list;
   TaskDescriptor *prev_t = NULL, *next = NULL;
   ColourMenuInternal *i,*j;

/*
   if (t == global_menu.t) {
      if (global_menu.wimp_menu) {
         mem_freek (global_menu.wimp_menu);
         global_menu.wimp_menu = NULL;
      }
   }
*/
   while (t != NULL)
   {
     next = t->next;

     if (t->task_handle == task_handle)
     {
       /*
        * remove this task's object's list
        */

        if (t->object_list != NULL) {

           i = t->object_list;
           do {
              j = i->forward;

              if (i == global_menu.current) {
                 global_menu.current = NULL;
                 global_menu.flags = 0;
              }

              if (i->title) mem_freek (i->title);
              mem_freek (i);
           } while ((i=j) != t->object_list);
         }
       /*
        * remove the task descriptor itself
        */

         if (t == task__list)
            task__list = next;
         else
            prev_t->next = next;

         mem_free (t, "freeing task descriptor (colourmenu)");

         break;
      }
      prev_t = t;
      t = next;
   }

   if (task__list == NULL)
      if (global_menu.wimp_menu) {
         mem_freek (global_menu.wimp_menu);
         global_menu.wimp_menu = NULL;
      }
}


extern void task_add (int task_handle)
{
   /*
    * Function to add a task descriptor to the list of active
    * Toolbox tasks.
    */

   /*
    * extra safety check, we make sure that the task is not already there!
    */

   TaskDescriptor *new_t;

   if (task_find (task_handle) != NULL)
      return;


   /*
    * add task to list
    */

   if ((new_t = mem_allocate (sizeof(TaskDescriptor), "task descriptor(colourmenu)")) == NULL)
   {
      raise_toolbox_error(ColourMenu_AllocFailed,0,-1,0);
      return;
   }

   new_t->task_handle = task_handle;
   new_t->next = task__list;
   task__list = new_t;
}

