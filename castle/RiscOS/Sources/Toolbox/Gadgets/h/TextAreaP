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
/* TextAreaP.h
 */

#ifndef __TEXTAREAP_H
#define __TEXTAREAP_H

#include "modmem.h"

/*-- OS unit indent around edge of gadget for text --*/
#define TextArea_DefaultIndent	5
#define TextArea_DefaultFont	"Corpus.Medium"
#define TextArea_DefaultHeight	(12 * 16)
#define TextArea_DefaultWidth	(12 * 16)

/* Delete deletes right */
#define NEWDELETE 1

typedef struct {
    ObjectID		parent_id;
    ComponentID		component_id;
    ObjectID		object_id;
    wimp_Bbox		box;
    int			event;
    unsigned int	state;
    int			type;
    int			wimpw;
    int			foreground;
    int			background;
    unsigned int	indent;		// Border width around window
    Text		*text;
    unsigned int	font_handle;
} PrivateTextArea;

_kernel_oserror *textarea_init(void);
_kernel_oserror *textarea_die(void);
int             textarea_active(void);
_kernel_oserror *textarea_add(TextArea *, int wimpw, ObjectID obj_id,
				int **icons, int **data);
_kernel_oserror *textarea_method(PrivateTextArea *handle,
				_kernel_swi_regs *regs);
_kernel_oserror *textarea_remove(PrivateTextArea *handle);
_kernel_oserror *textarea_fade(PrivateTextArea *handle, int fade);

_kernel_oserror *textarea_plot(TextArea *);
_kernel_oserror *textarea_move(int type, PrivateTextArea *tdata,
				wimp_Bbox *box);

_kernel_oserror *textarea_redraw_all(unsigned int flags, ObjectID object_id);

_kernel_oserror *textarea_filter(_kernel_swi_regs *regs);

_kernel_oserror *textarea_window_appearing(PrivateTextArea *sdata);

#endif
