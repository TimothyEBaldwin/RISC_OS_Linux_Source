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
/*task.c - useful functions for handling tasks*/

/*From CLib*/
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*From OSLib*/
#include "help.h"
#include "macros.h"
#include "messagetrans.h"
#include "os.h"
#include "osbyte.h"
#include "taskmanager.h"
#include "wimp.h"

/*From Support*/
#include "callback.h"
#include "m.h"
#include "riscos.h"
#include "task.h"
#include "trace.h"

/* Support for building with OSLib 4 or OSLib 6 */
#ifndef message_PREQUIT
#define message_PREQUIT message_PRE_QUIT
#endif

/*
 * (ADH 03/11/1998) MASK_ALL used to consist of the
 * following, OR'd together:
 *
 * wimp_MASK_NULL
 * wimp_MASK_LEAVING
 * wimp_MASK_ENTERING
 * wimp_MASK_LOSE
 * wimp_MASK_GAIN
 * wimp_MASK_POLLWORD
 *
 * But this means that 'Preserve FP', 'Scan pollword at
 * high priority' etc. and all reserved flags are forced
 * clear. This is bad (particularly the preserve FP bit).
 * Instead express MASK_ALL to keep all the bits that the
 * task sets, except for a specific list we want to make
 * sure are cleared.
 */
#define MASK_ALL (0xffffffff                  & \
                 (~(wimp_QUEUE_REDRAW))       & \
                 (~(wimp_QUEUE_MOUSE))        & \
                 (~(wimp_QUEUE_KEY))          & \
                 (~(wimp_MASK_MESSAGE))       & \
                 (~(wimp_MASK_RECORDED))      & \
                 (~(wimp_MASK_ACKNOWLEDGE)))

/*------------------------------------------------------------------------*/
typedef struct task_thread *task_thread;

struct task_thread
   {  int ref;
      task_message_fn *reply_fn;
      task_message_fn *bounce_fn;
      void *handle;
      task_thread next;
   };

struct task_r
   {  wimp_t task;
      byte events [20]; /*reference counts for events*/
      bits mask;
      callback_l list; /*callback list for WIMP events*/
      osbool selection_was_adjust;
      int event; /*the last event returned*/
      task_thread thread_list;
      task_thread *last_thread;
      char programme [taskmanager_NAME_LIMIT + 1];
   };

/*------------------------------------------------------------------------*/
static bits Modifier_Keys (void)

{  /*Get the states of SHIFT, CTRL and ALT.*/
   osbool x, y;
   bits down = NONE;

   tracef ("Modifier_Keys\n");

   if (xos_byte (osbyte_IN_KEY, 0 ^ 0xFF, 0xFF, &x, &y) == NULL && x && y)
      down |= task_SHIFT;

   if (xos_byte (osbyte_IN_KEY, 1 ^ 0xFF, 0xFF, &x, &y) == NULL && x && y)
      down |= task_CTRL;

   if (xos_byte (osbyte_IN_KEY, 2 ^ 0xFF, 0xFF, &x, &y) == NULL && x && y)
      down |= task_ALT;

   return down;
}
/*------------------------------------------------------------------------*/
static bits Mouse_Buttons (void)

{  /*Which mouse button was used?*/
   wimp_pointer pointer;

   tracef ("Mouse_Buttons\n");

   return xwimp_get_pointer_info (&pointer) == NULL? pointer.buttons: NONE;
}
/*------------------------------------------------------------------------*/
static void Message_Format (wimp_message *message, int ref, int action,
      va_list list)

{  int i;
   void *data;

   tracef ("Message_Format\n");

   message->size = offsetof (wimp_message, data);
   message->sender = 0;
   message->my_ref = 0;
   message->your_ref = ref;
   message->action = action;

   switch (action)
   {  case message_QUIT:
         /*No data.*/
      break;

      case message_DATA_SAVE:
      case message_DATA_SAVE_ACK:
      case message_DATA_LOAD:
      case message_DATA_LOAD_ACK:
      case message_DATA_OPEN:
         message->data AS data_xfer.w = va_arg (list, wimp_w);
         message->data AS data_xfer.i = va_arg (list, wimp_i);
         message->data AS data_xfer.pos = va_arg (list, os_coord);
         message->data AS data_xfer.est_size = va_arg (list, int);
         message->data AS data_xfer.file_type = va_arg (list, int);
         riscos_strcpy (message->data AS data_xfer.file_name,
               va_arg (list, char *));

         message->size += offsetof (wimp_message_data_xfer, file_name) +
               ALIGN (riscos_strlen (message->data AS data_xfer.file_name) +
               1);
      break;

      case message_RAM_FETCH:
      case message_RAM_TRANSMIT:
         message->data AS ram_xfer.addr = va_arg (list, void *);
         message->data AS ram_xfer.size = va_arg (list, int);

         message->size += sizeof message->data AS ram_xfer;
      break;

      case message_PREQUIT:
         message->data AS prequit.flags = va_arg (list, bits);

         message->size += sizeof message->data AS prequit;
      break;

      case message_PALETTE_CHANGE:
         /*No data.*/
      break;

      case message_SAVE_DESKTOP:
         message->data AS save_desktop.file = (os_f) va_arg (list, int);
         memset (message->data AS save_desktop.reserved, '\0',
               sizeof message->data AS save_desktop.reserved);
         message->data AS save_desktop.flags = va_arg (list, bits);

         message->size += sizeof message->data AS save_desktop;
      break;

      case message_DEVICE_CLAIM:
      case message_DEVICE_IN_USE:
         message->data AS device.major = va_arg (list, int);
         message->data AS device.minor = va_arg (list, int);
         riscos_strcpy (message->data AS device.info, va_arg (list, char *));

         message->size += sizeof message->data AS device;
      break;

      case message_DATA_SAVED:
         message->data AS data_saved.ref = va_arg (list, int);

         message->size += sizeof message->data AS data_saved;
      break;

      case message_SHUTDOWN:
         message->data AS shutdown.flags = va_arg (list, bits);

         message->size += sizeof message->data AS shutdown;
      break;

      case message_CLAIM_ENTITY:
         message->data AS claim_entity.flags = va_arg (list, bits);

         message->size += sizeof message->data AS claim_entity;
      break;

      case message_DATA_REQUEST:
         message->data AS data_request.w = va_arg (list, wimp_w);
         message->data AS data_request.i = va_arg (list, wimp_i);
         message->data AS data_request.pos = va_arg (list, os_coord);
         message->data AS data_request.flags = va_arg (list, bits);

         i = 0;
         do message->data AS data_request.file_types [i] = va_arg (list, int);
         while (message->data AS data_request.file_types [i++] != -1);

         message->size += offsetof (wimp_message_data_request, file_types) +
               i*sizeof (int);
      break;

      case message_DRAGGING:
         message->data AS dragging.w = va_arg (list, wimp_w);
         message->data AS dragging.i = va_arg (list, wimp_i);
         message->data AS dragging.pos = va_arg (list, os_coord);
         message->data AS dragging.flags = va_arg (list, bits);
         message->data AS dragging.box = va_arg (list, os_box);

         i = 0;
         do message->data AS dragging.file_types [i] = va_arg (list, int);
         while (message->data AS dragging.file_types [i++] != -1);

         message->size += offsetof (wimp_message_dragging, file_types) +
               i*sizeof (int);
      break;

      case message_DRAG_CLAIM:
         message->data AS drag_claim.flags = va_arg (list, int);

         i = 0;
         do message->data AS drag_claim.file_types [i] = va_arg (list, int);
         while (message->data AS drag_claim.file_types [i++] != -1);

         message->size += offsetof (wimp_message_drag_claim, file_types) +
               i*sizeof (int);
      break;

      default:
         data = va_arg (list, void *);
         if ((i = va_arg (list, int)) > 0)
         {  memcpy (&message->data, data, i);
            message->size += i;
         }
      break;
}  }
#ifndef PICKER
/*------------------------------------------------------------------------*/
static os_error *Thread_New (int my_ref, task_message_fn *reply_fn,
      task_message_fn *bounce_fn, void *h, task_thread *t_out)

{  task_thread t;
   os_error *error = NULL;

   if ((t = m_ALLOC (sizeof *t)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   t->ref       = my_ref;
   t->reply_fn  = reply_fn;
   t->bounce_fn = bounce_fn;
   t->handle    = h;
   t->next      = NULL;

   if (t_out != NULL) *t_out = t;

finish:
   return error;
}
#endif
/*------------------------------------------------------------------------*/
static os_error *Thread_Delete (task_thread t)

{  os_error *error = NULL;

   m_FREE (t, sizeof *t);

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
os_error *task_new (char *programme, wimp_t task, task_r *r_out)

{  os_error *error = NULL;
   int i;
   task_r r = NULL;
   osbool done_alloc = FALSE, done_new = FALSE;

   tracef ("task_new\n");

   if ((r = m_ALLOC (sizeof *r)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }
   done_alloc = TRUE;

   /*task*/
   r->task = task;

   /*events*/
   for (i = 0; i < COUNT (r->events); i++)
      r->events [i] = 0;

   /*mask*/
   r->mask = MASK_ALL;

   /*list*/
   if ((error = callback_new (&r->list)) != NULL)
      goto finish;
   done_new = TRUE;

   /*selection_was_adjust*/
   r->selection_was_adjust = FALSE;

   /*last_event*/
   r->event = -1;

   /*thread_list*/
   r->thread_list = NULL;

   /*last_thread*/
   r->last_thread = &r->thread_list;

   /*programme*/
   riscos_strncpy (r->programme, programme, taskmanager_NAME_LIMIT);

   if (r_out != NULL) *r_out = r;

finish:
   if (error != NULL)
   {  if (done_new)
         callback_delete (r->list);

      if (done_alloc)
         m_FREE (r, sizeof *r);
   }

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *task_delete (task_r r)

{  os_error *error = NULL;

   tracef ("task_delete\n");

   callback_delete (r->list);

   m_FREE (r, sizeof *r);

/*finish:*/
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
wimp_t task_info_task (task_r r) {return r->task;}
/*------------------------------------------------------------------------*/
os_error *task_callback (task_r r, callback_l list, int event,
      wimp_block *block, osbool *unclaimed)

{  osbool u;
   os_error *error = NULL;

   tracef ("task_callback\n");

   /*We allow a list other than |r|'s to be used.*/
   if (list == NULL) list = r->list;

   switch (r->event = event)
   {  case wimp_NULL_REASON_CODE:
      case wimp_USER_DRAG_BOX:
         tracef ("%d\n" _ r->event);
         if ((error = callback (list, block, &u, 1, r->event)) != NULL)
            goto finish;
      break;

      case wimp_REDRAW_WINDOW_REQUEST:
      case wimp_OPEN_WINDOW_REQUEST:
      case wimp_POINTER_LEAVING_WINDOW:
      case wimp_POINTER_ENTERING_WINDOW:
         tracef ("%d %d\n" _ r->event _ block ASREF redraw.w);
         if ((error = callback (list, block, &u, 2, r->event, block ASREF
               redraw.w)) != NULL)
            goto finish;
      break;

      case wimp_CLOSE_WINDOW_REQUEST:
         tracef ("%d %d %d %d\n" _ r->event _
               block ASREF close.w _ Mouse_Buttons () _ Modifier_Keys ());
         if ((error = callback (list, block, &u, 4, r->event, block ASREF
               close.w, Mouse_Buttons (), Modifier_Keys ())) != NULL)
            goto finish;
      break;

      case wimp_MOUSE_CLICK:
         tracef ("%d %d %d %d %d\n" _ r->event _
               block ASREF pointer.w _ block ASREF pointer.i _
               block ASREF pointer.buttons _ Modifier_Keys ());
         if ((error = callback (list, block, &u, 5, r->event,
               block ASREF pointer.w, block ASREF pointer.i,
               block ASREF pointer.buttons, Modifier_Keys ())) != NULL)
            goto finish;
      break;

      case wimp_KEY_PRESSED:
         tracef ("%d %d %d %d\n" _ r->event _ block ASREF key.w _
               block ASREF key.i _ block ASREF key.c);
         if ((error = callback (list, block, &u, 4, r->event, block ASREF
               key.w, block ASREF key.i, block ASREF key.c)) != NULL)
            goto finish;
      break;

      case wimp_MENU_SELECTION:
      {  int i;

         r->selection_was_adjust =
               (Mouse_Buttons () & wimp_CLICK_ADJUST) != NONE;

         tracef ("%d" _ r->event);
         for (i = 0; i <= wimp_MENU_DEPTH_LIMIT &&
               block ASREF selection.items [i] != -1; i++)
            trace_f (NULL _ 0 _ " %d" _
                  block ASREF selection.items [i]);
         trace_f (NULL _ 0 _ "\n");

         if ((error = callback (list, block, &u, i + 1, r->event,
               block ASREF selection)) != NULL)
            goto finish;
      }
      break;

      case wimp_SCROLL_REQUEST:
         tracef ("%d %d %d %d\n" _ r->event _
               block ASREF scroll.w _ Mouse_Buttons () _ Modifier_Keys ());
         if ((error = callback (list, block, &u, 4, r->event, block ASREF
               scroll.w, Mouse_Buttons (), Modifier_Keys ())) != NULL)
            goto finish;
      break;

      case wimp_LOSE_CARET:
      case wimp_GAIN_CARET:
         tracef ("%d %d %d\n" _ r->event _ block ASREF caret.w _
               block ASREF caret.i);
         if ((error = callback (list, block, &u, 3, r->event, block ASREF
               caret.w, block ASREF caret.i)) != NULL)
            goto finish;
      break;

      case wimp_POLLWORD_NON_ZERO:
         tracef ("%d %d\n" _ r->event _
               block ASREF pollword.addr);
         if ((error = callback (list, block, &u, 2, r->event,
               block ASREF pollword.addr)) != NULL)
            goto finish;
      break;

      case wimp_USER_MESSAGE:
      case wimp_USER_MESSAGE_RECORDED:
      case wimp_USER_MESSAGE_ACKNOWLEDGE:
      {  int action = block ASREF message.action;
         task_thread *tt;
         osbool handled = FALSE;

         /*First, check to see if there is a thread open for this
            message.*/
         tracef ("%d %d ... (checking threads)\n" _ r->event _ action);
         for (tt = &r->thread_list; *tt != NULL; tt = &(*tt)->next)
            /*For wimp_USER_MESSAGE, wimp_USER_MESSAGE_RECORDED the your_ref
               field must match; but for wimp_USER_MESSAGE_ACKNOWLEDGE,
               it's the my_ref field.*/
            if ((*tt)->ref == (r->event != wimp_USER_MESSAGE_ACKNOWLEDGE?
                  block ASREF message.your_ref: block ASREF message.my_ref))
            {  task_thread t = *tt;

               tracef ("Found a match! Unlink it from the list of threads\n");
               *tt = t->next;
               if (t->next == NULL)
                  r->last_thread = tt;

               /*Call the right function for this case.*/
               if (r->event != wimp_USER_MESSAGE_ACKNOWLEDGE)
               {  tracef ("... reply found\n");
                  if (t->reply_fn != NULL)
                     error = (*t->reply_fn) (t->handle, block);
               }
               else
               {  tracef ("... bounce found\n");
                  if (t->bounce_fn != NULL)
                     error = (*t->bounce_fn) (t->handle, block);
               }

               handled = TRUE;

               /*Delete the thread.*/
               (void) Thread_Delete (t);

               if (error != NULL)
                  goto finish;

               break;
            }

         if (handled) break;

         switch (action)
         {  case message_DATA_SAVE:
            case message_DATA_SAVE_ACK:
            case message_DATA_LOAD:
            case message_DATA_LOAD_ACK:
            case message_DATA_OPEN:
               tracef ("... %d %d %d\n" _
                     block ASREF message.data AS data_xfer.w _
                     block ASREF message.data AS data_xfer.i _
                     block ASREF message.data AS data_xfer.file_type);
               if ((error = callback (list, block, &u, 5, r->event, action,
                     block ASREF message.data AS data_xfer.w,
                     block ASREF message.data AS data_xfer.i,
                     block ASREF message.data AS data_xfer.file_type)) !=
                     NULL)
                  goto finish;
            break;

            case message_DEVICE_CLAIM:
            case message_DEVICE_IN_USE:
               tracef ("... %d %d\n" _
                     block ASREF message.data AS device.major _
                     block ASREF message.data AS device.minor);
               if ((error = callback (list, block, &u, 4, r->event, action,
                     block ASREF message.data AS device.major,
                     block ASREF message.data AS device.minor)) != NULL)
                  goto finish;
            break;

            case message_DATA_SAVED:
               tracef ("... %d\n" _
                     block ASREF message.data AS data_saved.ref);
               if ((error = callback (list, block, &u, 3, r->event, action,
                     block ASREF message.data AS data_saved.ref)) != NULL)
                  goto finish;
            break;

            case message_CLAIM_ENTITY:
               tracef ("... %d\n" _
                     block ASREF message.data AS claim_entity.flags);
               if ((error = callback (list, block, &u, 3, r->event, action,
                     block ASREF message.data AS claim_entity.flags)) !=
                     NULL)
                  goto finish;
            break;

            case message_HELP_REQUEST:
               tracef ("... %d\n" _
                     ((help_message_request *) &block ASREF message.data)->w
                     _ ((help_message_request *) &block ASREF
                     message.data)->i _ ((help_message_request *) &block
                     ASREF message.data)->buttons);
               if ((error = callback (list, block, &u, 5, r->event, action,
                     ((help_message_request *) &block ASREF message.data)->w,
                     ((help_message_request *) &block ASREF message.data)->i,
                     ((help_message_request *) &block ASREF
                     message.data)->buttons)) != NULL)
                  goto finish;
            break;

            case message_MENU_WARNING:
            {  /*Where is it?*/
               int i;

               tracef ("...");
               for (i = 0; i <= wimp_MENU_DEPTH_LIMIT &&
                     ((wimp_message_menu_warning *) &block ASREF
                     message.data)->selection.items [i] != -1; i++)
                  trace_f (NULL _ 0 _ " %d" _
                        ((wimp_message_menu_warning *) &block ASREF
                        message.data)->selection.items [i]);
               trace_f (NULL _ 0 _ "\n");

               if ((error = callback (list, block, &u, i + 2, r->event,
                     action, ((wimp_message_menu_warning *) &block ASREF
                     message.data)->selection)) != NULL)
                  goto finish;
            }
            break;

            case message_MENUS_DELETED:
               tracef ("... %d\n" _
                     ((wimp_message_menus_deleted *) &block ASREF
                     message.data)->menu);
               if ((error = callback (list, block, &u, 3, r->event, action,
                     ((wimp_message_menus_deleted *) &block ASREF
                     message.data)->menu)) != NULL)
                  goto finish;
            break;

            case message_WINDOW_INFO:
            case message_WINDOW_CLOSED:
               /*This relies on a pun, but it seems silly to ignore it.*/
               tracef ("... %d\n" _
                     ((wimp_message_window_info *) &block ASREF
                     message.data)->w);
               if ((error = callback (list, block, &u, 3, r->event, action,
                     ((wimp_message_window_info *) &block ASREF
                     message.data)->w)) != NULL)
                  goto finish;
            break;

            default:
               tracef ("...\n");
               if ((error = callback (list, block, &u, 2, r->event, action))
                     != NULL)
                  goto finish;
            break;
         }
      }
      break;
   }

   if (unclaimed != NULL) *unclaimed = u;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
os_error *task_report_error (task_r r, os_error *error)

{  tracef ("task_report_error: \"%s\"\n" _
         error != NULL? error->errmess: "");

   if (error != NULL)
      xwimp_report_error (error, NONE, r->programme, NULL);

   return error;
}
/*------------------------------------------------------------------------*/
bits task_claim (task_r r, int event)

{  tracef ("task_claim\n");

   /*If the reference count was 0, enable the event.*/
   if (r->events [event]++ == 0)
      r->mask &= ~(1 << event);

   #if TRACE
   {  int i;

      tracef ("events:");
      for (i = 0; i < COUNT (r->events); i++)
         trace_f (NULL _ 0 _ " %d" _ r->events [i]);
      trace_f (NULL _ 0 _ "\n");
   }
   #endif

   return r->mask;
}
/*------------------------------------------------------------------------*/
bits task_release (task_r r, int event)

{  tracef ("task_release\n");

   /*If the reference count hits 0, mask out the event.*/
   if (--r->events [event] == 0)
      r->mask |= 1 << event;

   #if TRACE
   {  int i;

      tracef ("events:");
      for (i = 0; i < COUNT (r->events); i++)
         trace_f (NULL _ 0 _ " %d" _ r->events [i]);
      trace_f (NULL _ 0 _ "\n");
   }
   #endif

   return r->mask;
}
/*------------------------------------------------------------------------*/
bits task_mask (task_r r)

{  tracef ("task_mask\n");

   #if TRACE
   {  int i;

      tracef ("events:");
      for (i = 0; i < COUNT (r->events); i++)
         trace_f (NULL _ 0 _ " %d" _ r->events [i]);
      trace_f (NULL _ 0 _ "\n");
   }
   #endif

   return r->mask;
}
/*------------------------------------------------------------------------*/
callback_l task_list (task_r r)

{  tracef ("task_list\n");

   return r->list;
}
/*------------------------------------------------------------------------*/
os_error *task_send_user_message (wimp_t to, int ref, int action, ...)

{  os_error *error = NULL;
   va_list list;
   wimp_message message;

   tracef ("task_send_user_message\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message (wimp_USER_MESSAGE, &message, to)) !=
         NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *task_send_user_message_recorded (wimp_t to, int ref,
      task_r r, task_message_fn *reply_fn, task_message_fn *bounce_fn,
      void *h, int action, ...)

{  os_error *error = NULL;
   va_list list;
   task_thread t = NULL;
   wimp_message message;

   tracef ("task_send_user_message_recorded\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message (wimp_USER_MESSAGE_RECORDED, &message,
         to)) != NULL)
      goto finish;

   /*Create a structure describing this thread. A thread, in this context,
      is a block describing what to do on receipt of a message: we are
      guaranteed that one of a reply or a bounce will happen (eventually) so
      this will be deallocated before programme exit.*/
   if ((error = Thread_New (message.my_ref, reply_fn, bounce_fn, h, &t)) !=
         NULL)
      goto finish;

   /*Add this thread structure to the list of active threads.*/
   *r->last_thread = t;
   r->last_thread = &t->next;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
      m_FREE (t, sizeof *t);
   }

   return error;
}
#endif
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *task_send_user_message_acknowledge (wimp_t to,
      int ref, int action, ...)

{  os_error *error = NULL;
   va_list list;
   wimp_message message;

   tracef ("task_send_user_message_acknowledge\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message (wimp_USER_MESSAGE_ACKNOWLEDGE,
         &message, to)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#endif
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *task_send_user_message_to_window (wimp_w to_w,
      wimp_i to_i, int ref, int action, ...)

{  os_error *error = NULL;
   va_list list;
   wimp_message message;

   tracef ("task_send_user_message\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message_to_window (wimp_USER_MESSAGE, &message,
         to_w, to_i, NULL)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#endif
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *task_send_user_message_recorded_to_window
      (wimp_w to_w, wimp_i to_i, int ref,
      task_r r, task_message_fn *reply_fn, task_message_fn *bounce_fn,
      void *h, int action, ...)

{  os_error *error = NULL;
   va_list list;
   task_thread t = NULL;
   wimp_message message;

   tracef ("task_send_user_message_recorded\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message_to_window (wimp_USER_MESSAGE_RECORDED,
         &message, to_w, to_i, NULL)) != NULL)
      goto finish;

   /*Create a structure describing this thread. A thread, in this context,
      is a block describing what to do on receipt of a message: we are
      guaranteed that one of a reply or a bounce will happen (eventually) so
      this will be deallocated before programme exit.*/
   if ((error = Thread_New (message.my_ref, reply_fn, bounce_fn, h, &t)) !=
         NULL)
      goto finish;

   /*Add this thread structure to the list of active threads.*/
   *r->last_thread = t;
   r->last_thread = &t->next;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
      m_FREE (t, sizeof *t);
   }

   return error;
}
#endif
#ifndef PICKER
/*------------------------------------------------------------------------*/
os_error *task_send_user_message_acknowledge_to_window (wimp_w to_w,
      wimp_i to_i, int ref, int action, ...)

{  os_error *error = NULL;
   va_list list;
   wimp_message message;

   tracef ("task_send_user_message_acknowledge_to_window\n");

   va_start (list, action);
   Message_Format (&message, ref, action, list);
   va_end (list);

   if ((error = xwimp_send_message_to_window (wimp_USER_MESSAGE_ACKNOWLEDGE,
         &message, to_w, to_i, NULL)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
#endif
