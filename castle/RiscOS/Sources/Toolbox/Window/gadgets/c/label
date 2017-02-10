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
/* Title:   label.c
 * Purpose: label gadgets
 * Author:  Chris Marshall
 * History: 22-Feb-94: IDJ: created
 *          23-Feb-94: CSM: Wrote label_add. Might work, dunno yet
 *          02-Mar-94: CSM: Fixed label add to supply window handle to Wimp_CreateIcon. Duh
 *          07-Mar-94: CSM: Added code to interpret flags settings
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "swis.h"
#include "kernel.h"

#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "string32.h"
#include "messages.h"

#include "style.h"
#include "objects/toolbox.h"
#include "objects/window.h"

#include "../globals.h"
#include "../gadgets.h"
#include "../object.h"

#include "label.h"

ICONLIST(2)
extern int WIMP_WINDOW;

typedef struct _label
{
  int   icon_handle;
  Label the_label;  /* Fill this in from gadget_template */
} label;

_kernel_oserror *label_add      (GadgetInternal *gadget, ObjectID window, int **icon_list, Gadget *gadget_template, int window_handle)
{
    wimp_IconCreate  i;
    _kernel_oserror *e;
    label           *l;
    int temp;
      
    window =window;

    /*
     * Allocate our own data to hang off the GadgetInternal structure.
     * We take a copy of the label's template (ie its textual label string).
     */

    temp= string_length (gadget_template->data.label.label)+1;

    l = mem_allocate (sizeof (label) + temp, "label_add, label type") ;
    if (l == NULL)
        return out_of_memory ();

    gadget->data = (void *) l ;

    l->the_label.label = (char *) l + sizeof(label);

    string_copy (l->the_label.label, gadget_template->data.label.label);

    /*
     * Set up a real wimp icon block, with text buffer pointing at our copy
     * of the template.
     */

    i.window_handle                        = window_handle;
    i.icon.data.indirect_text.buffer       = l->the_label.label ;
    i.icon.data.indirect_text.buff_len     = strlen (l->the_label.label) + 1 ;
    i.icon.data.indirect_text.valid_string = NULL ;
    i.icon.flags                           = style_TEXT_LABEL_ICONFLAGS;

    switch (gadget_template->hdr.flags & Label_Justification)
    {
      case Label_LeftJustify:
        break ;

      case Label_RightJustify:
        i.icon.flags |= wimp_ICONFLAGS_RJUSTIFY ;
        break ;

      case Label_Centred:
        i.icon.flags |= wimp_ICONFLAGS_HCENTRE ;
        break ;
    }

    if ((gadget_template->hdr.flags & Label_NoBox) == 0)
      i.icon.flags |= wimp_ICONFLAGS_HAS_BORDER ;

    SetCoords(i)

    /*
     * Create the underlying wimp icon (and store its handle).
     */

    if ((e = CreateIcon(i, &(l->icon_handle))) != NULL)
        goto error;


    /*
     * Return icon list to caller.
     */

    *icon_list = IconList;

    IconList[0] = l->icon_handle;

    return NULL;


error:

    if (l != NULL)
        mem_free (l, "freeing label");

    return e;
}

