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
#ifndef rgb_H
#define rgb_H

/*rgb.h - header file for ColourPicker*/

/*From CLib*/
#include <kernel.h>

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

/*From Support*/
#ifndef lookup_H
   #include "lookup.h"
#endif

#ifndef steppable_H
   #include "steppable.h"
#endif

#ifndef task_H
   #include "task.h"
#endif

/*Local*/
#include "rgb_i.h"

typedef
   struct rgb_colour
      {  int model_no;
         int red;
         int green;
         int blue;
         task_r r;
         callback_l list;
         wimp_w main_w, pane_w;
         char *pane_data;
         os_coord offset;
         wimp_i first_i;
         wimp_i caret_i;
         steppable_s red_steppable;
         steppable_s green_steppable;
         steppable_s blue_steppable;
         osbool dragging;
      }
   rgb_colour;

extern lookup_t rgb_messages, rgb_templates;

extern os_error *rgb_initialise (char *, int, void *);

extern os_error *rgb_terminate (int, int, void *);

extern void rgb_service (int, _kernel_swi_regs *, void *);

#endif
