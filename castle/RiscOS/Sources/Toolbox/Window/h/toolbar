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
/* Title:   toolbar.c
 * Purpose: handles toolbars for a Window Object
 * Author:  NK
 * History: 13-Sep-94: NK: created
 *
 */

#ifndef __toolbar_h
#define __toolbar_h

#include "kernel.h"

int open_panes (WindowInternal *w, wimp_NestedOpenWindow *open, unsigned int magic, unsigned int parent_window_handle, unsigned int alignment_flags);
void close_panes(WindowInternal *w);
void remove_pane(WindowInternal *window,_kernel_swi_regs *user_regs);
void set_pane(WindowInternal *window,_kernel_swi_regs *user_regs);

PaneInternal *get_frontmost_pane(WindowInternal *w);
#define get_frontmost_pane(w) ((w)->panes)
PaneInternal *get_rearmost_pane(WindowInternal *w);

#endif
