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
/* Title:   slider.h
 * Purpose: slider gadgets
 * Author:
 * History: 05-Apr-94: NK : created
 *
 */

_kernel_oserror *slider_add      (GadgetInternal *gadget,
                                         ObjectID window,
                                         int **icon_list,
                                         Gadget *gadget_template,
                                         int window_handle) ;

#define slider_remove   simple_remove

_kernel_oserror *slider_move     (GadgetInternal *gadget,
                                         ObjectID window,
                                         int window_handle,
                                         wimp_Bbox *box) ;

#define slider_set_fade simple_set_fade2

_kernel_oserror     *slider_method     (GadgetInternal *gadget, 
                                        ObjectID window, 
                                        _kernel_swi_regs *r);

#define slider_toolbox_event   NULL

_kernel_oserror *slider_mouse_click (GadgetInternal *gadget,
                                            ObjectID window,
                                            wimp_PollBlock *poll_block,
                                            int *claimed) ;

#define slider_key_pressed     NULL
                                            
#define slider_user_drag       NULL
#define slider_user_message    NULL
#define slider_redraw          NULL
#define slider_set_focus       NULL
