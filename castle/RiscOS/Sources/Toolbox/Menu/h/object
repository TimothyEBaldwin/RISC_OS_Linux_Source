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
/* Title:   object.h
 * Purpose: object list handling for the Menu module
 * Author:  TGR
 * History: 1-Nov-93: TGR: created
 *          7-Oct-96: EPW: Added MENU_INT_ENTRY_FLAGS_CLICK_SHOW_CENTRED
 *	   25-Jan-98: SNB: Added MENU_INT_ENTRY_FLAGS_CLICK_SHOW_AT_POINTER
 */


#ifndef __object_h
#define __object_h

#ifndef __toolbox_h
#include "toolbox.h"
#endif

#ifndef __menu_h
#include "objects.menu.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

#define MENU_INT_FLAGS_GENERATE_SHOW_EVENT       0x00000001
#define MENU_INT_FLAGS_GENERATE_HIDE_EVENT       0x00000002

typedef struct _menu_internal_header {

      int                          flags;
      struct _menu_internal       *forward;
      struct _menu_internal       *backward;
      ObjectID                     object_id;
      int                          title_len;
      int                          num_entries;
      int                          height;
      wimp_Menu                   *wimp_menu;
      char                        *help_message;
      int                          help_len;
      int                          show_event;
      int                          hide_event;
      struct _menu_internal_entry *entries;

} MenuInternalHeader;

typedef struct _menu_internal {

      struct _menu_internal_header hdr;

} MenuInternal;

#define MENU_INT_ENTRY_FLAGS_GENERATE_SUBMENU_EVENT 0x00000001
#define MENU_INT_ENTRY_FLAGS_CLICK_SHOW_TRANSIENT   0x00000002
#define MENU_INT_ENTRY_FLAGS_CLICK_SHOW_CENTRED     0x00000004
#define MENU_INT_ENTRY_FLAGS_CLICK_SHOW_AT_POINTER  0x00000008

typedef struct _menu_internal_entry {

      int          flags;
      ComponentID  component_id;
      int          text_len;
      ObjectID     click_show;
      ObjectID     submenu_show;
      int          submenu_event;
      int          click_event;
      char        *help_message;
      int          help_len;

} MenuInternalEntry;

#define menu_internal_entry(m,i)  (m->hdr.entries + i)

#endif
