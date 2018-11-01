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
/*rgb.c - entry points for ColourPicker module*/

/*History

   11 May 1993 J R C Started

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
#include "trace.h"

/*Local*/
#include "dialogue.h"
#include "files.h"
#include "helpreply.h"
#include "main.h"
#include "model.h"
#include "rgb.h"
#include "tables.h"

#if TRACE
   /*#define XTRACE*/
#endif

#define CLAMP (2*0x33)

/*We provide three ways of working:
      lots of little rectangles (USE_RECTANGLES)
      a 16M colour sprite with lots of colours, scaled (USE_SCALING)
      an error-diffused sprite of the current screen mode (USE_DIFFUSION)
*/
#define RECTANGLES 24
#define SCALES    128 /*was 32 J R C 19th Apr 1994*/

lookup_t rgb_messages, rgb_templates;

static colourpicker_model Model;

static resource_template *RGB;

static wimp_i Desktop_Colours [] =
   {  rgb_RGB_COLOUR0, rgb_RGB_COLOUR1, rgb_RGB_COLOUR2, rgb_RGB_COLOUR3,
      rgb_RGB_COLOUR4, rgb_RGB_COLOUR5, rgb_RGB_COLOUR6, rgb_RGB_COLOUR7,
      rgb_RGB_COLOUR8, rgb_RGB_COLOUR9, rgb_RGB_COLOUR10, rgb_RGB_COLOUR11,
      rgb_RGB_COLOUR12, rgb_RGB_COLOUR13, rgb_RGB_COLOUR14, rgb_RGB_COLOUR15
   };
static int Suppress;

static char *Message_File_Name, *Template_File_Name;

static osbool Medusa;
/*------------------------------------------------------------------------*/
static os_error *Use_Rectangles (wimp_draw *draw, os_colour *c,
      byte *x, byte *y)

{  int i, j;
   os_error *error = NULL;

   tracef ("Use_Rectangles\n");

   for (j = 0; j < RECTANGLES; j++)
      for (i = 0; i < RECTANGLES; i++)
      {  *x = os_COLOUR_RANGE*i/RECTANGLES;
         *y = os_COLOUR_RANGE*j/RECTANGLES;

         if
         (  (error = xcolourtrans_set_gcol (*c,
                  colourtrans_SET_FG_GCOL | colourtrans_USE_ECFS_GCOL,
                  os_ACTION_OVERWRITE, NULL, NULL)) != NULL ||

            (  error = xos_plot
               (  os_MOVE_TO,
                  icon_ratio
                  (  RGB->window.icons [rgb_RGB_SLICE].extent.x0,
                     RGB->window.icons [rgb_RGB_SLICE].extent.x1,
                     i, 0, RECTANGLES
                  ) + draw->box.x0 - draw->xscroll,
                  icon_ratio
                  (  RGB->window.icons [rgb_RGB_SLICE].extent.y0,
                     RGB->window.icons [rgb_RGB_SLICE].extent.y1,
                     j, 0, RECTANGLES
                  ) + draw->box.y1 - draw->yscroll
            )  ) != NULL ||

            (  error = xos_plot
               (  os_PLOT_TO | os_PLOT_RECTANGLE,
                  icon_ratio
                  (  RGB->window.icons [rgb_RGB_SLICE].extent.x0,
                     RGB->window.icons [rgb_RGB_SLICE].extent.x1,
                     i + 1, 0, RECTANGLES
                  ) + draw->box.x0 - draw->xscroll - 1,
                  icon_ratio
                  (  RGB->window.icons [rgb_RGB_SLICE].extent.y0,
                     RGB->window.icons [rgb_RGB_SLICE].extent.y1,
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
static os_error *Use_Scaling (wimp_draw *draw,
      os_colour *c, byte *x, byte *y)

{  typedef struct {osspriteop_header header;
         int body [SCALES] [SCALES];} sprite;

   os_factors factors;
   os_error *error = NULL;
   sprite *slice = NULL;
   int i, j;

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
   tracef ("allocated %d bytes\n" _ sizeof *slice + 4);

   /*Fill in the sprite - first the header, then the body.*/
   memcpy (&slice->header, &Slice_Header, sizeof Slice_Header);
         /*was slice->header = Slice_Header;*/
   tracef ("copied %d bytes for header\n" _ sizeof Slice_Header);

   for (j = 0; j < SCALES; j++)
      for (i = 0; i < SCALES; i++)
      {  *x = os_COLOUR_RANGE*i/SCALES;
         *y = os_COLOUR_RANGE*j/SCALES;

         slice->body [SCALES - 1 - j] [i] = *c >> 8;
      }

   /*Then plot it at the right position and scale.*/
   factors.xmul = RGB->window.icons [rgb_RGB_SLICE].extent.x1 -
         RGB->window.icons [rgb_RGB_SLICE].extent.x0 >> tables_xeig;
   factors.ymul = RGB->window.icons [rgb_RGB_SLICE].extent.y1 -
         RGB->window.icons [rgb_RGB_SLICE].extent.y0 >> tables_yeig;
   factors.xdiv = SCALES;
   factors.ydiv = SCALES;

   tracef ("calling xosspriteop_put_sprite_scaled ...\n");
   int action = os_ACTION_OVERWRITE;
   /* Using SpriteExtend's dithering in 4096 colour modes makes things look
      better. In 32K or 64K modes it's probably best to leave as-is. */
   if (tables_ncolour < 4096)
      action |= osspriteop_DITHERED;
   if ((error = xosspriteop_put_sprite_scaled (osspriteop_PTR,
         osspriteop_UNSPECIFIED, (osspriteop_id) slice,
         RGB->window.icons [rgb_RGB_SLICE].extent.x0 + draw->box.x0 -
            draw->xscroll,
         RGB->window.icons [rgb_RGB_SLICE].extent.y0 + draw->box.y1 -
            draw->yscroll,
         action, &factors, tables_translation)) != NULL)
      goto finish;
   tracef ("calling xosspriteop_put_sprite_scaled ... done\n");

#ifdef XTRACE
   {  os_f file;

      static int Area [3] = {/*count*/ 1, /*size*/ 16,
            16 + sizeof (int)*SQR (SCALES)};

      /*Write the sprite and translation table to files.*/
      xosfind_openout
            (osfind_NO_PATH | osfind_ERROR_IF_DIR | osfind_ERROR_IF_ABSENT,
            "$.RGBSprite", NULL, &file);
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
               osfind_ERROR_IF_ABSENT, "$.CP32K", NULL, &file);
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
/*------------------------------------------------------------------------*/
static os_error *Use_Diffusion (wimp_draw *draw,
      os_colour *c, byte *x, byte *y)

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

   tracef ("Use_Diffusion\n");

   if ((error = tables_ensure ()) != NULL)
      goto finish;

   surj = (byte (*) [32] [32] [32]) ((int *) tables_surjection) [1];
   inj = (unsigned short *) tables_injection;

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
   Slice_Header.mode   = (os_mode) (tables_log2_bpp + 1 << 27 | 180 >> tables_yeig << 14 |
         180 >> tables_xeig << 1 | 1);

   if ((slice = m_ALLOC (Slice_Header.size + 4)) == NULL)
         /*WARNING: MUST add 4 here, or the kernel might go off the end of
         the R M A block*/
   {  error = riscos_error_lookup (os_GLOBAL_NO_MEM, "NoMem");
      goto finish;
   }

   /*Fill in the sprite - first the header, then the body.*/
   memcpy (&slice->header, &Slice_Header, sizeof Slice_Header);

   for (j = 0; j < ysize; j++)
   {  int r = 0, g = 0, b = 0, /*clear the error each row*/
         xo = (Slice_Header.width + 1)*(ysize - 1 - j), shift = 0;

      /*Clear the row to 0 so we can disjoin the pixels in conveniently
         (with a comma).*/
      for (i = 0; i <= Slice_Header.width; i++)
            /*so that's what that field is there for!*/
         slice->body [xo + i] = 0;

      for (i = 0; i < xsize; i++)
      {  byte best;

         *x = os_COLOUR_RANGE*i << tables_xeig >> 8;
         *y = os_COLOUR_RANGE*j << tables_yeig >> 8;

         r += (*c & os_R) >> os_RSHIFT;
         g += (*c & os_G) >> os_GSHIFT;
         b += (*c & os_B) >> os_BSHIFT;

         /*First find the best fit among the screen colours.*/
         best = (*surj) [MAX (0, MIN (b, os_COLOUR_RANGE)) >> 3]
               [MAX (0, MIN (g, os_COLOUR_RANGE)) >> 3]
               [MAX (0, MIN (r, os_COLOUR_RANGE)) >> 3];
            /*let the compiler do some CSE*/

         slice->body [xo] |= best << shift;
         if ((shift += 1 << tables_log2_bpp) == 32)
            xo++, shift = 0;

         /*Pass forward errors based on what we wanted to plot in the
            first place.*/
         r -= (inj [best] & 0x1F)   << 3 | (inj [best] & 0x1C)   >> 2;
         g -= (inj [best] & 0x3E0)  >> 2 | (inj [best] & 0x380)  >> 7;
         b -= (inj [best] & 0x7C00) >> 7 | (inj [best] & 0x7000) >> 12;
               /*replicate the top 3 bits in the bottom end of 5 to
               make 8*/

         /*Clamp errors. JRC 14th Dec 1994*/
         if (r > CLAMP) r = CLAMP; else if (r < -CLAMP) r = -CLAMP;
         if (g > CLAMP) g = CLAMP; else if (g < -CLAMP) g = -CLAMP;
         if (b > CLAMP) b = CLAMP; else if (b < -CLAMP) b = -CLAMP;
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
            (osfind_NO_PATH | osfind_ERROR_IF_DIR | osfind_ERROR_IF_ABSENT,
            "$.CPSprite", NULL, &file);
      xosgbpb_write (file, (byte *) &Area.sprite_count,
            sizeof Area - sizeof Area.size, NULL);
      xosgbpb_write (file, (byte *) slice, Slice_Header.size, NULL);
      xosfind_close (file);
   }
#endif

   /*Then plot it at the right position - no need for translation table
      or scaling factors.*/
   if ((error = xosspriteop_put_sprite_scaled (osspriteop_PTR,
         (osspriteop_area *) 0x100, (osspriteop_id) slice,
         RGB->window.icons [rgb_RGB_SLICE].extent.x0 + draw->box.x0 -
            draw->xscroll,
         RGB->window.icons [rgb_RGB_SLICE].extent.y0 + draw->box.y1 -
            draw->yscroll,
         os_ACTION_OVERWRITE, NULL, NULL)) != NULL)
      goto finish;

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   m_FREE (slice, Slice_Header.size + 4);

   return error;
}
/*------------------------------------------------------------------------*/
static os_colour Colour (rgb_colour *rgb)

   /*Returns the OS_Colour for the given model.*/

{  return
      RATIO (rgb->red*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
            os_RSHIFT |
      RATIO (rgb->green*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
            os_GSHIFT |
      RATIO (rgb->blue*os_COLOUR_RANGE, colourtrans_COLOUR_RANGE) <<
            os_BSHIFT;
}
/*------------------------------------------------------------------------*/
static os_error *Plot (wimp_draw *draw, os_colour *c, byte *x, byte *y)

{  os_error *error = NULL;
   os_box screen;

   tracef ("Plot\n");

   /*Work out the screen soordinates of the colour slice.*/
   screen = RGB->window.icons [rgb_RGB_SLICE].extent;
   screen.x0 += draw->box.x0 - draw->xscroll;
   screen.x1 += draw->box.x0 - draw->xscroll;
   screen.y0 += draw->box.y1 - draw->yscroll;
   screen.y1 += draw->box.y1 - draw->yscroll;

   /*If the overlap is empty, do nothing.*/
   if (MIN (screen.x1, draw->clip.x1) > MAX (screen.x0, draw->clip.x0) &&
         MIN (screen.y1, draw->clip.y1) > MAX (screen.y0, draw->clip.y0))
   {  /*There are various possibilities for choosing between the strategies,
         but
         (a) you cannot do USE_SCALING on a non-medusa;
         (b) USE_SCALING looks pretty hopeless with <= 256 colours;
         (c) it would take extra effort to make USE_DIFFUSION work on a non-
             medusa, because of the absence of the 32K tables.
      */
      if (Medusa)
         /*Fix bug: if we cannot use scaling or diffusion, fallback to
            rectangles.*/
         switch (tables_log2_bpp)
         {  case 0: case 1:
         #if !TRACE
            case 2:
         #endif
               if ((error = Use_Rectangles (draw, c, x, y)) != NULL)
                  goto finish;
            break;

         #if TRACE
            case 2:
         #endif
            case 3:
               if ((error = Use_Diffusion (draw, c, x, y)) != NULL &&
                     (error = Use_Rectangles (draw, c, x, y)) != NULL)
                  goto finish;
            break;

            case 4: case 5:
               if ((error = Use_Scaling (draw, c, x, y)) != NULL &&
                     (error = Use_Rectangles (draw, c, x, y)) != NULL)
                  goto finish;
            break;
         }
      else
      {  if ((error = Use_Rectangles (draw, c, x, y)) != NULL)
            goto finish;
   }  }

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Decode (colourpicker_colour *colour, os_colour *c,
      byte **x, byte **y)

{  os_error *error = NULL;
   rgb_colour *rgb = (rgb_colour *) colour->info;
   wimp_i which [2];

   tracef ("Decode\n");

   *c = colour->colour;

   if ((error = xwimp_which_icon (rgb->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   switch (which [0] - rgb->first_i)
   {  case rgb_RGB_REDSLICE:
         tracef ("red slice\n");
         *x = &((byte *) c) [2];
         *y = &((byte *) c) [3];
      break;

      case rgb_RGB_GREENSLICE:
         tracef ("green slice\n");
         *x = &((byte *) c) [3];
         *y = &((byte *) c) [1];
      break;

      case rgb_RGB_BLUESLICE:
         tracef ("blue slice\n");
         *x = &((byte *) c) [1];
         *y = &((byte *) c) [2];
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
   rgb_colour *rgb = (rgb_colour *) colour->info;
   osbool more;
   wimp_draw update;
   os_colour c;
   byte *x, *y;

   tracef ("Update\n");

   if ((error = Decode (colour, &c, &x, &y)) != NULL)
      goto finish;

   update.w = rgb->main_w;
   update.box = RGB->window.icons [rgb_RGB_SLICE].extent;
   tracef ("slice extent ((%d, %d), (%d, %d))\n" _
         update.box.x0 _ update.box.y0 _ update.box.x1 _ update.box.y1);
   if ((error = xwimp_update_window (&update, &more)) != NULL)
      goto finish;

   while (more)
   {  if ((error = Plot (&update, &c, x, y)) != NULL)
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
   rgb_colour *rgb = (rgb_colour *) colour->info;
   wimp_i which [2];
   osbool update;

   tracef ("Value_Changed\n");

   /*If the value that has changed is the z-axis steppable, we have to
      invalidate the colour slice.*/
   if ((error = xwimp_which_icon (rgb->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   /*Update the record for this dialogue.*/
   if (v == rgb->red_steppable)
   {  tracef ("RED changed to %d\n" _ value);
      rgb->red = value;
      update = which [0] == rgb->first_i + rgb_RGB_REDSLICE;
   }
   else if (v == rgb->green_steppable)
   {  tracef ("GREEN changed to %d\n" _ value);
      rgb->green = value;
      update = which [0] == rgb->first_i + rgb_RGB_GREENSLICE;
   }
   else if (v == rgb->blue_steppable)
   {  tracef ("BLUE changed to %d\n" _ value);
      rgb->blue = value;
      update = which [0] == rgb->first_i + rgb_RGB_BLUESLICE;
   }
   else
      return NULL;

   colour->colour = Colour (rgb);

   if (Suppress > 0)
      Suppress--;
   else
   {  if (update)
         if ((error = Update (colour)) != NULL)
            goto finish;

      /*if (colour->colour != old_colour) Fix MED-4410: can't do this because
         if we change from one colour to another with the same B, we lose the
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
      have to set the value of the steppable that contains the icon that
      used to have the caret to the number in its writable icon. Luckily,
      this doesn't change!*/

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;
   steppable_s previous;
   int value;
   char s [20];
   wimp_icon_state state;

   NOT_USED (v)

   tracef ("Caret_Moved\n");
   tracef ("rgb->caret_i %d, new icon %d\n" _ rgb->caret_i _ i);

   if (i != rgb->caret_i)
   {  if (rgb->caret_i != -1)
      {  switch (rgb->caret_i - rgb->first_i)
         {  case rgb_RGB_REDPERCENT:
               tracef ("so old icon was REDPERCENT\n");
               previous = rgb->red_steppable;
            break;

            case rgb_RGB_GREENPERCENT:
               tracef ("so old icon was GREENPERCENT\n");
               previous = rgb->green_steppable;
            break;

            case rgb_RGB_BLUEPERCENT:
               tracef ("so old icon was BLUEPERCENT\n");
               previous = rgb->blue_steppable;
            break;

            default:
               return NULL;
            break;
         }

         /*Get the string from the icon that used to have the caret.*/
         state.w = w;
         state.i = rgb->caret_i;
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

            value = MIN (MAX (0, RATIO (colourtrans_COLOUR_RANGE*value, 1000)),
                  colourtrans_COLOUR_RANGE);
            tracef ("cooked current icon value: %d\n" _ value);

            if ((error = steppable_set_value (previous, value)) != NULL)
               goto finish;
         }
      }

      tracef ("updating new icon\n");
      rgb->caret_i = i;
      tracef ("rgb->caret_i %d\n" _ rgb->caret_i);
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
static os_error *Set_Position (rgb_colour *rgb, os_coord *pos,
      osbool start_drag)

   /*Update the steppables to follow the mouse position given, optionally
      also starting a drag.*/

{  os_error *error = NULL;
   wimp_window_state state;
   int x, y;
   wimp_i which [2];
   steppable_s xsteppable, ysteppable;

   tracef ("Set_Position ((%d, %d))\n" _ pos->x _ pos->y);

   /*Which way up is everything?*/
   if ((error = xwimp_which_icon (rgb->main_w, which,
         wimp_ICON_SELECTED | wimp_ICON_ESG,
         wimp_ICON_SELECTED | 2 << wimp_ICON_ESG_SHIFT)) != NULL)
      goto finish;

   switch (which [0] - rgb->first_i)
   {  case rgb_RGB_REDSLICE:
         tracef ("red slice\n");
         xsteppable = rgb->green_steppable;
         ysteppable = rgb->blue_steppable;
      break;

      case rgb_RGB_GREENSLICE:
         tracef ("green slice\n");
         xsteppable = rgb->blue_steppable;
         ysteppable = rgb->red_steppable;
      break;

      case rgb_RGB_BLUESLICE:
         tracef ("blue slice\n");
         xsteppable = rgb->red_steppable;
         ysteppable = rgb->green_steppable;
      break;

      default:
         tracef ("default\n");
         return FALSE;
      break;
   }

   /*Convert mouse coordinates to window-relative.*/
   state.w = rgb->main_w;
   if ((error = xwimp_get_window_state (&state)) != NULL)
      goto finish;

   x = icon_ratio (0, colourtrans_COLOUR_RANGE,
         pos->x + state.xscroll - state.visible.x0,
         RGB->window.icons [rgb_RGB_SLICE].extent.x0,
         RGB->window.icons [rgb_RGB_SLICE].extent.x1);

   y = icon_ratio (0, colourtrans_COLOUR_RANGE,
         pos->y + state.yscroll - state.visible.y1,
         RGB->window.icons [rgb_RGB_SLICE].extent.y0,
         RGB->window.icons [rgb_RGB_SLICE].extent.y1);
   /*Fix MED-1920 use SLICE not [XY]TRACK, or value can go -ve and kill
      Wimp. J R C 17th Jan 1994*/

   tracef ("setting values\n");
   Suppress = 1;
   if ((error = steppable_set_value (xsteppable, x)) != NULL ||
         (error = steppable_set_value (ysteppable, y)) != NULL)
      goto finish;

   if (start_drag)
   {  wimp_drag drag;

      drag.type = wimp_DRAG_USER_POINT; /*no graphics*/
      drag.bbox.x0 = RGB->window.icons [rgb_RGB_SLICE].extent.x0 +
            state.visible.x0 - state.xscroll;
      drag.bbox.y0 = RGB->window.icons [rgb_RGB_SLICE].extent.y0 +
            state.visible.y1 - state.yscroll;
      drag.bbox.x1 = RGB->window.icons [rgb_RGB_SLICE].extent.x1 +
            state.visible.x0 - state.xscroll;
      drag.bbox.y1 = RGB->window.icons [rgb_RGB_SLICE].extent.y1 +
            state.visible.y1 - state.yscroll;
         /*other fields not used*/

      tracef ("Starting drag, bbox ((%d, %d), (%d, %d))\n" _
         drag.bbox.x0 _ drag.bbox.y0 _ drag.bbox.x1 _ drag.bbox.y1);
      if ((error = xwimp_drag_box (&drag)) != NULL)
         goto finish;

      (void) task_claim (rgb->r, wimp_NULL_REASON_CODE);

      rgb->dragging = TRUE;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Slice (void *h, void *b, osbool *unclaimed)

   /*Click on rgb_RGB_REDSLICE, rgb_RGB_GREENSLICE or rgb_RGB_BLUESLICE.*/

{  wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;
   wimp_icon_state state;
   wimp_i rknob, rtrack, gknob, gtrack, bknob, btrack, first_i;
   steppable_steppable steppable;

   NOT_USED (unclaimed)

   tracef ("Slice: w 0x%X, i %d\n" _ pointer->w _ pointer->i);

   /*If this is already the selected icon, do nothing.*/
   state.w = pointer->w;
   state.i = pointer->i;
   if ((error = xwimp_get_icon_state (&state)) != NULL)
      goto finish;
   if ((state.icon.flags & wimp_ICON_SELECTED) == NONE)
   {  first_i = rgb->first_i;

      /*Set the icons to the proper amount of selectedness.*/
      if ((error = xwimp_set_icon_state (pointer->w,
            first_i + rgb_RGB_REDSLICE,
            pointer->i == first_i + rgb_RGB_REDSLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w,
            first_i + rgb_RGB_GREENSLICE,
            pointer->i == first_i + rgb_RGB_GREENSLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w,
            first_i + rgb_RGB_BLUESLICE,
            pointer->i == first_i + rgb_RGB_BLUESLICE?
                  wimp_ICON_SELECTED: NONE,
            wimp_ICON_SELECTED)) != NULL)
         goto finish;

      /*Deregister all the existing steppables.*/
      if
      (  (error = steppable_deregister (rgb->red_steppable)) != NULL ||
         (error = steppable_deregister (rgb->green_steppable)) != NULL ||
         (error = steppable_deregister (rgb->blue_steppable)) != NULL
      )
         goto finish;

      /*We need to know the relationship between (x, y, z) and (r, g, b).*/
      switch (pointer->i - first_i)
      {  case rgb_RGB_REDSLICE:
            rknob  = rgb_RGB_ZKNOB;
            rtrack = rgb_RGB_ZTRACK;

            gknob  = rgb_RGB_XKNOB;
            gtrack = rgb_RGB_XTRACK;

            bknob  = rgb_RGB_YKNOB;
            btrack = rgb_RGB_YTRACK;
         break;

         case rgb_RGB_GREENSLICE:
            rknob  = rgb_RGB_YKNOB;
            rtrack = rgb_RGB_YTRACK;

            gknob  = rgb_RGB_ZKNOB;
            gtrack = rgb_RGB_ZTRACK;

            bknob  = rgb_RGB_XKNOB;
            btrack = rgb_RGB_XTRACK;
         break;

         case rgb_RGB_BLUESLICE:
            rknob  = rgb_RGB_XKNOB;
            rtrack = rgb_RGB_XTRACK;

            gknob  = rgb_RGB_YKNOB;
            gtrack = rgb_RGB_YTRACK;

            bknob  = rgb_RGB_ZKNOB;
            btrack = rgb_RGB_ZTRACK;
         break;

         default:
            tracef ("default!\n");
            return FALSE;
         break;
      }

      /*Also change the colours of the relevant knobs to match the colour
         they now represent.*/
      if ((error = xwimp_set_icon_state (pointer->w, first_i + rknob,
            (bits) wimp_COLOUR_RED << wimp_ICON_BG_COLOUR_SHIFT,
               /*bizarrely, unsigned char << int is int!*/
            wimp_ICON_BG_COLOUR)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w, first_i + gknob,
            (bits) wimp_COLOUR_LIGHT_GREEN << wimp_ICON_BG_COLOUR_SHIFT,
            wimp_ICON_BG_COLOUR)) != NULL)
         goto finish;
      if ((error = xwimp_set_icon_state (pointer->w, first_i + bknob,
            (bits) wimp_COLOUR_DARK_BLUE << wimp_ICON_BG_COLOUR_SHIFT,
            wimp_ICON_BG_COLOUR)) != NULL)
         goto finish;

      /*And create the new ones, with different bindings between (r, g, b)
         and (x, y, z).*/
      steppable.r                = rgb->r;
      steppable.list             = rgb->list;
      steppable.w                = pointer->w;
      steppable.min              = 0;
      steppable.max              = colourtrans_COLOUR_RANGE;
      steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
      steppable.prec             = 1;
      steppable.value_changed_fn = &Value_Changed;
      steppable.caret_moved_fn   = &Caret_Moved;
      steppable.handle           = colour;

      steppable.value            = rgb->red;
      steppable.knob             = first_i + rknob;
      steppable.track            = first_i + rtrack;
      steppable.up               = first_i + rgb_RGB_REDUP;
      steppable.down             = first_i + rgb_RGB_REDDOWN;
      steppable.writable         = first_i + rgb_RGB_REDPERCENT;
      if ((error = steppable_register (&steppable, &rgb->red_steppable)) !=
            NULL)
         goto finish;

      steppable.value            = rgb->green;
      steppable.knob             = first_i + gknob;
      steppable.track            = first_i + gtrack;
      steppable.up               = first_i + rgb_RGB_GREENUP;
      steppable.down             = first_i + rgb_RGB_GREENDOWN;
      steppable.writable         = first_i + rgb_RGB_GREENPERCENT;
      if ((error = steppable_register (&steppable, &rgb->green_steppable))
            != NULL)
         goto finish;

      steppable.value            = rgb->blue;
      steppable.knob             = first_i + bknob;
      steppable.track            = first_i + btrack;
      steppable.up               = first_i + rgb_RGB_BLUEUP;
      steppable.down             = first_i + rgb_RGB_BLUEDOWN;
      steppable.writable         = first_i + rgb_RGB_BLUEPERCENT;
      if ((error = steppable_register (&steppable, &rgb->blue_steppable))
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

   /*Click on rgb_RGB_SLICE.*/

{  wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Two_Way: w 0x%X, i %d\n" _ pointer->w _ pointer->i);
   if ((error = Set_Position (rgb, &pointer->pos, FALSE)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Start_Drag (void *h, void *b, osbool *unclaimed)

   /*Drag on rgb_RGB_SLICE.*/

{  os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;
   wimp_pointer *pointer = &((wimp_block *) b) ASREF pointer;

   NOT_USED (unclaimed)

   tracef ("Start_Drag\n");
   if ((error = Set_Position (rgb, &pointer->pos, TRUE)) != NULL)
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
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (b)
   NOT_USED (unclaimed)

   tracef ("Dragging\n");

   if (rgb->dragging)
   {  if ((error = xwimp_get_pointer_info (&pointer)) != NULL)
         goto finish;
      tracef ("pointer at (%d, %d)\n" _ pointer.pos.x _ pointer.pos.y);

      if ((error = Set_Position (rgb, &pointer.pos, FALSE)) != NULL)
         goto finish;
   }

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *End_Drag (void *h, void *b, osbool *unclaimed)

   /*Remember this function gets called for EVERY colour picker open by this
      task, not only the right one.*/

{  os_error *error = NULL;
   wimp_dragged *dragged = &((wimp_block *) b) ASREF dragged;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("End_Drag\n");

   if (rgb->dragging)
   {  rgb->dragging = FALSE;

      (void) task_release (rgb->r, wimp_NULL_REASON_CODE);

      if ((error = xwimp_drag_box (NULL)) != NULL)
         goto finish;

      if ((error = Set_Position (rgb, (os_coord *) &dragged->final.x0,
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
   rgb_colour *rgb = (rgb_colour *) colour->info;
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

   switch (caret.i - rgb->first_i)
   {  case rgb_RGB_REDPERCENT:
         tracef ("caret is in red steppable\n");
         v = rgb->red_steppable;
      break;

      case rgb_RGB_GREENPERCENT:
         tracef ("caret is in green steppable\n");
         v = rgb->green_steppable;
      break;

      case rgb_RGB_BLUEPERCENT:
         tracef ("caret is in blue steppable\n");
         v = rgb->blue_steppable;
      break;
   }

   if (v != NULL)
   {  /*Get the value from the icon that has the caret.*/
      if ((error = icon_scan_fixed (caret.w, caret.i, &value, 10)) != NULL)
         goto finish;
      tracef ("value read is %d\n" _ value);

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
   rgb_colour *rgb = (rgb_colour *) colour->info;

   tracef ("Pass\n");

   if (key->w == rgb->main_w)
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
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Desktop: w 0x%X, i %d\n" _ pointer->w _ pointer->i);

   for (c = 0; c < 16; c++)
      if (rgb->first_i + Desktop_Colours [c] == pointer->i)
         break;

   /*Set values for this colour.*/
   if ((error = xwimp_read_true_palette ((os_palette *) &palette)) != NULL)
      goto finish;
   tracef ("colour required 0x%X\n" _ palette.entries [c]);

   /*Fix MED-4410: set |Suppress| to 2 not 3. J R C 28th Feb 1995*/
   /*No, we've got to do it the previous way ...*/
   Suppress = 3;
   if
   (  (error = steppable_set_value (rgb->red_steppable,
            RATIO (((palette.entries [c] & os_R) >> os_RSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE))) != NULL ||
      (error = steppable_set_value (rgb->green_steppable,
            RATIO (((palette.entries [c] & os_G) >> os_GSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE))) != NULL ||
      (error = steppable_set_value (rgb->blue_steppable,
            RATIO (((palette.entries [c] & os_B) >> os_BSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE))) != NULL
   )
      goto finish;

   /*We do the update ourselves, because we can't easily arrange it so that
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
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (unclaimed)

   tracef ("Gain\n");

   /*Only take notice of arrivals on my icons.*/
   switch (caret->i - rgb->first_i)
      case rgb_RGB_REDPERCENT:
      case rgb_RGB_GREENPERCENT:
      case rgb_RGB_BLUEPERCENT:
         rgb->caret_i = caret->i;

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Lose (void *h, void *b, osbool *unclaimed)

   /*Lose caret event on my pane.*/

{  wimp_caret *caret = &((wimp_block *) b) ASREF caret;
   os_error *error = NULL;
   colourpicker_colour *colour = (colourpicker_colour *) h;
   rgb_colour *rgb = (rgb_colour *) colour->info;

   NOT_USED (caret)
   NOT_USED (unclaimed)

   rgb->caret_i = (wimp_i) -1;
   tracef ("rgb_caret_i %d\n" _ rgb->caret_i);

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
   if ((error = helpreply (message, "RGB", rgb_messages)) != NULL)
      goto finish;

finish:
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Starting (task_r r, wimp_w main_w,
      colourpicker_dialogue *dialogue, os_coord *offset, bits flags,
      colourpicker_colour **colour_out)

   /* Given an empty main window, set it up for use in an RGB dialogue.
      Return a handle to quote in future interactions with this colour
      model.
   */

{  os_error *error = NULL;
   colourpicker_colour *colour;
   int size, c;
   osbool first, done_create_pane = FALSE, done_register_red = FALSE,
      done_register_green = FALSE, done_register_blue = FALSE,
      done_new = FALSE;
   rgb_colour *rgb = SKIP;
   wimp_window_info info;
   wimp_i i, new_i, first_i;
   steppable_steppable steppable;

   NOT_USED (flags)

   tracef ("Dialogue_Starting\n");

   tracef ("allocating %d bytes for colour-specific information\n" _
         colourpicker_SIZEOF_COLOUR (sizeof (rgb_colour)/sizeof (int)));
   if ((colour = m_ALLOC (colourpicker_SIZEOF_COLOUR
         (sizeof (rgb_colour)/sizeof (int)))) == NULL)
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
         (sizeof (rgb_colour)/sizeof (int));
      /*this is the size needed by this colour model*/

   rgb = (rgb_colour *) colour->info;

   /*model_no*/
   rgb->model_no = colourpicker_MODEL_RGB;
   tracef ("colour model %d\n" _ rgb->model_no);
      /*must be, or we wouldn't be here*/

   /*colour, r, g, b*/
   /*If there is a colour in |dialogue|, use it; otherwise use the one
      specified by |.colour|.*/
   if (size == colourpicker_MODEL_SIZE_RGB)
   {  rgb->red = ((rgb_colour *) dialogue->info)->red;
      rgb->green = ((rgb_colour *) dialogue->info)->green;
      rgb->blue = ((rgb_colour *) dialogue->info)->blue;

      colour->colour = Colour (rgb);
      tracef ("Full colour (%d, %d, %d) specified -> OS_Colour 0x%X.\n" _
            rgb->red _ rgb->green _ rgb->blue _ colour->colour);
   }
   else
   {  rgb->red = RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);
      rgb->green = RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);
      rgb->blue = RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);

      colour->colour = Colour (rgb);
      tracef ("OS_Colour 0x%X specified -> full colour (%d, %d, %d)\n" _
            dialogue->colour _ rgb->red _ rgb->green _ rgb->blue);
   }

   /*r*/
   rgb->r = r;

   /*list*/
   if ((error = callback_new (&rgb->list)) != NULL)
      goto finish;
   done_new = TRUE;

   /*main_w*/
   rgb->main_w = main_w;

   /*pane_w, pane_data*/
   if ((error = resource_create_window (RGB, &rgb->pane_w, &rgb->pane_data))
         != NULL)
      goto finish;
   done_create_pane = TRUE;

   /*offset*/
   tracef ("offset (%d, %d)\n" _ offset->x _ offset->y);
   rgb->offset = *offset;

   /*Copy all the icons from the window we just created to the window
      given. We used to open a pane window at the given offset from the main
      window, but it doesn't work.*/
   info.w = rgb->pane_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;
   first = TRUE;

   for (i = 0; i < info.icon_count; i++)
   {  wimp_icon_state state;
      wimp_icon_create create;

      state.w = rgb->pane_w;
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
         rgb->first_i = new_i;
         first = FALSE;
   }  }

   first_i = rgb->first_i;

   tracef ("Put the caret into icon %d for keyboard shortcuts\n" _
         first_i + rgb_RGB_REDPERCENT);
   if ((error = xwimp_set_caret_position (main_w, first_i +
         rgb_RGB_REDPERCENT, SKIP, SKIP, -1, 0)) != NULL)
      goto finish;

   /*caret_i*/
   rgb->caret_i = first_i + rgb_RGB_REDPERCENT;
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
   tracef ("rgb->caret_i initialised to %d\n" _ rgb->caret_i);

   tracef ("Set the slice icon states\n");
   if
   (  (error = xwimp_set_icon_state (main_w, first_i +
            rgb_RGB_REDSLICE, NONE, wimp_ICON_SELECTED)) != NULL ||
      (error = xwimp_set_icon_state (main_w, first_i +
            rgb_RGB_GREENSLICE, NONE, wimp_ICON_SELECTED)) != NULL ||
      (error = xwimp_set_icon_state (main_w, first_i +
            rgb_RGB_BLUESLICE, wimp_ICON_SELECTED, wimp_ICON_SELECTED)) !=
            NULL
   )
      goto finish;

   tracef ("Register the steppables\n");
   steppable.r                = rgb->r;
   steppable.list             = rgb->list;
   steppable.w                = main_w;
   steppable.min              = 0;
   steppable.max              = colourtrans_COLOUR_RANGE;
   steppable.div              = RATIO (colourtrans_COLOUR_RANGE, 100);
   steppable.prec             = 1;
   steppable.value_changed_fn = &Value_Changed;
   steppable.caret_moved_fn   = &Caret_Moved;
   steppable.handle           = colour;

   steppable.value            = rgb->red;
   steppable.knob             = first_i + rgb_RGB_XKNOB;
   steppable.track            = first_i + rgb_RGB_XTRACK;
   steppable.up               = first_i + rgb_RGB_REDUP;
   steppable.down             = first_i + rgb_RGB_REDDOWN;
   steppable.writable         = first_i + rgb_RGB_REDPERCENT;
   if ((error = steppable_register (&steppable, &rgb->red_steppable)) !=
         NULL)
      goto finish;
   done_register_red = TRUE;

   steppable.value            = rgb->green;
   steppable.knob             = first_i + rgb_RGB_YKNOB;
   steppable.track            = first_i + rgb_RGB_YTRACK;
   steppable.up               = first_i + rgb_RGB_GREENUP;
   steppable.down             = first_i + rgb_RGB_GREENDOWN;
   steppable.writable         = first_i + rgb_RGB_GREENPERCENT;
   if ((error = steppable_register (&steppable, &rgb->green_steppable)) !=
         NULL)
      goto finish;
   done_register_green = TRUE;

   steppable.value            = rgb->blue;
   steppable.knob             = first_i + rgb_RGB_ZKNOB;
   steppable.track            = first_i + rgb_RGB_ZTRACK;
   steppable.up               = first_i + rgb_RGB_BLUEUP;
   steppable.down             = first_i + rgb_RGB_BLUEDOWN;
   steppable.writable         = first_i + rgb_RGB_BLUEPERCENT;
   if ((error = steppable_register (&steppable, &rgb->blue_steppable)) !=
         NULL)
      goto finish;
   done_register_blue = TRUE;

   /*dragging*/
   rgb->dragging = FALSE;

   /*Also change the colours of the relevant knobs to match the colour
      they now represent.*/
   if ((error = xwimp_set_icon_state (main_w, first_i + rgb_RGB_XKNOB,
         (bits) wimp_COLOUR_RED << wimp_ICON_BG_COLOUR_SHIFT,
         wimp_ICON_BG_COLOUR)) != NULL)
      goto finish;
   if ((error = xwimp_set_icon_state (main_w, first_i + rgb_RGB_YKNOB,
         (bits) wimp_COLOUR_LIGHT_GREEN << wimp_ICON_BG_COLOUR_SHIFT,
         wimp_ICON_BG_COLOUR)) != NULL)
       goto finish;
   if ((error = xwimp_set_icon_state (main_w, first_i + rgb_RGB_ZKNOB,
         (bits) wimp_COLOUR_DARK_BLUE << wimp_ICON_BG_COLOUR_SHIFT,
         wimp_ICON_BG_COLOUR)) != NULL)
      goto finish;

   if
   (  /*Main window opens are handled here. This is a legacy from the pane
         days which it seems prudent to retain.*/
      (error = callback_register (rgb->list, &Open, colour, 2,
            wimp_OPEN_WINDOW_REQUEST, main_w)) != NULL ||

      /*Clicks on the slice icons.*/
      (error = callback_register (rgb->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + rgb_RGB_REDSLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (rgb->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + rgb_RGB_GREENSLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||
      (error = callback_register (rgb->list, &Slice, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + rgb_RGB_BLUESLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||

      /*Click on the slice itself gives a 2-way selection.*/
      (error = callback_register (rgb->list, &Two_Way, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + rgb_RGB_SLICE,
            wimp_CLICK_SELECT, NONE)) != NULL ||

      /*Drag starts a drag. JRC 9th Dec 1994*/
      (error = callback_register (rgb->list, &Start_Drag, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + rgb_RGB_SLICE,
            wimp_DRAG_SELECT, NONE)) != NULL ||
      (error = callback_register (rgb->list, &Dragging, colour, 1,
            wimp_NULL_REASON_CODE)) != NULL ||
      (error = callback_register (rgb->list, &End_Drag, colour, 1,
            wimp_USER_DRAG_BOX)) != NULL ||

      /*Returns are watched so we can update the steppables from the values
         in their respective icons.*/
      (error = callback_register (rgb->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i + rgb_RGB_REDPERCENT,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (rgb->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i + rgb_RGB_GREENPERCENT,
            wimp_KEY_RETURN)) != NULL ||
      (error = callback_register (rgb->list, &Return, colour, 4,
            wimp_KEY_PRESSED, main_w, first_i + rgb_RGB_BLUEPERCENT,
            wimp_KEY_RETURN)) != NULL ||

      /*Other keypresses are passed on.*/
      (error = callback_register (rgb->list, &Pass, colour, 1,
            wimp_KEY_PRESSED)) != NULL ||

      /*Gain and lose caret (merely for problem '*').*/
      (error = callback_register (rgb->list, &Gain, colour, 2,
            wimp_GAIN_CARET, main_w)) != NULL ||
      (error = callback_register (rgb->list, &Lose, colour, 2,
            wimp_LOSE_CARET, main_w)) != NULL ||

      /*Respond to help request events.*/
      (error = callback_register (rgb->list, &Help, colour, 3,
            wimp_USER_MESSAGE_RECORDED, message_HELP_REQUEST, main_w)) !=
            NULL
   )
      goto finish;

   /*Clicks on all the desktop colour icons.*/
   for (c = 0; c < 16; c++)
      if ((error = callback_register (rgb->list, &Desktop, colour, 5,
            wimp_MOUSE_CLICK, main_w, first_i + Desktop_Colours [c],
            wimp_CLICK_SELECT, NONE)) != NULL)
         goto finish;

   if (colour_out != NULL) *colour_out = colour;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);

      if (done_create_pane)
      {  os_error *error1;

         tracef ("resource_delete_window\n");
         error1 = resource_delete_window (rgb->pane_w, rgb->pane_data);
         if (error == NULL) error = error1;
      }

      if (done_register_blue)
      {  os_error *error1;

         tracef ("steppable_deregister\n");
         error1 = steppable_deregister (rgb->blue_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_green)
      {  os_error *error1;

         tracef ("steppable_deregister\n");
         error1 = steppable_deregister (rgb->green_steppable);
         if (error == NULL) error = error1;
      }

      if (done_register_red)
      {  os_error *error1;

         tracef ("steppable_deregister\n");
         error1 = steppable_deregister (rgb->red_steppable);
         if (error == NULL) error = error1;
      }

      if (done_new)
      {  os_error *error1;

         tracef ("callback_delete\n");
         error1 = callback_delete (rgb->list);
         if (error == NULL) error = error1;
      }

      m_FREE (colour, colourpicker_SIZEOF_COLOUR
            (sizeof (rgb_colour)/sizeof (int)));
   }

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Dialogue_Finishing (colourpicker_colour *colour)

{  os_error *error = NULL;
   rgb_colour *rgb = (rgb_colour *) colour->info;
   wimp_window_info info;
   wimp_i i;

   tracef ("Dialogue_Finishing\n");
   if
   (  (error = steppable_deregister (rgb->red_steppable)) != NULL ||
      (error = steppable_deregister (rgb->green_steppable)) != NULL ||
      (error = steppable_deregister (rgb->blue_steppable)) != NULL
   )
      goto finish;

   callback_delete (rgb->list);

   /*Delete all my icons on the main window.*/
   info.w = rgb->main_w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;

   for (i = rgb->first_i; i < info.icon_count; i++)
      if ((error = xwimp_delete_icon (rgb->main_w, i)) != NULL)
         goto finish;

   /*Delete the pane.*/
   if ((error = resource_delete_window (rgb->pane_w, rgb->pane_data)) !=
         NULL)
      goto finish;

   m_FREE (colour, colourpicker_SIZEOF_COLOUR
         (sizeof (rgb_colour)/sizeof (int)));

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Redraw_Area (colourpicker_colour *colour, wimp_draw *draw)

   /*Called in the redraw loop by the main picker.*/

{  os_error *error = NULL;
   os_colour c = colour->colour;
   byte *x, *y;

   tracef ("Redraw_Area\n");

   if ((error = Decode (colour, &c, &x, &y)) != NULL)
      goto finish;

   /*Redraw the colour patch.*/
   if ((error = Plot (draw, &c, x, y)) != NULL)
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
   rgb_colour *rgb = (rgb_colour *) colour->info;

   tracef ("Set_Values\n");

   /*If there is an rgb colour in |dialogue|, use it; otherwise use the
      os_colour.*/
   if (dialogue->size == colourpicker_MODEL_SIZE_RGB)
   {  rgb->red = ((rgb_colour *) dialogue->info)->red;
      rgb->green = ((rgb_colour *) dialogue->info)->green;
      rgb->blue = ((rgb_colour *) dialogue->info)->blue;

      colour->colour = Colour (rgb);
      tracef ("Full colour (%d, %d, %d) specified -> OS_Colour 0x%X.\n" _
            rgb->red _ rgb->green _ rgb->blue _ colour->colour);
   }
   else
   {  rgb->red = RATIO (((dialogue->colour & os_R) >> os_RSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);
      rgb->green = RATIO (((dialogue->colour & os_G) >> os_GSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);
      rgb->blue = RATIO (((dialogue->colour & os_B) >> os_BSHIFT)*
            colourtrans_COLOUR_RANGE, os_COLOUR_RANGE);

      colour->colour = Colour (rgb);
      tracef ("OS_Colour 0x%X specified -> full colour (%d, %d, %d)\n" _
            dialogue->colour _ rgb->red _ rgb->green _ rgb->blue);
   }

   tracef ("Set the new steppable values\n");
   /*Fix MED-4410: set |Suppress| to 2 not 3. J R C 28th Feb 1995*/
   /*No, we've got to do it the previous way ...*/
   Suppress = 3;
   if ((error = steppable_set_value (rgb->red_steppable, rgb->red)) != NULL
         || (error = steppable_set_value (rgb->green_steppable, rgb->green))
         != NULL || (error = steppable_set_value (rgb->blue_steppable,
         rgb->blue)) != NULL)
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

{  rgb_colour *rgb = (rgb_colour *) colour->info;

   tracef ("Process_Event %d\n" _ event);

   return task_callback (rgb->r, rgb->list, event, block, NULL);
}
/*------------------------------------------------------------------------*/
static os_error *Set_Colour (colourpicker_colour *colour)

{  os_error *error = NULL;
   rgb_colour *rgb = (rgb_colour *) colour->info;

   tracef ("Set_Colour (%d, %d, %d)\n" _ rgb->red _ rgb->green _ rgb->blue);

   if ((error = xcolourtrans_set_gcol (Colour (rgb), colourtrans_SET_FG_GCOL |
         colourtrans_USE_ECFS_GCOL, os_ACTION_OVERWRITE, NULL, NULL)) != NULL)
      goto finish;

   tracef ("set colour to 0x%X\n" _ Colour (rgb));

finish:
   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
static os_error *Setup_Model (void)

{  os_error *error = NULL;

   if ((error = lookup (rgb_templates, "RGB", (void **) &RGB)) != NULL)
      goto finish;

   /*Fill in |Model|.*/
   /*flags*/
   Model.flags = NONE;

   /*name*/
   if ((error = lookup (rgb_messages, "Name", (void **) &Model.name)) !=
         NULL)
     goto finish;

   /*description*/
   if ((error = lookup (rgb_messages, "Desc", (void **) &Model.description))
         != NULL)
      goto finish;

   /*info_size*/
   Model.info_size = colourpicker_MODEL_SIZE_RGB /*was sizeof (rgb_colour)
        JRC 8th Dec 1994*/;

   /*pane_size*/
   Model.pane_size.x = RGB->window.extent.x1 - RGB->window.extent.x0;
   Model.pane_size.y = RGB->window.extent.y1 - RGB->window.extent.y0;

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
os_error *rgb_initialise (char *tail, int podule_base,
      void *workspace)

{  os_error *error = NULL;
   osbool done_messages = FALSE, done_templates = FALSE;
   bits flags;

   NOT_USED (tail)
   NOT_USED (podule_base)
   NOT_USED (workspace)

   tracef ("rgb_initialise\n");

   Message_File_Name  = "ColourPicker:RGB.Messages";
   Template_File_Name = "ColourPicker:RGB.Templates";

   /*Load files.*/
   tracef ("rgb_initialise: registering messages \n");
   if ((error = main_resource_alloc (Message_File_Name,
         &resource_messages_alloc, &resource_messages_free, &rgb_messages))
         != NULL)
      goto finish;

   tracef ("rgb_initialise: registering templates\n");
   if ((error = main_resource_alloc (Template_File_Name,
         &resource_templates_alloc, &resource_templates_free,
         &rgb_templates)) != NULL)
   done_templates = TRUE;

   if ((error = Setup_Model ()) != NULL)
      goto finish;

   #if 1
      /*Since we are a part of ColourPicker, we can't register ourselves by
         calling colourpicker_register_model() - it doesn't exist yet. So we
         have to call model_register() direct.*/
      if ((error = model_register (colourpicker_MODEL_RGB, &Model,
            workspace)) != NULL)
         goto finish;
   #else
      /*If we were not a part of ColourPicker, we would do something
         like this to register ourselves, not worrying if the ColourPicker
         module is not running yet.*/
      if ((error = xcolourpicker_register_model (colourpicker_MODEL_RGB,
            &Model, workspace)) != NULL &&
            error->errnum != error_SWI_NOT_KNOWN)
         goto finish;
      tracef ("RGB: ColourPicker_RegisterModel gives errnum 0x%X\n" _
            error->errnum);
      error = NULL;
   #endif

   Suppress = 0;

   /*This is a medusa if OS_ReadModeVariable can cope with a mode
      descriptor.*/
   Medusa = xos_read_mode_variable ((os_mode) (6 << 27 | 1),
         os_MODEVAR_LOG2_BPP, NULL, &flags) == NULL && (flags & _C) == NONE;

   if (Medusa)
      if ((error = tables_initialise ()) != NULL)
         goto finish;

finish:
   if (error != NULL)
   {  tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);

      if (done_messages)
      {  os_error *error1;

         tracef ("main_resource_free\n");
         error1 = main_resource_free (rgb_messages,
               &resource_messages_free);
         if (error == NULL) error = error1;
      }

      if (done_templates)
      {  os_error *error1;

         tracef ("main_resource_free\n");
         error1 = main_resource_free (rgb_templates,
               &resource_templates_free);
         if (error == NULL) error = error1;
      }
   }

   return error;
}
/*------------------------------------------------------------------------*/
os_error *rgb_terminate (osbool fatal, int instance, void *workspace)

{  os_error *error = NULL, *error1;

   NOT_USED (fatal)
   NOT_USED (instance)
   NOT_USED (workspace)

   tracef ("rgb_terminate\n");

   error1 = main_resource_free (rgb_messages, &resource_messages_free);
   if (error == NULL) error = error1;

   error1 = main_resource_free (rgb_templates, &resource_templates_free);
   if (error == NULL) error = error1;

   error1 = tables_terminate ();
   if (error == NULL) error = error1;

   if (error != NULL)
      tracef ("ERROR: %s (error 0x%X)\n" _ error->errmess _ error->errnum);
   return error;
}
/*------------------------------------------------------------------------*/
void rgb_service (int service, _kernel_swi_regs *regs, void *workspace)

{  os_error *error = NULL;

   NOT_USED (workspace)

   tracef ("rgb_service\n");

   switch (service)
   {  case Service_ModeChange:
      case Service_WimpPalette:
         tracef ("rgb_service: servicing ModeChange/WimpPalette\n");
         if (Medusa)
            if ((error = tables_mode_change ()) != NULL)
               goto finish;
      break;

      case Service_ResourceFSStarted:
      case Service_TerritoryStarted:
         tracef ("rgb_service: servicing ResourceFSStarted/"
               "TerritoryStarted\n");
         if ((error = main_resource_free (rgb_messages,
               &resource_messages_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Message_File_Name,
               &resource_messages_alloc, &resource_messages_free,
               &rgb_messages)) != NULL)
            goto finish;

         if ((error = main_resource_free (rgb_templates,
               &resource_templates_free)) != NULL)
            goto finish;
         if ((error = main_resource_alloc (Template_File_Name,
               &resource_templates_alloc, &resource_templates_free,
               &rgb_templates)) != NULL)
            goto finish;

         if ((error = Setup_Model ()) != NULL)
            goto finish;
      break;

      case Service_ColourPickerLoaded:
         /*Register ourselves!*/
         (*(void (*) (int, colourpicker_model *, void *, void *))
               regs->r [2]) (colourpicker_MODEL_RGB, &Model, workspace,
               (void *) regs->r [3]);
      break;
   }

finish:
   /*We can't return an error from a service call, so throw it away.*/
   tracef ("discarding \"%s\" from service handler\n" _
         error != NULL? error->errmess: "");
}
