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
/*model.h - functions to handle colour model registration*/

/*From CLib*/
#include <stdlib.h>

/*From OSLib*/
#include "macros.h"
#include "os.h"

/*From Support*/
#include "m.h"
#include "riscos.h"
#include "relocate.h"
#include "trace.h"

/*Local*/
#include "colourpicker.h"
#include "dialogue.h"
#include "main.h"
#include "model.h"

model_list model_registry, *model_last;

os_coord model_bound;
/*------------------------------------------------------------------------*/
static void Bound_Panes (void)

{  model_list m;

   model_bound.x = model_bound.y = 0;

   for (m = model_registry; m != NULL; m = m->next)
   {  (void) MAXAB (model_bound.x, m->model->pane_size.x);
      (void) MAXAB (model_bound.y, m->model->pane_size.y);
   }

   tracef ("bound is (%d, %d)\n" _ model_bound.x _ model_bound.y);
}
/*------------------------------------------------------------------------*/
os_error *model_initialise ()

{  model_registry = NULL;
   model_last = &model_registry;

   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *model_terminate ()

   /*This routine must only be called when dialogue_terminate has succeeded,
      because it assumes that no models are in use.*/

{  model_list m, next;

   /*Free the model list entries.*/
   for (m = model_registry; m != NULL; m = next)
   {  next = m->next;
      m_FREE (m, sizeof *m);
   }

   return NULL;
}
/*------------------------------------------------------------------------*/
void model_loaded_service (int model_no, colourpicker_model *model,
      void *model_workspace, void *workspace)

   /*Called by a model on receipt of Service_ColourPickerLoaded*/

{  relocate_frame frame;

   tracef ("model_loaded_service\n");

   relocate_begin (workspace, &frame);
   (void) model_register (model_no, model, model_workspace);
      /*Can't do anything with errors in a service call.*/
   relocate_end (&frame);
}
/*------------------------------------------------------------------------*/
os_error *model_register (int model_no, colourpicker_model *model,
      void *model_workspace)

   /*Called by a model on initialisation.*/

{  os_error *error = NULL;
   model_list m;
   osbool found;

   tracef ("model_register\n");

   /*Is this model in the list already?*/
   found = FALSE;
   for (m = model_registry; m != NULL; m = m->next)
      if (m->model_no == model_no)
         /*Found it - update this entry*/
         found = TRUE;

   if (!found)
   {  /*Model is not in the list - add it now*/
      if ((m = m_ALLOC (sizeof *m)) == NULL)
      {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
         goto finish;
      }

      m->model_no = model_no;
      m->next     = NULL;

      *model_last = m;
      model_last = &m->next;
   }

   /*|m| is now either a new record just inserted into the list, or an old
      one.*/
   m->model     = model;
   m->workspace = model_workspace;

finish:
   if (error == NULL) Bound_Panes ();
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *model_deregister (int model_no)

   /*Called by a model on termination.*/

{  model_list *m;
   os_error *error = NULL;

   tracef ("model_deregister\n");
   /*Unlink the model from the list.*/
   for (m = &model_registry; *m != NULL; m = &(*m)->next)
      if ((*m)->model_no == model_no)
      {  model_list next = (*m)->next;

         if (model_in_use (model_no))
         {  error = main_error_lookup (error_COLOUR_PICKER_MODEL_IN_USE,
                  "ModelInUse", (*m)->model->name);
            goto finish;
         }

         /*Unlink |*m| from the chain.*/
         *m = next;

         /*Update |model_last| if it's just had its feet kicked out.*/
         if (next == NULL) model_last = m;

         m_FREE (*m, sizeof **m);
         break;
      }

finish:
   if (error == NULL) Bound_Panes ();
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
osbool model_in_use (int model_no)

{  dialogue_task_list t;
   dialogue_list l;

   for (t = dialogue_active_tasks; t != NULL; t = t->next)
      for (l = t->open_dialogues; l != NULL; l = l->next)
         if (l->colour->info [0] == model_no)
            return TRUE;

   return FALSE;
}
/*------------------------------------------------------------------------*/
os_error *model_set_colour (bits flags, colourpicker_colour *colour)

   /*Implements ColourPicker_SetColour.*/

{  model_list m;
   os_error *error = NULL;
   int model_no;
   relocate_frame frame;

   NOT_USED (flags)

   tracef ("model_set_colour\n");
   /*Find the model.*/
   model_no = colour->size > 0? colour->info [0]: colourpicker_MODEL_RGB;

   for (m = model_registry; m != NULL; m = m->next)
      if (m->model_no == model_no)
      {  relocate_begin (m->workspace, &frame);
         error = (*(os_error *(*) (colourpicker_colour *))
               m->model->entries [colourpicker_ENTRY_SET_COLOUR]) (colour);
         relocate_end (&frame);
         if (error != NULL) goto finish;

         break;
      }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
