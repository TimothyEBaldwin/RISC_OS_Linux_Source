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
/*icon.c - utilities to update simple WIMP icon types*/

/*History

   11 May 1993 J R C Started

*/

/*From OSLib*/
#include "macros.h"
#include "os.h"
#include "wimp.h"

/*From Support*/
#include "icon.h"
#include "riscos.h"
#include "trace.h"

/*------------------------------------------------------------------------*/
int icon_ratio (int x0, int x1, int mul, int min, int max)

   /* Divide the distance from |x0| to |x1| at the point |mul| as if it were
      scaled from |min| to |max|.
   */

{
   #ifdef XTRACE
      tracef ("icon_ratio (%d, %d, %d, %d, %d) -> %d\n" _
            x0 _ x1 _ mul _ min _ max _ icon_RATIO (x0, x1, mul, min, max));
   #endif

   return icon_RATIO (x0, x1, mul, min, max);
}
/*------------------------------------------------------------------------*/
os_error *icon_set_slider (wimp_w w, wimp_i knob, wimp_i track,
      int mul, int min, int max)

   /* Set the given slider knob to length |mul| out of the range |min| to
      |max|. This code is from P R M p3-24.
   */

{  os_error *error = NULL;
   wimp_icon_state state;
   wimp_icon_create create;
   wimp_draw update;
   osbool more;

   tracef ("icon_set_slider (w 0x%X, knob %d, track %d)\n" _
         w _ knob _ track);

   /*Get the knob state, so we can update it.*/
   state.w = w;
   state.i = knob;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   /*Keep the icon definition for recreation later.*/
   create.icon = state.icon;
   tracef ("KNOB ((%d, %d), (%d, %d))\n" _ create.icon.extent.x0 _
         create.icon.extent.y0 _ create.icon.extent.x1 _
         create.icon.extent.y1);

   /*Get the track state - this gives the range of of the slider.*/
   state.w = w;
   state.i = track;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;
   tracef ("TRACK ((%d, %d), (%d, %d))\n" _ state.icon.extent.x0 _
         state.icon.extent.y0 _ state.icon.extent.x1 _ state.icon.extent.y1);

   /*Delete the knob.*/
   if ((error = xwimp_delete_icon (w, knob)) != NULL)
      goto finish;

   /*Build an update block describing the changed area only.*/
   update.w = w;

   /*Update the state locally.*/
   if (state.icon.extent.x1 - state.icon.extent.x0 >=
         state.icon.extent.y1 - state.icon.extent.y0)
   {  /*This one goes across.*/
      int old_x1 = create.icon.extent.x1;

      create.icon.extent.x1 = icon_ratio (state.icon.extent.x0,
            state.icon.extent.x1, mul, min, max);

      update.box.x0 = MIN (old_x1, create.icon.extent.x1);
      update.box.y0 = create.icon.extent.y0;
      update.box.x1 = MAX (old_x1, create.icon.extent.x1);
      update.box.y1 = create.icon.extent.y1;
   }
   else
   {  /*This one goes vertically.*/
      int old_y1 = create.icon.extent.y1;

      create.icon.extent.y1 = icon_ratio (state.icon.extent.y0,
            state.icon.extent.y1, mul, min, max);

      update.box.x0 = create.icon.extent.x0;
      update.box.y0 = MIN (old_y1, create.icon.extent.y1);
      update.box.x1 = create.icon.extent.x1;
      update.box.y1 = MAX (old_y1, create.icon.extent.y1);
   }
   tracef ("UPDATE ((%d, %d), (%d, %d))\n" _ update.box.x0 _ update.box.y0 _
         update.box.x1 _ update.box.y1);

   /*And recreate the knob, hoping it keeps the same handle.*/
   create.w = w;
   if ((error = xwimp_create_icon (&create, NULL)) != NULL)
      goto finish;

   /*Update the changed area of the screen.*/
   if ((error = xwimp_update_window (&update, &more)) != NULL)
      goto finish;

   while (more)
      if ((error = xwimp_get_rectangle (&update, &more)) != NULL)
         goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *icon_get_slider (wimp_w w, wimp_i knob, wimp_i track,
      int *mul_out, int min, int max)

   /*Get the given slider position out of the range |min| to |max|.*/

{  os_error *error = NULL;
   wimp_icon_state knob_state, track_state;
   int mul;

   tracef ("icon_get_slider\n");

   /*Get the knob state.*/
   knob_state.w = w;
   knob_state.i = knob;
   if ((error = xwimp_get_icon_state (&knob_state)) != NULL)
      goto finish;

   /*Get the track state - this gives the range of of the slider.*/
   track_state.w = w;
   track_state.i = track;
   if ((error = xwimp_get_icon_state (&track_state)) != NULL)
      goto finish;

   if (track_state.icon.extent.x1 - track_state.icon.extent.x0 >
         track_state.icon.extent.y1 - track_state.icon.extent.y0)
   {  /*This one goes across.*/
      int x1 = knob_state.icon.extent.x1;

      mul = (max*(x1 - track_state.icon.extent.x0) +
            min*(track_state.icon.extent.x1 - x1))/
            (track_state.icon.extent.x1 - track_state.icon.extent.x0);
   }
   else
   {  /*This one goes vertically.*/
      int y1 = knob_state.icon.extent.y1;

      mul = (max*(y1 - track_state.icon.extent.y0) +
            min*(track_state.icon.extent.y1 - y1))/
            (track_state.icon.extent.y1 - track_state.icon.extent.y0);
   }

   if (mul_out != NULL) *mul_out = mul;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#endif
/*------------------------------------------------------------------------*/
os_error *icon_format (wimp_w w, wimp_i i, int mul, int div, int prec)

   /* Set the given writable icon to the specified amount. This code is from
      PRM p3-23.
   */

{  os_error *error = NULL;
   wimp_icon_state state;
   wimp_caret caret;

   tracef ("icon_format (w 0x%X, i %d)\n" _ w _ i);

   state.w = w;
   state.i = i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   /*Put the value in the icon.*/
   (void) riscos_format_fixed (icon_TEXT (&state.icon), mul, div, 0, prec);

   if ((error = xwimp_get_caret_position (&caret)) != NULL)
      goto finish;

   if (w == caret.w && i == caret.i)
   {  int len = riscos_strlen (icon_TEXT (&state.icon));

      if ((error = xwimp_set_caret_position (caret.w, caret.i,
            caret.pos.x, caret.pos.y, -1, MIN (caret.index, len))) != NULL)
         goto finish;
   }

   if ((error = xwimp_set_icon_state (w, i, NONE, NONE)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *icon_increment (wimp_w w, wimp_i i, int inc,
      int min, int max, int div, int prec, int *value_out)

   /* Adjust the given icon by the specified amount within the given limits.
      To use this function for icons which have no fractional part, just
      disallow '.' (in the validation string).
   */

{  os_error *error = NULL;
   int value, old_value, scale, j;
   wimp_icon_state state;

   tracef ("icon_increment\n");

   /*We have to work with the icon in terms of |scale| rather than |div|,
      or else we get rounding errors in the (highly visible!) output.*/
   scale = 1;
   for (j = 0; j < prec; j++) scale *= 10;

   state.w = w;
   state.i = i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   /*Read the old value of the icon.*/
   if (riscos_scan_fixed (icon_TEXT (&state.icon), &old_value, scale) == 0)
      old_value = 0;

   tracef ("old_value %d, increment %d\n" _ old_value _ inc);
   value = MIN (MAX (RATIO (div*old_value + scale*inc, div),
         scale*min/div), scale*max/div);
   tracef ("=> value %d\n" _ value);

   if (value != old_value)
      /*Put the value back in the icon.*/
      if ((error = icon_format (w, i, value, scale, prec)) != NULL)
         goto finish;

   if (value_out != NULL) *value_out = div*value/scale;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *icon_scan_dec (wimp_w w, wimp_i i, int *value_out)

{  os_error *error = NULL;
   wimp_icon_state state;
   int value;

   tracef ("icon_scan_dec\n");

   state.w = w;
   state.i = i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   /*Read the value of the icon.*/
   if (riscos_scan_dec (icon_TEXT (&state.icon), &value) == 0)
      value = 0;

   if (value_out != NULL) *value_out = value;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *icon_scan_fixed (wimp_w w, wimp_i i, int *mul_out, int div)

{  os_error *error = NULL;
   int mul;
   wimp_icon_state state;

   tracef ("icon_scan\n");

   state.w = w;
   state.i = i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   /*Read the value of the icon.*/
   if (riscos_scan_fixed (icon_TEXT (&state.icon), &mul, div) == 0)
      mul = 0;

   if (mul_out != NULL) *mul_out = mul;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *icon_set_text (wimp_w w, wimp_i i, char *text)

   /* Set the given icon to the specified text. NO PROVISION is made for
      checking the caret position, so this must only be used for display
      fields, icons in closed windows, etc.
   */

{  os_error *error = NULL;
   wimp_icon_state state;

   tracef ("icon_set_text (w 0x%X, i %d)\n" _ w _ i);

   state.w = w;
   state.i = i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;

   riscos_strncpy (state.icon.data AS indirected_text.text, text,
         state.icon.data AS indirected_text.size);

   if ((error = xwimp_set_icon_state (w, i, NONE, NONE)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *icon_name (wimp_w w, wimp_i i, char *buffer)

   /*Copy the name of the icon into a buffer.*/

{  os_error *error = NULL;
   wimp_icon_state icon_state;
   enum {Command, N, Name, Other} state = Command;
   char *s, *cc = buffer;

   tracef ("icon_name\n");

   icon_state.w = w;
   icon_state.i = i;
   if ((error = xwimp_get_icon_state (&icon_state)) != NULL)
      goto finish;

   if ((icon_state.icon.flags & (wimp_ICON_TEXT | wimp_ICON_INDIRECTED)) ==
         (wimp_ICON_TEXT | wimp_ICON_INDIRECTED) &&
         (s = icon_state.icon.data AS indirected_text.validation) != NULL &&
         s != (char *) -1)
   {  int j, len = riscos_strlen (s);

      for (j = 0; j < len; j++)
         switch (state)
         {  case Command:
               /*Expecting a command letter.*/
               if (s [j] == 'N')
                  /*Get a "name" command.*/
                  state = N;
               else
                  /*Some other command.*/
                  state = Other;
            break;

            case N:
               /*Expecting the digits of an N command.*/
               if (s [j] == '/')
                  state = Name;
            break;

            case Name:
               /*Expecting the characters of the name.*/
               if (s [j] == '/')
                  state = Other;
               else if (s [j] == ';')
                  state = Command;
               else
                  *cc++ = s [j];
            break;

            case Other:
               /*Inside a command, waiting for the end.*/
               if (s [j] == '\\')
                  j++;
               else if (s [j] == ';')
                  state = Command;
            break;
   }     }

   *cc = '\0';

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
