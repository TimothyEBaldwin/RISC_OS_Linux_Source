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
/*steppable.c - support for a slider with an adjuster and a writable icon*/

/*From CLib*/
#include <stdlib.h>

/*From OSLib*/
#include "macros.h"
#include "os.h"
#include "wimp.h"
#include "wimpreadsysinfo.h"

/*From Support*/
#include "icon.h"
#include "m.h"
#include "riscos.h"
#include "steppable.h"
#include "task.h"
#include "trace.h"

struct steppable_s
   {  steppable_steppable steppable;

      /*state variables*/
      osbool dragging;
   };

/*------------------------------------------------------------------------*/
static os_error *Set_Value (steppable_s s, int value)

   /*Update the icons of the steppable to the value given.*/

{  os_error *error = NULL;

   tracef ("Set_Value (%d)\n" _ value);

   /*Fix MED-4354: check values are in range in case something awful has
      happened. J R C 23rd Feb 1995*/
   (void) MAXAB (value, s->steppable.min);
   (void) MINAB (value, s->steppable.max);

   if ((error = icon_set_slider (s->steppable.w, s->steppable.knob,
         s->steppable.track, value,
         s->steppable.min, s->steppable.max)) != NULL)
      goto finish;

   if ((error = icon_format (s->steppable.w, s->steppable.writable, value,
         s->steppable.div, s->steppable.prec)) != NULL)
      goto finish;

   s->steppable.value = value;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Increment (steppable_s s, int inc)

{  os_error *error = NULL;
   int value;

   tracef ("Increment (%d)\n" _ inc);

   value = s->steppable.value + inc;
   (void) MAXAB (value, s->steppable.min);
   (void) MINAB (value, s->steppable.max);

   if (value != s->steppable.value)
   {  if ((error = Set_Value (s, value)) != NULL)
         goto finish;

      tracef ("steppable calling value_changed_fn\n");
      if ((error = (*s->steppable.value_changed_fn) (s, value,
            /*dragging*/ FALSE, s->steppable.handle)) != NULL)
         goto finish;
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Up (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Up\n");

   if ((error = Increment (s, s->steppable.div)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Down (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Down\n");

   if ((error = Increment (s, -s->steppable.div)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *SUp (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("SUp\n");

   if ((error = Increment (s, RATIO (s->steppable.div, 10))) !=
         NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *SDown (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("SDown\n");

   if ((error = Increment (s, -RATIO (s->steppable.div, 10))) !=
         NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Set_Position (steppable_s s, os_coord *pos,
      osbool start_drag, osbool end_drag)

   /*Update the icons of the steppable to follow the mouse position given,
      optionally also starting a drag.*/

{  os_error *error = NULL;
   wimp_window_state window_state;
   wimp_icon_state track_state;
   int value = SKIP;

   tracef ("Set_Position ((%d, %d))\n" _ pos->x _ pos->y);

   /*Convert mouse coordinates to window-relative.*/
   window_state.w = s->steppable.w;
   if ((error = xwimp_get_window_state (&window_state)) != NULL)
      goto finish;

   track_state.w = s->steppable.w;
   track_state.i = s->steppable.track;
   if ((error = xwimp_get_icon_state (&track_state)) != NULL)
      goto finish;

   if (track_state.icon.extent.x1 - track_state.icon.extent.x0 >
         track_state.icon.extent.y1 - track_state.icon.extent.y0)
      /*Slider is horizontal.*/
      value = icon_ratio (s->steppable.min, s->steppable.max,
            pos->x + window_state.xscroll - window_state.visible.x0,
            track_state.icon.extent.x0, track_state.icon.extent.x1);
   else
      /*Slider is vertical.*/
      value = icon_ratio (s->steppable.min, s->steppable.max,
            pos->y + window_state.yscroll - window_state.visible.y1,
            track_state.icon.extent.y0, track_state.icon.extent.y1);

   if ((value != s->steppable.value) || end_drag)
   {  if ((error = Set_Value (s, value)) != NULL)
         goto finish;

      tracef ("steppable calling value_changed_fn\n");
      if ((error = (*s->steppable.value_changed_fn) (s, value,
            s->dragging, s->steppable.handle)) != NULL)
         goto finish;
   }

   if (start_drag)
   {  wimp_drag drag;

      drag.type = wimp_DRAG_USER_POINT; /*no graphics*/
      drag.bbox.x0 = track_state.icon.extent.x0 +
            window_state.visible.x0 - window_state.xscroll;
      drag.bbox.y0 = track_state.icon.extent.y0 +
            window_state.visible.y1 - window_state.yscroll;
      drag.bbox.x1 = track_state.icon.extent.x1 +
            window_state.visible.x0 - window_state.xscroll;
      drag.bbox.y1 = track_state.icon.extent.y1 +
            window_state.visible.y1 - window_state.yscroll;
         /*other fields not used*/

      tracef ("Starting drag\n");
      if ((error = xwimp_drag_box (&drag)) != NULL)
         goto finish;

      (void) task_claim (s->steppable.r, wimp_NULL_REASON_CODE);

      s->dragging = TRUE;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Jump (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;

   NOT_USED (unclaimed)

   tracef ("Jump\n");

   if ((error = Set_Position (s, &pointer->pos, FALSE, FALSE)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Start_Drag (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;

   NOT_USED (unclaimed)

   tracef ("Start_Drag\n");

   if ((error = Set_Position (s, &pointer->pos, TRUE, FALSE)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dragging (void *h, void *b, osbool *unclaimed)

   /*Remember this function gets called for EVERY steppable, not only the
      right one.*/

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_pointer pointer;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Dragging\n");

   if (s->dragging)
   {  /*Fix bug: check the task handle here, since we may be in the
         wrong one.*/
      /*Removed again, J R C 18th Aug 1994, can no longer happen. Used to
         check wimpreadsysinfo_task() & 0xFFFF against
         task_info_task (s->steppable.r).*/
      if ((error = xwimp_get_pointer_info (&pointer)) != NULL)
         goto finish;

      if ((error = Set_Position (s, &pointer.pos, FALSE, FALSE)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *End_Drag (void *h, void *b, osbool *unclaimed)

   /*Remember this function gets called for EVERY steppable, not only the
      right one.*/

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_dragged *dragged = &((wimp_block *) b) ASREF dragged;

   NOT_USED (unclaimed)

   tracef ("End_Drag\n");

   if (s->dragging)
   {  /*See comments in Dragging(). J R C 18th Aug 1994*/
      s->dragging = FALSE;

      (void) task_release (s->steppable.r, wimp_NULL_REASON_CODE);

      if ((error = xwimp_drag_box (NULL)) != NULL)
         goto finish;

      if ((error = Set_Position (s, (os_coord *) &dragged->final.x0,
            FALSE, TRUE)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Click (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;

   NOT_USED (pointer)
   NOT_USED (unclaimed)

   tracef ("Click\n");

   tracef ("steppable calling caret_moved_fn\n");
   if ((error = (*s->steppable.caret_moved_fn) (s, s->steppable.w,
         s->steppable.writable, s->steppable.handle)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Press (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   wimp_key *key = &((wimp_block *) b) ASREF key;
   wimp_caret caret;

   NOT_USED (unclaimed)

   tracef ("Press\n");
      /*we know key->w == s->steppable.w*/

   /*Where is the caret now?*/
   if ((error = xwimp_get_caret_position (&caret)) != NULL)
      goto finish;
   tracef ("steppable: Press (%d) finds caret at (0x%X, %d)\n" _
         key->c _ caret.w _ caret.i);

   if (caret.w == key->w && /*caret.i != key->i &&*/ caret.i ==
         s->steppable.writable)
   {  /*The caret has actually moved to my writable. Tell the client.*/
      tracef ("steppable calling caret_moved_fn\n");
      if ((error = (*s->steppable.caret_moved_fn) (s, s->steppable.w,
            s->steppable.writable, s->steppable.handle)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Lose (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   steppable_s s = (steppable_s) h;
   /* wimp_caret *caret = &((wimp_block *) b) ASREF caret;
      wimp_key *key = &((wimp_block *) b) ASREF key;
   */

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Lose\n");

   /*The caret has gone from my writable to heaven knows where. Tell the
      client.*/
   tracef ("steppable calling caret_moved_fn\n");
   if ((error = (*s->steppable.caret_moved_fn) (s, s->steppable.w, -1,
         s->steppable.handle)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
os_error *steppable_register (steppable_steppable *steppable,
      steppable_s *s_out)

   /*Registers all the callbacks needed by the given steppable, and maps
      them to calls to the callbacks |*value_change_fn| and
      |*caret_moved_fn|.*/

{  os_error *error = NULL;
   steppable_s s;
   callback_l list;
   wimp_w w;

   tracef ("steppable_register\n");

   if ((s = m_ALLOC (sizeof *s)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   /*Copy all the fields provided into our own structure.*/
   s->steppable = *steppable;
   s->dragging = FALSE;

   if ((error = Set_Value (s, s->steppable.value)) != NULL)
      goto finish;

   /*Cache some fields for efficiency ...*/
   list = steppable->list;
   w    = steppable->w;

   if
   (  /*Clicks of SELECT and ADJUST with/without Shift on the adjuster
         icons.*/
      (error = callback_register (list, &Up, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.up, wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (list, &SUp, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.up, wimp_CLICK_SELECT, task_SHIFT)) != NULL ||
      (error = callback_register (list, &Down, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.up, wimp_CLICK_ADJUST, NONE)) != NULL ||
      (error = callback_register (list, &SDown, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.up, wimp_CLICK_ADJUST, task_SHIFT)) != NULL ||
      (error = callback_register (list, &Down, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.down, wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (list, &SDown, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.down, wimp_CLICK_SELECT, task_SHIFT)) != NULL ||
      (error = callback_register (list, &Up, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.down, wimp_CLICK_ADJUST, NONE)) != NULL ||
      (error = callback_register (list, &SUp, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.down, wimp_CLICK_ADJUST, task_SHIFT)) != NULL ||

      /*Clicks and drags on the knob and track.*/
      (error = callback_register (list, &Jump, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.knob, wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (list, &Jump, s, 5, wimp_MOUSE_CLICK, w,
            s->steppable.track, wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (list, &Start_Drag, s, 5, wimp_MOUSE_CLICK,
            w, s->steppable.knob, wimp_DRAG_SELECT, NONE)) != NULL ||
      (error = callback_register (list, &Start_Drag, s, 5, wimp_MOUSE_CLICK,
            w, s->steppable.track, wimp_DRAG_SELECT, NONE)) != NULL ||

      /*Clicks on the writable.*/
      (error = callback_register (list, &Click, s, 3, wimp_MOUSE_CLICK, w,
            s->steppable.writable)) != NULL ||

      /*A null and user drag handlers to look after dragging.*/
      (error = callback_register (list, &Dragging, s, 1,
            wimp_NULL_REASON_CODE)) != NULL ||
      (error = callback_register (list, &End_Drag, s, 1,
            wimp_USER_DRAG_BOX)) != NULL ||

      /*We have to get all key presses on the whole window, so we can tell
         when we get the caret by low means such as arrow keys.*/
      (error = callback_register (list, &Press, s, 2, wimp_KEY_PRESSED, w))
            != NULL ||

       /*We need lose caret events (but not gain caret events, strangely) to
          make sure that if the caret vanishes, the steppable is updated
          properly.*/
      (error = callback_register (list, &Lose, s, 3, wimp_LOSE_CARET, w,
            s->steppable.writable)) != NULL
   )
      goto finish;

   (void) task_claim (s->steppable.r, wimp_LOSE_CARET);

   if (s_out != NULL) *s_out = s;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *steppable_deregister (steppable_s s)

{  os_error *error = NULL;

   tracef ("steppable_deregister\n");

   (void) task_release (s->steppable.r, wimp_LOSE_CARET);

   tracef ("deregistering all callbacks for this steppable\n");
   callback_deregister (s->steppable.list, s, 0);

   m_FREE (s, sizeof *s);

/*finish:*/
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *steppable_set_value (steppable_s s, int value)

{  os_error *error = NULL;

   tracef ("steppable_set_value\n");
   if ((error = Set_Value (s, value)) != NULL)
      goto finish;

   /*If the value has not changed, do not callback that it has. Fixes
      MED-3768. JRC 9th Dec 1994*/
   /*Doesn't fix anything; breaks lots coz of the way the colour picker
      suppresses updates if values haven't changed. JRC 11th Jan 1995*/
   tracef ("steppable calling value_changed_fn\n");
   if ((error = (*s->steppable.value_changed_fn) (s, value,
         /*dragging*/ FALSE, s->steppable.handle)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *steppable_get_value (steppable_s s, int *value)

{  os_error *error = NULL;

   tracef ("steppable_get_value\n");
   if (value != NULL)
      *value = s->steppable.value;

/*finish:*/
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
