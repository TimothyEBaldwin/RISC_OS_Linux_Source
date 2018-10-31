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
/*tables.c*/

/*History

   15th Sep 1994 J R C Started

*/

/*From CLib*/

/*From OSLib*/
#include "colourtrans.h"
#include "os.h"
#include "osspriteop.h"

/*From Support*/
#include "m.h"
#include "riscos.h"
#include "tables.h"

typedef
   struct Mode_Descriptor
      {  bits flags;
         int xsize;
         int ysize;
         int log2_bpp;
         int frame_rate;
         int terminator;
      }
      Mode_Descriptor;

int tables_xeig, tables_yeig, tables_log2_bpp, tables_ncolour;

osspriteop_trans_tab *tables_translation = NULL, *tables_injection = NULL,
      *tables_surjection = NULL;

static osbool Found_Tables;

os_error *tables_initialise (void)

{  Found_Tables = FALSE;

   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *tables_terminate (void)

{  tracef ("tables_lose\n");

   if (Found_Tables)
   {  m_FREE (tables_translation, 0);
      m_FREE (tables_injection, 0);
      m_FREE (tables_surjection, 0);

      Found_Tables = FALSE;
   }

   return NULL;
}
/*------------------------------------------------------------------------*/
os_error *tables_ensure (void)

{  os_error *error = NULL;
   int size;

   static Mode_Descriptor Wide_Mode = {1, 800, 600, 4, -1, -1};

   tracef ("tables_find\n");

   if (!Found_Tables)
   {  tracef ("finding new tables ...\n");
      tables_translation = tables_injection = tables_surjection = NULL;
         /*Fix bug: clear these in case there's an error. J R C 9th Mar 1995*/

      /*Read new size of translation table for USE_SCALING.*/
      if ((error = xcolourtrans_generate_table
            ((os_mode) (6 << 27 | 180 << 14 | 180 << 1 | 1),
            colourtrans_CURRENT_PALETTE, colourtrans_CURRENT_MODE,
            colourtrans_CURRENT_PALETTE, NULL, 1 << 1, SKIP, SKIP,
            &size)) != NULL)
         goto finish;
      tracef ("size %d\n" _ size);

      /*Get that much store.*/
      if (size != 0)
      {  if ((tables_translation = m_ALLOC (size)) == NULL)
         {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
            goto finish;
         }
         tracef ("tables_translation 0x%X\n" _ tables_translation);

         /*Get the new table.*/
         if ((error = xcolourtrans_generate_table
               ((os_mode) (6 << 27 | 180 << 14 | 180 << 1 | 1),
               colourtrans_CURRENT_PALETTE, colourtrans_CURRENT_MODE,
               colourtrans_CURRENT_PALETTE, tables_translation, 1 << 1, SKIP,
               SKIP, NULL)) != NULL)
            goto finish;
         tracef ("filled in tables_translation\n");
      }
      else
         tables_translation = NULL;

      /*Read new size of surjection table for USE_DIFFUSION.*/
      if ((error = xcolourtrans_generate_table
            ((os_mode) (5 << 27 | 180 << 14 | 180 << 1 | 1),
            colourtrans_CURRENT_PALETTE,
            colourtrans_CURRENT_MODE, colourtrans_CURRENT_PALETTE, NULL,
            1 << 0 /*R1 is a sprite pointer*/ | 1 << 1 /*use current
            palette*/, SKIP, SKIP, &size)) != NULL)
         goto finish;
      tracef ("Surjection table size %d\n" _ size);

      /*Get that much store.*/
      if (size != 0)
      {  if ((tables_surjection = m_ALLOC (size)) == NULL)
         {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
            goto finish;
         }

         /*Get the new table.*/
         if ((error = xcolourtrans_generate_table
               ((os_mode) (5 << 27 | 180 << 14 | 180 << 1 | 1),
               colourtrans_CURRENT_PALETTE, colourtrans_CURRENT_MODE,
               colourtrans_CURRENT_PALETTE, tables_surjection, 1 << 0 /*R1 is
               a sprite pointer*/ | 1 << 1 /*use current palette*/, SKIP,
               SKIP, NULL)) != NULL)
            goto finish;
      }
      else
         tables_surjection = NULL;

      /*Same for injection table.*/
      if ((error = xcolourtrans_generate_table
            (colourtrans_CURRENT_MODE, colourtrans_CURRENT_PALETTE,
            (os_mode) &Wide_Mode /*was 5 << 27 | 180 << 14 | 180 << 1 | 1*/,
            colourtrans_CURRENT_PALETTE, NULL, 1 << 1 /*use current palette*/
            | 1 << 4 /*wide entries for deep sprites*/, SKIP, SKIP, &size))
            != NULL)
         goto finish;
      tracef ("Injection table size %d\n" _ size);

      if (size != 0)
      {  if ((tables_injection = m_ALLOC (size)) == NULL)
         {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
            goto finish;
         }

         if ((error = xcolourtrans_generate_table
               (colourtrans_CURRENT_MODE, colourtrans_CURRENT_PALETTE,
               (os_mode) &Wide_Mode
                     /*was 5 << 27 | 180 << 14 | 180 << 1 | 1*/,
               colourtrans_CURRENT_PALETTE, tables_injection, 1 << 1 /*use
               current palette*/ | 1 << 4 /*wide entries for deep sprites*/,
               SKIP, SKIP, NULL)) != NULL)
            goto finish;
      }
      else
         tables_injection = NULL;

      if (tables_surjection != 0)
         tracef ("tables_surjection [] {0x%X, 0x%X, 0x%X, ...}\n" _
               ((int *) tables_surjection) [0] _
               ((int *) tables_surjection) [1] _
               ((int *) tables_surjection) [2]);

      Found_Tables = TRUE;
      tracef ("finding new tables ... done\n");
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);

   /*Fix storage leak if not all tables found. J R C 4th Mar 1994*/
   if (error != NULL)
   {  m_FREE (tables_translation, 0);
      m_FREE (tables_injection, 0);
      m_FREE (tables_surjection, 0);
   }

   return error;
}
/*------------------------------------------------------------------------*/
os_error *tables_mode_change (void)

   /*Called on a mode change.*/

{  os_error *error = NULL;

   tracef ("tables_read_modevars\n");

   /*We need the X and Y EIG factors and lb bpp.*/
   if ((error = xos_read_mode_variable (os_CURRENT_MODE, os_MODEVAR_XEIG_FACTOR,
         &tables_xeig, NULL)) != NULL)
      goto finish;
   tracef ("tables_xeig %d\n" _ tables_xeig);

   if ((error = xos_read_mode_variable (os_CURRENT_MODE, os_MODEVAR_YEIG_FACTOR,
         &tables_yeig, NULL)) != NULL)
      goto finish;
   tracef ("tables_yeig %d\n" _ tables_yeig);

   if ((error = xos_read_mode_variable (os_CURRENT_MODE, os_MODEVAR_LOG2_BPP,
         &tables_log2_bpp, NULL)) != NULL)
      goto finish;
   tracef ("tables_log2_bpp %d\n" _ tables_log2_bpp);

   if ((error = xos_read_mode_variable (os_CURRENT_MODE, os_MODEVAR_NCOLOUR,
         &tables_ncolour, NULL)) != NULL)
      goto finish;
   tracef ("tables_ncolour %d\n" _ tables_ncolour);

   if ((error = tables_terminate ()) != NULL)
         /*we know this does nothing more than free the memory, so it's o k.*/
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
