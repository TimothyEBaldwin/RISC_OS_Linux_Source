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
/*window.c - useful functions for doing things to windows*/

/*From CLib*/
#include <stddef.h>
#include <string.h>

/*From OSlib*/
#include "os.h"
#include "wimp.h"

/*From Support*/
#include "riscos.h"
#include "trace.h"
#include "window.h"

os_error *window_set_title (wimp_w w, char *title)

   /*Set the window title to the given string. The window title bar must be
      indirected: the string is copied into the buffer pointed at by the
      window definition.*/

{  os_error *error = NULL, *error1;
   wimp_window_info info;
   wimp_outline outline;
   wimp_open open;
   wimp_window window;
   wimp_w new;
   osbool done_create = FALSE;
   int pixel_size;

   tracef ("window_set_title (0x%X, \"%s\")\n" _ w _ title);

   info.w = w;
   if ((error = xwimp_get_window_info_header_only (&info)) != NULL)
      goto finish;

   riscos_strncpy (info.title_data AS indirected_text.text, title,
         info.title_data AS indirected_text.size);

   outline.w = w;
   if ((error = xwimp_get_window_outline (&outline)) != NULL)
      goto finish;

   pixel_size = info.visible.x0 - outline.outline.x0;

   /*Create a new window the same size as the title bar of the old one.*/
   memset (&window, '\0', wimp_SIZEOF_WINDOW (0));
   window.flags = wimp_WINDOW_NO_BOUNDS | wimp_WINDOW_NEW_FORMAT;
   window.extent.x1 =  0x1FFFFFFF;
   window.extent.y0 = -0x1FFFFFFF;
   if ((error = xwimp_create_window (&window, &new)) != NULL)
      goto finish;
   done_create = TRUE;

   /*Open the new window behind the old one.*/
   open.w          = new;
   open.visible.x0 = info.visible.x0;
   open.visible.y0 = info.visible.y1 + pixel_size;
   open.visible.x1 = info.visible.x1;
   open.visible.y1 = outline.outline.y1 - pixel_size;;
   open.xscroll    =
   open.yscroll    = 0;
   open.next       = w;
   if ((error = xwimp_open_window (&open)) != NULL)
      goto finish;

   /*Now we have a new window exactly behind the title bar of
      the old window. Reopen that window behind the new one.*/
   open.w          = w;
   open.visible    = info.visible;
   open.xscroll    = info.xscroll;
   open.yscroll    = info.yscroll;
   open.next       = new;
   if ((error = xwimp_open_window (&open)) != NULL)
      goto finish;

finish:
   if (done_create)
   {  /*Finally, delete the newly created window. It will never appear on
         the screen at all.*/
      error1 = xwimp_delete_window (new);
      if (error == NULL) error = error1;
   }

   return error;
}

os_error *window_open (void *s, void *d, osbool *unclaimed)

{  os_error *error = NULL;

   NOT_USED (s)
   NOT_USED (unclaimed)

   tracef ("window_open\n");
   if ((error = xwimp_open_window ((wimp_open *) d)) != NULL)
      goto finish;

finish:
   return error;
}
