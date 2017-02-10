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
/* Title:   stringset.h
 * Purpose: string set gadgets
 * Author:  
 * History: 22-Feb-94: IDJ: created
 *
 */

_kernel_oserror *string_set_add    (GadgetInternal *gadget, ObjectID window,
                                    int **icon_list, Gadget *gadget_template,
                                    int window_handle);

_kernel_oserror *string_set_remove   (GadgetInternal *gadget, ObjectID window,int recurse);

_kernel_oserror *string_set_set_fade (GadgetInternal *gadget,
                                         ObjectID window,
                                         int do_fade) ;

_kernel_oserror *string_set_move     (GadgetInternal *gadget,
                                         ObjectID window,
                                         int window_handle,
                                         wimp_Bbox *box) ;


_kernel_oserror *string_set_method    (GadgetInternal *gadget, 
                                        ObjectID window, 
                                        _kernel_swi_regs *r);

_kernel_oserror *string_set_toolbox_event   (GadgetInternal *gadget, 
                                                ToolboxEvent *event, 
                                                ComponentID gadget_id, ObjectID ob);      

_kernel_oserror *string_set_set_focus (GadgetInternal *gadget, int window_handle, int dir);

#define string_set_mouse_click     NULL
#define string_set_key_pressed     NULL
#define string_set_user_drag       NULL
#define string_set_user_message    NULL
#define string_set_redraw          NULL 
