#ifndef wimpspriteop_H
#define wimpspriteop_H

/* C header file for WimpSpriteOp
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 May 1995
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
#undef  Wimp_SpriteOp
#define Wimp_SpriteOp                           0x400E9
#undef  XWimp_SpriteOp
#define XWimp_SpriteOp                          0x600E9
#undef  WimpSpriteOp_MergeSpriteFile
#define WimpSpriteOp_MergeSpriteFile            0xB
#undef  WimpSpriteOp_GetSprite
#define WimpSpriteOp_GetSprite                  0xE
#undef  WimpSpriteOp_SelectSprite
#define WimpSpriteOp_SelectSprite               0x18
#undef  WimpSpriteOp_PutSprite
#define WimpSpriteOp_PutSprite                  0x1C
#undef  WimpSpriteOp_PutSpriteUserCoords
#define WimpSpriteOp_PutSpriteUserCoords        0x22
#undef  WimpSpriteOp_SetPointerShape
#define WimpSpriteOp_SetPointerShape            0x24
#undef  WimpSpriteOp_ReadPaletteSize
#define WimpSpriteOp_ReadPaletteSize            0x25
#undef  WimpSpriteOp_ReadSpriteSize
#define WimpSpriteOp_ReadSpriteSize             0x28
#undef  WimpSpriteOp_ReadSpriteInfo
#define WimpSpriteOp_ReadSpriteInfo             0x28
#undef  WimpSpriteOp_ReadPixelColour
#define WimpSpriteOp_ReadPixelColour            0x29
#undef  WimpSpriteOp_ReadPixelMask
#define WimpSpriteOp_ReadPixelMask              0x2B
#undef  WimpSpriteOp_PlotMask
#define WimpSpriteOp_PlotMask                   0x30
#undef  WimpSpriteOp_PlotMaskUserCoords
#define WimpSpriteOp_PlotMaskUserCoords         0x31
#undef  WimpSpriteOp_PlotMaskScaled
#define WimpSpriteOp_PlotMaskScaled             0x32
#undef  WimpSpriteOp_PutSpriteScaled
#define WimpSpriteOp_PutSpriteScaled            0x34
#undef  WimpSpriteOp_PutSpriteGreyScaled
#define WimpSpriteOp_PutSpriteGreyScaled        0x35
#undef  WimpSpriteOp_PlotMaskTrfm
#define WimpSpriteOp_PlotMaskTrfm               0x37
#undef  WimpSpriteOp_PutSpriteTrfm
#define WimpSpriteOp_PutSpriteTrfm              0x38

/************************
 * Constant definitions *
 ************************/
#define wimpspriteop_AREA                       ((osspriteop_area *) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_merge_sprite_file()
 *
 * Description:   Merges sprite file
 *
 * Input:         file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0xB.
 */

extern os_error *xwimpspriteop_merge_sprite_file (char const *file_name);
extern void wimpspriteop_merge_sprite_file (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_get_sprite()
 *
 * Description:   Gets sprite
 *
 * Input:         sprite_name - value of R2 on entry
 *                get_palette - value of R3 on entry
 *
 * Output:        header - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0xE.
 */

extern os_error *xwimpspriteop_get_sprite (char const *sprite_name,
      osbool get_palette,
      osspriteop_header **header);
extern osspriteop_header *wimpspriteop_get_sprite (char const *sprite_name,
      osbool get_palette);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_select_sprite()
 *
 * Description:   Selects sprite
 *
 * Input:         sprite_name - value of R2 on entry
 *
 * Output:        header - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x18.
 */

extern os_error *xwimpspriteop_select_sprite (char const *sprite_name,
      osspriteop_header **header);
extern osspriteop_header *wimpspriteop_select_sprite (char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_put_sprite()
 *
 * Description:   Puts sprite
 *
 * Input:         sprite_name - value of R2 on entry
 *                action - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x1C.
 */

extern os_error *xwimpspriteop_put_sprite (char const *sprite_name,
      os_action action);
extern void wimpspriteop_put_sprite (char const *sprite_name,
      os_action action);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_put_sprite_user_coords()
 *
 * Description:   Puts sprite at user coordinates
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                action - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x22.
 */

extern os_error *xwimpspriteop_put_sprite_user_coords (char const *sprite_name,
      int x,
      int y,
      os_action action);
extern void wimpspriteop_put_sprite_user_coords (char const *sprite_name,
      int x,
      int y,
      os_action action);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_set_pointer_shape()
 *
 * Description:   Sets pointer shape
 *
 * Input:         sprite_name - value of R2 on entry
 *                flags - value of R3 on entry
 *                xactive - value of R4 on entry
 *                yactive - value of R5 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x24.
 */

extern os_error *xwimpspriteop_set_pointer_shape (char const *sprite_name,
      bits flags,
      int xactive,
      int yactive,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void wimpspriteop_set_pointer_shape (char const *sprite_name,
      bits flags,
      int xactive,
      int yactive,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_read_palette_size()
 *
 * Description:   Reads palette size
 *
 * Input:         sprite_name - value of R2 on entry
 *
 * Output:        size - value of R3 on exit
 *                palette - value of R4 on exit
 *                mode - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x25, R3 = 0xFFFFFFFF.
 */

extern os_error *xwimpspriteop_read_palette_size (char const *sprite_name,
      int *size,
      os_sprite_palette **palette,
      os_mode *mode);
extern void wimpspriteop_read_palette_size (char const *sprite_name,
      int *size,
      os_sprite_palette **palette,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_read_sprite_size()
 *
 * Description:   Synonymous with _ReadSpriteInfo. Reads sprite information
 *
 * Input:         sprite_name - value of R2 on entry
 *
 * Output:        width - value of R3 on exit
 *                height - value of R4 on exit
 *                mask - value of R5 on exit
 *                mode - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x28.
 */

extern os_error *xwimpspriteop_read_sprite_size (char const *sprite_name,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);
extern void wimpspriteop_read_sprite_size (char const *sprite_name,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_read_sprite_info()
 *
 * Description:   Reads sprite information
 *
 * Input:         sprite_name - value of R2 on entry
 *
 * Output:        width - value of R3 on exit
 *                height - value of R4 on exit
 *                mask - value of R5 on exit
 *                mode - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x28.
 */

extern os_error *xwimpspriteop_read_sprite_info (char const *sprite_name,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);
extern void wimpspriteop_read_sprite_info (char const *sprite_name,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_read_pixel_colour()
 *
 * Description:   Reads pixel colour
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        gcol - value of R5 on exit
 *                tint - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x29.
 */

extern os_error *xwimpspriteop_read_pixel_colour (char const *sprite_name,
      int x,
      int y,
      os_gcol *gcol,
      os_tint *tint);
extern void wimpspriteop_read_pixel_colour (char const *sprite_name,
      int x,
      int y,
      os_gcol *gcol,
      os_tint *tint);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_read_pixel_mask()
 *
 * Description:   Reads pixel mask
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        solid - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x2B.
 */

extern os_error *xwimpspriteop_read_pixel_mask (char const *sprite_name,
      int x,
      int y,
      osbool *solid);
extern osbool wimpspriteop_read_pixel_mask (char const *sprite_name,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_plot_mask()
 *
 * Description:   Plots sprite mask
 *
 * Input:         sprite_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x30.
 */

extern os_error *xwimpspriteop_plot_mask (char const *sprite_name);
extern void wimpspriteop_plot_mask (char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_plot_mask_user_coords()
 *
 * Description:   Plots sprite mask at user coordinates
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x31.
 */

extern os_error *xwimpspriteop_plot_mask_user_coords (char const *sprite_name,
      int x,
      int y);
extern void wimpspriteop_plot_mask_user_coords (char const *sprite_name,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_plot_mask_scaled()
 *
 * Description:   Plots mask scaled
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                factors - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x32.
 */

extern os_error *xwimpspriteop_plot_mask_scaled (char const *sprite_name,
      int x,
      int y,
      os_factors const *factors);
extern void wimpspriteop_plot_mask_scaled (char const *sprite_name,
      int x,
      int y,
      os_factors const *factors);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_put_sprite_scaled()
 *
 * Description:   Puts sprite scaled
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                action - value of R5 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x34.
 */

extern os_error *xwimpspriteop_put_sprite_scaled (char const *sprite_name,
      int x,
      int y,
      os_action action,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void wimpspriteop_put_sprite_scaled (char const *sprite_name,
      int x,
      int y,
      os_action action,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_put_sprite_grey_scaled()
 *
 * Description:   Puts sprite scaled and anti-aliased
 *
 * Input:         sprite_name - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x35, R5 = 0x0.
 */

extern os_error *xwimpspriteop_put_sprite_grey_scaled (char const *sprite_name,
      int x,
      int y,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void wimpspriteop_put_sprite_grey_scaled (char const *sprite_name,
      int x,
      int y,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_plot_mask_trfm()
 *
 * Description:   Plots sprite mask transformed
 *
 * Input:         sprite_name - value of R2 on entry
 *                flags - value of R3 on entry
 *                source_rect - value of R4 on entry
 *                trfm - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x37.
 */

extern os_error *xwimpspriteop_plot_mask_trfm (char const *sprite_name,
      bits flags,
      os_box const *source_rect,
      os_trfm const *trfm);
extern void wimpspriteop_plot_mask_trfm (char const *sprite_name,
      bits flags,
      os_box const *source_rect,
      os_trfm const *trfm);

/* ------------------------------------------------------------------------
 * Function:      wimpspriteop_put_sprite_trfm()
 *
 * Description:   Puts sprite transformed
 *
 * Input:         sprite_name - value of R2 on entry
 *                flags - value of R3 on entry
 *                source_rect - value of R4 on entry
 *                action - value of R5 on entry
 *                trfm - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400E9 with R0 = 0x38.
 */

extern os_error *xwimpspriteop_put_sprite_trfm (char const *sprite_name,
      bits flags,
      os_box const *source_rect,
      os_action action,
      os_trfm const *trfm,
      osspriteop_trans_tab const *trans_tab);
extern void wimpspriteop_put_sprite_trfm (char const *sprite_name,
      bits flags,
      os_box const *source_rect,
      os_action action,
      os_trfm const *trfm,
      osspriteop_trans_tab const *trans_tab);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
