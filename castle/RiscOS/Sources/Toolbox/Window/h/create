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
/* Title:   create.h
 * Purpose: create a Generic Object
 * Author:  IDJ
 * History: 7-Oct-93: IDJ: created
 *
 */


#ifndef __create_h
#define __create_h

#include "kernel.h"

#ifndef __task_h
#include "task.h"
#endif

extern _kernel_oserror *create_object (_kernel_swi_regs *r, TaskDescriptor *t);
extern _kernel_oserror *create_extractgadget (_kernel_swi_regs *r);
extern void create_extras(Gadget *g, WindowInternal *w);

/* templates of earlier, but supported template formats */
typedef struct
{
        int               flags;
        char             *help_message;
        int               max_help;
        char             *pointer_shape;
        int               max_pointer_shape;
        int               pointer_x_hot;
        int               pointer_y_hot;
        char             *menu;
        int               num_keyboard_shortcuts;
        KeyBoardShortcut *keyboard_shortcuts;
        int               num_gadgets;
        Gadget           *gadgets;
        ComponentID       default_focus;
        wimp_Window       window;
        /* shortcuts and gadgets are here in memory */

} WindowTemplate101;

#endif

