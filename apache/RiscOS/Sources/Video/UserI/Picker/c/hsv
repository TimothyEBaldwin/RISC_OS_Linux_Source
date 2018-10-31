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
/*hsv.c - entry points for ColourPicker module*/

/*History

   20th Aug 1993 J R C Started

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
#include "macros.h"
#include "messagetrans.h"
#include "os.h"
#include "osfind.h"
#include "osgbpb.h"
#include "osspriteop.h"
#include "resourcefs.h"
#include "territory.h"

/*From Support*/
#include "icon.h"
#include "lookup.h"
#include "m.h"
#include "resource.h"
#include "riscos.h"
#include "steppable.h"
#include "tables.h"
#include "trace.h"

/*Local*/
#include "dialogue.h"
#include "files.h"
#include "helpreply.h"
#include "hsv.h"
#include "main.h"
#include "model.h"
#include "tables.h"

#if TRACE
   #define XTRACE
#endif

/*We provide three ways of working:
      lots of little rectangles (USE_RECTANGLES)
      a 16M colour sprite with lots of colours, scaled (USE_SCALING)
      an error-diffused sprite of the current screen mode (USE_DIFFUSION)
*/
#define RECTANGLES 24
#define SCALES     64 /*was 128 J R C 19th Apr 1994*/

lookup_t hsv_messages, hsv_templates;

static colourpicker_model Model;

static resource_template *HSV;

static wimp_i Desktop_Colours [] =
   {  hsv_HSV_COLOUR0, hsv_HSV_COLOUR1, hsv_HSV_COLOUR2, hsv_HSV_COLOUR3,
      hsv_HSV_COLOUR4, hsv_HSV_COLOUR5, hsv_HSV_COLOUR6, hsv_HSV_COLOUR7,
      hsv_HSV_COLOUR8, hsv_HSV_COLOUR9, hsv_HSV_COLOUR10, hsv_HSV_COLOUR11,
      hsv_HSV_COLOUR12, hsv_HSV_COLOUR13, hsv_HSV_COLOUR14, hsv_HSV_COLOUR15
   };

static int Suppress = 0;

static char *Message_File_Name, *Template_File_Name;

static osbool Medusa;

static os_error *Use_Rectangles (wimp_draw *draw, int *h, int *s, int *v,
      int *x, int *y, int xlimit, int ylimit)

{  int i, j, r, g, b;
   os_error *error = NULL;
   os_colour c;

   tracef ("Use_Rectangles\n");

   for (j = 0; j < RECTANGLES; j++)
      for (i = 0; i < RECTANGLES; i++)
      {  *x = i*xlimit/RECTANGLES;
         *y = j*ylimit/RECTANGLES;

         if (xcolourtrans_convert_hsv_to_rgb
               (*h != 0? *h: 360*colourtrans_COLOUR_RANGE, *s, *v,
               &r, &g, &b) != NULL)
            c = os_COLOUR_BLACK;
         else
            c = RATIO (r*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_RSHIFT |
                  RATIO (g*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_GSHIFT |
                  RATIO (b*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_BSHIFT;

         if
         (  (error = xcolourtrans_set_gcol (c, colourtrans_SET_FG_GCOL |
                  colourtrans_USE_ECFS_GCOL, os_ACTION_OVERWRITE, NULL, NULL)) !=
                  NULL ||

            (  error = xos_plot
               (  os_MOVE_TO,
                  icon_ratio
                  (  HSV->window.icons [hsv_HSV_SLICE].extent.x0,
                     HSV->window.icons [hsv_HSV_SLICE].extent.x1,
                     i, 0, RECTANGLES
                  ) + draw->box.x0 - draw->xscroll,
                  icon_ratio
                  (  HSV->window.icons [hsv_HSV_SLICE].extent.y0,
                     HSV->window.icons [hsv_HSV_SLICE].extent.y1,
                     j, 0, RECTANGLES
                  ) + draw->box.y1 - draw->yscroll
            )  ) != NULL ||

            (  error = xos_plot
               (  os_PLOT_TO | os_PLOT_RECTANGLE,
                  icon_ratio
                  (  HSV->window.icons [hsv_HSV_SLICE].extent.x0,
                     HSV->window.icons [hsv_HSV_SLICE].extent.x1,
                     i + 1, 0, RECTANGLES
                  ) + draw->box.x0 - draw->xscroll - 1,
                  icon_ratio
                  (  HSV->window.icons [hsv_HSV_SLICE].extent.y0,
                     HSV->window.icons [hsv_HSV_SLICE].extent.y1,
                     j + 1, 0, RECTANGLES
                  ) + draw->box.y1 - draw->yscroll - 1
            )  ) != NULL
         )
            goto finish;
         trace_f (NULL _ 0 _ ".");
      }

   trace_f (NULL _ 0 _ "\n");

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Use_Scaling (wimp_draw *draw, int *h, int *s, int *v,
      int *x, int *y, int xlimit, int ylimit)

{  typedef struct {osspriteop_header header;
         int body [SCALES] [SCALES];} sprite;

   os_factors factors;
   os_error *error = NULL;
   sprite *slice = NULL;
   int i, j, r, g, b;
   os_colour c;

   static osspriteop_header Slice_Header =
      {  /*size*/ sizeof (osspriteop_header) +
               sizeof (int)*SQR (SCALES),
         /*name*/ "slice\0\0\0\0\0\0",
         /*width*/ SCALES - 1,
         /*height*/ SCALES - 1,
         /*left_bit*/ 0,
         /*right_bit*/ 31,
         /*image*/ sizeof (osspriteop_header),
         /*mask*/ sizeof (osspriteop_header),
         /*mode*/ (os_mode) (6 << 27 | 180 << 14 | 180 << 1 | 1)
      };

   tracef ("Use_Scaling\n");

   if ((error = tables_ensure ()) != NULL)
      goto finish;
   tracef ("found tables\n");

   if ((slice = m_ALLOC (sizeof *slice + 4)) == NULL)
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }
   tracef ("allocated %d bytes\n" _ sizeof *slice);

   /*Fill in the sprite - first the header, then the body.*/
   memcpy (&slice->header, &Slice_Header, sizeof Slice_Header);
         /*was slice->header = Slice_Header;*/
   tracef ("copied %d bytes for header\n" _ sizeof Slice_Header);

   tracef ("xlimit %d, ylimit %d\n" _ xlimit _ ylimit);
   for (j = 0; j < SCALES; j++)
      for (i = 0; i < SCALES; i++)
      {  os_error *e;

      #ifdef XTRACE
         tracef ("i %d, j %d, x 0x%X, y 0x%X\n" _ i _ j _ x _ y);
      #endif
         *x = i*xlimit/SCALES;
         *y = j*ylimit/SCALES;
      #ifdef XTRACE
         tracef ("*x %d, *y %d\n" _ *x _ *y);
      #endif

      #ifdef XTRACE
         tracef ("converting (h, s, v) (%d, %d, %d)\n" _
               *h != 0? *h: 360*colourtrans_COLOUR_RANGE _ *s _ *v);
      #endif
         e = xcolourtrans_convert_hsv_to_rgb
               (*h != 0? *h: 360*colourtrans_COLOUR_RANGE, *s, *v,
               &r, &g, &b);
      #ifdef XTRACE
         tracef ("-> (r, g, b) (%d, %d, %d)\n" _ r _ g _ b);
      #endif

         if (e != NULL)
            c = os_COLOUR_BLACK;
         else
            c = RATIO (r*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_RSHIFT |
                  RATIO (g*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_GSHIFT |
                  RATIO (b*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
                  os_BSHIFT;
      #ifdef XTRACE
         tracef ("c 0x%X\n" _ c);
      #endif

         slice->body [SCALES - 1 - j] [i] = c >> 8;
         trace_f (NULL _ 0 _ ".");
      }
   trace_f (NULL _ 0 _ "\n");

   /*Then plot it at the right position and scale.*/
   factors.xmul = HSV->window.icons [hsv_HSV_SLICE].extent.x1 -
         HSV->window.icons [hsv_HSV_SLICE].extent.x0 >> tables_xeig;
   factors.ymul = HSV->window.icons [hsv_HSV_SLICE].extent.y1 -
         HSV->window.icons [hsv_HSV_SLICE].extent.y0 >> tables_yeig;
   factors.xdiv = SCALES;
   factors.ydiv = SCALES;

   tracef ("calling xosspriteop_put_sprite_scaled ...\n");
   if ((error = xosspriteop_put_sprite_scaled (osspriteop_PTR,
         (osspriteop_area *) 0x100, (osspriteop_id) slice,
         HSV->window.icons [hsv_HSV_SLICE].extent.x0 + draw->box.x0 -
            draw->xscroll,
         HSV->window.icons [hsv_HSV_SLICE].extent.y0 + draw->box.y1 -
            draw->yscroll,
         os_ACTION_OVERWRITE, &factors, tables_translation)) != NULL)
      goto finish;
   tracef ("calling xosspriteop_put_sprite_scaled ... done\n");

#ifdef XTRACE
   {  os_f file;

      static int Area [3] = {/*count*/ 1, /*size*/ 16,
            16 + sizeof (int)*SQR (SCALES)};

      /*Write the sprite and translation table to files.*/
      xosfind_openout
            (osfind_NO_PATH | osfind_ERROR_IF_DIR | osfind_ERROR_IF_ABSENT,
            "$.HSVSprite", NULL, &file);
      xosgbpb_write (file, (byte *) Area, sizeof Area, NULL);
      xosgbpb_write (file, (byte *) slice, sizeof *slice, NULL);
      xosfind_close (file);

      xosfind_openout
            (osfind_NO_PATH | osfind_ERROR_IF_DIR | osfind_ERROR_IF_ABSENT,
            "$.CPTTab", NULL, &file);
      xosgbpb_write (file, (byte *) tables_translation, 256, NULL);
      xosfind_close (file);

      if (((int *) tables_translation) [0] == ((int *) tables_translation) [2])
      {  xosfind_openout (osfind_NO_PATH | osfind_ERROR_IF_DIR |
               osfind_ERROR_IF_ABSENT,
               "$.CP32K", NULL, &file);
         xosgbpb_write (file, (byte *) ((int *) tables_translation) [1],
               32*1024, NULL);
         xosfind_close (file);
   }  }
#endif

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   m_FREE (slice, sizeof *slice + 4);

   return error;
}
#if 0
/*------------------------------------------------------------------------*/
static os_error *Use_Diffusion (wimp_draw *draw, int *h, int *s, int *v,
      int *x, int *y, int xlimit, int ylimit)

{  typedef struct {osspriteop_header header; int body [1];} sprite;

   os_error *error = NULL;
   sprite *slice = NULL;
   int xsize, ysize, i, j;
   byte (*surj) [32] [32] [32];
   unsigned short *inj;

   static osspriteop_header Slice_Header =
      {  /*size*/ SKIP,
         /*name*/ "slice\0\0\0\0\0\0",
         /*width*/ SKIP,
         /*height*/ SKIP,
         /*left_bit*/ 0,
         /*right_bit*/ 31,
         /*image*/ sizeof (osspriteop_header),
         /*mask*/ sizeof (osspriteop_header),
         /*mode*/ SKIP
      };

   tracef ("Use_Diffusion: xlimit %d, ylimit %d\n" _ xlimit _ ylimit);

   if ((error = tables_ensure ()) != NULL)
      goto finish;

   surj = (byte (*) [32] [32] [32]) ((int *) tables_surjection) [1];
   inj  = (unsigned short *) tables_injection;

   /*Make a sprite to match what's on the screen.*/
   xsize = 256 >> tables_xeig;
         /*width in pixels*/
   ysize = 256 >> tables_yeig;
         /*height in pixels*/
   tracef ("sprite size (%d, %d)\n" _ xsize _ ysize);

   /*Note - a lot of these calculations work only because the screen
      sprite is a convenient size.*/
   Slice_Header.size   = sizeof (osspriteop_header) +
         (xsize*ysize << tables_log2_bpp >> 3);
   Slice_Header.width  = (xsize >> 5 - tables_log2_bpp) - 1;
   Slice_Header.height = ysize - 1;
   Slice_Header.mode   = tables_log2_bpp + 1 << 27 | 180 >> tables_yeig <<
14 |
         180 >> tables_xeig << 1 | 1;

   if ((slice = m_ALLOC (Slice_Header.size + 4)) == NULL)
         /*WARNING: MUST add 4 here, or the kernel might go off the end of
         the RMA block*/
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   /*Fill in the sprite - first the header, then the body.*/
   memcpy (&slice->header, &Slice_Header, sizeof Slice_Header);

   for (j = 0; j < ysize; j++)
   {  int re = 0, ge = 0, be = 0, /*clear the error each row*/
         xo = (Slice_Header.width + 1)*(ysize - 1 - j), shift = 0;

      /*Clear the row to 0 so we can disjoin the pixels in conveniently
         (with a comma).*/
      for (i = 0; i <= Slice_Header.width; i++)
            /*so that's what that field is there for!*/
         slice->body [xo + i] = 0;

      for (i = 0; i < xsize; i++)
      {  byte best;
         int r, g, b;

         *x = xlimit*i/xsize;
         *y = ylimit*j/ysize;
         tracef ("target colour (h %d, s %d, v %d), "
               "error (r %d, g %d, b %d)\n" _
               *h _ *s _ *v _ r _ g _ b);

         if (xcolourtrans_convert_hsv_to_rgb
               (*h != 0? *h: 360*colourtrans_COLOUR_RANGE, *s, *v,
               &r, &g, &b) != NULL)
            r = g = b = 0;
         tracef ("(r, g, b)/([0; 1] << 16) = (%d, %d, %d)\n" _ r _ g _ b);

         re += r, ge += g, be += b;

         /*First find the best fit among the screen colours.*/
         best = (*surj) [MAX (0, MIN (31*be/colourtrans_COLOUR_RANGE, 31))]
               [MAX (0, MIN (31*ge/colourtrans_COLOUR_RANGE, 31))]
               [MAX (0, MIN (31*re/colourtrans_COLOUR_RANGE, 31))];
         tracef ("best %d\n" _ best);

         slice->body [xo] |= best << shift;
         if ((shift += 1 << tables_log2_bpp) == 32)
            xo++, shift = 0;

         /*Pass forward errors based on what we wanted to plot in the
            first place. First get the colour actually plotted as
            (r, g, b).*/
         re -= colourtrans_COLOUR_RANGE*(inj [best] & 0x1F)/31;
         ge -= colourtrans_COLOUR_RANGE*((inj [best] & 0x3E0) >> 5)/31;
         be -= colourtrans_COLOUR_RANGE*((inj [best] & 0x7C00) >> 10)/31;
   }  }

#ifdef XTRACE
   {  os_f file;

      static osspriteop_area Area =
         {  /*size*/ SKIP,
            /*sprite_count*/ 1,
            /*first*/ sizeof (osspriteop_area),
            /*used*/ SKIP
         };

      Area.used = sizeof (osspriteop_area) + Slice_Header.size;

      /*Write the sprite to a file.*/
      xosfind_openout
            (osfind_osfind_NO_PATH | ERROR_IF_DIR | osfind_ERROR_IF_ABSENT,
            "$.CPSprite", NULL, &file);
      xosgbpb_write (file, (byte *) &Area.sprite_count,
            sizeof Area - sizeof Area.size);
      xosgbpb_write (file, (byte *) slice, Slice_Header.size);
      xosfind_close (file);
   }
#endif

   /*Then plot it at the right position - no need for translation table
      or scaling factors.*/
   tracef ("calling xosspriteop_put_sprite_scaled ...\n");
   if ((error = xosspriteop_put_sprite_scaled (osspriteop_PTR,
         (osspriteop_area *) 0x100, (osspriteop_id) slice,
         HSV->window.icons [hsv_HSV_SLICE].extent.x0 + draw->box.x0 -
            draw->xscroll,
         HSV->window.icons [hsv_HSV_SLICE].extent.y0 + draw->box.y1 -
            draw->yscroll,
         os_ACTION_OVERWRITE, NULL, NULL)) != NULL)
      goto finish;
   tracef ("calling xosspriteop_put_sprite_scaled ... done\n");

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   m_FREE (slice, Slice_Header.size);

   return error;
}
#endif
/*------------------------------------------------------------------------*/
static os_colour Colour (hsv_colour *hsv)

   /*Returns the OS_Colour for the given model.*/

{  int r, g, b;

   tracef ("Colour\n");

   return
      xcolourtrans_convert_hsv_to_rgb
            (hsv->hue != 0? hsv->hue: 360*colourtrans_COLOUR_RANGE,
            hsv->saturation, hsv->value, &r, &g, &b) != NULL?
      os_COLOUR_BLACK:
      RATIO (r*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_RSHIFT |
      RATIO (g*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_GSHIFT |
      RATIO (b*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) << os_BSHIFT;
}
/*------------------------------------------------------------------------*/
static os_error *Plot (wimp_draw *draw, int *h, int *s, int *v,
      int *x, int *y, int xlimit, int ylimit)

{  os_error *error = NULL;
   os_box screen;

   tracef ("Plot\n");

   /*Work out the screen soordinates of the colour slice.*/
   screen = HSV->window.icons [hsv_HSV_SLICE].extent;
   screen.x0 += draw->box.x0 - draw->xscroll;
   screen.x1 += draw->box.x0 - draw->xscroll;
   screen.y0 += draw->box.y1 - draw->yscroll;
   screen.y1 += draw->box.y1 - draw->yscroll;

   /*If the overlap is empty, do nothing.*/
   if (MIN (screen.x1, draw->clip.x1) > MAX (screen.x0, draw->clip.x0) &&
         MIN (screen.y1, draw->clip.y1) > MAX (screen.y0, draw->clip.y0))
   {  /*There are various possibilities for choosing between the strategies,
         but
         (a) you cannot do USE_SCALING on a non-Medusa;
         (b) USE_SCALING looks pretty hopeless with <= 256 colours;
         (c) it would take extra effort to make USE_DIFFUSION work on a non-
             medusa, beause of the absence of the 32K tables;
         (d) anyway, I can't get USE_DIFFUSION to work!
      */
      if (Medusa && tables_log2_bpp > 3)
      {  if ((error = Use_Scaling (draw, h, s, v, x, y, xlimit, ylimit))
               != NULL &&
               (error = Use_Rectangles (draw, h, s, v, x, y, xlimit, ylimit))
               != NULL)
            goto finish;
      }
      else
      {  if ((error = Use_Rectangles (draw, h, s, v, x, y, xlimit, ylimit))
               != NULL)
            goto finish;
   }  }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Decode (colourpicker_colour *colour,
      int *h, int *s, int *v, int **x, int **y, int *xlimit, int *ylimit)

{  os_error *error = NULL;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_i which [2];

   tracef ("Decode\n");

   if ((error = xwimp_which_icon (hsv->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   switch (which [0] - hsv->first_i)
   {  case hsv_HSV_HUESLICE:
         tracef ("hue slice\n");
         *h = hsv->hue;
         *x = s; *xlimit = colourtrans_COLOUR_RANGE;
         *y = v; *ylimit = colourtrans_COLOUR_RANGE;
      break;

      case hsv_HSV_SATURATIONSLICE:
         tracef ("saturation slice\n");
         *y = h; *ylimit = 360*colourtrans_COLOUR_RANGE;
         *s = hsv->saturation;
         *x = v; *xlimit = colourtrans_COLOUR_RANGE;
      break;

      case hsv_HSV_VALUESLICE:
         tracef ("value slice\n");
         *x = h; *xlimit = 360*colourtrans_COLOUR_RANGE;
         *y = s; *ylimit = colourtrans_COLOUR_RANGE;
         *v = hsv->value;
      break;

      default:
         tracef ("default!\n");
         return NULL;
      break;
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Update (colourpicker_colour *colour)

{  os_error *error = NULL;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   osbool more;
   wimp_draw update;
   int *x, *y, h, s, v, xlimit, ylimit;

   tracef ("Update\n");

   if ((error = Decode (colour, &h, &s, &v, &x, &y, &xlimit, &ylimit)) !=
         NULL)
      goto finish;

   update.w = hsv->main_w;
   update.box = HSV->window.icons [hsv_HSV_SLICE].extent;
   tracef ("slice extent ((%d, %d), (%d, %d))\n" _
         update.box.x0 _ update.box.y0 _ update.box.x1 _ update.box.y1);
   if ((error = xwimp_update_window (&update, &more)) != NULL)
      goto finish;

   while (more)
   {  if ((error = Plot (&update, &h, &s, &v, x, y, xlimit, ylimit)) !=
            NULL)
         goto finish;

      if ((error = xwimp_get_rectangle (&update, &more)) != NULL)
         goto finish;
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Value_Changed (steppable_s v, int value, osbool dragging,
      void *h)

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_i which [2];
   osbool update;

   tracef ("Value_Changed\n");

   /*If the value that has changed is the z-axis steppable, we have to
      invalidate the colour slice.*/
   if ((error = xwimp_which_icon (hsv->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   /*Update the record for this dialogue.*/
   if (v == hsv->hue_steppable)
   {  tracef ("HUE changed to %d\n" _ value);
      hsv->hue = value;
      update = which [0] == hsv->first_i + hsv_HSV_HUESLICE;
   }
   else if (v == hsv->saturation_steppable)
   {  tracef ("SATURATION changed to %d\n" _ value);
      hsv->saturation = value;
      update = which [0] == hsv->first_i + hsv_HSV_SATURATIONSLICE;
   }
   else if (v == hsv->value_steppable)
   {  tracef ("VALUE changed to %d\n" _ value);
      hsv->value = value;
      update = which [0] == hsv->first_i + hsv_HSV_VALUESLICE;
   }
   else
      return NULL;

   colour->colour = Colour (hsv);

   if (Suppress > 0)
      Suppress--;
   else
   {  if (update)
         if ((error = Update (colour)) != NULL)
            goto finish;

      /*if (colour->colour != old_colour) Fix MED-4410: can't do this because
         if we change from one colour to another with the same V, we lose the
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
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
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
   hsv_colour *hsv = (hsv_colour *) colour->info;
   steppable_s previous;
   int value, limit, scale;
   char s [20];
   wimp_icon_state state;

   NOT_USED (v)

   tracef ("Caret_Moved\n");

   tracef ("caret moved to steppable with writable %d; hsv->caret_i %d\n" _
         i _ hsv->caret_i);
   if (i != hsv->caret_i)
   {  if (hsv->caret_i != -1)
      {  switch (hsv->caret_i - hsv->first_i)
         {  case hsv_HSV_HUEDEGREES:
               previous = hsv->hue_steppable;
               limit = 360*colourtrans_COLOUR_RANGE;
               scale = 1;
            break;

            case hsv_HSV_SATURATIONPERCENT:
               previous = hsv->saturation_steppable;
               limit = colourtrans_COLOUR_RANGE;
               scale = 100;
            break;

            case hsv_HSV_VALUEPERCENT:
               previous = hsv->value_steppable;
               limit = colourtrans_COLOUR_RANGE;
               scale = 100;
            break;

            default:
               return NULL;
            break;
         }

         /*Get the string from the icon that used to have the caret.*/
         state.w = w;
         state.i = hsv->caret_i;
         if ((error = xwimp_get_icon_state (&state)) != NULL)
            goto finish;
         tracef ("previous text: \"%s\"\n" _ icon_TEXT (&state.icon));

         /*Make the string representation for the current steppable value.*/
         if ((error = steppable_get_value (previous, &value)) != NULL)
            goto finish;
         tracef ("current steppable value: %d\n" _ value);
         riscos_format_fixed (s, RATIO (10*scale*value,
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
                  10*scale)), limit);
            tracef ("cooked current icon value: %d\n" _ value);

            if ((error = steppable_set_value (previous, value)) != NULL)
               goto finish;
         }

      #if 0
         /*Get the value from the icon that used to have the caret.*/
         if ((error = icon_scan_fixed (w, hsv->caret_i, &value, 10)) != NULL)
            goto finish;

         /*That's scaled.*/
         value = RATIO (colourtrans_COLOUR_RANGE*value, 10*scale);

         /*Get the current value of the steppable.*/
         if ((error = steppable_get_value (previous, &old_value)) != NULL)
            goto finish;

         /*Set that steppable to have the same value.*/
         tracef ("new value %d, old value %d\n" _ value _ old_value);
         if (value != old_value)
         {  /*Apply the minimum and maximum for this steppable.*/
            value = MIN (MAX (0, value), limit);

            if ((error = steppable_set_value (previous, value)) != NULL)
               goto finish;
         }
      #endif
      }

      tracef ("updating new icon\n");
      hsv->caret_i = i;
      tracef ("hsv->caret_i %d\n" _ hsv->caret_i);
   }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
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
static os_error *Set_Position (hsv_colour *hsv, os_coord *pos,
      osbool start_drag)

   /*Update the steppables to follow the mouse position given, optionally
      also starting a drag.*/

{  os_error *error = NULL;
   wimp_window_state state;
   int x, y, xlimit, ylimit;
   wimp_i which [2];
   steppable_s xsteppable, ysteppable;

   tracef ("Set_Position ((%d, %d))\n" _ pos->x _ pos->y);

   /*Which way up is everything?*/
   if ((error = xwimp_which_icon (hsv->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   switch (which [0] - hsv->first_i)
   {  case hsv_HSV_HUESLICE:
         tracef ("hue slice\n");
         xsteppable = hsv->saturation_steppable;
         ysteppable = hsv->value_steppable;
         xlimit = colourtrans_COLOUR_RANGE;
         ylimit = colourtrans_COLOUR_RANGE;
      break;

      case hsv_HSV_SATURATIONSLICE:
         tracef ("saturation slice\n");
         xsteppable = hsv->value_steppable;
         ysteppable = hsv->hue_steppable;
         xlimit = colourtrans_COLOUR_RANGE;
         ylimit = 360*colourtrans_COLOUR_RANGE;
      break;

      case hsv_HSV_VALUESLICE:
         tracef ("value slice\n");
         xsteppable = hsv->hue_steppable;
         ysteppable = hsv->saturation_steppable;
         xlimit = 360*colourtrans_COLOUR_RANGE;
         ylimit = colourtrans_COLOUR_RANGE;
      break;

      default:
         tracef ("default\n");
         return FALSE;
      break;
   }

   state.w = hsv->main_w;
   if ((error = xwimp_get_window_state (&state)) != NULL)
      goto finish;

   x = icon_ratio (0, xlimit,
         pos->x + state.xscroll - state.visible.x0,
         HSV->window.icons [hsv_HSV_SLICE].extent.x0,
         HSV->window.icons [hsv_HSV_SLICE].extent.x1);

   y = icon_ratio (0, ylimit,
         pos->y + state.yscroll - state.visible.y1,
         HSV->window.icons [hsv_HSV_SLICE].extent.y0,
         HSV->window.icons [hsv_HSV_SLICE].extent.y1);
   tracef ("   = ratio of %d/%d\n" _ y _ ylimit);
      /*Fix MED-1920 use SLICE not [XY]TRACK, or value can go -ve and kill
      WIMP. J R C 17th Jan 1994*/

   tracef ("setting values\n");
   Suppress = 1;
   if ((error = steppable_set_value (xsteppable, x)) != NULL ||
         (error = steppable_set_value (ysteppable, y)) != NULL)
      goto finish;

   if (start_drag)
   {  wimp_drag drag;

      drag.type = wimp_DRAG_USER_POINT; /*no graphics*/
      drag.bbox.x0 = HSV->window.icons [hsv_HSV_SLICE].extent.x0 +
            state.visible.x0 - state.xscroll;
      drag.bbox.y0 = HSV->window.icons [hsv_HSV_SLICE].extent.y0 +
            state.visible.y1 - state.yscroll;
      drag.bbox.x1 = HSV->window.icons [hsv_HSV_SLICE].extent.x1 +
            state.visible.x0 - state.xscroll;
      drag.bbox.y1 = HSV->window.icons [hsv_HSV_SLICE].extent.y1 +
            state.visible.y1 - state.yscroll;
         /*other fields not used*/

      tracef ("Starting drag, bbox ((%d, %d), (%d, %d))\n" _
         drag.bbox.x0 _ drag.bbox.y0 _ drag.bbox.x1 _ drag.bbox.y1);
      if ((error = xwimp_drag_box (&drag)) != NULL)
         goto finish;

      (void) task_claim (hsv->r, wimp_NULL_REASON_CODE);

      hsv->dragging = TRUE;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Slice (void *h, void *b, osbool *unclaimed)

   /* Click on hsv_HSV_HUESLICE, hsv_HSV_SATURATIONSLICE or
      hsv_HSV_VALUESLICE.*/

{  wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_icon_state state;
   wimp_i hknob, htrack, sknob, strack, vknob, vtrack, first_i;
   steppable_steppable steppable;

   NOT_USED (unclaimed)

   tracef ("Slice: w 0x%X, i %d\n" _ pointer->w _ pointer->i);

   /*If this is already the selected icon, do nothing.*/
   state.w = pointer->w;
   state.i = pointer->i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;
   if ((state.icon.flags & wimp_ICON_SELECTED) == NONE)
   {  first_i = hsv->first_i;

      /*Set the icons to the proper amount of selectedness.*/
      if ((error = xwimp_set_icon_state (pointer->w,
            hsv->first_i + hsv_HSV_HUESLICE,
            pointer->i == hsv->first_i + hsv_HSV_HUESLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w,
            hsv->first_i + hsv_HSV_SATURATIONSLICE,
            pointer->i == hsv->first_i + hsv_HSV_SATURATIONSLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w,
            hsv->first_i + hsv_HSV_VALUESLICE,
            pointer->i == hsv->first_i + hsv_HSV_VALUESLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;

      /*Deregister all the existing steppables.*/
      if
      (  (error = steppable_deregister (hsv->hue_steppable)) != NULL ||
         (error = steppable_deregister (hsv->saturation_steppable)) != NULL
               ||
         (error = steppable_deregister (hsv->value_steppable)) != NULL
      )
         goto finish;

      /*We need to know the relationship between (x, y, z) and (h, s, v).*/
      switch (pointer->i - hsv->first_i)
      {  case hsv_HSV_HUESLICE:
            hknob  = hsv_HSV_ZKNOB;
            htrack = hsv_HSV_ZTRACK;

            sknob  = hsv_HSV_XKNOB;
            strack = hsv_HSV_XTRACK;

            vknob  = hsv_HSV_YKNOB;
            vtrack = hsv_HSV_YTRACK;
         break;

         case hsv_HSV_SATURATIONSLICE:
            hknob  = hsv_HSV_YKNOB;
            htrack = hsv_HSV_YTRACK;

            sknob  = hsv_HSV_ZKNOB;
            strack = hsv_HSV_ZTRACK;

            vknob  = hsv_HSV_XKNOB;
            vtrack = hsv_HSV_XTRACK;
         break;

         case hsv_HSV_VALUESLICE:
            hknob  = hsv_HSV_XKNOB;
            htrack = hsv_HSV_XTRACK;

            sknob  = hsv_HSV_YKNOB;
            strack = hsv_HSV_YTRACK;

            vknob  = hsv_HSV_ZKNOB;
            vtrack = hsv_HSV_ZTRACK;
         break;

         default:
            tracef ("default!\n");
            return FALSE;
         break;
      }

      /*And create the new ones, with different bindings between (h, s, v)
         and (x, y, z).*/
      steppable.r                = hsv->r;
      steppable.list             = hsv->list;
      steppable.w                = pointer->w;
      steppable.prec             = 1;
      steppable.value_changed_fn = &Value_Changed;
      steppable.caret_moved_fn   = &Caret_Moved;
      steppable.handle           = colour;

      steppable.value            = hsv->hue;
      steppable.min              = 0;
      steppable.max              = 360*colourtrans_COLOUR_RANGE;
      steppable.div              = colourtrans_COLOUR_RANGE;
      steppable.knob             = first_i + hknob;
      steppable.track            = first_i + htrack;
      steppable.up               = first_i + hsv_HSV_HUEUP;
      steppable.down             = first_i + hsv_HSV_HUEDOWN;
      steppable.writable         = first_i + hsv_HSV_HUEDEGREES;
      if ((error = steppable_register (&steppable, &hsv->hue_steppable))
            != NULL)
         goto finish;

      steppable.value            = hsv->saturation;
      steppable.min              = 0;
      steppable.max              = colourtrans_COLOUR_RANGE;
      steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
      steppable.knob             = first_i + sknob;
      steppable.track            = first_i + strack;
      steppable.up               = first_i + hsv_HSV_SATURATIONUP;
      steppable.down             = first_i + hsv_HSV_SATURATIONDOWN;
      steppable.writable         = first_i + hsv_HSV_SATURATIONPERCENT;
      if ((error = steppable_register (&steppable,
            &hsv->saturation_steppable)) != NULL)
         goto finish;

      steppable.value            = hsv->value;
      steppable.min              = 0;
      steppable.max              = colourtrans_COLOUR_RANGE;
      steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
      steppable.knob             = first_i + vknob;
      steppable.track            = first_i + vtrack;
      steppable.up               = first_i + hsv_HSV_VALUEUP;
      steppable.down             = first_i + hsv_HSV_VALUEDOWN;
      steppable.writable         = first_i + hsv_HSV_VALUEPERCENT;
      if ((error = steppable_register (&steppable, &hsv->value_steppable))
            != NULL)
         goto finish;

      /*Redraw the colour patch.*/
      if ((error = Update (colour)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Two_Way (void *h, void *b, osbool *unclaimed)

   /*Click on hsv_HSV_SLICE.*/

{  wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Two_Way: w 0x%X, i %d\n" _ pointer->w _ pointer->i);
   if ((error = Set_Position (hsv, &pointer->pos, FALSE)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Start_Drag (void *h, void *b, osbool *unclaimed)

   /*Drag on hsv_HSV_SLICE.*/

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;

   NOT_USED (unclaimed)

   tracef ("Start_Drag\n");
   if ((error = Set_Position (hsv, &pointer->pos, TRUE)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dragging (void *h, void *b, osbool *unclaimed)

   /*Remember this function gets called for EVERY colour picker open by this
      task, not only the right one.*/

{  os_error *error = NULL;
   wimp_pointer pointer;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Dragging\n");

   if (hsv->dragging)
   {  if ((error = xwimp_get_pointer_info (&pointer)) != NULL)
         goto finish;
      tracef ("pointer at (%d, %d)\n" _ pointer.pos.x _ pointer.pos.y);

      if ((error = Set_Position (hsv, &pointer.pos, FALSE)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *End_Drag (void *h, void *b, osbool *unclaimed)

   /*Remember this function gets called for EVERY colour picker open by this
      task, not only the right one.*/

{  os_error *error = NULL;
   wimp_dragged *dragged = &((wimp_block *) b) ASREF dragged;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("End_Drag\n");

   if (hsv->dragging)
   {  hsv->dragging = FALSE;

      (void) task_release (hsv->r, wimp_NULL_REASON_CODE);

      if ((error = xwimp_drag_box (NULL)) != NULL)
         goto finish;

      if ((error = Set_Position (hsv, (os_coord *) &dragged->final.x0,
            FALSE)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Return (void *h, void *b, osbool *unclaimed)

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_caret caret;
   steppable_s v = NULL;
   int value, limit = 0, scale = 0;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Return\n");

   /*Before passing this event on to the main picker, make sure that the icon
      with the caret is up to date. J R C 14th Nov 1993*/
   if ((error = xwimp_get_caret_position (&caret)) != NULL)
      goto finish;

   switch (caret.i - hsv->first_i)
   {  case hsv_HSV_HUEDEGREES:
         tracef ("caret is in hue steppable\n");
         v = hsv->hue_steppable;
         limit = 360*colourtrans_COLOUR_RANGE;
         scale = 1;
      break;

      case hsv_HSV_SATURATIONPERCENT:
         tracef ("caret is in saturation steppable\n");
         v = hsv->saturation_steppable;
         limit = colourtrans_COLOUR_RANGE;
         scale = 100;
      break;

      case hsv_HSV_VALUEPERCENT:
         tracef ("caret is in value steppable\n");
         v = hsv->value_steppable;
         limit = colourtrans_COLOUR_RANGE;
         scale = 100;
      break;
   }

   if (v != NULL)
   {  /*Get the value from the icon that has the caret.*/
      if ((error = icon_scan_fixed (caret.w, caret.i, &value,
               RATIO (colourtrans_COLOUR_RANGE, scale))) != NULL)
         goto finish;
      tracef ("value read and scaled by 10: %d\n" _ value);

      /*Apply the minimum and maximum for this steppable.*/
      value = MIN (MAX (0, value), limit);
      tracef ("value in range (%d, ..., %d): %d\n" _ 0 _ limit _ value);

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
   hsv_colour *hsv = (hsv_colour *) colour->info;

   tracef ("Pass\n");

   if (key->w == hsv->main_w)
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
   int c;
   os_PALETTE (20) palette;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   int hue, saturation, value;

   NOT_USED (unclaimed)

   tracef ("Desktop: w 0x%X, i %d\n" _ pointer->w _ pointer->i);

   for (c = 0; c < 16; c++)
      if (hsv->first_i + Desktop_Colours [c] == pointer->i)
         break;

   /*Set values for this colour.*/
   if ((error = xwimp_read_true_palette ((os_palette *) &palette)) != NULL)
      goto finish;
   tracef ("colour required 0x%X\n" _ palette.entries [c]);

   if ((error = xcolourtrans_convert_rgb_to_hsv
         (RATIO (((palette.entries [c] & os_R) >> os_RSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         RATIO (((palette.entries [c] & os_G) >> os_GSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         RATIO (((palette.entries [c] & os_B) >> os_BSHIFT)*
               colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
         &hue, &saturation, &value)) != NULL)
      goto finish;
   if (!(0 <= hue && hue <= 360*colourtrans_COLOUR_RANGE))
      hue = 0;

   /*Fix MED-4410: set |Suppress| to 2 not 3. J R C 28th Feb 1995*/
   /*No, we've got to do it the previous way ...*/
   Suppress = 3;
   if ((error = steppable_set_value (hsv->hue_steppable, hue)) != NULL ||
         (error = steppable_set_value (hsv->saturation_steppable,
         saturation)) != NULL || (error = steppable_set_value
         (hsv->value_steppable, value)) != NULL)
      goto finish;
   if (!(0 <= hue && hue < 360*colourtrans_COLOUR_RANGE))
      hue = 0;

   /* We do the update ourselves, because we can't easily arrange it so that
      it's the last call to steppable_set_value() that will cause an update
      internally.*/
   if ((error = Update (colour)) != NULL)
      goto finish;

   /*SWI the main module to let it know that the colour has changed.*/
   if ((error = xcolourpickermodelswi_colour_changed (colour)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Gain (void *h, void *b, osbool *unclaimed)

   /*Gain caret event on my pane.*/

{  wimp_caret *caret = &((wimp_block *) b) ASREF caret;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Gain\n");

   /*Only take notice of arrivals on my icons.*/
   switch (caret->i - hsv->first_i)
      case hsv_HSV_HUEDEGREES:
      case hsv_HSV_SATURATIONPERCENT:
      case hsv_HSV_VALUEPERCENT:
         hsv->caret_i = caret->i;

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Lose (void *h, void *b, osbool *unclaimed)

   /*Lose caret event on my pane.*/

{  wimp_caret *caret = &((wimp_block *) b) ASREF caret;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   NOT_USED (caret)
   NOT_USED (unclaimed)

   tracef ("Lose\n");

   hsv->caret_i = (wimp_i) -1;

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
   if ((error = helpreply (message, "HSV", hsv_messages)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Starting (task_r r, wimp_w main_w,
      colourpicker_dialogue *dialogue, os_coord *offset, bits flags,
      colourpicker_colour **colour_out)

   /* Given an empty main window, set it up for use in an HSV dialogue.
      Return a handle to quote in future interactions with this colour
      model.
   */

{  os_error *error = NULL;
   colourpicker_colour *colour;
   int size, c;
   osbool first, done_create_pane = FALSE, done_register_hue = FALSE,
      done_register_saturation = FALSE, done_register_value = FALSE,
      done_new = FALSE;
   hsv_colour *hsv = SKIP;
   wimp_window_info info;
   wimp_i i, new_i, first_i;
   steppable_steppable steppable;

   NOT_USED (flags)

   tracef ("Dialogue_Starting\n");

   tracef ("allocating %d bytes for colour-specific information\n" _
         colourpicker_SIZEOF_COLOUR (sizeof (hsv_colour)/sizeof (int)));
   if ((colour = m_ALLOC (colourpicker_SIZEOF_COLOUR
         (sizeof (hsv_colour)/sizeof (int)))) == NULL)
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
         (sizeof (hsv_colour)/sizeof (int));
      /*this is the size needed by this colour model*/

   hsv = (hsv_colour *) colour->info;

   /*model_no*/
   hsv->model_no = colourpicker_MODEL_HSV;
   tracef ("colour model %d\n" _ hsv->model_no);
      /*must be, or we wouldn't be here*/

   /*colour, r, g, b*/
   /*If there is a colour in |dialogue|, use it; otherwise use the one
      specified by |.colour|.*/
   if (size == colourpicker_MODEL_SIZE_HSV)
   {  hsv->hue = ((hsv_colour *) dialogue->info)->hue;
      hsv->saturation = ((hsv_colour *) dialogue->info)->saturation;
      hsv->value = ((hsv_colour *) dialogue->info)->value;

      colour->colour = Colour (hsv);
      tracef ("Full colour (%d, %d, %d) specified -> OS_Colour 0x%X.\n" _
            hsv->hue _ hsv->saturation _ hsv->value _ colour->colour);
   }
   else
   {  if
      (  (  error =
               xcolourtrans_convert_rgb_to_hsv
               (  RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  &hsv->hue, &hsv->saturation, &hsv->value
               )
         ) != NULL
      )
         goto finish;
      if (!(0 <= hsv->hue && hsv->hue <= 360*colourtrans_COLOUR_RANGE))
         hsv->hue = 0;

      colour->colour = Colour (hsv);
      tracef ("OS_Colour 0x%X specified -> full colour (%d, %d, %d)\n" _
            dialogue->colour _ hsv->hue _ hsv->saturation _ hsv->value);
   }

   /*r*/
   hsv->r = r;

   /*list*/
   if ((error = callback_new (&hsv->list)) != NULL)
      goto finish;
   done_new = TRUE;

   /*main_w*/
   hsv->main_w = main_w;

   /*pane_w, pane_data*/
   if ((error = resource_create_window (HSV, &hsv->pane_w, &hsv->pane_data))
         != NULL)
      goto finish;
   done_create_pane = TRUE;

   /*offset*/
   tracef ("offset (%d, %d)\n" _ offset->x _ offset->y);
   hsv->offset = *offset;

   /*Copy all the icons from the window we just created to the window
      given. We used to open a pane window at the given offset from the main
      window, but it doesn't work.*/
   info.w = hsv->pane_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;
   first = TRUE;

   for (i = 0; i < info.icon_count; i++)
   {  wimp_icon_state state;
      wimp_icon_create create;

      state.w = hsv->pane_w;
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
         hsv->first_i = new_i;
         first = FALSE;
   }  }

   first_i = hsv->first_i;

   tracef ("Put the caret into icon %d for keyboard shortcuts\n" _
         first_i + hsv_HSV_HUEDEGREES);
   if ((error = xwimp_set_caret_position (main_w, first_i +
         hsv_HSV_HUEDEGREES, SKIP, SKIP, -1, 0)) != NULL)
      goto finish;

   /*caret_i*/
   hsv->caret_i = first_i + hsv_HSV_HUEDEGREES;
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

   tracef ("Set the slice icon states\n");
   if
   (  (error = xwimp_set_icon_state (main_w, first_i +
            hsv_HSV_HUESLICE, NONE, wimp_ICON_SELECTED)) != NULL ||
      (error = xwimp_set_icon_state (main_w, first_i +
            hsv_HSV_SATURATIONSLICE, NONE, wimp_ICON_SELECTED)) != NULL ||
      (error = xwimp_set_icon_state (main_w, first_i +
            hsv_HSV_VALUESLICE, wimp_ICON_SELECTED, wimp_ICON_SELECTED)) !=
            NULL
   )
      goto finish;

   tracef ("Register the steppables\n");
   steppable.r                = hsv->r;
   steppable.list             = hsv->list;
   steppable.w                = main_w;
   steppable.prec             = 1;
   steppable.value_changed_fn = &Value_Changed;
   steppable.caret_moved_fn   = &Caret_Moved;
   steppable.handle           = colour;

   steppable.value            = hsv->hue;
   steppable.min              = 0;
   steppable.max              = 360*colourtrans_COLOUR_RANGE;
   steppable.div              = colourtrans_COLOUR_RANGE;
   steppable.knob             = first_i + hsv_HSV_XKNOB;
   steppable.track            = first_i + hsv_HSV_XTRACK;
   steppable.up               = first_i + hsv_HSV_HUEUP;
   steppable.down             = first_i + hsv_HSV_HUEDOWN;
   steppable.writable         = first_i + hsv_HSV_HUEDEGREES;
   if ((error = steppable_register (&steppable, &hsv->hue_steppable)) !=
         NULL)
      goto finish;
   done_register_hue = TRUE;

   steppable.value            = hsv->saturation;
   steppable.min              = 0;
   steppable.max              = colourtrans_COLOUR_RANGE;
   steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
   steppable.knob             = first_i + hsv_HSV_YKNOB;
   steppable.track            = first_i + hsv_HSV_YTRACK;
   steppable.up               = first_i + hsv_HSV_SATURATIONUP;
   steppable.down             = first_i + hsv_HSV_SATURATIONDOWN;
   steppable.writable         = first_i + hsv_HSV_SATURATIONPERCENT;
   if ((error = steppable_register (&steppable, &hsv->saturation_steppable))
         != NULL)
      goto finish;
   done_register_saturation = TRUE;

   steppable.value            = hsv->value;
   steppable.min              = 0;
   steppable.max              = colourtrans_COLOUR_RANGE;
   steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
   steppable.knob             = first_i + hsv_HSV_ZKNOB;
   steppable.track            = first_i + hsv_HSV_ZTRACK;
   steppable.up               = first_i + hsv_HSV_VALUEUP;
   steppable.down             = first_i + hsv_HSV_VALUEDOWN;
   steppable.writable         = first_i + hsv_HSV_VALUEPERCENT;
   if ((error = steppable_register (&steppable, &hsv->value_steppable)) !=
         NULL)
      goto finish;
   done_register_value = TRUE;

   /*dragging*/
   hsv->dragging = FALSE;

   if
   (  /*Main window opens are handled here. This is a legacy from the pane
         days which it seems prudent to retain.*/
      (error = callback_register (hsv->list, &Open, colour, 2,
            wimp_OPEN_WINDOW_REQUEST, main_w)) != NULL ||

      /*Clicks on the slice icons.*/
      (error = callback_register (hsv->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + hsv_HSV_HUESLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (hsv->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + hsv_HSV_SATURATIONSLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (hsv->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + hsv_HSV_VALUESLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||

      /*Click on the slice itself gives a 2-way selection.*/
      (error = callback_register (hsv->list, &Two_Way, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + hsv_HSV_SLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||

      /*Drag starts a drag. JRC 9th Dec 1994*/
      (error = callback_register (hsv->list, &Start_Drag, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + hsv_HSV_SLICE,
            wimp_DRAG_SELECT, NONE)) != NULL ||
      (error = callback_register (hsv->list, &Dragging, colour, 1,
            wimp_NULL_REASON_CODE)) != NULL ||
      (error = callback_register (hsv->list, &End_Drag, colour, 1,
            wimp_USER_DRAG_BOX)) != NULL ||

      /*Returns are watched so we can update the steppables from the values
         in their respective icons.*/
      (error = callback_register (hsv->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i + hsv_HSV_HUEDEGREES,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (hsv->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i +
            hsv_HSV_SATURATIONPERCENT, wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (hsv->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i + hsv_HSV_VALUEPERCENT,
            wimp_KEY_RETURN)) != NULL ||

      /*Other keypresses are passed on.*/
      (error = callback_register (hsv->list, &Pass, colour, 1,
          wimp_KEY_PRESSED)) != NULL ||

      /*Gain and lose caret (merely for problem '*').*/
      (error = callback_register (hsv->list, &Gain, colour, 2,
            wimp_GAIN_CARET, main_w)) != NULL ||
      (error = callback_register (hsv->list, &Lose, colour, 2,
            wimp_LOSE_CARET, main_w)) != NULL ||

      /*Respond to help request events.*/
      (error = callback_register (hsv->list, &Help, colour, 3,
            wimp_USER_MESSAGE_RECORDED, message_HELP_REQUEST, main_w)) !=
            NULL
   )
      goto finish;

   /*Clicks on all the desktop colour icons.*/
   for (c = 0; c < 16; c++)
      if ((error = callback_register (hsv->list, &Desktop, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + Desktop_Colours [c],
            wimp_CLICK_SELECT, NONE)) != NULL)
         goto finish;

   if (colour_out != NULL) *colour_out = colour;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   if (error != NULL)
   {  if (done_create_pane)
      {  os_error *error1 = resource_delete_window (hsv->pane_w,
               hsv->pane_data);
         if (error == NULL) error = error1;
      }

      if (done_register_value)
      {  os_error *error1 = steppable_deregister (hsv->value_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_saturation)
      {  os_error *error1 =
               steppable_deregister (hsv->saturation_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_hue)
      {  os_error *error1 = steppable_deregister (hsv->hue_steppable);
         if (error == NULL) error = error1;
      }

      if (done_new)
      {  os_error *error1;

         tracef ("callback_delete\n");
         error1 = callback_delete (hsv->list);
         if (error == NULL) error = error1;
      }

      m_FREE (colour, colourpicker_SIZEOF_COLOUR
           (sizeof (hsv_colour)/sizeof (int)));
   }

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Finishing (colourpicker_colour *colour)

{  os_error *error = NULL;
   hsv_colour *hsv = (hsv_colour *) colour->info;
   wimp_window_info info;
   wimp_i i;

   tracef ("Dialogue_Finishing\n");
   if
   (  (error = steppable_deregister (hsv->hue_steppable)) != NULL ||
      (error = steppable_deregister (hsv->saturation_steppable)) != NULL ||
      (error = steppable_deregister (hsv->value_steppable)) != NULL
   )
      goto finish;

   callback_delete (hsv->list);

   /*Delete all my icons on the main window.*/
   info.w = hsv->main_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;

   for (i = hsv->first_i; i < info.icon_count; i++)
      if ((error = xwimp_delete_icon (hsv->main_w, i)) != NULL)
         goto finish;

   /*Delete the pane.*/
   if ((error = resource_delete_window (hsv->pane_w, hsv->pane_data)) !=
         NULL)
      goto finish;

   m_FREE (colour, colourpicker_SIZEOF_COLOUR
         (sizeof (hsv_colour)/sizeof (int)));

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Redraw_Area (colourpicker_colour *colour, wimp_draw *draw)

   /*Called in the redraw loop by the main picker. We eschew this in favour
       of an update slightly later.*/

{  os_error *error = NULL;
   int h, s, v, *x, *y, xlimit, ylimit;

   tracef ("Redraw_Area\n");

   if ((error = Decode (colour, &h, &s, &v, &x, &y, &xlimit, &ylimit)) !=
         NULL)
      goto finish;

   /*Redraw the colour patch.*/
   if ((error = Plot (draw, &h, &s, &v, x, y, xlimit, ylimit)) != NULL)
      goto finish;

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
   hsv_colour *hsv = (hsv_colour *) colour->info;

   tracef ("Set_Values\n");

   /*If there is an hsv colour in |dialogue|, use it; otherwise use the
      os_colour.*/
   if (dialogue->size == colourpicker_MODEL_SIZE_HSV)
   {  hsv->hue = ((hsv_colour *) dialogue->info)->hue;
      hsv->saturation = ((hsv_colour *) dialogue->info)->saturation;
      hsv->value = ((hsv_colour *) dialogue->info)->value;

      colour->colour = Colour (hsv);
      tracef ("Full colour (%d, %d, %d) specified -> OS_Colour 0x%X.\n" _
            hsv->hue _ hsv->saturation _ hsv->value _ colour->colour);
   }
   else
   {  if
      (  (  error =
               xcolourtrans_convert_rgb_to_hsv
               (  RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
                        colourtrans_COLOUR_RANGE, os_COLOUR_RANGE),
                  &hsv->hue, &hsv->saturation, &hsv->value
               )
         ) != NULL
      )
         goto finish;
      if (!(0 <= hsv->hue && hsv->hue <= 360*colourtrans_COLOUR_RANGE))
         hsv->hue = 0;

      colour->colour = Colour (hsv);
      tracef ("OS_Colour 0x%X specified -> full colour (%d, %d, %d)\n" _
            dialogue->colour _ hsv->hue _ hsv->saturation _ hsv->value);
   }

   tracef ("Set the new steppable values\n");
   /*Fix MED-4410: set |Suppress| to 2 not 3. J R C 28th Feb 1995*/
   /*No, we've got to do it the previous way ...*/
   Suppress = 3;
   if ((error = steppable_set_value (hsv->hue_steppable, hsv->hue)) != NULL
         || (error = steppable_set_value (hsv->saturation_steppable,
         hsv->saturation)) != NULL || (error = steppable_set_value
         (hsv->value_steppable, hsv->value)) != NULL)
      goto finish;

   /* We do the update ourselves, because we can't easily arrange it so that
      it's the last call to steppable_set_value() that will cause an update
      internally.*/
   if ((error = Update (colour)) != NULL)
      goto finish;

   /*SWI the main module to let it know that the colour has changed.*/
   if ((error = xcolourpickermodelswi_colour_changed (colour)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Process_Event (colourpicker_colour *colour, int event,
      wimp_block *block)

{  hsv_colour *hsv = (hsv_colour *) colour->info;

   tracef ("Process_Event %d\n" _ event);

   return task_callback (hsv->r, hsv->list, event, block, NULL);
}
/*------------------------------------------------------------------------*/
static os_error *Set_Colour (colourpicker_colour *colour)

{  os_error *error = NULL;
   hsv_colour *hsv = (hsv_colour *) colour->info;

   tracef ("Set_Colour (%d, %d, %d)\n" _
         hsv->hue _ hsv->saturation _ hsv->value);

   if ((error = xcolourtrans_set_gcol (Colour (hsv), colourtrans_SET_FG_GCOL |
         colourtrans_USE_ECFS_GCOL, os_ACTION_OVERWRITE, NULL, NULL)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *SetUp_Model (void)

{  os_error *error = NULL;

   if ((error = lookup (hsv_templates, "HSV", (void **) &HSV)) != NULL)
      goto finish;

   /*Fill in |Model|.*/
   /*flags*/
   Model.flags = NONE;

   /*name*/
   if ((error = lookup (hsv_messages, "Name", (void **) &Model.name)) !=
         NULL)
      goto finish;

   /*description*/
   if ((error = lookup (hsv_messages, "Desc", (void **) &Model.description))
         != NULL)
      goto finish;

   /*info_size*/
   Model.info_size = colourpicker_MODEL_SIZE_HSV /*was sizeof (hsv_colour)
         JRC 8th Dec 1994*/;

   /*pane_size*/
   Model.pane_size.x = HSV->window.extent.x1 - HSV->window.extent.x0;
   Model.pane_size.y = HSV->window.extent.y1 - HSV->window.extent.y0;

   /*entries*/
   Model.entries [colourpicker_ENTRY_DIALOGUE_STARTING] =
         (void *) &Dialogue_Starting;
   Model.entries [colourpicker_ENTRY_DIALOGUE_FINISHING] =
         (void *) &Dialogue_Finishing;
   Model.entries [colourpicker_ENTRY_REDRAW_AREA] =
         (void *) &Redraw_Area;
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
os_error *hsv_initialise (char *tail, int podule_base,
      void *workspace)

{  os_error *error = NULL;
   osbool done_messages = FALSE, done_templates = FALSE;
   bits flags;

   NOT_USED (tail)
   NOT_USED (podule_base)
   NOT_USED (workspace)

   tracef ("hsv_initialise\n");

   Message_File_Name  = "ColourPicker:HSV.Messages";
   Template_File_Name = "ColourPicker:HSV.Templates";

   /*Load files.*/
   tracef ("hsv_initialise: loading messages\n");
   if ((error = main_resource_alloc (Message_File_Name,
         &resource_messages_alloc, &resource_messages_free, &hsv_messages))
         != NULL)
      goto finish;

   tracef ("hsv_initialise: loading templates\n");
   if ((error = main_resource_alloc (Template_File_Name,
         &resource_templates_alloc, &resource_templates_free,
         &hsv_templates)) != NULL)
   done_templates = TRUE;

   if ((error = SetUp_Model ()) != NULL)
      goto finish;

   #if 1
      /*Since we are a part of ColourPicker, we can't register ourselves by
         calling colourpicker_register_model() - it doesn't exist yet. So we
         have to call model_register() direct.*/
      if ((error = model_register (colourpicker_MODEL_HSV, &Model,
            workspace)) != NULL)
         goto finish;
   #else
      /*If we were not a part of ColourPicker, we would do something
         like this to register ourselves, not worrying if the ColourPicker
         module is not running yet.*/
      if ((error = xcolourpicker_register_model (colourpicker_MODEL_HSV,
            &Model, workspace)) != NULL &&
            error->errnum != error_SWI_NOT_KNOWN)
         goto finish;
      tracef ("HSV: ColourPicker_RegisterModel gives errnum 0x%X\n" _
            error->errnum);
      error = NULL;
   #endif

   Suppress = 0;

   /*This is a medusa if OS_ReadModeVariable can cope with a mode
      descriptor.*/
   Medusa = xos_read_mode_variable ((os_mode) (6 << 27 | 1),
         os_MODEVAR_LOG2_BPP, NULL, &flags) == NULL && (flags & _C) == NONE;

   if ((error = tables_initialise ()) != NULL)
      goto finish;

   if (Medusa)
      if ((error = tables_mode_change ()) != NULL)
         goto finish;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);

      if (done_messages)
      {  os_error *error1 = main_resource_free (hsv_messages,
               &resource_messages_free);
         if (error == NULL) error = error1;
      }

      if (done_templates)
      {  os_error *error1 = main_resource_free (hsv_templates,
               &resource_templates_free);
         if (error == NULL) error = error1;
      }
   }

   return error;
}
/*------------------------------------------------------------------------*/
os_error *hsv_terminate (osbool fatal, int instance, void *workspace)

{  os_error *error = NULL, *error1;

   NOT_USED (fatal)
   NOT_USED (instance)
   NOT_USED (workspace)

   tracef ("hsv_terminate\n");

   error1 = main_resource_free (hsv_messages, &resource_messages_free);
   if (error == NULL) error = error1;

   error1 = main_resource_free (hsv_templates, &resource_templates_free);
   if (error == NULL) error = error1;

   error1 = tables_terminate ();
   if (error == NULL) error = error1;

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
void hsv_service (int service, _kernel_swi_regs *regs, void *workspace)

{  os_error *error = NULL;

   NOT_USED (workspace)

   tracef ("hsv_service\n");

   switch (service)
   {  case Service_ModeChange:
      case Service_WimpPalette:
         tracef ("hsv_service: servicing ModeChange/WimpPalette\n");
         if (Medusa)
            if ((error = tables_mode_change ()) != NULL)
               goto finish;
      break;

      case Service_ResourceFSStarted:
      case Service_TerritoryStarted:
         tracef ("hsv_service: servicing ResourceFSStarted/"
               "TerritoryStarted\n");
         if ((error = main_resource_free (hsv_messages,
               &resource_messages_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Message_File_Name,
               &resource_messages_alloc, &resource_messages_free,
               &hsv_messages)) != NULL)
            goto finish;

         if ((error = main_resource_free (hsv_templates,
               &resource_templates_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Template_File_Name,
               &resource_templates_alloc, &resource_templates_free,
               &hsv_templates)) != NULL)
            goto finish;

         if ((error = SetUp_Model ()) != NULL)
            goto finish;
      break;

      case Service_ColourPickerLoaded:
         /*Register ourselves!*/
         (*(void (*) (int, colourpicker_model *, void *, void *))
               regs->r [2]) (colourpicker_MODEL_HSV, &Model, workspace,
               (void *) regs->r [3]);
      break;
   }

finish:
   /*We can't return an error from a service call, so throw it away.*/
   tracef ("discarding \"%s\" from service handler\n" _
         error != NULL? error->errmess: "");
}
