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
/*declare.c - implementation file for drawfile_declare_fonts*/

/*From CLib*/
#include <stddef.h>
#include <string.h>

/*From OSLib*/
#include "drawfile.h"
#include "os.h"
#include "pdriver.h"

/*From Support*/
#include "riscos.h"
#include "jc_trace.h"
#include "trfm.h"

/*Local*/
#include "declare.h"
#include "main.h"
#include "textarea.h"
#include "verify.h"

/*------------------------------------------------------------------------*/
os_error *declare (bits flags, drawfile_diagram *diagram, int size)

{  drawfile_object *end, *o;
   drawfile_declare_fonts_state state;
   os_error *error = NULL;
   osbool unclaimed;

   tracef ("declare\n");
   state.diagram    = diagram;
   state.font_table = NULL;
   state.flags      = flags;
   state.error      = NULL;

   tracef ("declare: despatching\n");
   end = (drawfile_object *) &((byte *) diagram) [size];
   for (o = diagram->objects; o < end; *(byte **) &o += o->size)
   {  state.object = o;
      if ((error = callback (main_declaration_callback, &state, &unclaimed,
            1, o->type)) != NULL)
         goto finish;

      if (unclaimed && o->type >= 0x100)
      {  if ((error = xservice_draw_object_declare_fonts (o->type, &state,
               NULL)) != NULL)
            goto finish;
      }
   }

finish:
   return error != NULL? error: state.error;
}
/*------------------------------------------------------------------------*/
os_error *declare_font_table (void *null, void *s, osbool *unclaimed)

{  os_error *error = NULL;
   drawfile_declare_fonts_state *state = (drawfile_declare_fonts_state *) s; /*save typing*/
   drawfile_font_def *font_def, *end;
   bits flags;

   tracef ("declare_font_table\n");
   NOT_USED (null)

   /*Save the pointer.*/
   state->font_table = state->object;

   end = (drawfile_font_def *) &((byte *) state->font_table)
         [state->font_table->size];
   flags = ((state->flags & drawfile_NO_DOWNLOAD) != NONE?
         pdriver_NO_DOWNLOAD: NONE) | pdriver_KERNED;

   for (font_def = state->font_table->data AS font_table.font_def;
         font_def < end && font_def->font_index != 0; *(byte **) &font_def
         += drawfile_SIZEOF_FONT_DEF (strlen (font_def->font_name) + 1))
   {  tracef ("declaring font \"%s\"\n" _ font_def->font_name);
      if ((error = xpdriver_declare_font (0, font_def->font_name, flags))
            != NULL)
         goto finish;
   }

   *unclaimed = FALSE;

finish:
   if (state->error == NULL) state->error = error;
   if (error != NULL)
      tracef ("declare_font_table: \"%s\"\n" _ error->errmess);
   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *declare_group (void *null, void *s, osbool *unclaimed)

{  os_error *error = NULL;
   drawfile_declare_fonts_state *state = (drawfile_declare_fonts_state *) s /*save typing*/;
   drawfile_object *o, *end;
   osbool u;

   tracef ("declare_group\n");
   NOT_USED (null)

   end = (drawfile_object *) &((byte *) state->object)
         [state->object->size];
   for (o = (drawfile_object *) &state->object->data AS group.objects;
         o < end; *(byte **) &o += o->size)
   {  state->object = o;
      if ((error = callback (main_declaration_callback, state, &u, 1,
            o->type)) != NULL)
         goto finish;

      if (u && o->type >= 0x100)
      {  if ((error = xservice_draw_object_declare_fonts (o->type, state,
               NULL)) != NULL)
            goto finish;
      }
   }

   *unclaimed = FALSE;

finish:
   if (state->error == NULL) state->error = error;
   if (error != NULL)
      tracef ("declare_group: \"%s\"\n" _ error->errmess);
   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *declare_tagged (void *null, void *s, osbool *unclaimed)

{  os_error *error = NULL;
   drawfile_declare_fonts_state *state = (drawfile_declare_fonts_state *) s /*save typing*/;
   drawfile_object *o, *end;
   osbool u;

   tracef ("declare_tagged\n");
   NOT_USED (null)

   o = (drawfile_object *) &state->object->data AS tagged.object;
   end = (drawfile_object *) &((byte *) state->object)
         [state->object->size];

   state->object = o;
   if ((error = callback (main_declaration_callback, state, &u, 1,
         o->type)) != NULL)
      goto finish;

   if (u && o->type >= 0x100)
      if ((error = xservice_draw_object_declare_fonts (o->type, state, NULL))
            != NULL)
         goto finish;

   *unclaimed = FALSE;

finish:
   if (state->error == NULL) state->error = error;
   if (error != NULL)
      tracef ("declare_tagged: \"%s\"\n" _ error->errmess);
   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *declare_text_area (void *null, void *s, osbool *unclaimed)

{  os_error *error = NULL;
   drawfile_declare_fonts_state *state = (drawfile_declare_fonts_state *) s; /*save typing*/

   tracef ("declare_text_area\n");
   NOT_USED (null)

   if ((error = textarea_declare (state->object, ((state->flags &
         drawfile_NO_DOWNLOAD) != NONE? pdriver_NO_DOWNLOAD: NONE) |
         pdriver_KERNED)) != NULL)
      goto finish;

   *unclaimed = FALSE;

finish:
   if (state->error == NULL) state->error = error;
   if (error != NULL)
      tracef ("declare_text_area: \"%s\"\n" _ error->errmess);
   return NULL;
}
