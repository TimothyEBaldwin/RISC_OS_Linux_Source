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

#include <stdio.h>
#include <stdlib.h>
#include "kernel.h"
#include "swis.h"

#include "macros.h"
#include "twimp.h"
#include "objects/toolbox.h"
#include "objects/window.h"

#include "glib.h"

typedef struct _tasks {
  struct _tasks *next;
  int th;
  int refc;
  int SWI;
} TaskRec;

static TaskRec *all_tasks[8]=NULL;

static TaskRec *find_current_task(int *th,int type)
{
   TaskRec *list = all_tasks[type];
   WimpSysInfo inf;

   wimp_read_sys_info(5,&inf);
   if (th) *th = inf.r0;

   while (list) {
     if (list->th == inf.r0) return list;
     list=list->next;

   }
   return list;
}

static int FILTERS[] = {Toolbox_RegisterPostFilter_ToolboxEvent,
    	      Toolbox_RegisterPostFilter_WimpEvent,
    	      Toolbox_RegisterPostFilter_WimpMessage};

_kernel_oserror *add_task_interest(FilterTypes type, int *list, int SWI)
{
   int th;
   _kernel_swi_regs regs;
   _kernel_oserror *e;
   TaskRec *rec=find_current_task(&th,type);

   if (!rec) {
     rec = calloc(1,sizeof(TaskRec));
     if (!rec) return NULL;
     rec->th = th;
     rec->SWI = SWI;
     rec->next = all_tasks[type];
     all_tasks[type] = rec;
     regs.r[0] = 0;
     regs.r[1] = SWI;
     regs.r[2] = (int) rec;
     regs.r[3] = FILTERS[type];
     regs.r[4] = (int) list;
     e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);
     if (e) return e;
   }

   rec->refc++;
   return NULL;
}

_kernel_oserror *remove_task_interest(FilterTypes type,int *inter)
{
   _kernel_swi_regs regs;
   _kernel_oserror *e;
   TaskRec *list = all_tasks[type],*rec=find_current_task(0,type);

   if (rec) {
     rec->refc--;
     if (!rec->refc) {
       regs.r[0] = Toolbox_RegisterPostFilter_Remove;
       regs.r[1] = rec->SWI;
       regs.r[2] = (int) rec;
       regs.r[3] = FILTERS[type];
       regs.r[4] = (int) inter;
       e = _kernel_swi (Toolbox_RegisterPostFilter, &regs, &regs);
       /* remove from list and free up */

       if (list == rec) all_tasks[type] = rec->next;
       else {
          while(list) {
             if (list->next == rec) {
                list->next = rec->next;
                break;
             }
             list = list->next;
          }
       }
       free(rec);
       return e;
     }

   }
   return NULL;
}

