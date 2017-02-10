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
/************************************************************************/
/* © Acorn Computers Ltd, 1992.                                         */
/*                                                                      */
/* This file forms part of an unsupported source release of RISC_OSLib. */
/*                                                                      */
/* It may be freely used to create executable images for saleable       */
/* products but cannot be sold in source form or as an object library   */
/* without the prior written consent of Acorn Computers Ltd.            */
/*                                                                      */
/* If this file is re-distributed (even if modified) it should retain   */
/* this copyright notice.                                               */
/*                                                                      */
/************************************************************************/

/*
 * Title: c.dboxtcol
 * Purpose: display dbox to allow setting of colours
 * History: IDJ: 05-Feb-92: prepared for source release
 *
 */


#include "colourpick.h"
#include "event.h"
#include "dboxtcol.h"
#include "help.h"
#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "win.h"

#include "swis.h"

#undef  NULL
#define NULL 0

static BOOL Open, Chosen;
static dboxtcol_colour Colour;
static dboxtcol_colourhandler Proc;
static void *Handle;
static wimp_w W;
static int Model = 0;

static BOOL Unknowns (wimp_eventstr *event_str, void *h)

{  h = h;

   switch (event_str->e)
   {  case wimp_ESEND:
      case wimp_ESENDWANTACK:
         switch (event_str->data.msg.hdr.action)
         {  case wimp_MMENUSDELETED:
               Open = FALSE;
               return TRUE;
            break;

            case message_COLOUR_PICKER_COLOUR_CHOICE:
               Chosen = TRUE;

               Colour = (event_str->data.msg.data.words [1] &
                     colourpicker_COLOUR_TRANSPARENT) != 0?
                     dboxtcol_Transparent:
                     event_str->data.msg.data.words [2];

               if (Proc != NULL) (*Proc) (Colour, Handle);
               return TRUE;
            break;

            case message_COLOUR_PICKER_COLOUR_CHANGED:
              Model = event_str->data.msg.data.words [4];
            break;

            case wimp_MHELPREQUEST:
               /*If we get a help-request on this colour picker, we must
                  "handle" it to prevent other parts of RISC_OSLib trying to
                  deal with it.*/
               if (event_str->data.msg.data.helprequest.m.w == W)
                  return TRUE;
            break;
         }
      break;
   }

   return FALSE;
}

BOOL dboxtcol (dboxtcol_colour *colour_out, BOOL allow_transparent,
      char *name, dboxtcol_colourhandler proc, void *handle)

{  BOOL transparent;
   wimp_eventstr *e;
   os_error *error = NULL;
   colourpicker_dialogue dialogue;
   colourpicker_d d;

   static BOOL Added_Messages = FALSE;

   if (!Added_Messages)
   {  static int Messages [] = {message_COLOUR_PICKER_COLOUR_CHOICE,
            message_COLOUR_PICKER_COLOUR_CHANGED, wimp_MMENUSDELETED, 0};

      if ((error = _swix (Wimp_AddMessages, _IN (0), Messages)) != NULL)
         goto finish;

      Added_Messages = TRUE;
   }

   Open = TRUE;
   Chosen = FALSE;
   Colour = colour_out != NULL? *colour_out: dboxtcol_Transparent;
   Proc = proc;
   Handle = handle;

   transparent = allow_transparent && Colour == dboxtcol_Transparent;

   e = wimpt_last_event();
   if (e->e == wimp_ESEND && e->data.msg.hdr.action == wimp_MMENUWARN) {
     /* this is a dbox that is actually part of the menu tree. */
     dialogue.visible.x0 = e->data.msg.data.menuwarn.x;
     dialogue.visible.y1 = e->data.msg.data.menuwarn.y;
   } else {
     wimp_mousestr mouse_str;
     /* a floater: float it near the pointer. */
     wimpt_noerr (wimp_get_point_info (&mouse_str));
     dialogue.visible.x0 = mouse_str.x;
     dialogue.visible.y1 = mouse_str.y;
   }

   dialogue.flags =
      (allow_transparent? colourpicker_DIALOGUE_OFFERS_TRANSPARENT: 0) |
      colourpicker_DIALOGUE_TYPE_CLICK << colourpicker_DIALOGUE_TYPE_SHIFT |
      (transparent? colourpicker_DIALOGUE_TRANSPARENT: 0);
   dialogue.title      = name;
   dialogue.visible.y0 = 0x80000000;
   dialogue.visible.x1 = 0x7FFFFFFF;
   dialogue.xscroll    = 0;
   dialogue.yscroll    = 0;
   dialogue.colour     = Colour;
   dialogue.size       = 4;
   dialogue.info [0]   = Model;

   if ((error = _swix (ColourPicker_OpenDialogue,
         _IN (0) | _IN (1) | _OUT (0) | _OUT (1),
         colourpicker_OPEN_TRANSIENT | colourpicker_OPEN_SUB_MENU,
         &dialogue, &d, &W)) != NULL)
      goto finish;

   /*Poll the WIMP until the window goes away.*/
   win_add_unknown_event_processor (&Unknowns, 0);
   do event_process (); while (Open);
   win_remove_unknown_event_processor (&Unknowns, 0);

   if (colour_out != NULL) *colour_out = Colour;

finish:
   wimpt_complain (error);
   return Chosen;
}
