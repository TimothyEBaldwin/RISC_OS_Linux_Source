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
/* ScrollbarP.h
 */

#ifndef __SCROLLBARP_H
#define __SCROLLBARP_H

typedef struct {
    ObjectID		object_id;
    ComponentID		component_id;
    int			parent_window;	// 8 bytes
    wimp_Bbox		box;		// 12 bytes
    int			scrollbar_window;
    int			event;
    int			state;
    int			type;
    int                 faded; // PJG (17/6/99) Added to record the faded state
    unsigned int	icon;
    unsigned int	min;
    unsigned int	max;
    unsigned int	value;
    unsigned int	visible;
    unsigned int	line_inc;
    unsigned int	page_inc;
} PrivateScrollbar;

int             scrollbar_active(void);
_kernel_oserror *scrollbar_die(void);
_kernel_oserror *_scrollbar_redraw(const PrivateScrollbar *sdata);

_kernel_oserror *scrollbar_add(Scrollbar *, int wimpw, ObjectID obj_id,
				int **icons, int **data);
_kernel_oserror *scrollbar_method(PrivateScrollbar *handle, _kernel_swi_regs *regs);
_kernel_oserror *scrollbar_remove(PrivateScrollbar *handle);
_kernel_oserror *scrollbar_fade(PrivateScrollbar *handle, int fade);

_kernel_oserror *scrollbar_plot(Scrollbar *);

_kernel_oserror *scrollbar_filter(_kernel_swi_regs *regs);

_kernel_oserror *scrollbar_move(PrivateScrollbar *sdata, wimp_Bbox *box);

#endif
