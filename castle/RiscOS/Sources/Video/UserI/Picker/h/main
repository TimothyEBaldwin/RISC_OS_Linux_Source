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
