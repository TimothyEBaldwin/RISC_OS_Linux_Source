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
/* ScrollLisP.h
 */

#ifndef __SCROLLLISTP_H
#define __SCROLLLISTP_H

#include "modmem.h"

#define FLAGS_SPRITE_AREA	(1u<<0)
#define FLAGS_SPRITE_NAME	(1u<<1)
#define FLAGS_HALF_SIZE		(1u<<2)
#define FLAGS_SELECTED		(1u<<31)

struct _entries
{
    char		*text;
    const int		*sprite_area;
    char		*sprite_name;
    unsigned int	flags;
};

typedef struct {
    ObjectID		parent_id;
    ObjectID		object_id;
    ComponentID		component_id;
    int			parent_window;		// 12 bytes
    wimp_Bbox		box;
    int			event;
    int			state;
    unsigned int	icon;
    struct _entries	*entries;
    unsigned int	no_entries;
    unsigned int	foreground;
    unsigned int	background;
    unsigned int	font_handle;
    unsigned int	visible;
} PrivateScrollList;

/* Others */
int             scrolllist_active(void);
_kernel_oserror *scrolllist_init(void);
_kernel_oserror *scrolllist_die(void);
_kernel_oserror *scrolllist_add(ScrollList *, int wimpw,
				ObjectID obj_id,
				int **icons, int **data);
_kernel_oserror *scrolllist_method(PrivateScrollList *handle,
				_kernel_swi_regs *regs);
_kernel_oserror *scrolllist_remove(PrivateScrollList *handle);
_kernel_oserror *scrolllist_fade(PrivateScrollList *handle, int fade);

_kernel_oserror *scrolllist_plot(ScrollList *);
_kernel_oserror *scrolllist_move(int type, PrivateScrollList *sdata,
				wimp_Bbox *box);

_kernel_oserror *scrolllist_filter(_kernel_swi_regs *regs);

#endif
