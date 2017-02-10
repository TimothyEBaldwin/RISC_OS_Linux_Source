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
/*52 instructions*/

#include "colourtrans.h"
#include "font.h"
#include "os.h"
#include "pdriver.h"

os_error *x (int page, char *t)

{  bool more;
   os_box req;
   os_error *error = NULL;

   if ((error = xpdriver_draw_page (1, &req, page, NULL, &more,
         NULL)) != NULL)
      goto finish;

   while (more)
   {  if ((error = xcolourtrans_set_gcol (os_COLOUR_BLACK,
            colourtrans_SET_FG_GCOL, os_ACTION_OVERWRITE, NULL, NULL))
            != NULL)
         goto finish;

      if ((error = xfont_paint (0, t, NONE, 0, 0, NULL, NULL, 0))
            != NULL)
         goto finish;

      if ((error = xpdriver_get_rectangle (&req, &more, NULL)) !=
            NULL)
         goto finish;
   }

finish:
  return error;
}
