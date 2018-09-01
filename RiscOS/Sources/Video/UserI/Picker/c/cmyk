/* Copyright 1996 Acorn Computers Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*cmyk.c - entry points for ColourPicker module*/

/*History

   24th Aug 1993 J R C Started

*/

/*From CLib*/
#include <kernel.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*From OSLib*/
#include "colourpicker.h"
#include "colourtrans.h"
#include "help.h"
#include "messagetrans.h"
#include "macros.h"
#include "os.h"
#include "resourcefs.h"
#include "territory.h"
#include "wimp.h"

/*From Support*/
#include "icon.h"
#include "lookup.h"
#include "m.h"
#include "resource.h"
#include "riscos.h"
#include "steppable.h"
#include "trace.h"

/*Local*/
#include "cmyk.h"
#include "dialogue.h"
#include "files.h"
#include "helpreply.h"
#include "main.h"
#include "model.h"

lookup_t cmyk_messages, cmyk_templates;

static colourpicker_model Model;

static resource_template *CMYK;

static wimp_i Desktop_Colours [] =
   {  cmyk_CMYK_COLOUR0, cmyk_CMYK_COLOUR1, cmyk_CMYK_COLOUR2,
      cmyk_CMYK_COLOUR3, cmyk_CMYK_COLOUR4, cmyk_CMYK_COLOUR5,
      cmyk_CMYK_COLOUR6, cmyk_CMYK_COLOUR7, cmyk_CMYK_COLOUR8,
      cmyk_CMYK_COLOUR9, cmyk_CMYK_COLOUR10, cmyk_CMYK_COLOUR11,
      cmyk_CMYK_COLOUR12, cmyk_CMYK_COLOUR13, cmyk_CMYK_COLOUR14,
      cmyk_CMYK_COLOUR15
   };

static char *Message_File_Name, *Template_File_Name;

static int Suppress;
/*------------------------------------------------------------------------*/
static os_colour Colour (cmyk_colour *cmyk)

   /*Returns the OS_Colour for the given model.*/

{  int r, g, b;
   os_error *error = NULL;

   if ((error = xcolourtrans_convert_cmyk_to_rgb
         (cmyk->cyan, cmyk->magenta, cmyk->yellow, cmyk->key, &r, &g, &b))
         != NULL)
   {  tracef ("ERROR %s, returning black\n" _ error->errmess);
      return os_COLOUR_BLACK;
   }
   tracef ("ColourTrans: CMYK (%d, %d, %d, %d) -> RGB (%d, %d, %d)\n" _
         cmyk->cyan _ cmyk->magenta _ cmyk->yellow _ cmyk->key _
         r _ g _ b);

   return
      RATIO (r*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_RSHIFT |
      RATIO (g*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_GSHIFT |
      RATIO (b*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_BSHIFT;
}
/*------------------------------------------------------------------------*/
static os_error *Value_Changed (steppable_s v, int value, osbool dragging,
      void *h)

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   tracef ("Value_Changed\n");

   /*Update the record for this dialogue.*/
   if (v == cmyk->cyan_steppable)
   {  tracef ("CYAN changed to %d\n" _ value);
      cmyk->cyan = value;
   }
   else if (v == cmyk->magenta_steppable)
   {  tracef ("MAGENTA changed to %d\n" _ value);
      cmyk->magenta = value;
   }
   else if (v == cmyk->yellow_steppable)
   {  tracef ("YELLOW changed to %d\n" _ value);
      cmyk->yellow = value;
   }
   else if (v == cmyk->key_steppable)
   {  tracef ("KEY changed to %d\n" _ value);
      cmyk->key = value;
   }
   else
      return NULL;

   colour->colour = Colour (cmyk);

   if (Suppress > 0)
      Suppress--;
   else
   {  /*if (colour->colour != old_colour) Fix MED-4410: can't do this because
         if we change from one colour to another with the same K, we lose the
         message. J R C 28th Feb 1995*/
      {  /*SWI the main module to let it know that the colour has changed.*/
         if (!dragging)
         {  if ((error = xcolourpickermodelswi_colour_changed (colour)) !=
                  NULL)
               goto finish;
         }
         else
         {  if ((error = xcolourpickermodelswi_colour_changed_by_dragging
                 (colour)) != NULL)
               goto finish;
   }  }  }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Caret_Moved (steppable_s v, wimp_w w, wimp_i i, void *h)

   /* Called when the caret enters the writable of a steppable. We
      have to set the
      value of the steppable that contains the icon that used to have the
      caret to the number in its writable icon. Luckily, this doesn't
      change!*/

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;
   steppable_s previous;
   int value;
   char s [20];
   wimp_icon_state state;

   NOT_USED (v)

   tracef ("Caret_Moved\n");

   tracef ("caret moved to steppable with writable %d; cmyk->caret_i %d\n" _
         i _ cmyk->caret_i);
   if (i != cmyk->caret_i)
   {  if (cmyk->caret_i != -1)
      {  switch (cmyk->caret_i - cmyk->first_i)
         {  case cmyk_CMYK_CPERCENT:
               previous = cmyk->cyan_steppable;
            break;

            case cmyk_CMYK_MPERCENT:
               previous = cmyk->magenta_steppable;
            break;

            case cmyk_CMYK_YPERCENT:
               previous = cmyk->yellow_steppable;
            break;

            case cmyk_CMYK_KPERCENT:
               previous = cmyk->key_steppable;
            break;

            default:
               return NULL;
            break;
         }

         /*Get the string from the icon that used to have the caret.*/
         state.w = w;
         state.i = cmyk->caret_i;
         if ((error = xwimp_get_icon_state (&state)) != NULL)
            goto finish;
         tracef ("previous text: \"%s\"\n" _ icon_TEXT (&state.icon));

         /*Make the string representation for the current steppable value.*/
         if ((error = steppable_get_value (previous, &value)) != NULL)
            goto finish;
         tracef ("current steppable value: %d\n" _ value);
         riscos_format_fixed (s, RATIO (1000*value,
               colourtrans_COLOUR_RANGE), 10, 0, 1);
         tracef ("=> current steppable text: \"%s\"\n" _ s);

         /*Set that steppable to have the same value.*/
         if (riscos_strcmp (s, icon_TEXT (&state.icon)) != 0)
         {  tracef ("so they are different ...\n");

            /*Apply the minimum and maximum for this steppable.*/
            if (riscos_scan_fixed (icon_TEXT (&state.icon), &value, 10) == 0)
               value = 0;
            tracef ("raw current icon value: %d\n" _ value);

            value = MIN (MAX (0, RATIO (colourtrans_COLOUR_RANGE*value,
                  1000)), colourtrans_COLOUR_RANGE);
            tracef ("cooked current icon value: %d\n" _ value);

            if ((error = steppable_set_value (previous, value)) != NULL)
               goto finish;
         }

      #if 0
         /*Get the value from the icon that used to have the caret.*/
         if ((error = icon_scan_fixed (w, cmyk->caret_i, &value, 10)) !=
               NULL)
            goto finish;

         /*That's a percentage.*/
         value = RATIO (colourtrans_COLOUR_RANGE*value, 1000);

         /*Get the current value of the steppable.*/
         if ((error = steppable_get_value (previous, &old_value)) != NULL)
            goto finish;

         /*Set that steppable to have the same value.*/
         tracef ("new value %d, old value %d\n" _ value _ old_value);
         if (value != old_value)
         {  /*Apply the minimum and maximum for this steppable.*/
            value = MIN (MAX (0, value), colourtrans_COLOUR_RANGE);

            /*Set that steppable to have the same value.*/
            if ((error = steppable_set_value (previous, value)) != NULL)
               goto finish;
         }
      #endif
      }

      tracef ("updating new icon\n");
      cmyk->caret_i = i;
      tracef ("cmyk->caret_i %d\n" _ cmyk->caret_i);
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Open (void *h, void *b, osbool *unclaimed)

   /* Handler for OpenWindowRequest on the main window. (Done here because
      we used to have to open the pane at the right offset.)
   */

{  os_error *error = NULL;
   wimp_open *open = &((wimp_block *) b) ASREF open;

   NOT_USED (h)
   NOT_USED (unclaimed)

   tracef ("Open: w 0x%X\n" _ open->w);

   if ((error = xwimp_open_window (open)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Return (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;
   wimp_caret caret;
   steppable_s v = NULL;
   int value;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Return\n");

   /*Before passing this event on to the main picker, make sure that the icon
      with the caret is up to date. J R C 14th Nov 1993*/
   if ((error = xwimp_get_caret_position (&caret)) != NULL)
      goto finish;

   switch (caret.i - cmyk->first_i)
   {  case cmyk_CMYK_CPERCENT:
         tracef ("caret is in cyansteppable\n");
         v = cmyk->cyan_steppable;
      break;

      case cmyk_CMYK_MPERCENT:
         tracef ("caret is in magenta steppable\n");
         v = cmyk->magenta_steppable;
      break;

      case cmyk_CMYK_YPERCENT:
         tracef ("caret is in yellow steppable\n");
         v = cmyk->yellow_steppable;
      break;

      case cmyk_CMYK_KPERCENT:
         tracef ("caret is in key steppable\n");
         v = cmyk->key_steppable;
      break;
   }

   if (v != NULL)
   {  /*Get the value from the icon that has the caret.*/
      if ((error = icon_scan_fixed (caret.w, caret.i, &value, 10)) != NULL)
         goto finish;

      /*That's a percentage.*/
      value = RATIO (colourtrans_COLOUR_RANGE*value, 1000);

      /*Apply the minimum and maximum for this steppable.*/
      value = MIN (MAX (0, value), colourtrans_COLOUR_RANGE);

      /*Set the steppable to have that value.*/
      if ((error = steppable_set_value (v, value)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Pass (void *h, void *b, osbool *unclaimed)

   /*Ideally, this would be registered for key-presses only, but it would
      then happen before the key-pressed handlers for the steppables.*/

{  wimp_key *key = &((wimp_block *) b) ASREF key;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   tracef ("Pass\n");

   if (key->w == cmyk->main_w)
   {  tracef ("Passing the key press to the front end ...\n");
      if ((error = xcolourpickermodelswi_process_key (key->c, colour)) !=
            NULL)
         goto finish;
      tracef ("Passing the key press to the front end ... done\n");

      *unclaimed = FALSE;
         /*the dialogue may be gone*/
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Desktop (void *h, void *b, osbool *unclaimed)

   /*Click on one of the desktop colour icons.*/

{  wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   int c, m, y, k, i;
   os_PALETTE (20) palette;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Desktop: w 0x%X, i %d\n" _ pointer->w _ pointer->i);

   for (i = 0; i < 16; i++)
      if (cmyk->first_i + Desktop_Colours [i] == pointer->i)
         break;

   /*Set values for this colour.*/
   if ((error = xwimp_read_true_palette ((os_palette *) &palette)) != NULL)
      goto finish;
   tracef ("colour required 0x%X\n" _ palette.entries [i]);

   if ((error = xcolourtrans_convert_rgb_to_cmyk
         (RATIO (((palette.entries [i] & os_R) >> os_RSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         RATIO (((palette.entries [i] & os_G) >> os_GSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         RATIO (((palette.entries [i] & os_B) >> os_BSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         &c, &m, &y, &k)) != NULL)
      goto finish;
   tracef ("or in (c, m, y, k), (0x%X, 0x%X, 0x%X, 0x%X)\n" _ c _ m _ y _ k);

   /*Fix MED-4410: set |Suppress| to 3 not 4. J R C 28th Feb 1995*/
   Suppress = 3;
   if ((error = steppable_set_value (cmyk->cyan_steppable, c)) != NULL ||
         (error = steppable_set_value (cmyk->magenta_steppable, m)) != NULL
         || (error = steppable_set_value (cmyk->yellow_steppable, y)) !=
         NULL || (error = steppable_set_value (cmyk->key_steppable, k)) !=
         NULL)
      goto finish;

   /*SWI the main module to let it know that the colour has changed. JRC 10th
      Jan 1995*/
   /*if ((error = xcolourpickermodelswi_colour_changed (colour)) != NULL)
      goto finish; don't need this then. J R C 28th Feb 1995*/

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Gain (void *h, void *b, osbool *unclaimed)

   /*Gain caret event on my pane.*/

{  wimp_caret *caret = &((wimp_block *) b) ASREF caret;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Gain\n");

   /*Only take notice of arrivals on my icons.*/
   switch (caret->i - cmyk->first_i)
      case cmyk_CMYK_CPERCENT:
      case cmyk_CMYK_MPERCENT:
      case cmyk_CMYK_YPERCENT:
      case cmyk_CMYK_KPERCENT:
         cmyk->caret_i = caret->i;

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Lose (void *h, void *b, osbool *unclaimed)

   /*Lose caret event on my pane.*/

{  wimp_caret *caret = &((wimp_block *) b) ASREF caret;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   NOT_USED (caret)
   NOT_USED (unclaimed)

   cmyk->caret_i = (wimp_i) -1;

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Help (void *h, void *b, osbool *unclaimed)

{  wimp_message *message = &((wimp_block *) b) ASREF message;
   os_error *error = NULL;

   NOT_USED (h)
   NOT_USED (unclaimed)

   tracef ("Help\n");
   if ((error = helpreply (message, "CMYK", cmyk_messages)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Starting (task_r r, wimp_w main_w,
      colourpicker_dialogue *dialogue, os_coord *offset, bits flags,
      colourpicker_colour **colour_out)

   /* Given an empty main window, set it up for use in an CMYK dialogue.
      Return a handle to quote in future interactions with this colour
      model.
   */

{  os_error *error = NULL;
   colourpicker_colour *colour;
   int size, c;
   osbool first, done_create_pane = FALSE, done_register_cyan = FALSE,
      done_register_magenta = FALSE, done_register_yellow = FALSE,
      done_register_key = FALSE, done_new = FALSE;
   cmyk_colour *cmyk = SKIP;
   wimp_window_info info;
   wimp_i i, new_i, first_i;
   steppable_steppable steppable;

   NOT_USED (flags)

   tracef ("Dialogue_Starting\n");

   tracef ("allocating %d bytes for colour-specific information\n" _
         colourpicker_SIZEOF_COLOUR (sizeof (cmyk_colour)/sizeof (int)));
   if ((colour = m_ALLOC (colourpicker_SIZEOF_COLOUR
         (sizeof (cmyk_colour)/sizeof (int)))) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   /*Now copy the fields present in the dialogue to the local structure,
      filling in any missing oness.*/

   /*size*/
   size = dialogue->size;
   tracef ("size given %d\n" _ size);
      /*this is the size actually provided by the client*/
   colour->size = colourpicker_SIZEOF_COLOUR
         (sizeof (cmyk_colour)/sizeof (int));
      /*this is the size needed by this colour model*/

   cmyk = (cmyk_colour *) colour->info;

   /*model_no*/
   cmyk->model_no = colourpicker_MODEL_CMYK;
   tracef ("colour model %d\n" _ cmyk->model_no);
      /*must be, or we wouldn't be here*/

   /*colour, r, g, b*/
   /*If there is a colour in |dialogue|, use it; otherwise use the one
      specified by |.colour|.*/
   if (size == colourpicker_MODEL_SIZE_CMYK)
   {  cmyk->cyan = ((cmyk_colour *) dialogue->info)->cyan;
      cmyk->magenta = ((cmyk_colour *) dialogue->info)->magenta;
      cmyk->yellow = ((cmyk_colour *) dialogue->info)->yellow;
      cmyk->key = ((cmyk_colour *) dialogue->info)->key;

      colour->colour = Colour (cmyk);
      tracef ("Full colour (%d, %d, %d, %d) specified -> "
            "OS_Colour 0x%X.\n" _ cmyk->cyan _ cmyk->magenta _
            cmyk->yellow _ cmyk->key _ colour->colour);
   }
   else
   {  if
      (  (  error =
               xcolourtrans_convert_rgb_to_cmyk
               (  RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  &cmyk->cyan,
                  &cmyk->magenta,
                  &cmyk->yellow,
                  &cmyk->key
               )
         ) != NULL
      )
         goto finish;
      tracef ("ColourTrans: RGB (%d, %d, %d) -> CMYK (%d, %d, %d, %d)\n" _
            RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            cmyk->cyan _ cmyk->magenta _ cmyk->yellow _ cmyk->key);

      colour->colour = Colour (cmyk);
      tracef ("OS_Colour 0x%X specified -> full colour (%d, %d, %d, %d)\n" _
            dialogue->colour _ cmyk->cyan _ cmyk->magenta _ cmyk->yellow _
            cmyk->key);
   }

   /*r*/
   cmyk->r = r;

   /*list*/
   if ((error = callback_new (&cmyk->list)) != NULL)
      goto finish;
   done_new = TRUE;

   /*main_w*/
   cmyk->main_w = main_w;

   /*pane_w, pane_data*/
   if ((error = resource_create_window (CMYK, &cmyk->pane_w,
         &cmyk->pane_data)) != NULL)
      goto finish;
   done_create_pane = TRUE;

   /*offset*/
   tracef ("offset (%d, %d)\n" _ offset->x _ offset->y);
   cmyk->offset = *offset;

   /*Copy all the icons from the window we just created to the window
      given. We used to open a pane window at the given offset from the main
      window, but it doesn't work.*/
   info.w = cmyk->pane_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;
   first = TRUE;

   for (i = 0; i < info.icon_count; i++)
   {  wimp_icon_state state;
      wimp_icon_create create;

      state.w = cmyk->pane_w;
      state.i = i;
      if ((error = xwimp_get_icon_state (&state)) != NULL)
         goto finish;

      /*Create it on the main window.*/
      create.w    = main_w;
      create.icon = state.icon;
      if ((error = xwimp_create_icon (&create, &new_i)) != NULL)
         goto finish;
      tracef ("copied icon from %d on pane window to %d on main\n" _
            i _ new_i);

      if (first)
      {  /*Remember which was our first icon, so we can delete them all
            later.*/
         cmyk->first_i = new_i;
         first = FALSE;
   }  }

   first_i = cmyk->first_i;

   tracef ("Put the caret into icon %d for keyboard shortcuts\n" _
         cmyk->first_i + cmyk_CMYK_CPERCENT);
   if ((error = xwimp_set_caret_position (main_w, cmyk->first_i +
         cmyk_CMYK_CPERCENT, SKIP, SKIP, -1, 0)) != NULL)
      goto finish;

   /*caret_i*/
   cmyk->caret_i = cmyk->first_i + cmyk_CMYK_CPERCENT;
      /*The idea of this is to handle focus-changing properly. The only
         situation where we lose track of the caret position is when a click
         in a writable icon steals it. (All other cases result in
         Wimp_GainCaret and Wimp_LoseCaret events.) The steppables
         will callback to Caret_Moved() when they detect a mouse click on
         any of themselves; by also tracking Wimp_GainCaret and
         Wimp_LoseCaret events, we can always know what the current caret
         position is. When it leaves a writable icon, we can update the
         colour based on the previous location. This is problem '*'.
      */

   tracef ("Register the steppables\n");
   steppable.r                = cmyk->r;
   steppable.list             = cmyk->list;
   steppable.w                = main_w;
   steppable.min              = 0;
   steppable.max              = colourtrans_COLOUR_RANGE;
   steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
   steppable.prec             = 1;
   steppable.value_changed_fn = &Value_Changed;
   steppable.caret_moved_fn   = &Caret_Moved;
   steppable.handle           = colour;

   steppable.value            = cmyk->cyan;
   steppable.knob             = first_i + cmyk_CMYK_CKNOB;
   steppable.track            = first_i + cmyk_CMYK_CTRACK;
   steppable.up               = first_i + cmyk_CMYK_CUP;
   steppable.down             = first_i + cmyk_CMYK_CDOWN;
   steppable.writable         = first_i + cmyk_CMYK_CPERCENT;
   if ((error = steppable_register (&steppable, &cmyk->cyan_steppable)) !=
         NULL)
      goto finish;
   done_register_cyan = TRUE;

   steppable.value            = cmyk->magenta;
   steppable.knob             = first_i + cmyk_CMYK_MKNOB;
   steppable.track            = first_i + cmyk_CMYK_MTRACK;
   steppable.up               = first_i + cmyk_CMYK_MUP;
   steppable.down             = first_i + cmyk_CMYK_MDOWN;
   steppable.writable         = first_i + cmyk_CMYK_MPERCENT;
   if ((error = steppable_register (&steppable, &cmyk->magenta_steppable))
         != NULL)
      goto finish;
   done_register_magenta = TRUE;

   steppable.value            = cmyk->yellow;
   steppable.knob             = first_i + cmyk_CMYK_YKNOB;
   steppable.track            = first_i + cmyk_CMYK_YTRACK;
   steppable.up               = first_i + cmyk_CMYK_YUP;
   steppable.down             = first_i + cmyk_CMYK_YDOWN;
   steppable.writable         = first_i + cmyk_CMYK_YPERCENT;
   if ((error = steppable_register (&steppable, &cmyk->yellow_steppable)) !=
         NULL)
      goto finish;
   done_register_yellow = TRUE;

   steppable.value            = cmyk->key;
   steppable.knob             = first_i + cmyk_CMYK_KKNOB;
   steppable.track            = first_i + cmyk_CMYK_KTRACK;
   steppable.up               = first_i + cmyk_CMYK_KUP;
   steppable.down             = first_i + cmyk_CMYK_KDOWN;
   steppable.writable         = first_i + cmyk_CMYK_KPERCENT;
   if ((error = steppable_register (&steppable, &cmyk->key_steppable)) !=
         NULL)
      goto finish;
   done_register_key = TRUE;

   if
   (  /*Main window opens are handled here. This is a legacy from the pane
         days which it seems prudent to retain.*/
      (error = callback_register (cmyk->list, &Open, colour, 2,
            wimp_OPEN_WINDOW_REQUEST, main_w)) != NULL ||

      /*Returns are watched so we can update the steppables from the values
         in their respective icons.*/
      (error = callback_register (cmyk->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, cmyk->first_i + cmyk_CMYK_CPERCENT,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (cmyk->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, cmyk->first_i + cmyk_CMYK_MPERCENT,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (cmyk->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, cmyk->first_i + cmyk_CMYK_YPERCENT,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (cmyk->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, cmyk->first_i + cmyk_CMYK_KPERCENT,
            wimp_KEY_RETURN)) != NULL ||

      /*Other keypresses are passed on.*/
      (error = callback_register (cmyk->list, &Pass, colour, 1,
            wimp_KEY_PRESSED)) != NULL ||

      /*Gain and lose caret (merely for problem '*').*/
      (error = callback_register (cmyk->list, &Gain, colour, 2,
            wimp_GAIN_CARET, main_w)) != NULL ||
      (error = callback_register (cmyk->list, &Lose, colour, 2,
            wimp_LOSE_CARET, main_w)) != NULL ||

      /*Respond to help request events.*/
      (error = callback_register (cmyk->list, &Help, colour, 3,
            wimp_USER_MESSAGE_RECORDED, message_HELP_REQUEST, main_w)) !=
            NULL
   )
      goto finish;

   /*Clicks on all the desktop colour icons.*/
   for (c = 0; c < 16; c++)
      if ((error = callback_register (cmyk->list, &Desktop, colour, 5,
            wimp_MOUSE_CLICK, main_w, cmyk->first_i + Desktop_Colours [c],
            wimp_CLICK_SELECT, NONE)) != NULL)
         goto finish;

   if (colour_out != NULL) *colour_out = colour;

finish:
   if (error != NULL)
   {  if (done_create_pane)
      {  os_error *error1 = resource_delete_window (cmyk->pane_w,
               cmyk->pane_data);
         if (error == NULL) error = error1;
      }

      if (done_register_key)
      {  os_error *error1 = steppable_deregister (cmyk->key_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_yellow)
      {  os_error *error1 = steppable_deregister (cmyk->yellow_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_magenta)
      {  os_error *error1 = steppable_deregister (cmyk->magenta_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_cyan)
      {  os_error *error1 = steppable_deregister (cmyk->cyan_steppable);
         if (error == NULL) error = error1;
      }

      if (done_new)
      {  os_error *error1;

         tracef ("callback_delete\n");
         error1 = callback_delete (cmyk->list);
         if (error == NULL) error = error1;
      }

      m_FREE (colour, colourpicker_SIZEOF_COLOUR
            (sizeof (cmyk_colour)/sizeof (int)));
   }

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Finishing (colourpicker_colour *colour)

{  os_error *error = NULL;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;
   wimp_window_info info;
   wimp_i i;

   tracef ("Dialogue_Finishing\n");
   if ((error = steppable_deregister (cmyk->cyan_steppable)) != NULL ||
         (error = steppable_deregister (cmyk->magenta_steppable)) != NULL ||
         (error = steppable_deregister (cmyk->yellow_steppable)) != NULL ||
         (error = steppable_deregister (cmyk->key_steppable)) != NULL)
      goto finish;

   callback_delete (cmyk->list);

   /*Delete all my icons on the main window.*/
   info.w = cmyk->main_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;

   for (i = cmyk->first_i; i < info.icon_count; i++)
      if ((error = xwimp_delete_icon (cmyk->main_w, i)) != NULL)
         goto finish;

   /*Delete the pane.*/
   if ((error = resource_delete_window (cmyk->pane_w, cmyk->pane_data)) !=
         NULL)
      goto finish;

   m_FREE (colour, colourpicker_SIZEOF_COLOUR
         (sizeof (cmyk_colour)/sizeof (int)));

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Set_Values (colourpicker_dialogue *dialogue,
      colourpicker_colour *colour)

   /* Set the state of a dialogue to a given colour.
   */

{  os_error *error = NULL;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   tracef ("Set_Values\n");

   /*If there is an cmyk colour in |dialogue|, use it; otherwise use the
      os_colour.*/
   if (dialogue->size == colourpicker_MODEL_SIZE_CMYK)
   {  cmyk->cyan = ((cmyk_colour *) dialogue->info)->cyan;
      cmyk->magenta = ((cmyk_colour *) dialogue->info)->magenta;
      cmyk->yellow = ((cmyk_colour *) dialogue->info)->yellow;
      cmyk->key = ((cmyk_colour *) dialogue->info)->key;

      colour->colour = Colour (cmyk);
      tracef ("Full colour (%d, %d, %d, %d) -> OS_Colour 0x%X.\n" _
            cmyk->cyan _ cmyk->magenta _ cmyk->yellow _ cmyk->key _ colour->colour);
   }
   else
   {  if
      (  (  error =
               xcolourtrans_convert_rgb_to_cmyk
               (  RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
                     colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  &cmyk->cyan,
                  &cmyk->magenta,
                  &cmyk->yellow,
                  &cmyk->key
               )
         ) != NULL
      )
         goto finish;
      tracef ("ColourTrans: RGB (%d, %d, %d) -> CMYK (%d, %d, %d, %d)\n" _
            RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE) _
            cmyk->cyan _ cmyk->magenta _ cmyk->yellow _ cmyk->key);

      colour->colour = Colour (cmyk);
      tracef ("OS_Colour 0x%X -> full colour (%d, %d, %d, %d)\n" _
            dialogue->colour _ cmyk->cyan _ cmyk->magenta _ cmyk->yellow _
            cmyk->key);
   }

   tracef ("Set the new steppable values\n");
   Suppress = 3;
   if ((error = steppable_set_value (cmyk->cyan_steppable, cmyk->cyan)) !=
         NULL || (error = steppable_set_value (cmyk->magenta_steppable,
         cmyk->magenta)) != NULL || (error = steppable_set_value
         (cmyk->yellow_steppable, cmyk->yellow)) != NULL || (error =
         steppable_set_value (cmyk->key_steppable, cmyk->key)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Process_Event (colourpicker_colour *colour, int event,
      wimp_block *block)

{  cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   tracef ("Process_Event %d\n" _ event);

   return task_callback (cmyk->r, cmyk->list, event, block, NULL);
}
/*------------------------------------------------------------------------*/
static os_error *Set_Colour (colourpicker_colour *colour)

{  os_error *error = NULL;
   cmyk_colour *cmyk = (cmyk_colour *) colour->info;

   tracef ("Set_Colour (%d, %d, %d)\n" _
         cmyk->cyan _ cmyk->magenta _ cmyk->yellow _ cmyk->key);

   if ((error = xcolourtrans_set_gcol (Colour (cmyk), colourtrans_SET_FG_GCOL |
         colourtrans_USE_ECFS_GCOL, os_ACTION_OVERWRITE, NULL, NULL)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Setup_Model (void)

{  os_error *error = NULL;

   if ((error = lookup (cmyk_templates, "CMYK", (void **) &CMYK)) != NULL)
      goto finish;

   /*Fill in |Model|.*/
   /*flags*/
   Model.flags = NONE;

   /*name*/
   if ((error = lookup (cmyk_messages, "Name", (void **) &Model.name)) !=
         NULL)
      goto finish;

   /*description*/
   if ((error = lookup (cmyk_messages, "Desc",
         (void **) &Model.description)) != NULL)
      goto finish;

   /*info_size*/
   Model.info_size = colourpicker_MODEL_SIZE_CMYK /*was sizeof (cmyk_colour)
         JRC 8th Dec 1994*/;

   /*pane_size*/
   Model.pane_size.x = CMYK->window.extent.x1 - CMYK->window.extent.x0;
   Model.pane_size.y = CMYK->window.extent.y1 - CMYK->window.extent.y0;

   /*entries*/
   Model.entries [colourpicker_ENTRY_DIALOGUE_STARTING] =
         (void *) &Dialogue_Starting;
   Model.entries [colourpicker_ENTRY_DIALOGUE_FINISHING] =
         (void *) &Dialogue_Finishing;
   Model.entries [colourpicker_ENTRY_REDRAW_AREA] =
         NULL;
   Model.entries [colourpicker_ENTRY_UPDATE_AREA] =
         NULL;
   Model.entries [colourpicker_ENTRY_READ_VALUES] =
         NULL;
   Model.entries [colourpicker_ENTRY_SET_VALUES] =
         (void *) &Set_Values;
   Model.entries [colourpicker_ENTRY_PROCESS_EVENT] =
         (void *) &Process_Event;
   Model.entries [colourpicker_ENTRY_SET_COLOUR] =
         (void *) &Set_Colour;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
os_error *cmyk_initialise (char *tail, int podule_base,
      void *workspace)

{  os_error *error = NULL;
   osbool done_messages = FALSE, done_templates = FALSE;

   NOT_USED (tail)
   NOT_USED (podule_base)
   NOT_USED (workspace)

   tracef ("cmyk_initialise\n");

   Message_File_Name  = "ColourPicker:CMYK.Messages";
   Template_File_Name = "ColourPicker:CMYK.Templates";

   /*Load files.*/
   tracef ("cmyk_initialise: loading messages\n");
   if ((error = main_resource_alloc (Message_File_Name,
         &resource_messages_alloc, &resource_messages_free, &cmyk_messages))
         != NULL)
      goto finish;

   tracef ("cmyk_initialise: loading templates\n");
   if ((error = main_resource_alloc (Template_File_Name,
         &resource_templates_alloc, &resource_templates_free,
         &cmyk_templates)) != NULL)
   done_templates = TRUE;

   if ((error = Setup_Model ()) != NULL)
      goto finish;

   #if 1
      /*Since we are a part of ColourPicker, we can't register ourselves by
         calling colourpicker_register_model() - it doesn't exist yet. So we
         have to call model_register() direct.*/
      if ((error = model_register (colourpicker_MODEL_CMYK, &Model,
            workspace)) != NULL)
         goto finish;
   #else
      /*If we were not a part of ColourPicker, we would do something
         like this to register ourselves, not worrying if the ColourPicker
         module is not running yet.*/
      if ((error = xcolourpicker_register_model (colourpicker_MODEL_CMYK,
            &Model, workspace)) != NULL &&
            error->errnum != os_ERROR_SWI_NOT_KNOWN)
         goto finish;
      tracef ("CMYK: ColourPicker_RegisterModel gives errnum 0x%X\n" _
            error->errnum);
      error = NULL;
   #endif

   Suppress = 0;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);

      if (done_messages)
      {  os_error *error1 = main_resource_free (cmyk_messages,
               &resource_messages_free);
         if (error == NULL) error = error1;
      }

      if (done_templates)
      {  os_error *error1 = main_resource_free (cmyk_templates,
               &resource_templates_free);
         if (error == NULL) error = error1;
      }
   }

   return error;
}
/*------------------------------------------------------------------------*/
os_error *cmyk_terminate (osbool fatal, int instance, void *workspace)

{  os_error *error = NULL, *error1;

   NOT_USED (fatal)
   NOT_USED (instance)
   NOT_USED (workspace)

   tracef ("cmyk_terminate\n");

   error1 = main_resource_free (cmyk_messages, &resource_messages_free);
   if (error == NULL) error = error1;

   error1 = main_resource_free (cmyk_templates, &resource_templates_free);
   if (error == NULL) error = error1;

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
void cmyk_service (int service, _kernel_swi_regs *regs, void *workspace)

{  os_error *error = NULL;

   NOT_USED (workspace)
   NOT_USED (error)

   tracef ("cmyk_service\n");

   switch (service)
   {  case Service_ResourceFSStarted:
      case Service_TerritoryStarted:
         tracef ("cmyk_service: servicing ResourceFSStarted/"
               "TerritoryStarted\n");
         if ((error = main_resource_free (cmyk_messages,
               &resource_messages_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Message_File_Name,
               &resource_messages_alloc, &resource_messages_free,
               &cmyk_messages)) != NULL)
            goto finish;

         if ((error = main_resource_free (cmyk_templates,
               &resource_templates_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Template_File_Name,
               &resource_templates_alloc, &resource_templates_free,
               &cmyk_templates)) != NULL)
            goto finish;

         if ((error = Setup_Model ()) != NULL)
            goto finish;
      break;

      case Service_ColourPickerLoaded:
         /*Register ourselves!*/
         (*(void (*) (int, colourpicker_model *, void *, void *))
               regs->r [2]) (colourpicker_MODEL_CMYK, &Model, workspace,
               (void *) regs->r [3]);
      break;
   }

finish:
   /*We can't return an error from a service call, so throw it away.*/
   tracef ("discarding \"%s\" from service handler\n" _
         error != NULL? error->errmess: "");
}
