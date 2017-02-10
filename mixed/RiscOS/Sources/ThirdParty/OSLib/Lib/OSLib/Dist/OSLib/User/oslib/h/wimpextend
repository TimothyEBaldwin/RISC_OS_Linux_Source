#ifndef wimpextend_H
#define wimpextend_H

/* C header file for WimpExtend
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Richard Sargeant, sargeant@arcade.demon.co.uk, 04-Mar-1999
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

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Wimp_Extend
#define Wimp_Extend                             0x400FB
#undef  XWimp_Extend
#define XWimp_Extend                            0x600FB
#undef  WimpExtend_GetParent
#define WimpExtend_GetParent                    0x6
#undef  WimpExtend_GetFrontChild
#define WimpExtend_GetFrontChild                0x7
#undef  WimpExtend_GetBackChild
#define WimpExtend_GetBackChild                 0x8
#undef  WimpExtend_GetSiblingUnder
#define WimpExtend_GetSiblingUnder              0x9
#undef  WimpExtend_GetSiblingOver
#define WimpExtend_GetSiblingOver               0xA
#undef  WimpExtend_GetFurnitureSizes
#define WimpExtend_GetFurnitureSizes            0xB
#undef  WimpExtend_GetSpriteAddress
#define WimpExtend_GetSpriteAddress             0xD

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct wimpextend_furniture_sizes       wimpextend_furniture_sizes;

/********************
 * Type definitions *
 ********************/
struct wimpextend_furniture_sizes
   {  wimp_w w;
      os_box border_widths;
      int back_width;
      int close_width;
      int reserved1;
      int title_width;
      int reserved2;
      int iconise_width;
      int toggle_size_width;
      int toggle_size_height;
      int vertical_scroll_upper_gap;
      int up_arrow_height;
      int vertical_scroll_well_height;
      int down_arrow_height;
      int vertical_scroll_lower_gap;
      int adjust_size_height;
      int adjust_size_width;
      int horizontal_scroll_right_gap;
      int right_arrow_width;
      int horizontal_scroll_well_width;
      int left_arrow_width;
      int horizontal_scroll_left_gap;
   };

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_parent()
 *
 * Description:   Finds the window's parent - nested Wimp / RISC O S 3.8+
 *
 * Input:         w - value of R1 on entry
 *
 * Output:        parent - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0x6.
 */

extern os_error *xwimpextend_get_parent (wimp_w w,
      wimp_w *parent);
extern wimp_w wimpextend_get_parent (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_front_child()
 *
 * Description:   Finds the window's frontmost child; this call may also be
 *                used to enquire about the top-level stack - nested Wimp /
 *                RISC O S 3.8+
 *
 * Input:         w - value of R1 on entry
 *
 * Output:        child - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0x7.
 */

extern os_error *xwimpextend_get_front_child (wimp_w w,
      wimp_w *child);
extern wimp_w wimpextend_get_front_child (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_back_child()
 *
 * Description:   Finds the window's backmost child; this call may also be
 *                used to enquire about the top-level stack - nested Wimp /
 *                RISC O S 3.8+
 *
 * Input:         w - value of R1 on entry
 *
 * Output:        child - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0x8.
 */

extern os_error *xwimpextend_get_back_child (wimp_w w,
      wimp_w *child);
extern wimp_w wimpextend_get_back_child (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_sibling_under()
 *
 * Description:   Finds the window's sibling that's immediately behind -
 *                nested Wimp / RISC O S 3.8+
 *
 * Input:         w - value of R1 on entry
 *
 * Output:        sibling - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0x9.
 */

extern os_error *xwimpextend_get_sibling_under (wimp_w w,
      wimp_w *sibling);
extern wimp_w wimpextend_get_sibling_under (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_sibling_over()
 *
 * Description:   Finds the window's sibling that's immediately in front -
 *                nested Wimp / RISC O S 3.8+
 *
 * Input:         w - value of R1 on entry
 *
 * Output:        sibling - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0xA.
 */

extern os_error *xwimpextend_get_sibling_over (wimp_w w,
      wimp_w *sibling);
extern wimp_w wimpextend_get_sibling_over (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_furniture_sizes()
 *
 * Description:   Finds the sizes of the window's various items of
 *                furniture - RISC O S 4+
 *
 * Input:         sizes - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0xB.
 */

extern os_error *xwimpextend_get_furniture_sizes (wimpextend_furniture_sizes *sizes);
extern void wimpextend_get_furniture_sizes (wimpextend_furniture_sizes *sizes);

/* ------------------------------------------------------------------------
 * Function:      wimpextend_get_sprite_address()
 *
 * Description:   Lookup a sprite using the same algorithm as the Window
 *                Manager - RISC O S Select
 *
 * Input:         sprite_area - value of R1 on entry
 *                sprite_name - value of R2 on entry
 *
 * Output:        area - value of R1 on exit
 *                sprite - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x400FB with R0 = 0xD.
 */

extern os_error *xwimpextend_get_sprite_address (osspriteop_area const *sprite_area,
      char const *sprite_name,
      osspriteop_area **area,
      osspriteop_header **sprite);
extern void wimpextend_get_sprite_address (osspriteop_area const *sprite_area,
      char const *sprite_name,
      osspriteop_area **area,
      osspriteop_header **sprite);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
