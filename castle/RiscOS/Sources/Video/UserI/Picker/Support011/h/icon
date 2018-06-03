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
#ifndef icon_H
#define icon_H

/*icon.h - utilities to update simple Wimp icon types*/

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

#ifndef wimp_H
   #include "wimp.h"
#endif

/*From Support*/
#ifndef muldiv_H
   #include "AsmUtils/muldiv.h"
#endif

 /* Macro to return the text pointer for an icon.
  */

#define icon_TEXT(icon) \
      (((icon)->flags & wimp_ICON_INDIRECTED) != NONE? \
         (icon)->data AS indirected_text.text: (icon)->data AS text)

 /* Function to divide the range (x0, x1) as (min, max) and return the
  * value at a distance of |mul| between them.
  */

extern int icon_ratio (int x0, int x1, int mul, int max, int min);

 /* Macro to do the same - take your pick!
  */

#define icon_RATIO(x0, x1, mul, min, max) \
      ((x0) + muldiv ((mul) - (min), (x1) - (x0), (max) - (min)))

 /* Function to set a slider icon (knob, track) to a given value |mul|
  * in the range specified.
  */

extern os_error *icon_set_slider (wimp_w, wimp_i knob, wimp_i track,
      int mul, int min, int max);

 /* Function to get a slider icon position.
  */

extern os_error *icon_get_slider (wimp_w, wimp_i knob, wimp_i track,
      int *mul, int min, int max);

 /* Function to set a numeric writeable icon to a given value.
  */

extern os_error *icon_format (wimp_w, wimp_i, int mul, int div,
      int prec);

 /* Function to increment the value in a numeric writable icon.
  */

extern os_error *icon_increment (wimp_w, wimp_i, int inc, int min,
      int max, int div, int prec, int *value_out);

 /* Functions to return the value of a numeric writable icon.
  */

extern os_error *icon_scan_dec (wimp_w, wimp_i, int *value_out);

extern os_error *icon_scan_fixed (wimp_w, wimp_i, int *mul_out,
      int div);

extern os_error *icon_set_text (wimp_w, wimp_i, char *text);

extern os_error *icon_name (wimp_w, wimp_i, char *buffer);

#endif
