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
#ifndef __auxiliary_h
#define __auxiliary_h

#include "kernel.h"

#ifndef __toolbox_h
#include "objects.toolbox.h"
#endif

#ifndef __colourmenu_h
#include "objects.colourmenu.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

#ifndef __mem_h
#include "mem.h"
#endif

#include "object.h"
#include "task.h"

#define mem_freek(A) mem_free(A,"Colour")
#define mem_alloc(A) mem_allocate(A,"Colour")

#define GCharSpaceX                       164;

typedef struct _display_info {  /* Graphical display information, either coords or size */

      int           x;
      int           y;

} DisplayInfo;

/* Globals **************************************************************************************/

extern int  global_menu_state[64];

typedef struct {
   unsigned int          x,y,flags,colour;
   ColourMenuInternal   *current;
   wimp_Menu            *wimp_menu;
   TaskDescriptor       *t;
} GlobalMenu;

extern GlobalMenu global_menu;
extern char *global_title;
extern char *global_help_message;

extern EventInterest  messages_of_interest[];
extern EventInterest  events_of_interest[];
extern EventInterest  toolbox_events_of_interest[];

#define GLOBAL_MENU_INFO_FLAGS_IS_SHOWING        0x00000001
#define GLOBAL_MENU_INFO_FLAGS_SHOW_NEXT         0x00000002
#define GLOBAL_MENU_INFO_FLAGS_TOP_LEVEL         0x00000004

extern BOOL menu_showing (int *buffer);
extern _kernel_oserror *palette_update (void);
extern void set_colour (ColourMenuInternal *menu_int, int new_colour);
extern _kernel_oserror *hide_menu (ColourMenuInternal *menu_int);
extern _kernel_oserror *update_tree (void);
_kernel_oserror *menu_show_actual (void);
_kernel_oserror *menu_show_submenu_actual (void);
extern _kernel_oserror *has_been_hidden (void);

#endif
