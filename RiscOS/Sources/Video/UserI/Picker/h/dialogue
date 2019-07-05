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
#ifndef dialogue_H
#define dialogue_H

/*dialogue.h - functions to handle colourpicker dialogue boxes*/

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

/*From Support*/
#ifndef riscos_H
   #include "riscos.h"
#endif

#ifndef task_H
   #include "task.h"
#endif

/*Local*/
#ifndef colourpicker_H
   #include "colourpick.h"
#endif

#ifndef model_H
   #include "model.h"
#endif

#include "dialogue_i.h"

typedef struct dialogue_task_list *dialogue_task_list;
typedef struct dialogue_list *dialogue_list;

struct dialogue_task_list
   {  int sentinel;
      wimp_t task;
      void *workspace; /*here so the event filter veneer can find it*/
      bits saved_mask;
      int key; /*set to -1 or a keycode in the postfilter*/
      task_r r;
      char *post_name, *pre_name;
      dialogue_list open_dialogues, *last_dialogue;
      dialogue_task_list next;
   };

struct dialogue_list
   {  int sentinel;
      bits flags;
      char *title;
      wimp_w main_w;
      char *main_data;
      model_list model;
      colourpicker_colour *colour;
      dialogue_task_list parent;
      dialogue_list next;
   };

/*We maintain a list of tasks that have dialogues open, and for each task a
   list of the dialogues it owns.*/

extern dialogue_task_list dialogue_active_tasks, *dialogue_last_task;

extern os_error *dialogue_setup (void);

extern os_error *dialogue_initialise (void);

extern os_error *dialogue_terminate (void);

extern os_error *dialogue_open (bits, colourpicker_dialogue *,
      colourpicker_d *, wimp_w *);

extern os_error *dialogue_close (bits, colourpicker_d);

extern os_error *dialogue_update (bits, colourpicker_d,
       colourpicker_dialogue *);

extern os_error *dialogue_read (bits, colourpicker_d,
      colourpicker_dialogue *, wimp_w *, int *);

extern os_error *dialogue_close_down (dialogue_task_list t);

extern os_error *dialogue_colour_changed (osbool, colourpicker_colour *);

extern os_error *dialogue_process_key (int c, colourpicker_colour *colour);

extern os_error *dialogue_help_reply (bits, wimp_message *);

extern dialogue_task_list dialogue_task (wimp_t task);

#endif
