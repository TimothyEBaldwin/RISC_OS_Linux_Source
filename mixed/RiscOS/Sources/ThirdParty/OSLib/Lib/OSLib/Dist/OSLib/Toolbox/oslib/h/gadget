#ifndef gadget_H
#define gadget_H

/* C header file for Gadget
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Sept 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Gadget_GetFlags
#define Gadget_GetFlags                         0x40
#undef  Gadget_SetFlags
#define Gadget_SetFlags                         0x41
#undef  Gadget_SetHelpMessage
#define Gadget_SetHelpMessage                   0x42
#undef  Gadget_GetHelpMessage
#define Gadget_GetHelpMessage                   0x43
#undef  Gadget_GetIconList
#define Gadget_GetIconList                      0x44
#undef  Gadget_SetFocus
#define Gadget_SetFocus                         0x45
#undef  Gadget_GetType
#define Gadget_GetType                          0x46
#undef  Gadget_MoveGadget
#define Gadget_MoveGadget                       0x47
#undef  Gadget_GetBBox
#define Gadget_GetBBox                          0x48

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct gadget_object                    gadget_object;
typedef struct gadget_object_base               gadget_object_base;
typedef struct gadget_extension                 gadget_extension;
typedef struct gadget_extension_list            gadget_extension_list;
typedef struct gadget_extension_list_base       gadget_extension_list_base;

/********************
 * Type definitions *
 ********************/
typedef bits gadget_flags;

#define gadget_OBJECT_MEMBERS \
   gadget_flags flags; \
   bits class_no_and_size; \
   os_box bbox; \
   toolbox_c cmp; \
   toolbox_msg_reference help_message; \
   int help_limit;

/* Base gadget_object structure without variable part */
struct gadget_object_base
   {  gadget_OBJECT_MEMBERS
   };

/* legacy structure */
struct gadget_object
   {  gadget_OBJECT_MEMBERS
      int gadget [UNKNOWN];
   };

#define gadget_OBJECT(N) \
   struct \
      {  gadget_OBJECT_MEMBERS \
         int gadget [N]; \
      }

#define gadget_SIZEOF_OBJECT(N) \
   (offsetof (gadget_object, gadget) + \
         (N)*sizeof ((gadget_object *) NULL)->gadget)

typedef bits gadget_feature;

struct gadget_extension
   {  int type;
      gadget_flags valid_flags;
      gadget_feature features;
   };

struct gadget_extension_list
   {  gadget_extension gadget [UNKNOWN];
   };

#define gadget_EXTENSION_LIST(N) \
   struct \
      {  gadget_extension gadget [N]; \
      }

#define gadget_SIZEOF_EXTENSION_LIST(N) \
   ((N)*sizeof ((gadget_extension_list *) NULL)->gadget)

/************************
 * Constant definitions *
 ************************/
#define gadget_FADED                            ((gadget_flags) 0x80000000u)
#define gadget_AT_BACK                          ((gadget_flags) 0x40000000u)
#define gadget_NO_HANDLER                       0x0u
#define gadget_DEFAULT_HANDLER                  0x1u
#define gadget_PRIVATE_HANDLER                  0x2u
#define gadget_FEATURE_ADD_SHIFT                0
#define gadget_FEATURE_ADD                      ((gadget_feature) 0x3u)
#define gadget_FEATURE_REMOVE_SHIFT             2
#define gadget_FEATURE_REMOVE                   ((gadget_feature) 0xCu)
#define gadget_FEATURE_POST_ADD_SHIFT           4
#define gadget_FEATURE_POST_ADD                 ((gadget_feature) 0x30u)
#define gadget_FEATURE_METHOD_SHIFT             6
#define gadget_FEATURE_METHOD                   ((gadget_feature) 0xC0u)
#define gadget_FEATURE_CLICK_SHIFT              10
#define gadget_FEATURE_CLICK                    ((gadget_feature) 0xC00u)
#define gadget_FEATURE_PLOT_SHIFT               16
#define gadget_FEATURE_PLOT                     ((gadget_feature) 0x30000u)
#define gadget_FEATURE_SET_FOCUS_SHIFT          18
#define gadget_FEATURE_SET_FOCUS                ((gadget_feature) 0xC0000u)
#define gadget_FEATURE_MOVE_SHIFT               20
#define gadget_FEATURE_MOVE                     ((gadget_feature) 0x300000u)
#define gadget_FEATURE_FADE_SHIFT               22
#define gadget_FEATURE_FADE                     ((gadget_feature) 0xC00000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      gadget_get_flags()
 *
 * Description:   Gets the flags for a particular gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x40.
 */

extern os_error *xgadget_get_flags (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      gadget_flags *flags_out);
extern gadget_flags gadget_get_flags (bits flags,
      toolbox_o window,
      toolbox_c gadget);

/* ------------------------------------------------------------------------
 * Function:      gadget_set_flags()
 *
 * Description:   Sets the flags for a particular gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                flags_in - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x41.
 */

extern os_error *xgadget_set_flags (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      gadget_flags flags_in);
extern void gadget_set_flags (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      gadget_flags flags_in);

/* ------------------------------------------------------------------------
 * Function:      gadget_set_help_message()
 *
 * Description:   Sets the help message for a particular gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                help_message - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x42.
 */

extern os_error *xgadget_set_help_message (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      char const *help_message);
extern void gadget_set_help_message (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      char const *help_message);

/* ------------------------------------------------------------------------
 * Function:      gadget_get_help_message()
 *
 * Description:   Gets the help message that is associated with a
 *                particular gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                help_message - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x43.
 */

extern os_error *xgadget_get_help_message (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      char *help_message,
      int size,
      int *used);
extern int gadget_get_help_message (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      char *help_message,
      int size);

/* ------------------------------------------------------------------------
 * Function:      gadget_get_icon_list()
 *
 * Description:   Gets the list of icon handles that are associated with a
 *                gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x44.
 */

extern os_error *xgadget_get_icon_list (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      wimp_i *buffer,
      int size,
      int *used);
extern int gadget_get_icon_list (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      wimp_i *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      gadget_set_focus()
 *
 * Description:   Sets the type for the specified gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x45.
 */

extern os_error *xgadget_set_focus (bits flags,
      toolbox_o window,
      toolbox_c gadget);
extern void gadget_set_focus (bits flags,
      toolbox_o window,
      toolbox_c gadget);

/* ------------------------------------------------------------------------
 * Function:      gadget_get_type()
 *
 * Description:   Gets the type for the specified gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *
 * Output:        type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x46.
 */

extern os_error *xgadget_get_type (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      int *type);
extern int gadget_get_type (bits flags,
      toolbox_o window,
      toolbox_c gadget);

/* ------------------------------------------------------------------------
 * Function:      gadget_move_gadget()
 *
 * Description:   Moves an already created gadget in the specified window
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                bbox - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x47.
 */

extern os_error *xgadget_move_gadget (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      os_box const *bbox);
extern void gadget_move_gadget (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      os_box const *bbox);

/* ------------------------------------------------------------------------
 * Function:      gadget_get_bbox()
 *
 * Description:   Gets the bounding box of a gadget
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                gadget - value of R3 on entry
 *                bbox - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x48.
 */

extern os_error *xgadget_get_bbox (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      os_box *bbox);
extern void gadget_get_bbox (bits flags,
      toolbox_o window,
      toolbox_c gadget,
      os_box *bbox);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
