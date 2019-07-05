#ifndef colourtrans_H
#define colourtrans_H

/* C header file for ColourTrans
 * written by DefMod (Jan  2 2007) on Tue Jan  2 12:21:49 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 28 July 1995
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

#ifndef font_H
#include "oslib/font.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ColourTrans_SelectTable
#define ColourTrans_SelectTable                 0x40740
#undef  XColourTrans_SelectTable
#define XColourTrans_SelectTable                0x60740
#undef  ColourTrans_SelectTableForSprite
#define ColourTrans_SelectTableForSprite        0x40740
#undef  XColourTrans_SelectTableForSprite
#define XColourTrans_SelectTableForSprite       0x60740
#undef  ColourTrans_SelectGCOLTable
#define ColourTrans_SelectGCOLTable             0x40741
#undef  XColourTrans_SelectGCOLTable
#define XColourTrans_SelectGCOLTable            0x60741
#undef  ColourTrans_SelectGCOLTableForSprite
#define ColourTrans_SelectGCOLTableForSprite    0x40741
#undef  XColourTrans_SelectGCOLTableForSprite
#define XColourTrans_SelectGCOLTableForSprite   0x60741
#undef  ColourTrans_ReturnGCOL
#define ColourTrans_ReturnGCOL                  0x40742
#undef  XColourTrans_ReturnGCOL
#define XColourTrans_ReturnGCOL                 0x60742
#undef  ColourTrans_SetGCOL
#define ColourTrans_SetGCOL                     0x40743
#undef  XColourTrans_SetGCOL
#define XColourTrans_SetGCOL                    0x60743
#undef  ColourTrans_ReturnColourNumber
#define ColourTrans_ReturnColourNumber          0x40744
#undef  XColourTrans_ReturnColourNumber
#define XColourTrans_ReturnColourNumber         0x60744
#undef  ColourTrans_ReturnGCOLForMode
#define ColourTrans_ReturnGCOLForMode           0x40745
#undef  XColourTrans_ReturnGCOLForMode
#define XColourTrans_ReturnGCOLForMode          0x60745
#undef  ColourTrans_ReturnColourNumberForMode
#define ColourTrans_ReturnColourNumberForMode   0x40746
#undef  XColourTrans_ReturnColourNumberForMode
#define XColourTrans_ReturnColourNumberForMode  0x60746
#undef  ColourTrans_ReturnOppGCOL
#define ColourTrans_ReturnOppGCOL               0x40747
#undef  XColourTrans_ReturnOppGCOL
#define XColourTrans_ReturnOppGCOL              0x60747
#undef  ColourTrans_SetOppGCOL
#define ColourTrans_SetOppGCOL                  0x40748
#undef  XColourTrans_SetOppGCOL
#define XColourTrans_SetOppGCOL                 0x60748
#undef  ColourTrans_ReturnOppColourNumber
#define ColourTrans_ReturnOppColourNumber       0x40749
#undef  XColourTrans_ReturnOppColourNumber
#define XColourTrans_ReturnOppColourNumber      0x60749
#undef  ColourTrans_ReturnOppGCOLForMode
#define ColourTrans_ReturnOppGCOLForMode        0x4074A
#undef  XColourTrans_ReturnOppGCOLForMode
#define XColourTrans_ReturnOppGCOLForMode       0x6074A
#undef  ColourTrans_ReturnOppColourNumberForMode
#define ColourTrans_ReturnOppColourNumberForMode 0x4074B
#undef  XColourTrans_ReturnOppColourNumberForMode
#define XColourTrans_ReturnOppColourNumberForMode 0x6074B
#undef  ColourTrans_GCOLToColourNumber
#define ColourTrans_GCOLToColourNumber          0x4074C
#undef  XColourTrans_GCOLToColourNumber
#define XColourTrans_GCOLToColourNumber         0x6074C
#undef  ColourTrans_ColourNumberToGCOL
#define ColourTrans_ColourNumberToGCOL          0x4074D
#undef  XColourTrans_ColourNumberToGCOL
#define XColourTrans_ColourNumberToGCOL         0x6074D
#undef  ColourTrans_ReturnFontColours
#define ColourTrans_ReturnFontColours           0x4074E
#undef  XColourTrans_ReturnFontColours
#define XColourTrans_ReturnFontColours          0x6074E
#undef  ColourTrans_SetFontColours
#define ColourTrans_SetFontColours              0x4074F
#undef  XColourTrans_SetFontColours
#define XColourTrans_SetFontColours             0x6074F
#undef  ColourTrans_InvalidateCache
#define ColourTrans_InvalidateCache             0x40750
#undef  XColourTrans_InvalidateCache
#define XColourTrans_InvalidateCache            0x60750
#undef  ColourTrans_SetCalibration
#define ColourTrans_SetCalibration              0x40751
#undef  XColourTrans_SetCalibration
#define XColourTrans_SetCalibration             0x60751
#undef  ColourTrans_ReadCalibration
#define ColourTrans_ReadCalibration             0x40752
#undef  XColourTrans_ReadCalibration
#define XColourTrans_ReadCalibration            0x60752
#undef  ColourTrans_ConvertDeviceColour
#define ColourTrans_ConvertDeviceColour         0x40753
#undef  XColourTrans_ConvertDeviceColour
#define XColourTrans_ConvertDeviceColour        0x60753
#undef  ColourTrans_ConvertDevicePalette
#define ColourTrans_ConvertDevicePalette        0x40754
#undef  XColourTrans_ConvertDevicePalette
#define XColourTrans_ConvertDevicePalette       0x60754
#undef  ColourTrans_ConvertRGBToCIE
#define ColourTrans_ConvertRGBToCIE             0x40755
#undef  XColourTrans_ConvertRGBToCIE
#define XColourTrans_ConvertRGBToCIE            0x60755
#undef  ColourTrans_ConvertCIEToRGB
#define ColourTrans_ConvertCIEToRGB             0x40756
#undef  XColourTrans_ConvertCIEToRGB
#define XColourTrans_ConvertCIEToRGB            0x60756
#undef  ColourTrans_WriteCalibrationToFile
#define ColourTrans_WriteCalibrationToFile      0x40757
#undef  XColourTrans_WriteCalibrationToFile
#define XColourTrans_WriteCalibrationToFile     0x60757
#undef  ColourTrans_WriteCalibrationToFileW
#define ColourTrans_WriteCalibrationToFileW     0x40757
#undef  XColourTrans_WriteCalibrationToFileW
#define XColourTrans_WriteCalibrationToFileW    0x60757
#undef  ColourTrans_ConvertRGBToHSV
#define ColourTrans_ConvertRGBToHSV             0x40758
#undef  XColourTrans_ConvertRGBToHSV
#define XColourTrans_ConvertRGBToHSV            0x60758
#undef  ColourTrans_ConvertHSVToRGB
#define ColourTrans_ConvertHSVToRGB             0x40759
#undef  XColourTrans_ConvertHSVToRGB
#define XColourTrans_ConvertHSVToRGB            0x60759
#undef  ColourTrans_ConvertRGBToCMYK
#define ColourTrans_ConvertRGBToCMYK            0x4075A
#undef  XColourTrans_ConvertRGBToCMYK
#define XColourTrans_ConvertRGBToCMYK           0x6075A
#undef  ColourTrans_ConvertCMYKToRGB
#define ColourTrans_ConvertCMYKToRGB            0x4075B
#undef  XColourTrans_ConvertCMYKToRGB
#define XColourTrans_ConvertCMYKToRGB           0x6075B
#undef  ColourTrans_ReadPalette
#define ColourTrans_ReadPalette                 0x4075C
#undef  XColourTrans_ReadPalette
#define XColourTrans_ReadPalette                0x6075C
#undef  ColourTrans_WritePalette
#define ColourTrans_WritePalette                0x4075D
#undef  XColourTrans_WritePalette
#define XColourTrans_WritePalette               0x6075D
#undef  ColourTrans_SetColour
#define ColourTrans_SetColour                   0x4075E
#undef  XColourTrans_SetColour
#define XColourTrans_SetColour                  0x6075E
#undef  ColourTrans_MiscOp
#define ColourTrans_MiscOp                      0x4075F
#undef  XColourTrans_MiscOp
#define XColourTrans_MiscOp                     0x6075F
#undef  ColourTransMiscOp_SetWeights
#define ColourTransMiscOp_SetWeights            0x0
#undef  ColourTrans_WriteLoadingsToFile
#define ColourTrans_WriteLoadingsToFile         0x40760
#undef  XColourTrans_WriteLoadingsToFile
#define XColourTrans_WriteLoadingsToFile        0x60760
#undef  ColourTrans_WriteLoadingsToFileW
#define ColourTrans_WriteLoadingsToFileW        0x40760
#undef  XColourTrans_WriteLoadingsToFileW
#define XColourTrans_WriteLoadingsToFileW       0x60760
#undef  ColourTrans_SetTextColour
#define ColourTrans_SetTextColour               0x40761
#undef  XColourTrans_SetTextColour
#define XColourTrans_SetTextColour              0x60761
#undef  ColourTrans_SetOppTextColour
#define ColourTrans_SetOppTextColour            0x40762
#undef  XColourTrans_SetOppTextColour
#define XColourTrans_SetOppTextColour           0x60762
#undef  ColourTrans_GenerateTable
#define ColourTrans_GenerateTable               0x40763
#undef  XColourTrans_GenerateTable
#define XColourTrans_GenerateTable              0x60763
#undef  ColourTrans_GenerateTableForSprite
#define ColourTrans_GenerateTableForSprite      0x40763
#undef  XColourTrans_GenerateTableForSprite
#define XColourTrans_GenerateTableForSprite     0x60763
#undef  ColourV
#define ColourV                                 0x22
#undef  Service_CalibrationChanged
#define Service_CalibrationChanged              0x5B
#undef  Service_InvalidateCache
#define Service_InvalidateCache                 0x82

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct colourtrans_gcol_list            colourtrans_gcol_list;
typedef struct colourtrans_gcol_list_base       colourtrans_gcol_list_base;
typedef struct colourtrans_calibration_table    colourtrans_calibration_table;
typedef struct colourtrans_calibration_table_base colourtrans_calibration_table_base;

/********************
 * Type definitions *
 ********************/
typedef bits colourtrans_gcol_flags;

typedef bits colourtrans_table_flags;

typedef bits colourtrans_calibration_flags;

typedef bits colourtrans_palette_flags;

typedef bits colourtrans_colour_flags;

typedef bits colourtrans_text_colour_flags;

struct colourtrans_gcol_list
   {  os_gcol gcol [UNKNOWN];
   };

#define colourtrans_GCOL_LIST(N) \
   struct \
      {  os_gcol gcol [N]; \
      }

#define colourtrans_SIZEOF_GCOL_LIST(N) \
   ((N)*sizeof ((colourtrans_gcol_list *) NULL)->gcol)

#define colourtrans_CALIBRATION_TABLE_MEMBERS \
   int rcount; \
   int gcount; \
   int bcount;

/* Base colourtrans_calibration_table structure without variable part */
struct colourtrans_calibration_table_base
   {  colourtrans_CALIBRATION_TABLE_MEMBERS
   };

/* legacy structure */
struct colourtrans_calibration_table
   {  colourtrans_CALIBRATION_TABLE_MEMBERS
      os_colour standard_colour [UNKNOWN];
   };

#define colourtrans_CALIBRATION_TABLE(N) \
   struct \
      {  colourtrans_CALIBRATION_TABLE_MEMBERS \
         os_colour standard_colour [N]; \
      }

#define colourtrans_SIZEOF_CALIBRATION_TABLE(N) \
   (offsetof (colourtrans_calibration_table, standard_colour) + \
         (N)*sizeof ((colourtrans_calibration_table *) NULL)->standard_colour)

/************************
 * Constant definitions *
 ************************/
#define colourtrans_COLOUR_RANGE                65536
#define colourtrans_SET_FG_GCOL                 ((colourtrans_gcol_flags) 0x0u)
#define colourtrans_SET_BG_GCOL                 ((colourtrans_gcol_flags) 0x80u)
#define colourtrans_USE_ECFS_GCOL               ((colourtrans_gcol_flags) 0x100u)
#define colourtrans_SET_TEXT_GCOL               ((colourtrans_gcol_flags) 0x200u)
#define colourtrans_GIVEN_SPRITE                ((colourtrans_table_flags) 0x1u)
#define colourtrans_CURRENT_IF_ABSENT           ((colourtrans_table_flags) 0x2u)
#define colourtrans_GIVEN_TRANSFER_FN           ((colourtrans_table_flags) 0x4u)
#define colourtrans_RETURN_GCOL_LIST            ((colourtrans_table_flags) 0x8u)
#define colourtrans_RETURN_WIDE_ENTRIES         ((colourtrans_table_flags) 0x10u)
#define colourtrans_RETURN_PALETTE_TABLE        ((colourtrans_table_flags) 0x1000000u)
#define colourtrans_WRITE_DEFAULT_CALIBRATION   ((colourtrans_calibration_flags) 0x1u)
#define colourtrans_PALETTE_FOR_SPRITE          ((colourtrans_palette_flags) 0x1u)
#define colourtrans_FLASHING_PALETTE            ((colourtrans_palette_flags) 0x2u)
#define colourtrans_SET_FG_COL                  ((colourtrans_colour_flags) 0x0u)
#define colourtrans_SET_BG_COL                  ((colourtrans_colour_flags) 0x80u)
#define colourtrans_SET_TEXT_COL                ((colourtrans_colour_flags) 0x200u)
#define colourtrans_SET_FG_TEXT_COL             ((colourtrans_text_colour_flags) 0x0u)
#define colourtrans_SET_BG_TEXT_COL             ((colourtrans_text_colour_flags) 0x80u)
#define colourtrans_CURRENT_PALETTE             ((os_palette *) 0xFFFFFFFFu)
#define colourtrans_DEFAULT_PALETTE             ((os_palette *) 0x0u)
#define colourtrans_CURRENT_FONT                ((font_f) 0x0u)
#define colourtrans_CURRENT_MODE                ((os_mode) 0xFFFFFFFFu)
#define error_COLOUR_TRANS_BAD_CALIB            0xA00u
#define error_COLOUR_TRANS_CONV_OVER            0xA01u
#define error_COLOUR_TRANS_BAD_HSV              0xA02u
#define error_COLOUR_TRANS_SWITCHED             0xA03u
#define error_COLOUR_TRANS_BAD_MISC_OP          0xA04u
#define error_COLOUR_TRANS_BAD_FLAGS            0xA05u
#define error_COLOUR_TRANS_BUFF_OVER            0xA06u
#define error_COLOUR_TRANS_BAD_DEPTH            0xA07u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      colourtrans_select_table()
 *
 * Description:   Sets up a translation table in a buffer (PRM 3-346,
 *                5a-119, 5a-668) - Prefer ColourTrans_GenerateTable
 *
 * Input:         source_mode - value of R0 on entry
 *                source_palette - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                trans_tab - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40740.
 */

extern os_error *xcolourtrans_select_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab);
extern void colourtrans_select_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_select_table_for_sprite()
 *
 * Description:   Sets up a translation table for a sprite in a buffer (PRM
 *                3-346, 5a-119, 5a-668) - Prefer
 *                ColourTrans_GenerateTableForSprite
 *
 * Input:         source_area - value of R0 on entry
 *                source_id - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                trans_tab - value of R4 on entry
 *                flags - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40740.
 */

extern os_error *xcolourtrans_select_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags);
extern void colourtrans_select_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_select_gcol_table()
 *
 * Description:   Sets up a list of GCOL's in a buffer
 *
 * Input:         source_mode - value of R0 on entry
 *                source_palette - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                gcol_list - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40741.
 */

extern os_error *xcolourtrans_select_gcol_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      colourtrans_gcol_list *gcol_list);
extern void colourtrans_select_gcol_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      colourtrans_gcol_list *gcol_list);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_select_gcol_table_for_sprite()
 *
 * Description:   Sets up a list of GCOL's for a sprite in a buffer
 *
 * Input:         source_area - value of R0 on entry
 *                source_id - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                gcol_list - value of R4 on entry
 *                flags - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40741.
 */

extern os_error *xcolourtrans_select_gcol_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      colourtrans_gcol_list *gcol_list,
      colourtrans_table_flags flags);
extern void colourtrans_select_gcol_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      colourtrans_gcol_list *gcol_list,
      colourtrans_table_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_gcol()
 *
 * Description:   Gets the closest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40742.
 */

extern os_error *xcolourtrans_return_gcol (os_colour colour,
      os_gcol *gcol);
__swi (0x40742) os_gcol colourtrans_return_gcol (os_colour colour);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_gcol()
 *
 * Description:   Sets the closest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                flags - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *                log2_bpp - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40743.
 */

extern os_error *xcolourtrans_set_gcol (os_colour colour,
      colourtrans_gcol_flags flags,
      os_action action,
      os_gcol *gcol,
      int *log2_bpp);
extern os_gcol colourtrans_set_gcol (os_colour colour,
      colourtrans_gcol_flags flags,
      os_action action,
      int *log2_bpp);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_colour_number()
 *
 * Description:   Gets the closest colour for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *
 * Output:        colour_number - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40744.
 */

extern os_error *xcolourtrans_return_colour_number (os_colour colour,
      os_colour_number *colour_number);
__swi (0x40744) os_colour_number colourtrans_return_colour_number (os_colour colour);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_gcol_for_mode()
 *
 * Description:   Sets the closest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                mode - value of R1 on entry
 *                dest_palette - value of R2 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40745.
 */

extern os_error *xcolourtrans_return_gcol_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette,
      os_gcol *gcol);
__swi (0x40745) os_gcol colourtrans_return_gcol_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_colour_number_for_mode()
 *
 * Description:   Gets the closest colour for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                mode - value of R1 on entry
 *                dest_palette - value of R2 on entry
 *
 * Output:        colour_number - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40746.
 */

extern os_error *xcolourtrans_return_colour_number_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette,
      os_colour_number *colour_number);
__swi (0x40746) os_colour_number colourtrans_return_colour_number_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_opp_gcol()
 *
 * Description:   Gets the furthest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40747.
 */

extern os_error *xcolourtrans_return_opp_gcol (os_colour colour,
      os_gcol *gcol);
__swi (0x40747) os_gcol colourtrans_return_opp_gcol (os_colour colour);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_opp_gcol()
 *
 * Description:   Sets the furthest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                flags - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *                log2_bpp - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40748.
 */

extern os_error *xcolourtrans_set_opp_gcol (os_colour colour,
      colourtrans_gcol_flags flags,
      os_action action,
      os_gcol *gcol,
      int *log2_bpp);
extern os_gcol colourtrans_set_opp_gcol (os_colour colour,
      colourtrans_gcol_flags flags,
      os_action action,
      int *log2_bpp);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_opp_colour_number()
 *
 * Description:   Gets the furthest colour for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *
 * Output:        colour_number - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40749.
 */

extern os_error *xcolourtrans_return_opp_colour_number (os_colour colour,
      os_colour_number *colour_number);
__swi (0x40749) os_colour_number colourtrans_return_opp_colour_number (os_colour colour);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_opp_gcol_for_mode()
 *
 * Description:   Gets the furthest GCOL for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                mode - value of R1 on entry
 *                dest_palette - value of R2 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4074A.
 */

extern os_error *xcolourtrans_return_opp_gcol_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette,
      os_gcol *gcol);
__swi (0x4074A) os_gcol colourtrans_return_opp_gcol_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_opp_colour_number_for_mode()
 *
 * Description:   Gets the furthest colour for a palette entry
 *
 * Input:         colour - value of R0 on entry
 *                mode - value of R1 on entry
 *                dest_palette - value of R2 on entry
 *
 * Output:        colour_number - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4074B.
 */

extern os_error *xcolourtrans_return_opp_colour_number_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette,
      os_colour_number *colour_number);
__swi (0x4074B) os_colour_number colourtrans_return_opp_colour_number_for_mode (os_colour colour,
      os_mode mode,
      os_palette const *dest_palette);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_gcol_to_colour_number()
 *
 * Description:   Translates a GCOL to a colour number
 *
 * Input:         gcol - value of R0 on entry
 *
 * Output:        colour_number - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4074C.
 */

extern os_error *xcolourtrans_gcol_to_colour_number (os_gcol gcol,
      os_colour_number *colour_number);
__swi (0x4074C) os_colour_number colourtrans_gcol_to_colour_number (os_gcol gcol);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_colour_number_to_gcol()
 *
 * Description:   Translates a colour number to a GCOL
 *
 * Input:         colour_number - value of R0 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4074D.
 */

extern os_error *xcolourtrans_colour_number_to_gcol (os_colour_number colour_number,
      os_gcol *gcol);
__swi (0x4074D) os_gcol colourtrans_colour_number_to_gcol (os_colour_number colour_number);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_return_font_colours()
 *
 * Description:   Finds the best range of anti-alias colours to match a
 *                pair of palette entries
 *
 * Input:         font - value of R0 on entry
 *                bg_hint - value of R1 on entry
 *                fill - value of R2 on entry
 *                offset - value of R3 on entry
 *
 * Output:        bg_hint_out - value of R1 on exit
 *                fill_out - value of R2 on exit
 *                offset_out - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x4074E.
 */

extern os_error *xcolourtrans_return_font_colours (font_f font,
      os_colour bg_hint,
      os_colour fill,
      int offset,
      os_colour *bg_hint_out,
      os_colour *fill_out,
      int *offset_out);
extern void colourtrans_return_font_colours (font_f font,
      os_colour bg_hint,
      os_colour fill,
      int offset,
      os_colour *bg_hint_out,
      os_colour *fill_out,
      int *offset_out);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_font_colours()
 *
 * Description:   Sets the best range of anti-alias colours to match a pair
 *                of palette entries
 *
 * Input:         font - value of R0 on entry
 *                bg_hint - value of R1 on entry
 *                fill - value of R2 on entry
 *                offset - value of R3 on entry
 *
 * Output:        bg_hint_out - value of R1 on exit
 *                fill_out - value of R2 on exit
 *                offset_out - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x4074F.
 */

extern os_error *xcolourtrans_set_font_colours (font_f font,
      os_colour bg_hint,
      os_colour fill,
      int offset,
      os_colour *bg_hint_out,
      os_colour *fill_out,
      int *offset_out);
extern void colourtrans_set_font_colours (font_f font,
      os_colour bg_hint,
      os_colour fill,
      int offset,
      os_colour *bg_hint_out,
      os_colour *fill_out,
      int *offset_out);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_invalidate_cache()
 *
 * Description:   Informs ColourTrans that the palette has been changed by
 *                some other means
 *
 * Other notes:   Calls SWI 0x40750.
 */

extern os_error *xcolourtrans_invalidate_cache (void);
__swi (0x40750) void colourtrans_invalidate_cache (void);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_calibration()
 *
 * Description:   Sets the calibration table for the screen
 *
 * Input:         calibration_table - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40751.
 */

extern os_error *xcolourtrans_set_calibration (colourtrans_calibration_table const *calibration_table);
__swi (0x40751) void colourtrans_set_calibration (colourtrans_calibration_table const *calibration_table);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_read_calibration()
 *
 * Description:   Reads the calibration table for the screen
 *
 * Input:         calibration_table - value of R0 on entry
 *
 * Output:        size - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40752.
 */

extern os_error *xcolourtrans_read_calibration (colourtrans_calibration_table *calibration_table,
      int *size);
extern int colourtrans_read_calibration (colourtrans_calibration_table *calibration_table);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_device_colour()
 *
 * Description:   Converts a device colour to a standard colour
 *
 * Input:         colour - value of R1 on entry
 *                calibration_table - value of R3 on entry
 *
 * Output:        colour_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40753.
 */

extern os_error *xcolourtrans_convert_device_colour (os_colour colour,
      colourtrans_calibration_table const *calibration_table,
      os_colour *colour_out);
extern os_colour colourtrans_convert_device_colour (os_colour colour,
      colourtrans_calibration_table const *calibration_table);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_device_palette()
 *
 * Description:   Converts a device palette to standard colours
 *
 * Input:         colour_count - value of R0 on entry
 *                list - value of R1 on entry
 *                buffer - value of R2 on entry
 *                calibration_table - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40754.
 */

extern os_error *xcolourtrans_convert_device_palette (int colour_count,
      os_colour const *list,
      os_colour *buffer,
      colourtrans_calibration_table const *calibration_table);
__swi (0x40754) void colourtrans_convert_device_palette (int colour_count,
      os_colour const *list,
      os_colour *buffer,
      colourtrans_calibration_table const *calibration_table);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_rgb_to_cie()
 *
 * Description:   Converts an RGB colour to CIE representation
 *
 * Input:         r - value of R0 on entry
 *                g - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Output:        x - value of R0 on exit
 *                y - value of R1 on exit
 *                z - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40755.
 */

extern os_error *xcolourtrans_convert_rgb_to_cie (int r,
      int g,
      int b,
      int *x,
      int *y,
      int *z);
extern void colourtrans_convert_rgb_to_cie (int r,
      int g,
      int b,
      int *x,
      int *y,
      int *z);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_cie_to_rgb()
 *
 * Description:   Converts a CIE colour to RGB representation
 *
 * Input:         x - value of R0 on entry
 *                y - value of R1 on entry
 *                z - value of R2 on entry
 *
 * Output:        r - value of R0 on exit
 *                g - value of R1 on exit
 *                b - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40756.
 */

extern os_error *xcolourtrans_convert_cie_to_rgb (int x,
      int y,
      int z,
      int *r,
      int *g,
      int *b);
extern void colourtrans_convert_cie_to_rgb (int x,
      int y,
      int z,
      int *r,
      int *g,
      int *b);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_write_calibration_to_file()
 *
 * Description:   Saves the current calibration to a file. Prefer
 *                ColourTrans_WriteCalibrationToFileW
 *
 * Input:         flags - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40757.
 */

extern os_error *xcolourtrans_write_calibration_to_file (colourtrans_calibration_flags flags,
      os_f file);
__swi (0x40757) void colourtrans_write_calibration_to_file (colourtrans_calibration_flags flags,
      os_f file);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_write_calibration_to_filew()
 *
 * Description:   Saves the current calibration to a file using a wide file
 *                handle.
 *
 * Input:         flags - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40757.
 */

extern os_error *xcolourtrans_write_calibration_to_filew (colourtrans_calibration_flags flags,
      os_fw file);
__swi (0x40757) void colourtrans_write_calibration_to_filew (colourtrans_calibration_flags flags,
      os_fw file);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_rgb_to_hsv()
 *
 * Description:   Converts an RGB colour to HSV representation
 *
 * Input:         r - value of R0 on entry
 *                g - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Output:        h - value of R0 on exit
 *                s - value of R1 on exit
 *                v - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40758.
 */

extern os_error *xcolourtrans_convert_rgb_to_hsv (int r,
      int g,
      int b,
      int *h,
      int *s,
      int *v);
extern void colourtrans_convert_rgb_to_hsv (int r,
      int g,
      int b,
      int *h,
      int *s,
      int *v);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_hsv_to_rgb()
 *
 * Description:   Converts an HSV colour to RGB representation
 *
 * Input:         h - value of R0 on entry
 *                s - value of R1 on entry
 *                v - value of R2 on entry
 *
 * Output:        r - value of R0 on exit
 *                g - value of R1 on exit
 *                b - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40759.
 */

extern os_error *xcolourtrans_convert_hsv_to_rgb (int h,
      int s,
      int v,
      int *r,
      int *g,
      int *b);
extern void colourtrans_convert_hsv_to_rgb (int h,
      int s,
      int v,
      int *r,
      int *g,
      int *b);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_rgb_to_cmyk()
 *
 * Description:   Converts an RGB colour to CMYK representation
 *
 * Input:         r - value of R0 on entry
 *                g - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Output:        c - value of R0 on exit
 *                m - value of R1 on exit
 *                y - value of R2 on exit
 *                k - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x4075A.
 */

extern os_error *xcolourtrans_convert_rgb_to_cmyk (int r,
      int g,
      int b,
      int *c,
      int *m,
      int *y,
      int *k);
extern void colourtrans_convert_rgb_to_cmyk (int r,
      int g,
      int b,
      int *c,
      int *m,
      int *y,
      int *k);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_convert_cmyk_to_rgb()
 *
 * Description:   Converts a CMYK colour to RGB representation
 *
 * Input:         c - value of R0 on entry
 *                m - value of R1 on entry
 *                y - value of R2 on entry
 *                k - value of R3 on entry
 *
 * Output:        r - value of R0 on exit
 *                g - value of R1 on exit
 *                b - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x4075B.
 */

extern os_error *xcolourtrans_convert_cmyk_to_rgb (int c,
      int m,
      int y,
      int k,
      int *r,
      int *g,
      int *b);
extern void colourtrans_convert_cmyk_to_rgb (int c,
      int m,
      int y,
      int k,
      int *r,
      int *g,
      int *b);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_read_palette()
 *
 * Description:   Reads either the screen's palette, or a sprite's palette
 *
 * Input:         area - value of R0 on entry
 *                id - value of R1 on entry
 *                palette - value of R2 on entry
 *                size - value of R3 on entry
 *                flags - value of R4 on entry
 *
 * Output:        spare - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4075C.
 */

extern os_error *xcolourtrans_read_palette (osspriteop_area const *area,
      osspriteop_id id,
      os_palette *palette,
      int size,
      colourtrans_palette_flags flags,
      int *spare);
extern int colourtrans_read_palette (osspriteop_area const *area,
      osspriteop_id id,
      os_palette *palette,
      int size,
      colourtrans_palette_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_write_palette()
 *
 * Description:   Writes to either the screen's palette, or to a sprite's
 *                palette
 *
 * Input:         area - value of R0 on entry
 *                id - value of R1 on entry
 *                palette - value of R2 on entry
 *                flags - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4075D with R3 = 0x0.
 */

extern os_error *xcolourtrans_write_palette (osspriteop_area const *area,
      osspriteop_id id,
      os_palette const *palette,
      colourtrans_palette_flags flags);
extern void colourtrans_write_palette (osspriteop_area const *area,
      osspriteop_id id,
      os_palette const *palette,
      colourtrans_palette_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_colour()
 *
 * Description:   Changes the foreground or background colour to a GCOL
 *                number
 *
 * Input:         gcol - value of R0 on entry
 *                flags - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4075E.
 */

extern os_error *xcolourtrans_set_colour (os_gcol gcol,
      colourtrans_colour_flags flags,
      os_action action);
extern void colourtrans_set_colour (os_gcol gcol,
      colourtrans_colour_flags flags,
      os_action action);

/* ------------------------------------------------------------------------
 * Function:      colourtransmiscop_set_weights()
 *
 * Description:   This call is for internal use only
 *
 * Input:         rweight - value of R1 on entry
 *                gweight - value of R2 on entry
 *                bweight - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4075F with R0 = 0x0.
 */

extern os_error *xcolourtransmiscop_set_weights (int rweight,
      int gweight,
      int bweight);
extern void colourtransmiscop_set_weights (int rweight,
      int gweight,
      int bweight);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_write_loadings_to_file()
 *
 * Description:   Writes to a file a *command that would set the
 *                ColourTrans error loadings. Prefer
 *                ColourTrans_WriteLoadingsToFileW
 *
 * Input:         file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40760.
 */

extern os_error *xcolourtrans_write_loadings_to_file (os_f file);
extern void colourtrans_write_loadings_to_file (os_f file);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_write_loadings_to_filew()
 *
 * Description:   Writes to a file, using a wide file handle, a *command
 *                that would set the ColourTrans error loadings
 *
 * Input:         file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40760.
 */

extern os_error *xcolourtrans_write_loadings_to_filew (os_fw file);
extern void colourtrans_write_loadings_to_filew (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_text_colour()
 *
 * Description:   Changes the text foreground or background colour to a
 *                GCOL number
 *
 * Input:         colour - value of R0 on entry
 *                flags - value of R3 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40761.
 */

extern os_error *xcolourtrans_set_text_colour (os_colour colour,
      colourtrans_text_colour_flags flags,
      os_gcol *gcol);
extern os_gcol colourtrans_set_text_colour (os_colour colour,
      colourtrans_text_colour_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_set_opp_text_colour()
 *
 * Description:   Changes the text foreground or background colour to a
 *                GCOL number
 *
 * Input:         colour - value of R0 on entry
 *                flags - value of R3 on entry
 *
 * Output:        gcol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40762.
 */

extern os_error *xcolourtrans_set_opp_text_colour (os_colour colour,
      colourtrans_text_colour_flags flags,
      os_gcol *gcol);
extern os_gcol colourtrans_set_opp_text_colour (os_colour colour,
      colourtrans_text_colour_flags flags);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_generate_table()
 *
 * Description:   Sets up a translation table in a buffer
 *
 * Input:         source_mode - value of R0 on entry
 *                source_palette - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                trans_tab - value of R4 on entry
 *                flags - value of R5 on entry
 *                workspace - value of R6 on entry
 *                transfer_fn - value of R7 on entry
 *
 * Output:        size - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40763.
 */

extern os_error *xcolourtrans_generate_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags,
      void *workspace,
      void const *transfer_fn,
      int *size);
extern int colourtrans_generate_table (os_mode source_mode,
      os_palette const *source_palette,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags,
      void *workspace,
      void const *transfer_fn);

/* ------------------------------------------------------------------------
 * Function:      colourtrans_generate_table_for_sprite()
 *
 * Description:   Sets up a translation table for a sprite in a buffer
 *
 * Input:         source_area - value of R0 on entry
 *                source_id - value of R1 on entry
 *                dest_mode - value of R2 on entry
 *                dest_palette - value of R3 on entry
 *                trans_tab - value of R4 on entry
 *                flags - value of R5 on entry
 *                workspace - value of R6 on entry
 *                transfer_fn - value of R7 on entry
 *
 * Output:        size - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40763.
 */

extern os_error *xcolourtrans_generate_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags,
      void *workspace,
      void const *transfer_fn,
      int *size);
extern int colourtrans_generate_table_for_sprite (osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode dest_mode,
      os_palette const *dest_palette,
      osspriteop_trans_tab *trans_tab,
      colourtrans_table_flags flags,
      void *workspace,
      void const *transfer_fn);

/* ------------------------------------------------------------------------
 * Function:      service_calibration_changed()
 *
 * Description:   Screen calibration has changed
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5B.
 */

extern os_error *xservice_calibration_changed (void);
extern void service_calibration_changed (void);

/* ------------------------------------------------------------------------
 * Function:      service_invalidate_cache()
 *
 * Description:   Broadcast whenever the cache is flushed within
 *                ColourTrans
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x82.
 */

extern os_error *xservice_invalidate_cache (void);
extern void service_invalidate_cache (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef coltrans32_H
#include "oslib/coltrans32.h"
#endif

#endif
