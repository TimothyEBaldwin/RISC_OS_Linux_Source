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
/* Title:   auxiliary.h
 * Purpose: support functions for the Scale object class
 * Author:  TGR
 * History: 15-Feb-94: TGR: created
 *
 *
 */

#ifndef __auxiliary_h
#define __auxiliary_h

#include "kernel.h"

#ifndef __toolbox_h
#include "objects.toolbox.h"
#endif

#ifndef __scale_h
#include "objects.scale.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

#ifndef __mem_h
#include "mem.h"
#endif

#include "object.h"
#include "task.h"

#define mem_freek(A) mem_free(A,"Scale")
#define mem_alloc(A) mem_allocate(A,"Scale")

/*
extern ObjectID          global_menu;
*/
extern ScaleInternal    *global_next;

/*
extern EventInterest   messages_of_interest[];
*/

extern EventInterest   events_of_interest[];

extern EventInterest   toolbox_events_of_interest[];

/*
extern _kernel_oserror *dialogue_completed (ObjectID object_id);
*/
_kernel_oserror *apply_factor (ScaleInternal *internal, int factor);
extern ScaleInternal *find_internal (TaskDescriptor *t, ObjectID sub_object_id);
extern _kernel_oserror *show_actual (void);

#endif
