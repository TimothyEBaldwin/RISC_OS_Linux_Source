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
#ifndef main_H
#define main_H

/*main.h - header file for ColourPicker*/

/*From CLib*/
#include <kernel.h>

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

#ifndef wimp_H
   #include "wimp.h"
#endif

/*From Support*/
#ifndef lookup_H
   #include "lookup.h"
#endif

#ifndef resource_H
   #include "resource.h"
#endif

/*Local*/
#ifndef dialogue_H
   #include "dialogue.h"
#endif

/**Command numbers*/
#define main_MODEL_LIST 0

extern void *main_workspace;

extern lookup_t main_messages, main_sprites, main_templates;

extern _kernel_oserror *main_initialise (char *, int, void *);

extern _kernel_oserror *main_terminate (osbool, int, void *);

extern _kernel_oserror *main_swi (int, _kernel_swi_regs *, void *);

extern void main_service (int, _kernel_swi_regs *, void *);

extern _kernel_oserror *main_command (char *, int, int, void *);

extern os_error *main_event (int, wimp_block *, dialogue_task_list);

extern int main_post_filter (int, wimp_block *, wimp_t, dialogue_task_list);

extern int main_pre_filter (bits, wimp_block *, wimp_t, dialogue_task_list);

extern os_error *main_error_lookup (int, char *, ...);

extern os_error *main_report_error (os_error *error);

extern os_error *main_resource_alloc (char *, resource_loader *,
      resource_unloader *, lookup_t *);

extern os_error *main_resource_free (lookup_t, resource_unloader *);

#endif
