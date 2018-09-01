#ifndef window_H
#define window_H

/* C header file for Window
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk; Simon Middleton, Uniqueway Ltd, 18 Aug 1996
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#ifndef keyboardshortcut_H
#include "oslib/keyboardshortcut.h"
#endif

#ifndef gadget_H
#include "oslib/gadget.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Window_ClassSWI
#define Window_ClassSWI                         0x82880
#undef  XWindow_ClassSWI
#define XWindow_ClassSWI                        0xA2880
#undef  Window_PostFilter
#define Window_PostFilter                       0x82881
#undef  XWindow_PostFilter
#define XWindow_PostFilter                      0xA2881
#undef  Window_PreFilter
#define Window_PreFilter                        0x82882
#undef  XWindow_PreFilter
#define XWindow_PreFilter                       0xA2882
#undef  Window_GetPointerInfo
#define Window_GetPointerInfo                   0x82883
#undef  XWindow_GetPointerInfo
#define XWindow_GetPointerInfo                  0xA2883
#undef  Window_WimpToToolbox
#define Window_WimpToToolbox                    0x82884
#undef  XWindow_WimpToToolbox
#define XWindow_WimpToToolbox                   0xA2884
#undef  Window_RegisterExternal
#define Window_RegisterExternal                 0x82885
#undef  XWindow_RegisterExternal
#define XWindow_RegisterExternal                0xA2885
#undef  Window_DeregisterExternal
#define Window_DeregisterExternal               0x82886
#undef  XWindow_DeregisterExternal
#define XWindow_DeregisterExternal              0xA2886
#undef  Window_RegisterFilter
#define Window_RegisterFilter                   0x82888
#undef  XWindow_RegisterFilter
#define XWindow_RegisterFilter                  0xA2888
#undef  Window_DeregisterFilter
#define Window_DeregisterFilter                 0x82889
#undef  XWindow_DeregisterFilter
#define XWindow_DeregisterFilter                0xA2889
#undef  Window_EnumerateGadgets
#define Window_EnumerateGadgets                 0x8288A
#undef  XWindow_EnumerateGadgets
#define XWindow_EnumerateGadgets                0xA288A
#undef  Window_GadgetGetIconList
#define Window_GadgetGetIconList                0x8288B
#undef  XWindow_GadgetGetIconList
#define XWindow_GadgetGetIconList               0xA288B
#undef  Window_ExtractGadgetInfo
#define Window_ExtractGadgetInfo                0x828BE
#undef  XWindow_ExtractGadgetInfo
#define XWindow_ExtractGadgetInfo               0xA28BE
#undef  Window_PlotGadget
#define Window_PlotGadget                       0x828BF
#undef  XWindow_PlotGadget
#define XWindow_PlotGadget                      0xA28BF
#undef  Window_GetWimpHandle
#define Window_GetWimpHandle                    0x0
#undef  Window_AddGadget
#define Window_AddGadget                        0x1
#undef  Window_RemoveGadget
#define Window_RemoveGadget                     0x2
#undef  Window_SetMenu
#define Window_SetMenu                          0x3
#undef  Window_GetMenu
#define Window_GetMenu                          0x4
#undef  Window_SetPointer
#define Window_SetPointer                       0x5
#undef  Window_GetPointer
#define Window_GetPointer                       0x6
#undef  Window_SetHelpMessage
#define Window_SetHelpMessage                   0x7
#undef  Window_GetHelpMessage
#define Window_GetHelpMessage                   0x8
#undef  Window_AddKeyboardShortcuts
#define Window_AddKeyboardShortcuts             0x9
#undef  Window_RemoveKeyboardShortcuts
#define Window_RemoveKeyboardShortcuts          0xA
#undef  Window_SetTitle
#define Window_SetTitle                         0xB
#undef  Window_GetTitle
#define Window_GetTitle                         0xC
#undef  Window_SetDefaultFocus
#define Window_SetDefaultFocus                  0xD
#undef  Window_GetDefaultFocus
#define Window_GetDefaultFocus                  0xE
#undef  Window_SetExtent
#define Window_SetExtent                        0xF
#undef  Window_GetExtent
#define Window_GetExtent                        0x10
#undef  Window_ForceRedraw
#define Window_ForceRedraw                      0x11
#undef  Window_SetToolBars
#define Window_SetToolBars                      0x12
#undef  Window_GetToolBars
#define Window_GetToolBars                      0x13
#undef  Service_WindowModuleStarting
#define Service_WindowModuleStarting            0x82881
#undef  Service_WindowModuleDying
#define Service_WindowModuleDying               0x82882
#undef  Service_GadgetRegistered
#define Service_GadgetRegistered                0x82883
#undef  Service_GadgetDeregistered
#define Service_GadgetDeregistered              0x82884

/************************************
 * Structure and union declarations *
 ************************************/
typedef union  window_icon_data                 window_icon_data;
typedef struct window_window                    window_window;
typedef struct window_object                    window_object;
typedef struct window_object_base               window_object_base;
typedef struct window_object_template           window_object_template;
typedef struct window_object_template_base      window_object_template_base;
typedef struct window_action_show_object        window_action_show_object;
typedef struct window_action_about_to_be_shown  window_action_about_to_be_shown;
typedef struct window_action_about_to_be_shown_block window_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits window_flags;

typedef bits window_gadget_flags;

union window_icon_data
   {  struct
      {  toolbox_msg_reference text;
         toolbox_string_reference validation;
         int size;
      }
      indirected_text;
   };

/* ------------------------------------------------------------------------
 * Type:          window_window
 *
 * Description:   A Wimp window structure with no icons and specialised title data
 *
 * Fields:        extra_flags - RISC O S 4+
 *                title_flags - must always be Indirected Text
 *                icon_count - Must be 0
 */

struct window_window
   {  os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
      wimp_window_flags flags;
      wimp_colour title_fg;
      wimp_colour title_bg;
      wimp_colour work_fg;
      wimp_colour work_bg;
      wimp_colour scroll_outer;
      wimp_colour scroll_inner;
      wimp_colour highlight_bg;
      wimp_extra_window_flags extra_flags;
      os_box extent;
      wimp_icon_flags title_flags;
      wimp_icon_flags work_flags;
      toolbox_sprite_area_reference sprite_area;
      short xmin;
      short ymin;
      window_icon_data title_data;
      int icon_count;
   };

/* ------------------------------------------------------------------------
 * Type:          window_object
 *
 * Description:   Structure to describe Window Object for in-memory construction - to be referenced from Toolbox_Template
 *
 * Fields:        shortcuts - cast to KeyboardShortcut_Object pointer
 *                gadgets - cast to Gadget_Object pointer
 */

#define window_OBJECT_MEMBERS \
   window_flags flags; \
   toolbox_msg_reference help_message; \
   int help_limit; \
   toolbox_string_reference sprite_name; \
   int pointer_limit; \
   os_coord hotspot; \
   toolbox_string_reference menu_name; \
   int shortcut_count; \
   toolbox_object_offset shortcuts; \
   int gadget_count; \
   toolbox_object_offset gadgets; \
   toolbox_c default_focus; \
   bits show_action; \
   bits hide_action; \
   toolbox_string_reference toolbar_ibl; \
   toolbox_string_reference toolbar_itl; \
   toolbox_string_reference toolbar_ebl; \
   toolbox_string_reference toolbar_etl; \
   window_window window;

/* Base window_object structure without variable part */
struct window_object_base
   {  window_OBJECT_MEMBERS
   };

/* legacy structure */
struct window_object
   {  window_OBJECT_MEMBERS
      int data [UNKNOWN];
   };

#define window_OBJECT(N) \
   struct \
      {  window_OBJECT_MEMBERS \
         int data [N]; \
      }

#define window_SIZEOF_OBJECT(N) \
   (offsetof (window_object, data) + \
         (N)*sizeof ((window_object *) NULL)->data)

/* ------------------------------------------------------------------------
 * Type:          window_object_template
 *
 * Description:   Structure Describing Window Object in Resource file
 *
 * Fields:        shortcuts - cast to KeyboardShortcut_Object pointer
 *                gadgets - cast to Gadget_Object pointer
 */

#define window_OBJECT_TEMPLATE_MEMBERS \
   toolbox_RESOURCE_FILE_OBJECT_MEMBERS \
   window_flags objectflags; \
   toolbox_msg_reference help_message; \
   int help_limit; \
   toolbox_string_reference sprite_name; \
   int pointer_limit; \
   os_coord hotspot; \
   toolbox_string_reference menu_name; \
   int shortcut_count; \
   toolbox_object_offset shortcuts; \
   int gadget_count; \
   toolbox_object_offset gadgets; \
   toolbox_c default_focus; \
   bits show_action; \
   bits hide_action; \
   toolbox_string_reference toolbar_ibl; \
   toolbox_string_reference toolbar_itl; \
   toolbox_string_reference toolbar_ebl; \
   toolbox_string_reference toolbar_etl; \
   window_window window;

/* Base window_object_template structure without variable part */
struct window_object_template_base
   {  window_OBJECT_TEMPLATE_MEMBERS
   };

/* legacy structure */
struct window_object_template
   {  window_OBJECT_TEMPLATE_MEMBERS
      int data [UNKNOWN];
   };

#define window_OBJECT_TEMPLATE(N) \
   struct \
      {  window_OBJECT_TEMPLATE_MEMBERS \
         int data [N]; \
      }

#define window_SIZEOF_OBJECT_TEMPLATE(N) \
   (offsetof (window_object_template, data) + \
         (N)*sizeof ((window_object_template *) NULL)->data)

typedef toolbox_full window_full;

struct window_action_show_object
   {  os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
   };

/* ------------------------------------------------------------------------
 * Type:          window_action_about_to_be_shown
 *
 * Description:   Prefer Window_ActionAboutToBeShownBlock
 */

struct window_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         window_full full;
      }
      position;
   };

struct window_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         window_full full;
      }
      position;
   };

typedef toolbox_action_header_base window_action_dialogue_completed_block;

typedef bits window_tool_bar_flags;

typedef bits window_mouse_state;

/************************
 * Constant definitions *
 ************************/
#define class_WINDOW                            ((toolbox_class) 0x82880u)
#define error_WINDOW_ALLOC_FAILED               0x80A901u
#define error_WINDOW_SHORT_BUFFER               0x80A902u
#define error_WINDOW_BAD_VERSION                0x80A903u
#define error_WINDOW_INVALID_FLAGS              0x80A904u
#define error_WINDOW_TASKS_ACTIVE               0x80A905u
#define error_WINDOW_NO_SUCH_TASK               0x80A911u
#define error_WINDOW_NO_SUCH_METHOD             0x80A912u
#define error_WINDOW_NO_SUCH_MISC_OP_METHOD     0x80A913u
#define error_WINDOW_INVALID_COMPONENT_ID       0x80A914u
#define error_WINDOW_DUPLICATE_COMPONENT_ID     0x80A915u
#define error_WINDOW_INVALID_GADGET_TYPE        0x80A920u
#define window_GENERATE_ABOUT_TO_BE_SHOWN       ((window_flags) 0x1u)
#define window_AUTO_OPEN                        ((window_flags) 0x2u)
#define window_AUTO_CLOSE                       ((window_flags) 0x4u)
#define window_GENERATE_DIALOGUE_COMPLETED      ((window_flags) 0x8u)
#define window_IS_TOOL_BAR                      ((window_flags) 0x10u)
#define window_NO_FOCUS                         (-1)
#define window_SET_FOCUS_TO_WINDOW              (-2)
#define action_WINDOW_ABOUT_TO_BE_SHOWN         0x82880u
#define action_WINDOW_DIALOGUE_COMPLETED        0x82890u
#define window_TOOL_BAR_IBL                     ((window_tool_bar_flags) 0x1u)
#define window_TOOL_BAR_ITL                     ((window_tool_bar_flags) 0x2u)
#define window_TOOL_BAR_EBL                     ((window_tool_bar_flags) 0x4u)
#define window_TOOL_BAR_ETL                     ((window_tool_bar_flags) 0x8u)
#define window_CLICK_ADJUST                     ((window_mouse_state) 0x1u)
#define window_CLICK_MENU                       ((window_mouse_state) 0x2u)
#define window_CLICK_SELECT                     ((window_mouse_state) 0x4u)
#define window_CLICK_NOT_TOOLBOX                ((window_mouse_state) 0x100u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      window_get_pointer_info()
 *
 * Description:   Calls SWI 0x82883
 *
 * Input:         flags - value of R0 on entry
 *
 * Output:        x - value of R0 on exit
 *                y - value of R1 on exit
 *                state - value of R2 on exit
 *                obj - value of R3 on exit
 *                cmp - value of R4 on exit
 */

extern os_error *xwindow_get_pointer_info (bits flags,
      int *x,
      int *y,
      window_mouse_state *state,
      toolbox_o *obj,
      toolbox_c *cmp);
extern void window_get_pointer_info (bits flags,
      int *x,
      int *y,
      window_mouse_state *state,
      toolbox_o *obj,
      toolbox_c *cmp);

/* ------------------------------------------------------------------------
 * Function:      window_wimp_to_toolbox()
 *
 * Description:   Calls SWI 0x82884
 *
 * Input:         flags - value of R0 on entry
 *                w - value of R1 on entry
 *                i - value of R2 on entry
 *
 * Output:        obj - value of R0 on exit
 *                cmp - value of R1 on exit
 */

extern os_error *xwindow_wimp_to_toolbox (bits flags,
      wimp_w w,
      wimp_i i,
      toolbox_o *obj,
      toolbox_c *cmp);
extern void window_wimp_to_toolbox (bits flags,
      wimp_w w,
      wimp_i i,
      toolbox_o *obj,
      toolbox_c *cmp);

/* ------------------------------------------------------------------------
 * Function:      window_register_external()
 *
 * Description:   Registers one or more gadgets with the window module
 *
 * Input:         flags - value of R0 on entry
 *                types - value of R1 on entry
 *                handler_swi_number - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x82885.
 */

extern os_error *xwindow_register_external (bits flags,
      gadget_extension_list const *types,
      int handler_swi_number);
__swi (0x82885) void window_register_external (bits flags,
      gadget_extension_list const *types,
      int handler_swi_number);

/* ------------------------------------------------------------------------
 * Function:      window_deregister_external()
 *
 * Description:   Deregisters a gadget from the window module
 *
 * Input:         flags - value of R0 on entry
 *                type - value of R1 on entry
 *                handler_swi_number - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x82886.
 */

extern os_error *xwindow_deregister_external (bits flags,
      int type,
      int handler_swi_number);
__swi (0x82886) void window_deregister_external (bits flags,
      int type,
      int handler_swi_number);

/* ------------------------------------------------------------------------
 * Function:      window_extract_gadget_info()
 *
 * Description:   Calls SWI 0x828BE
 *
 * Input:         flags - value of R0 on entry
 *                object - value of R1 on entry
 *                cmp - value of R2 on entry
 *
 * Output:        gadget - value of R0 on exit (X version only)
 *                size - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xwindow_extract_gadget_info (bits flags,
      toolbox_resource_file_object const *object,
      toolbox_c cmp,
      gadget_object **gadget,
      int *size);
extern gadget_object *window_extract_gadget_info (bits flags,
      toolbox_resource_file_object const *object,
      toolbox_c cmp,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      window_get_wimp_handle()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *
 * Output:        w - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xwindow_get_wimp_handle (bits flags,
      toolbox_o window,
      wimp_w *w);
extern wimp_w window_get_wimp_handle (bits flags,
      toolbox_o window);

/* ------------------------------------------------------------------------
 * Function:      window_add_gadget()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                object - value of R3 on entry
 *
 * Output:        gadget - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xwindow_add_gadget (bits flags,
      toolbox_o window,
      gadget_object const *object,
      toolbox_c *gadget);
extern toolbox_c window_add_gadget (bits flags,
      toolbox_o window,
      gadget_object const *object);

/* ------------------------------------------------------------------------
 * Function:      window_remove_gadget()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xwindow_remove_gadget (bits flags,
      toolbox_o window,
      toolbox_c gadget);
extern void window_remove_gadget (bits flags,
      toolbox_o window,
      toolbox_c gadget);

/* ------------------------------------------------------------------------
 * Function:      window_set_menu()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                menu - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xwindow_set_menu (bits flags,
      toolbox_o window,
      toolbox_o menu);
extern void window_set_menu (bits flags,
      toolbox_o window,
      toolbox_o menu);

/* ------------------------------------------------------------------------
 * Function:      window_get_menu()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *
 * Output:        menu - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xwindow_get_menu (bits flags,
      toolbox_o window,
      toolbox_o *menu);
extern toolbox_o window_get_menu (bits flags,
      toolbox_o window);

/* ------------------------------------------------------------------------
 * Function:      window_set_pointer()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                sprite_name - value of R3 on entry
 *                xhotspot - value of R4 on entry
 *                yhotspot - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xwindow_set_pointer (bits flags,
      toolbox_o window,
      char const *sprite_name,
      int xhotspot,
      int yhotspot);
extern void window_set_pointer (bits flags,
      toolbox_o window,
      char const *sprite_name,
      int xhotspot,
      int yhotspot);

/* ------------------------------------------------------------------------
 * Function:      window_get_pointer()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *                xhotspot - value of R5 on exit
 *                yhotspot - value of R6 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xwindow_get_pointer (bits flags,
      toolbox_o window,
      char *buffer,
      int size,
      int *used,
      int *xhotspot,
      int *yhotspot);
extern int window_get_pointer (bits flags,
      toolbox_o window,
      char *buffer,
      int size,
      int *xhotspot,
      int *yhotspot);

/* ------------------------------------------------------------------------
 * Function:      window_set_help_message()
 *
 * Description:   Calls reason code 7 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                help - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x7.
 */

extern os_error *xwindow_set_help_message (bits flags,
      toolbox_o window,
      char const *help);
extern void window_set_help_message (bits flags,
      toolbox_o window,
      char const *help);

/* ------------------------------------------------------------------------
 * Function:      window_get_help_message()
 *
 * Description:   Calls reason code 8 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x8.
 */

extern os_error *xwindow_get_help_message (bits flags,
      toolbox_o window,
      char *buffer,
      int size,
      int *used);
extern int window_get_help_message (bits flags,
      toolbox_o window,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      window_add_keyboard_shortcuts()
 *
 * Description:   Calls reason code 9 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                add_count - value of R3 on entry
 *                shortcuts - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x9.
 */

extern os_error *xwindow_add_keyboard_shortcuts (bits flags,
      toolbox_o window,
      int add_count,
      keyboardshortcut_object const *shortcuts);
extern void window_add_keyboard_shortcuts (bits flags,
      toolbox_o window,
      int add_count,
      keyboardshortcut_object const *shortcuts);

/* ------------------------------------------------------------------------
 * Function:      window_remove_keyboard_shortcuts()
 *
 * Description:   Calls reason code 10 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                remove_count - value of R3 on entry
 *                shortcuts - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0xA.
 */

extern os_error *xwindow_remove_keyboard_shortcuts (bits flags,
      toolbox_o window,
      int remove_count,
      keyboardshortcut_object const *shortcuts);
extern void window_remove_keyboard_shortcuts (bits flags,
      toolbox_o window,
      int remove_count,
      keyboardshortcut_object const *shortcuts);

/* ------------------------------------------------------------------------
 * Function:      window_set_title()
 *
 * Description:   Calls reason code 11 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0xB.
 */

extern os_error *xwindow_set_title (bits flags,
      toolbox_o window,
      char const *title);
extern void window_set_title (bits flags,
      toolbox_o window,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      window_get_title()
 *
 * Description:   Calls reason code 12 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xC.
 */

extern os_error *xwindow_get_title (bits flags,
      toolbox_o window,
      char *buffer,
      int size,
      int *used);
extern int window_get_title (bits flags,
      toolbox_o window,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      window_set_default_focus()
 *
 * Description:   Calls reason code 13 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                focus - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0xD.
 */

extern os_error *xwindow_set_default_focus (bits flags,
      toolbox_o window,
      toolbox_c focus);
extern void window_set_default_focus (bits flags,
      toolbox_o window,
      toolbox_c focus);

/* ------------------------------------------------------------------------
 * Function:      window_get_default_focus()
 *
 * Description:   Calls reason code 14 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *
 * Output:        focus - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xE.
 */

extern os_error *xwindow_get_default_focus (bits flags,
      toolbox_o window,
      toolbox_c *focus);
extern toolbox_c window_get_default_focus (bits flags,
      toolbox_o window);

/* ------------------------------------------------------------------------
 * Function:      window_set_extent()
 *
 * Description:   Calls reason code 15 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                extent - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0xF.
 */

extern os_error *xwindow_set_extent (bits flags,
      toolbox_o window,
      os_box const *extent);
extern void window_set_extent (bits flags,
      toolbox_o window,
      os_box const *extent);

/* ------------------------------------------------------------------------
 * Function:      window_get_extent()
 *
 * Description:   Calls reason code 16 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                extent - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x10.
 */

extern os_error *xwindow_get_extent (bits flags,
      toolbox_o window,
      os_box *extent);
extern void window_get_extent (bits flags,
      toolbox_o window,
      os_box *extent);

/* ------------------------------------------------------------------------
 * Function:      window_force_redraw()
 *
 * Description:   Calls reason code 17 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                redraw - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x11.
 */

extern os_error *xwindow_force_redraw (bits flags,
      toolbox_o window,
      os_box const *redraw);
extern void window_force_redraw (bits flags,
      toolbox_o window,
      os_box const *redraw);

/* ------------------------------------------------------------------------
 * Function:      window_set_tool_bars()
 *
 * Description:   Calls reason code 18 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                ibl - value of R3 on entry
 *                itl - value of R4 on entry
 *                ebl - value of R5 on entry
 *                etl - value of R6 on entry
 *
 * Other notes:   Before entry, R2 = 0x12.
 */

extern os_error *xwindow_set_tool_bars (window_tool_bar_flags flags,
      toolbox_o window,
      toolbox_o ibl,
      toolbox_o itl,
      toolbox_o ebl,
      toolbox_o etl);
extern void window_set_tool_bars (window_tool_bar_flags flags,
      toolbox_o window,
      toolbox_o ibl,
      toolbox_o itl,
      toolbox_o ebl,
      toolbox_o etl);

/* ------------------------------------------------------------------------
 * Function:      window_get_tool_bars()
 *
 * Description:   Calls reason code 19 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *
 * Output:        ibl - value of R0 on exit
 *                itl - value of R1 on exit
 *                ebl - value of R2 on exit
 *                etl - value of R3 on exit
 *
 * Other notes:   Before entry, R2 = 0x13.
 */

extern os_error *xwindow_get_tool_bars (window_tool_bar_flags flags,
      toolbox_o window,
      toolbox_o *ibl,
      toolbox_o *itl,
      toolbox_o *ebl,
      toolbox_o *etl);
extern void window_get_tool_bars (window_tool_bar_flags flags,
      toolbox_o window,
      toolbox_o *ibl,
      toolbox_o *itl,
      toolbox_o *ebl,
      toolbox_o *etl);

/* ------------------------------------------------------------------------
 * Function:      service_window_module_starting()
 *
 * Description:   Window module has started and is ready to receive SWI
 *                calls
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x82881.
 */

extern os_error *xservice_window_module_starting (void);
extern void service_window_module_starting (void);

/* ------------------------------------------------------------------------
 * Function:      service_window_module_dying()
 *
 * Description:   Window module is closing down
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x82882.
 */

extern os_error *xservice_window_module_dying (void);
extern void service_window_module_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_gadget_registered()
 *
 * Description:   Gadget type has been registered
 *
 * Input:         type - value of R0 on entry
 *                handler_swi_number - value of R2 on entry
 *                feature_mask - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x82883.
 */

extern os_error *xservice_gadget_registered (int type,
      int handler_swi_number,
      bits feature_mask);
extern void service_gadget_registered (int type,
      int handler_swi_number,
      bits feature_mask);

/* ------------------------------------------------------------------------
 * Function:      service_gadget_deregistered()
 *
 * Description:   Gadget type has been deregistered
 *
 * Input:         type - value of R0 on entry
 *                handler_swi_number - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x82884.
 */

extern os_error *xservice_gadget_deregistered (int type,
      int handler_swi_number);
extern void service_gadget_deregistered (int type,
      int handler_swi_number);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
