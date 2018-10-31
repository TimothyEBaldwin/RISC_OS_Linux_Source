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
/*lookup.c - simple lookup facilities*/

/*From CLib*/
#include <limits.h>
#include <stdlib.h>
#include <string.h>

/*From OSLib*/
#include "os.h"
#include "territory.h"

/*From Support*/
#include "lookup.h"
#include "m.h"
#include "riscos.h"
#include "trace.h"

typedef
   struct
   {  char *token;
      void *ptr;
   }
   Entry;

struct lookup_t
   {  int count;
      Entry *entries;
   };

#if 0
/*------------------------------------------------------------------------*/
static os_error *Trace (lookup_t t)

{  int i;

   tracef ("Trace\n");
   tracef ("t 0x%X\n" _ t);
   tracef ("count %d\n" _ t->count);
   tracef ("t->entries 0x%X\n" _ t->entries);
   for (i = 0; i < t->count; i++)
      tracef ("%-3d: 0x%X, 0x%X\n" _ i _
            ((int *) t->entries) [2*i] _ ((int *) t->entries) [2*i + 1]);
   for (i = 0; i < t->count; i++)
      if (t->entries [i].token != NULL)
         tracef ("%-3d: %s (0x%X) -> 0x%X\n" _
               i _ t->entries [i].token _ t->entries [i].token _
               t->entries [i].ptr);
      else
         tracef ("%-3d: empty\n" _ i);

   return NULL;
}
#endif
/*------------------------------------------------------------------------*/
os_error *lookup_new (lookup_t *t_out, int start_count)

{  int i;
   os_error *error = NULL;
   lookup_t t;

   tracef ("lookup_new\n");
   if ((t = m_ALLOC (sizeof *t)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   if ((t->entries = m_ALLOC (start_count*sizeof (Entry))) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }
   t->count = start_count;

   tracef ("clearing out entries 0, ..., %d\n" _ t->count - 1);
   for (i = 0; i < t->count; i++)
      t->entries [i].token = NULL;

   if (t_out != NULL) *t_out = t;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
      if (t != NULL)
      {  m_FREE (t->entries, 0);
         m_FREE (t, sizeof *t);
   }  }

   return error;
}
/*------------------------------------------------------------------------*/
os_error *lookup_delete (lookup_t t)

{  tracef ("lookup_delete\n");

   if (t != NULL)
   {  int i;

      for (i = 0; i < t->count && t->entries [i].token != NULL; i++)
         m_FREE (t->entries [i].token,
               riscos_strlen (t->entries [i].token) + 1);

      m_FREE (t->entries, t->count*sizeof (Entry));
      m_FREE (t, sizeof *t);
   }

   return NULL;
}
/*------------------------------------------------------------------------*/
static os_error *Lookup (lookup_t t, char *s, Entry **e_out)

   /* Return the entry corresponding to the token |s|, or |NULL| if it is
    * not in the table.
    * There are three possibilities on exit:
    *    *e_out != NULL && (*e_out)->token == NULL:
    *          |s| was not in the table, but there is a slot to put it in
    *    *e_out != NULL && (*e_out)->token != NULL:
    *          |s| was in the table before
    *    *e_out == NULL:
    *          |s| is not in the table, and the table should be extended.
    */

{  int i, collate;
   os_error *error = NULL;
   Entry *e = NULL;

   tracef ("Lookup\n");

   for (i = 0; i < t->count; i++)
   {  if (t->entries [i].token == NULL)
      {  e = &t->entries [i];
         tracef ("found an empty slot (%d)\n" _ i);
         break;
      }

      /*Attempt to fix MED-4237: fall back to bytewise comparison if there
         is no territory. J R C 23rd Feb 1995*/
      /*Second attempt: the first stupidly still kept the erorr return from
         xterritory_collate() in |error|.*/
      if (xterritory_collate (territory_CURRENT, s, t->entries [i].token,
            territory_IGNORE_CASE, &collate) != NULL)
         collate = strcmp (s, t->entries [i].token);

      if (collate == 0)
      {  e = &t->entries [i];
         tracef ("found a match (%d)\n" _ i);
         break;
      }
   }

   if (e == NULL) tracef ("no slot found\n");

   if (e_out != NULL) *e_out = e;

/*finish:*/
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *lookup (lookup_t t, char *s, void **ptr_out)

{  os_error *error = NULL;
   Entry *e;

   tracef ("lookup (0x%X, \"%s\",)\n" _ t _ s);

   if ((error = Lookup (t, s, &e)) != NULL)
      goto finish;

   if (e == NULL || e->token == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_ANY, "NoAny", s);
      goto finish;
   }

   if (ptr_out != NULL) *ptr_out = e->ptr;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *lookup_insert (lookup_t t, char *s, void *ptr)

{  os_error *error = NULL;
   Entry *e;

   tracef ("lookup_insert (0x%X, \"%s\", 0x%X)\n" _ t _ s _ ptr);

   if ((error = Lookup (t, s, &e)) != NULL)
      goto finish;

   if (e == NULL)
   {  Entry *tmp;

      tracef ("extending the table to count %d (now at 0x%X)\n" _
            2*t->count _ t->entries);
      if ((tmp = m_REALLOC (t->entries, t->count*sizeof (Entry),
            2*t->count*sizeof (Entry))) == NULL)
      {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
         goto finish;
      }
      t->entries = tmp;
      tracef ("table extended (now at 0x%X)\n" _ t->entries);

      tracef ("clearing out entries %d, ..., %d\n" _
            t->count _ 2*t->count - 1);
      memset (t->entries + t->count, '\0', t->count*sizeof (Entry));

      e = &t->entries [t->count];

      t->count *= 2;
      tracef ("new count %d\n" _ t->count);
   }

   if (e->token == NULL && (e->token = m_ALLOC (riscos_strlen (s) + 1)) ==
         NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   riscos_strcpy (e->token, s); /*case may have changed*/
   e->ptr = ptr;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
os_error *lookup_enumerate (lookup_t t, char **token, void **ptr,
      void **context)

{  tracef ("lookup_enumerate\n");

   if ((int) *context < t->count &&
         t->entries [(int) *context].token != NULL)
   {  if (token != NULL) *token = t->entries [(int) *context].token;
      if (ptr   != NULL) *ptr   = t->entries [(int) *context].ptr;

      *context = (void *) ((int) *context + 1);
   }
   else
      /*Not found.*/
      *context = NULL;

   return NULL;
}
