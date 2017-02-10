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
/* Title:   task.h
 * Purpose: task handling for the Generic module
 * Author:  IDJ
 * History: 7-Oct-93: IDJ: created
 *
 */


#ifndef __task_h
#define __task_h

#ifndef __object_h
#include "object.h"
#endif

typedef struct task_descriptor
{
        struct task_descriptor *next;
        int                     task_handle;
        Object                 *object_list;
} TaskDescriptor;


extern TaskDescriptor *task_find (int task_handle);
extern void task_remove (int task_handle);
extern void task_add (int task_handle);
extern int task_any_active(void);
void task_remove_filters(TaskDescriptor *t);

#endif
