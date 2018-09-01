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
/*resource.c - resource loading for various kinds of resource file*/

/* Present capabilities

      Messages
      Templates
      Sprites
*/

/* History

   28 May 1993 JRC Changed to keep all the resources needed by a table in
         the table itself (as entries beginning with "!"), if
         necessary. This is to allow multiple tables to be loaded
         successfully.
*/

/*From CLib*/
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

/*From OSLib*/
#include "font.h"
#include "messagetrans.h"
#include "os.h"
#include "osfile.h"
#include "wimp.h"

/*From Support*/
#include "lookup.h"
#include "m.h"
#include "resource.h"
#include "riscos.h"
#include "trace.h"

/*------------------------------------------------------------------------*/
os_error *resource_messages_alloc (lookup_t t, char *file_name)

{  os_error *error = NULL;
   messagetrans_control_block cb;
   int size, extra_size, context;
   bits flags;
   osbool done_open_file = FALSE;
   char *tmp, *messages;

   tracef ("resource_messages_alloc\n");

   /*Has this table been used before?*/
   if ((error = lookup (t, "!Messages", (void **) &messages)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      messages = NULL;
   }

   if ((error = lookup (t, "!Size", (void **) &size)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      size = 0;
   }

   if (messages != NULL)
      tracef ("at entry: messages \"%s\", size %d\n" _ messages _ size);
   else
      tracef ("at entry: messages NULL, size %d\n" _ size);

   tracef ("reading size of \"%s\"\n" _ file_name);
   if ((error = xmessagetrans_file_info (file_name, &flags, &extra_size)) !=
         NULL)
      goto finish;
   tracef ("size of messages file is %d\n" _ extra_size);

   if ((flags & messagetrans_DIRECT_ACCESS) != NONE)
      tmp = NULL;
   else
   {  if ((tmp = m_REALLOC (messages, size, size + extra_size)) == NULL)
      {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
         goto finish;
      }
      messages = tmp;
      tmp = &messages [size];
      size += extra_size;
   }

   if ((error = xmessagetrans_open_file (&cb, file_name, tmp)) != NULL)
      goto finish;
   done_open_file = TRUE;
   if (messages != NULL)
      tracef ("after xmessagetrans_open_file: messages \"%s\", size %d\n" _
            messages _ size);
   else
      tracef ("after xmessagetrans_open_file: messages NULL, size %d\n" _
            size);

   context = 0;
   while (TRUE)
   {  char token [255 + 1];
      osbool cont;
      int size;
      char *lookup;

      if ((error = xmessagetrans_enumerate_tokens (&cb, "*", token,
            sizeof token - 1, context, &cont, &size, &context)) != NULL)
         goto finish;
      if (!cont) break;
      tracef ("enumerated token %s\n" _ token);

      if ((error = xmessagetrans_lookup (&cb, token, NULL, 0, NULL, NULL,
            NULL, NULL, &lookup, &size)) != NULL)
         goto finish;
      tracef ("...%s:%.*s\n" _ token _ size _ lookup);

      if ((error = lookup_insert (t, token, lookup)) != NULL)
         goto finish;
   }

   /*Update the values in the table.*/
   if ((error = lookup_insert (t, "!Messages", messages)) != NULL ||
         (error = lookup_insert (t, "!Size", (void *) size)) != NULL)
      goto finish;

finish:
   if (done_open_file)
   {  os_error *error1 = xmessagetrans_close_file (&cb);
      if (error == NULL) error = error1;
   }
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *resource_messages_free (lookup_t t)

{  char *messages;
   os_error *error = NULL;
   int size;
   tracef ("resource_messages_free\n");

   /*Has this table been used before?*/
   if ((error = lookup (t, "!Messages", (void **) &messages)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      messages = NULL;
   }

   if ((error = lookup (t, "!Size", (void **) &size)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      size = 0;
   }

   if (messages != NULL)
   {  m_FREE (messages, size);

      /*Update the values in the table.*/
      if ((error = lookup_insert (t, "!Messages", 0)) != NULL ||
            (error = lookup_insert (t, "!Size", 0)) != NULL)
         goto finish;
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
   /* Used by an app or module to load a !Sprites file into a lookup t.
    * On successful completion, all the sprite names in the file will be in
    * the lookup t, and the sprite file will be in a sprite area in
    * memory.
    * Multiple sprites files may be loaded into the same lookup table, and
    * subsequently deleted by |resource_sprites_free|.
    */

os_error *resource_sprites_alloc (lookup_t t, char *file_name)

{  os_error *error = NULL;
   int obj_type, extra_size, first, space, s,
      sprite_count, len, new_size;
   bits exec_addr, load_addr, attr;
   osspriteop_area *sprites, *tmp;

   tracef ("resource_sprites_alloc\n");

   /*Has this table been used before?*/
   if ((error = lookup (t, "!Sprites", (void **) &sprites)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      sprites = NULL;
   }

   tracef ("reading size of \"%s\"\n" _ file_name);
   if ((error = xosfile_read_no_path (file_name, &obj_type, &load_addr,
         &exec_addr, &extra_size, &attr)) != NULL)
      goto finish;
   tracef ("size of sprites file is %d\n" _ extra_size);

   if (obj_type != osfile_IS_FILE)
   {  error = xosfile_make_error (file_name, obj_type);
      goto finish;
   }

   /*Allocate some memory for the sprite area*/
   new_size = (sprites != NULL? sprites->used: 4) + extra_size;
   tracef ("allocating %d bytse for sprite area\n" _ new_size);
   if ((tmp = m_REALLOC (sprites, sprites != NULL? sprites->used: 4,
         new_size)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }
   tmp->size = new_size;

   if (sprites == NULL)
   {  /*This is the first time this sprite area has been used.*/
      tmp->first = sizeof (osspriteop_area);
      tracef ("load sprite file\n");
      if ((error = xosspriteop_load_sprite_file (osspriteop_USER_AREA, tmp,
            file_name)) != NULL)
         goto finish;
   }
   else
   {  tracef ("merge sprite file: size %d, count %d, first %d, used %d\n" _
            tmp->size _ tmp->sprite_count _ tmp->first _ tmp->used);
      if ((error = xosspriteop_merge_sprite_file (osspriteop_USER_AREA,
            tmp, file_name)) != NULL)
         goto finish;
   }
   sprites = tmp;

   /*We have to reinsert all the sprites back into the lookup table,
      since we have no way of knowing which are new, which have moved,
      etc.*/
   tracef ("read area cb\n");
   if ((error = xosspriteop_read_area_cb (osspriteop_USER_AREA, sprites,
        &extra_size, &sprite_count, &first, &space)) != NULL)
      goto finish;

   for (s = 0; s < sprite_count; s++)
   {  osspriteop_header *header;
      char name [osspriteop_NAME_LIMIT + 1];

      if ((error = xosspriteop_return_name (osspriteop_USER_AREA, sprites,
            name, osspriteop_NAME_LIMIT + 1, s + 1, &len)) != NULL)
         goto finish;

      if ((error = xosspriteop_select_sprite (osspriteop_NAME, sprites,
            (osspriteop_id) name, &header)) != NULL)
         goto finish;

      if ((error = lookup_insert (t, name, header)) != NULL)
         goto finish;
   }

   /*Update the values in the table.*/
   if ((error = lookup_insert (t, "!Sprites", sprites)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *resource_sprites_free (lookup_t t)

{  osspriteop_area *sprites;
   os_error *error = NULL;

   tracef ("resource_sprites_free\n");

   /*Has this table been used before?*/
   if ((error = lookup (t, "!Sprites", (void **) &sprites)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      sprites = NULL;
   }

   if (sprites != NULL)
   {  m_FREE (sprites, sprites->used);

      /*Update the values in the table.*/
      if ((error = lookup_insert (t, "!Sprites", 0)) != NULL)
         goto finish;
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
   /* Used by an app or module to load a Templates file into a lookup t.
      On successful completion, all the template names in the file will be
      in the lookup t and each template will be in a separate buffer
      along with its indirected data.
      Multiple templates files may be loaded into the same lookup t, and
      subsequently deleted by |resource_templates_free|.
    */

os_error *resource_templates_alloc (lookup_t t, char *file_name)

{  os_error *error = NULL;
   osbool done_open_template = FALSE;
   char template_name [wimp_TEMPLATE_NAME_LIMIT + 1];
   int context;

   tracef ("resource_templates\n");

   /*Don't need to use !Templates and !Size, because each wimp_window is
      read into a separate buffer (this is the easiest way to use the
      enumeration provided by Wimp_LoadTemplate).*/

   if ((error = xwimp_open_template (file_name)) != NULL)
      goto finish;
   done_open_template = TRUE;

   context = 0;
   while (TRUE)
   {  int size, data_size;
      resource_template *template = SKIP;

      template_name [0] = '*', template_name [1] = '\0';

      if ((error = xwimp_load_template (NULL, NULL, NULL, (font_f *) -1,
            template_name, context, &size, &data_size, &context)) != NULL)
         goto finish;
      if (context == 0) break;

      template_name [riscos_strlen (template_name)] = '\0';

      if ((template = m_ALLOC (sizeof (int) + sizeof (void *) + size +
            data_size)) == NULL)
      {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
         goto finish;
      }
      tracef ("allocated %d + %d bytes at 0x%X for window\n" _
            size _ data_size _ &template->window);

      template->data_size = data_size;
      template->data = (char *) &template->window + size;

      if ((error = xwimp_load_template (&template->window,
            template->data, template->data + data_size,
            (font_f *) -1, template_name, 0, NULL, NULL, NULL)) != NULL)
         goto finish;
      tracef ("loaded template \"%s\", %d icons\n" _ template_name _
            template->window.icon_count);

      if ((error = lookup_insert (t, template_name, template)) != NULL)
         goto finish;
   }

finish:
   if (done_open_template)
   {  os_error *error1 = xwimp_close_template ();
      if (error == NULL) error = error1;
   }
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *resource_templates_free (lookup_t t)

{  void *context;
   resource_template *template;
   os_error *error = NULL;

   tracef ("resource_templates_free\n");

   context = NULL;
   while (TRUE)
   {  if ((error = lookup_enumerate (t, NULL, (void **) &template,
            &context)) != NULL)
         goto finish;

      if (context == 0) break;

      m_FREE (template, 0);
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *resource_create_window (resource_template *template,
      wimp_w *w_out, char **data_out)

{  os_error *error = NULL;
   wimp_w w;
   char *data = NULL;
   int i;
   wimp_window *window = NULL;

   tracef ("resource_create_window\n");

   /*Make a copy of the data, if there is any.*/
   tracef ("window: data_size %d, icon_count %d\n" _ template->data_size _
         template->window.icon_count);
   if (template->data_size != 0)
   {  char **ptr;

      /*Make blocks for the new wimp_window and the new indirected data.*/
      if
      (  (window = m_ALLOC (wimp_SIZEOF_WINDOW
               (template->window.icon_count))) == NULL ||
         (data = m_ALLOC (template->data_size)) == NULL
      )
      {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
         tracef ("failed to allocate %d + %d bytes\n" _
               wimp_SIZEOF_WINDOW (template->window.icon_count) _
               template->data_size);
         goto finish;
      }

      /*Copy the definitions from the template file into these blocks.*/
      memcpy (window, &template->window,
            wimp_SIZEOF_WINDOW (template->window.icon_count));
      memcpy (data, template->data, template->data_size);

      /*Relocate the window definition to refer to this data.*/
      if ((window->flags & wimp_WINDOW_TITLE_ICON) != NONE &&
            ((window->title_flags & (wimp_ICON_TEXT | wimp_ICON_SPRITE)) !=
            NONE) &&
            (window->title_flags & wimp_ICON_INDIRECTED) != NONE)
      {  ptr = &window->title_data AS indirected_text.text;
         if (!(*ptr == NULL || (int) *ptr == +1 || (int) *ptr == -1))
            *ptr += data - template->data;

         ptr = &window->title_data AS indirected_text.validation;
         if (!(*ptr == NULL || (int) *ptr == +1 || (int) *ptr == -1))
            *ptr += data - template->data;
      }

      for (i = 0; i < window->icon_count; i++)
         if (((window->icons [i].flags & (wimp_ICON_TEXT |
               wimp_ICON_SPRITE)) != NONE) &&
               (window->icons [i].flags & wimp_ICON_INDIRECTED) != NONE)
         {  ptr = &window->icons [i].data AS indirected_text.text;
            if (!(*ptr == NULL || (int) *ptr == +1 || (int) *ptr == -1))
               *ptr += data - template->data;

            ptr = &window->icons [i].data AS indirected_text.validation;
            if (!(*ptr == NULL || (int) *ptr == +1 || (int) *ptr == -1))
               *ptr += data - template->data;
   }     }
   else
   {  window = &template->window;
      data = NULL;
   }

   if ((error = xwimp_create_window (window, &w)) != NULL)
      goto finish;
   tracef ("created w 0x%X, allocated data 0x%X\n" _ w _ data);

   if (w_out != NULL) *w_out = w;
   if (data_out != NULL) *data_out = data;

finish:
   if (template->data_size != 0)
   {  m_FREE (window, wimp_SIZEOF_WINDOW (template->window.icon_count));

      if (error != NULL) m_FREE (data, template->data_size);
   }

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *resource_delete_window (wimp_w w, char *data)

{  os_error *error = NULL;

   tracef ("resource_delete_window\n");
   tracef ("deleting w 0x%X, freeing data 0x%X\n" _ w _ data);

   if ((error = xwimp_delete_window (w)) != NULL)
      goto finish;

   m_FREE (data, 0);

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
