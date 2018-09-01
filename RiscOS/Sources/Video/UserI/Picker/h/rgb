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
