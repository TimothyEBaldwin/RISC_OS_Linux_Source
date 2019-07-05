#ifndef osspriteop_H
#define osspriteop_H

/* C header file for OSSpriteOp
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_SpriteOp
#define OS_SpriteOp                             0x2E
#undef  XOS_SpriteOp
#define XOS_SpriteOp                            0x2002E
#undef  OSSpriteOp_ScreenSave
#define OSSpriteOp_ScreenSave                   0x2
#undef  OSSpriteOp_ScreenLoad
#define OSSpriteOp_ScreenLoad                   0x3
#undef  OSSpriteOp_ReadAreaCB
#define OSSpriteOp_ReadAreaCB                   0x8
#undef  OSSpriteOp_ClearSprites
#define OSSpriteOp_ClearSprites                 0x9
#undef  OSSpriteOp_LoadSpriteFile
#define OSSpriteOp_LoadSpriteFile               0xA
#undef  OSSpriteOp_MergeSpriteFile
#define OSSpriteOp_MergeSpriteFile              0xB
#undef  OSSpriteOp_SaveSpriteFile
#define OSSpriteOp_SaveSpriteFile               0xC
#undef  OSSpriteOp_ReturnName
#define OSSpriteOp_ReturnName                   0xD
#undef  OSSpriteOp_GetSprite
#define OSSpriteOp_GetSprite                    0xE
#undef  OSSpriteOp_CreateSprite
#define OSSpriteOp_CreateSprite                 0xF
#undef  OSSpriteOp_GetSpriteUserCoords
#define OSSpriteOp_GetSpriteUserCoords          0x10
#undef  OSSpriteOp_VerifyArea
#define OSSpriteOp_VerifyArea                   0x11
#undef  OSSpriteOp_SelectSprite
#define OSSpriteOp_SelectSprite                 0x18
#undef  OSSpriteOp_DeleteSprite
#define OSSpriteOp_DeleteSprite                 0x19
#undef  OSSpriteOp_RenameSprite
#define OSSpriteOp_RenameSprite                 0x1A
#undef  OSSpriteOp_CopySprite
#define OSSpriteOp_CopySprite                   0x1B
#undef  OSSpriteOp_PutSprite
#define OSSpriteOp_PutSprite                    0x1C
#undef  OSSpriteOp_CreateMask
#define OSSpriteOp_CreateMask                   0x1D
#undef  OSSpriteOp_RemoveMask
#define OSSpriteOp_RemoveMask                   0x1E
#undef  OSSpriteOp_InsertRow
#define OSSpriteOp_InsertRow                    0x1F
#undef  OSSpriteOp_DeleteRow
#define OSSpriteOp_DeleteRow                    0x20
#undef  OSSpriteOp_FlipAboutXAxis
#define OSSpriteOp_FlipAboutXAxis               0x21
#undef  OSSpriteOp_PutSpriteUserCoords
#define OSSpriteOp_PutSpriteUserCoords          0x22
#undef  OSSpriteOp_AppendSprite
#define OSSpriteOp_AppendSprite                 0x23
#undef  OSSpriteOp_SetPointerShape
#define OSSpriteOp_SetPointerShape              0x24
#undef  OSSpriteOp_ReadPaletteSize
#define OSSpriteOp_ReadPaletteSize              0x25
#undef  OSSpriteOp_RemovePalette
#define OSSpriteOp_RemovePalette                0x25
#undef  OSSpriteOp_CreatePalette
#define OSSpriteOp_CreatePalette                0x25
#undef  OSSpriteOp_CreateTruePalette
#define OSSpriteOp_CreateTruePalette            0x25
#undef  OSSpriteOp_ReadSpriteSize
#define OSSpriteOp_ReadSpriteSize               0x28
#undef  OSSpriteOp_ReadSpriteInfo
#define OSSpriteOp_ReadSpriteInfo               0x28
#undef  OSSpriteOp_ReadPixelColour
#define OSSpriteOp_ReadPixelColour              0x29
#undef  OSSpriteOp_ReadPixelColourDeep
#define OSSpriteOp_ReadPixelColourDeep          0x29
#undef  OSSpriteOp_WritePixelColour
#define OSSpriteOp_WritePixelColour             0x2A
#undef  OSSpriteOp_WritePixelColourDeep
#define OSSpriteOp_WritePixelColourDeep         0x2A
#undef  OSSpriteOp_ReadPixelMask
#define OSSpriteOp_ReadPixelMask                0x2B
#undef  OSSpriteOp_ReadPixelMaskAlpha
#define OSSpriteOp_ReadPixelMaskAlpha           0x2B
#undef  OSSpriteOp_WritePixelMask
#define OSSpriteOp_WritePixelMask               0x2C
#undef  OSSpriteOp_WritePixelMaskAlpha
#define OSSpriteOp_WritePixelMaskAlpha          0x2C
#undef  OSSpriteOp_InsertColumn
#define OSSpriteOp_InsertColumn                 0x2D
#undef  OSSpriteOp_DeleteColumn
#define OSSpriteOp_DeleteColumn                 0x2E
#undef  OSSpriteOp_FlipAboutYAxis
#define OSSpriteOp_FlipAboutYAxis               0x2F
#undef  OSSpriteOp_PlotMask
#define OSSpriteOp_PlotMask                     0x30
#undef  OSSpriteOp_PlotMaskUserCoords
#define OSSpriteOp_PlotMaskUserCoords           0x31
#undef  OSSpriteOp_PlotMaskScaled
#define OSSpriteOp_PlotMaskScaled               0x32
#undef  OSSpriteOp_PaintCharScaled
#define OSSpriteOp_PaintCharScaled              0x33
#undef  OSSpriteOp_PutSpriteScaled
#define OSSpriteOp_PutSpriteScaled              0x34
#undef  OSSpriteOp_PutSpriteScaledMapped
#define OSSpriteOp_PutSpriteScaledMapped        0x34
#undef  OSSpriteOp_PutSpriteGreyScaled
#define OSSpriteOp_PutSpriteGreyScaled          0x35
#undef  OSSpriteOp_RemoveLeftHandWastage
#define OSSpriteOp_RemoveLeftHandWastage        0x36
#undef  OSSpriteOp_PlotMaskTrfm
#define OSSpriteOp_PlotMaskTrfm                 0x37
#undef  OSSpriteOp_PutSpriteTrfm
#define OSSpriteOp_PutSpriteTrfm                0x38
#undef  OSSpriteOp_PutSpriteTrfmMapped
#define OSSpriteOp_PutSpriteTrfmMapped          0x38
#undef  OSSpriteOp_InsertDeleteRows
#define OSSpriteOp_InsertDeleteRows             0x39
#undef  OSSpriteOp_InsertDeleteColumns
#define OSSpriteOp_InsertDeleteColumns          0x3A
#undef  OSSpriteOp_SwitchOutputToSprite
#define OSSpriteOp_SwitchOutputToSprite         0x3C
#undef  OSSpriteOp_SwitchOutputToMask
#define OSSpriteOp_SwitchOutputToMask           0x3D
#undef  OSSpriteOp_ReadSaveAreaSize
#define OSSpriteOp_ReadSaveAreaSize             0x3E
#undef  OSSpriteOp_UnswitchOutput
#define OSSpriteOp_UnswitchOutput               0x2E
#undef  XOSSpriteOp_UnswitchOutput
#define XOSSpriteOp_UnswitchOutput              0x2002E
#undef  SpriteV
#define SpriteV                                 0x1F
#undef  Service_SwitchingOutputToSprite
#define Service_SwitchingOutputToSprite         0x72

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct osspriteop_trans_tab             osspriteop_trans_tab;
typedef struct osspriteop_trans_tab_base        osspriteop_trans_tab_base;
typedef struct osspriteop_colour_mapping        osspriteop_colour_mapping;
typedef struct osspriteop_area                  osspriteop_area;
typedef struct osspriteop_header                osspriteop_header;
typedef struct osspriteop_id_                   *osspriteop_id;
      /*Should be union of name and header, but that's inconvenient since you can't project into unions by cast*/
typedef struct osspriteop_save_area             osspriteop_save_area;
typedef struct osspriteop_save_area_base        osspriteop_save_area_base;

/********************
 * Type definitions *
 ********************/
struct osspriteop_trans_tab
   {  byte c [UNKNOWN];
   };

#define osspriteop_TRANS_TAB(N) \
   struct \
      {  byte c [N]; \
      }

#define osspriteop_SIZEOF_TRANS_TAB(N) \
   ((N)*sizeof ((osspriteop_trans_tab *) NULL)->c)

struct osspriteop_colour_mapping
   {  byte *workspace;
      void *function;
   };

struct osspriteop_area
   {  int size;
      int sprite_count;
      int first;
      int used;
   };

struct osspriteop_header
   {  int size;
      char name [12];
      int width;
      int height;
      int left_bit;
      int right_bit;
      int image;
      int mask;
      os_mode mode;
   };

typedef bits osspriteop_flags;

typedef bits osspriteop_mode_word;

struct osspriteop_save_area
   {  int a [UNKNOWN];
   };

#define osspriteop_SAVE_AREA(N) \
   struct \
      {  int a [N]; \
      }

#define osspriteop_SIZEOF_SAVE_AREA(N) \
   ((N)*sizeof ((osspriteop_save_area *) NULL)->a)

typedef os_action osspriteop_action;

typedef bits osspriteop_pointer_flags;

typedef bits osspriteop_trfm_flags;

/************************
 * Constant definitions *
 ************************/
#define osspriteop_NAME_LIMIT                   12
#define osspriteop_SYSTEM_AREA                  ((osspriteop_flags) 0x0u)
#define osspriteop_USER_AREA                    ((osspriteop_flags) 0x100u)
#define osspriteop_NAME                         ((osspriteop_flags) 0x100u)
#define osspriteop_PTR                          ((osspriteop_flags) 0x200u)
#define osspriteop_NEW_STYLE                    ((osspriteop_mode_word) 0x1u)
#define osspriteop_XRES                         ((osspriteop_mode_word) 0x3FFEu)
#define osspriteop_XRES_SHIFT                   1
#define osspriteop_YRES                         ((osspriteop_mode_word) 0x7FFC000u)
#define osspriteop_YRES_SHIFT                   14
#define osspriteop_TYPE                         ((osspriteop_mode_word) 0x78000000u)
#define osspriteop_TYPE_SHIFT                   27
#define osspriteop_ALPHA_MASK                   ((osspriteop_mode_word) 0x80000000u)
      /*RISC O S Select*/
#define osspriteop_TYPE_OLD                     ((osspriteop_mode_word) 0x0u)
#define osspriteop_TYPE1BPP                     ((osspriteop_mode_word) 0x1u)
#define osspriteop_TYPE2BPP                     ((osspriteop_mode_word) 0x2u)
#define osspriteop_TYPE4BPP                     ((osspriteop_mode_word) 0x3u)
#define osspriteop_TYPE8BPP                     ((osspriteop_mode_word) 0x4u)
#define osspriteop_TYPE16BPP                    ((osspriteop_mode_word) 0x5u)
#define osspriteop_TYPE32BPP                    ((osspriteop_mode_word) 0x6u)
#define osspriteop_TYPE_CMYK                    ((osspriteop_mode_word) 0x7u)
#define osspriteop_UNSPECIFIED                  ((osspriteop_area *) 0x100u)
#define error_SPRITE_OP_NO_WORK_SPACE           0x80u
#define error_SPRITE_OP_NOT_GRAPHICS            0x81u
#define error_SPRITE_OP_NO_ROOM                 0x82u
#define error_SPRITE_OP_NO_SPRITES              0x83u
#define error_SPRITE_OP_NOT_ENOUGH_ROOM         0x85u
#define error_SPRITE_OP_DOESNT_EXIST            0x86u
#define error_SPRITE_OP_BAD_SPRITE_FILE         0x700u
#define error_SPRITE_OP_NO_ROOM_TO_MERGE        0x701u
#define error_SPRITE_OP_INVALID_SECOND_PTR      0x702u
#define error_SPRITE_OP_INVALID_ROW_OR_COL      0x703u
#define error_SPRITE_OP_INVALID_HEIGHT          0x704u
#define error_SPRITE_OP_INVALID_WIDTH           0x705u
#define error_SPRITE_OP_NO_ROOM_TO_INSERT       0x706u
#define error_SPRITE_OP_SPRITE_ALREADY_EXISTS   0x707u
#define error_SPRITE_OP_INVALID_SPRITE_MODE     0x708u
#define error_SPRITE_OP_BAD_REASON_CODE         0x709u
#define error_SPRITE_OP_CANT_DO_SYSTEM          0x70Au
#define error_SPRITE_OP_BAD_TRANSLATION         0x70Bu
#define error_SPRITE_OP_BAD_GREY_SCALE          0x70Cu
#define error_SPRITE_OP_BAD_POINTER_SHAPE       0x70Du
#define error_SPRITE_OP_BAD_APPEND              0x70Eu
#define error_SPRITE_OP_CANT_IN_TELETEXT        0x70Fu
#define error_SPRITE_OP_INVALID_SAVE_AREA       0x710u
#define error_SPRITE_OP_SPRITE_IS_CURRENT_DEST  0x711u
#define error_SPRITE_OP_BAD_FLAGS               0x712u
#define error_SPRITE_OP_BAD_COORD_BLOCK         0x713u
#define error_SPRITE_OP_BAD_SOURCE_RECTANGLE    0x714u
#define error_SPRITE_OP_BAD_TRANSFORMATION      0x715u
#define error_SPRITE_OP_BAD_DEPTH               0x716u
#define error_SPRITE_OP_BAD_SWITCH_DEPTH        0x717u
#define error_SPRITE_OP_BAD_COLOUR_MAP          0x720u
#define error_SPRITE_OP_BAD_JPEG_UNSUPPORTED    0x721u
#define error_SPRITE_OP_BAD_JPEG_PROGRESSIVE    0x722u
#define error_SPRITE_OP_BAD_TYPE                0x723u
#define osspriteop_USE_MASK                     ((osspriteop_action) 0x8u)
#define osspriteop_USE_PALETTE                  ((osspriteop_action) 0x10u)
      /*RISC O S 3.5+*/
#define osspriteop_GIVEN_WIDE_ENTRIES           ((osspriteop_action) 0x20u)
      /*RISC O S 3.6+*/
#define osspriteop_DITHERED                     ((osspriteop_action) 0x40u)
      /*RISC O S 3.6+*/
#define osspriteop_GIVEN_COLOUR_MAPPING         ((osspriteop_action) 0x80u)
      /*RISC O S 4+*/
#define osspriteop_TRANSLUCENCY                 ((osspriteop_action) 0xFF00u)
      /*RISC O S 4+*/
#define osspriteop_TRANSLUCENCY_SHIFT           8
      /*RISC O S 4+*/
#define osspriteop_POINTER_SHAPE                ((osspriteop_pointer_flags) 0xFu)
#define osspriteop_POINTER_SHAPE_SHIFT          0
#define osspriteop_POINTER_IGNORE_SHAPE_DATA    ((osspriteop_pointer_flags) 0x10u)
#define osspriteop_POINTER_IGNORE_PALETTE       ((osspriteop_pointer_flags) 0x20u)
#define osspriteop_POINTER_IGNORE_SHAPE         ((osspriteop_pointer_flags) 0x40u)
#define osspriteop_DESTINATION_COORDS           ((osspriteop_trfm_flags) 0x1u)
#define osspriteop_SOURCE_RECTANGLE             ((osspriteop_trfm_flags) 0x2u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osspriteop_screen_save()
 *
 * Description:   Screen saves
 *
 * Input:         file_name - value of R2 on entry
 *                save_palette - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 = 0x2.
 */

extern os_error *xosspriteop_screen_save (char const *file_name,
      osbool save_palette);
extern void osspriteop_screen_save (char const *file_name,
      osbool save_palette);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_screen_load()
 *
 * Description:   Screen loads
 *
 * Input:         file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 = 0x3.
 */

extern os_error *xosspriteop_screen_load (char const *file_name);
extern void osspriteop_screen_load (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_area_cb()
 *
 * Description:   Reads area control block
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *
 * Output:        size - value of R2 on exit
 *                count - value of R3 on exit
 *                first - value of R4 on exit
 *                used - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x8.
 */

extern os_error *xosspriteop_read_area_cb (osspriteop_flags flags,
      osspriteop_area const *area,
      int *size,
      int *count,
      int *first,
      int *used);
extern void osspriteop_read_area_cb (osspriteop_flags flags,
      osspriteop_area const *area,
      int *size,
      int *count,
      int *first,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_clear_sprites()
 *
 * Description:   Initialises sprite area
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x9.
 */

extern os_error *xosspriteop_clear_sprites (osspriteop_flags flags,
      osspriteop_area *area);
extern void osspriteop_clear_sprites (osspriteop_flags flags,
      osspriteop_area *area);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_load_sprite_file()
 *
 * Description:   Loads sprite file
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xA.
 */

extern os_error *xosspriteop_load_sprite_file (osspriteop_flags flags,
      osspriteop_area *area,
      char const *file_name);
extern void osspriteop_load_sprite_file (osspriteop_flags flags,
      osspriteop_area *area,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_merge_sprite_file()
 *
 * Description:   Merges sprite file
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xB.
 */

extern os_error *xosspriteop_merge_sprite_file (osspriteop_flags flags,
      osspriteop_area *area,
      char const *file_name);
extern void osspriteop_merge_sprite_file (osspriteop_flags flags,
      osspriteop_area *area,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_save_sprite_file()
 *
 * Description:   Saves sprite file
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xC.
 */

extern os_error *xosspriteop_save_sprite_file (osspriteop_flags flags,
      osspriteop_area const *area,
      char const *file_name);
extern void osspriteop_save_sprite_file (osspriteop_flags flags,
      osspriteop_area const *area,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_return_name()
 *
 * Description:   Returns sprite name
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                sprite_no - value of R4 on entry
 *
 * Output:        used - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xD.
 */

extern os_error *xosspriteop_return_name (osspriteop_flags flags,
      osspriteop_area const *area,
      char *buffer,
      int size,
      int sprite_no,
      int *used);
extern int osspriteop_return_name (osspriteop_flags flags,
      osspriteop_area const *area,
      char *buffer,
      int size,
      int sprite_no);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_get_sprite()
 *
 * Description:   Gets sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                sprite_name - value of R2 on entry
 *                get_palette - value of R3 on entry
 *
 * Output:        header - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xE.
 */

extern os_error *xosspriteop_get_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool get_palette,
      osspriteop_header **header);
extern osspriteop_header *osspriteop_get_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool get_palette);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_create_sprite()
 *
 * Description:   Creates sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                sprite_name - value of R2 on entry
 *                create_palette - value of R3 on entry
 *                width - value of R4 on entry
 *                height - value of R5 on entry
 *                mode - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0xF.
 */

extern os_error *xosspriteop_create_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool create_palette,
      int width,
      int height,
      os_mode mode);
extern void osspriteop_create_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool create_palette,
      int width,
      int height,
      os_mode mode);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_get_sprite_user_coords()
 *
 * Description:   Gets sprite from user coordinates
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                sprite_name - value of R2 on entry
 *                get_palette - value of R3 on entry
 *                x0 - value of R4 on entry
 *                y0 - value of R5 on entry
 *                x1 - value of R6 on entry
 *                y1 - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x10.
 */

extern os_error *xosspriteop_get_sprite_user_coords (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool get_palette,
      int x0,
      int y0,
      int x1,
      int y1);
extern void osspriteop_get_sprite_user_coords (osspriteop_flags flags,
      osspriteop_area *area,
      char const *sprite_name,
      osbool get_palette,
      int x0,
      int y0,
      int x1,
      int y1);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_verify_area()
 *
 * Description:   Verifies that a region of memory contains a valid sprite
 *                area
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x11.
 */

extern os_error *xosspriteop_verify_area (osspriteop_flags flags,
      osspriteop_area const *area);
extern void osspriteop_verify_area (osspriteop_flags flags,
      osspriteop_area const *area);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_select_sprite()
 *
 * Description:   Selects sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Output:        header - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x18.
 */

extern os_error *xosspriteop_select_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_header **header);
extern osspriteop_header *osspriteop_select_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_delete_sprite()
 *
 * Description:   Deletes sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x19.
 */

extern os_error *xosspriteop_delete_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_delete_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_rename_sprite()
 *
 * Description:   Renames sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                sprite_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1A.
 */

extern os_error *xosspriteop_rename_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      char const *sprite_name);
extern void osspriteop_rename_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_copy_sprite()
 *
 * Description:   Copies sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                sprite_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1B.
 */

extern os_error *xosspriteop_copy_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      char const *sprite_name);
extern void osspriteop_copy_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite()
 *
 * Description:   Puts sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                action - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1C.
 */

extern os_error *xosspriteop_put_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      os_action action);
extern void osspriteop_put_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      os_action action);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_create_mask()
 *
 * Description:   Creates mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1D.
 */

extern os_error *xosspriteop_create_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_create_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_remove_mask()
 *
 * Description:   Removes mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1E.
 */

extern os_error *xosspriteop_remove_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_remove_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_insert_row()
 *
 * Description:   Inserts row
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                row - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x1F.
 */

extern os_error *xosspriteop_insert_row (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row);
extern void osspriteop_insert_row (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_delete_row()
 *
 * Description:   Deletes row
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                row - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x20.
 */

extern os_error *xosspriteop_delete_row (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row);
extern void osspriteop_delete_row (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_flip_about_xaxis()
 *
 * Description:   Flips about x axis
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x21.
 */

extern os_error *xosspriteop_flip_about_xaxis (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_flip_about_xaxis (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_user_coords()
 *
 * Description:   Puts sprite at user coordinates
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                action - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x22.
 */

extern os_error *xosspriteop_put_sprite_user_coords (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_action action);
extern void osspriteop_put_sprite_user_coords (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_action action);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_append_sprite()
 *
 * Description:   Appends sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id0 - value of R2 on entry
 *                id1 - value of R3 on entry
 *                append_vertically - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x23.
 */

extern os_error *xosspriteop_append_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id0,
      osspriteop_id id1,
      osbool append_vertically);
extern void osspriteop_append_sprite (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id0,
      osspriteop_id id1,
      osbool append_vertically);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_set_pointer_shape()
 *
 * Description:   Sets pointer shape
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                pointer_flags - value of R3 on entry
 *                xactive - value of R4 on entry
 *                yactive - value of R5 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x24.
 */

extern os_error *xosspriteop_set_pointer_shape (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_pointer_flags pointer_flags,
      int xactive,
      int yactive,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void osspriteop_set_pointer_shape (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_pointer_flags pointer_flags,
      int xactive,
      int yactive,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_palette_size()
 *
 * Description:   Reads palette size
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Output:        size - value of R3 on exit
 *                palette - value of R4 on exit
 *                mode - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x25, R3 = 0xFFFFFFFF.
 */

extern os_error *xosspriteop_read_palette_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *size,
      os_sprite_palette **palette,
      os_mode *mode);
extern void osspriteop_read_palette_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *size,
      os_sprite_palette **palette,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_remove_palette()
 *
 * Description:   Removes palette
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x25, R3 = 0x0.
 */

extern os_error *xosspriteop_remove_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_remove_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_create_palette()
 *
 * Description:   Creates palette
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x25, R3 = 0x1.
 */

extern os_error *xosspriteop_create_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_create_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_create_true_palette()
 *
 * Description:   Creates palette with true colours
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x25, R3 = 0x80000000.
 */

extern os_error *xosspriteop_create_true_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_create_true_palette (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_sprite_size()
 *
 * Description:   Synonymous with _ReadSpriteInfo. Reads sprite information
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Output:        width - value of R3 on exit
 *                height - value of R4 on exit
 *                mask - value of R5 on exit
 *                mode - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x28.
 */

extern os_error *xosspriteop_read_sprite_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);
extern void osspriteop_read_sprite_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_sprite_info()
 *
 * Description:   Reads sprite information
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Output:        width - value of R3 on exit
 *                height - value of R4 on exit
 *                mask - value of R5 on exit
 *                mode - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x28.
 */

extern os_error *xosspriteop_read_sprite_info (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);
extern void osspriteop_read_sprite_info (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *width,
      int *height,
      osbool *mask,
      os_mode *mode);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_pixel_colour()
 *
 * Description:   Reads pixel colour
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        gcol - value of R5 on exit
 *                tint - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x29.
 */

extern os_error *xosspriteop_read_pixel_colour (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_gcol *gcol,
      os_tint *tint);
extern void osspriteop_read_pixel_colour (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_gcol *gcol,
      os_tint *tint);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_pixel_colour_deep()
 *
 * Description:   Reads pixel colour into 24-bit RGB value
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        gcol - value of R5 on exit
 *                tint - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x29.
 */

extern os_error *xosspriteop_read_pixel_colour_deep (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      bits *gcol,
      os_tint *tint);
extern void osspriteop_read_pixel_colour_deep (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      bits *gcol,
      os_tint *tint);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_write_pixel_colour()
 *
 * Description:   Writes pixel colour
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                gcol - value of R5 on entry
 *                tint - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2A.
 */

extern os_error *xosspriteop_write_pixel_colour (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      os_gcol gcol,
      os_tint tint);
extern void osspriteop_write_pixel_colour (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      os_gcol gcol,
      os_tint tint);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_write_pixel_colour_deep()
 *
 * Description:   Writes pixel colour using 24-bit RGB value
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                gcol - value of R5 on entry
 *                tint - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2A.
 */

extern os_error *xosspriteop_write_pixel_colour_deep (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      bits gcol,
      os_tint tint);
extern void osspriteop_write_pixel_colour_deep (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      bits gcol,
      os_tint tint);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_pixel_mask()
 *
 * Description:   Reads pixel mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        solid - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2B.
 */

extern os_error *xosspriteop_read_pixel_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      osbool *solid);
extern osbool osspriteop_read_pixel_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_pixel_mask_alpha()
 *
 * Description:   Reads pixel mask with alpha channel support - RISC O S
 *                Select
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Output:        opacity - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2B.
 */

extern os_error *xosspriteop_read_pixel_mask_alpha (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      int *opacity);
extern int osspriteop_read_pixel_mask_alpha (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_write_pixel_mask()
 *
 * Description:   Writes pixel mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                solid - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2C.
 */

extern os_error *xosspriteop_write_pixel_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      osbool solid);
extern void osspriteop_write_pixel_mask (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      osbool solid);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_write_pixel_mask_alpha()
 *
 * Description:   Writes pixel mask with alpha channel support - RISC O S
 *                Select
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                opacity - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2C.
 */

extern os_error *xosspriteop_write_pixel_mask_alpha (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      int opacity);
extern void osspriteop_write_pixel_mask_alpha (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int x,
      int y,
      int opacity);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_insert_column()
 *
 * Description:   Inserts column
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                column - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2D.
 */

extern os_error *xosspriteop_insert_column (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column);
extern void osspriteop_insert_column (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_delete_column()
 *
 * Description:   Deletes column
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                column - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2E.
 */

extern os_error *xosspriteop_delete_column (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column);
extern void osspriteop_delete_column (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_flip_about_yaxis()
 *
 * Description:   Flips about y axis
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x2F.
 */

extern os_error *xosspriteop_flip_about_yaxis (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_flip_about_yaxis (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_plot_mask()
 *
 * Description:   Plots sprite mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x30.
 */

extern os_error *xosspriteop_plot_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id);
extern void osspriteop_plot_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_plot_mask_user_coords()
 *
 * Description:   Plots sprite mask at user coordinates
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x31.
 */

extern os_error *xosspriteop_plot_mask_user_coords (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y);
extern void osspriteop_plot_mask_user_coords (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_plot_mask_scaled()
 *
 * Description:   Plots mask scaled
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                factors - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x32.
 */

extern os_error *xosspriteop_plot_mask_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_factors const *factors);
extern void osspriteop_plot_mask_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_factors const *factors);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_paint_char_scaled()
 *
 * Description:   Paints character scaled
 *
 * Input:         c - value of R1 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                factors - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 = 0x33.
 */

extern os_error *xosspriteop_paint_char_scaled (char c,
      int x,
      int y,
      os_factors const *factors);
extern void osspriteop_paint_char_scaled (char c,
      int x,
      int y,
      os_factors const *factors);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_scaled()
 *
 * Description:   Puts sprite scaled
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                action - value of R5 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x34.
 */

extern os_error *xosspriteop_put_sprite_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      osspriteop_action action,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void osspriteop_put_sprite_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      osspriteop_action action,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_scaled_mapped()
 *
 * Description:   Puts sprite scaled with colour mapping - RISC O S 4+
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                action - value of R5 on entry
 *                factors - value of R6 on entry
 *                mapping - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x34, R5 |= 0x80.
 */

extern os_error *xosspriteop_put_sprite_scaled_mapped (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      osspriteop_action action,
      os_factors const *factors,
      osspriteop_colour_mapping const *mapping);
extern void osspriteop_put_sprite_scaled_mapped (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      osspriteop_action action,
      os_factors const *factors,
      osspriteop_colour_mapping const *mapping);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_grey_scaled()
 *
 * Description:   Puts sprite scaled and anti-aliased - not RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x35, R5 = 0x0.
 */

extern os_error *xosspriteop_put_sprite_grey_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);
extern void osspriteop_put_sprite_grey_scaled (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int x,
      int y,
      os_factors const *factors,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_remove_left_hand_wastage()
 *
 * Description:   Removes left hand wastage
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x36.
 */

extern os_error *xosspriteop_remove_left_hand_wastage (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);
extern void osspriteop_remove_left_hand_wastage (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_plot_mask_trfm()
 *
 * Description:   Plots sprite mask transformed
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                trfm_flags - value of R3 on entry
 *                source_rect - value of R4 on entry
 *                trfm - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x37.
 */

extern os_error *xosspriteop_plot_mask_trfm (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      os_trfm const *trfm);
extern void osspriteop_plot_mask_trfm (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      os_trfm const *trfm);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_trfm()
 *
 * Description:   Puts sprite transformed
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                trfm_flags - value of R3 on entry
 *                source_rect - value of R4 on entry
 *                action - value of R5 on entry
 *                trfm - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x38.
 */

extern os_error *xosspriteop_put_sprite_trfm (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      osspriteop_action action,
      os_trfm const *trfm,
      osspriteop_trans_tab const *trans_tab);
extern void osspriteop_put_sprite_trfm (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      osspriteop_action action,
      os_trfm const *trfm,
      osspriteop_trans_tab const *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_put_sprite_trfm_mapped()
 *
 * Description:   Puts sprite transformed with colour mapping - RISC O S 4+
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                trfm_flags - value of R3 on entry
 *                source_rect - value of R4 on entry
 *                action - value of R5 on entry
 *                trfm - value of R6 on entry
 *                mapping - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x38, R5 |= 0x80.
 */

extern os_error *xosspriteop_put_sprite_trfm_mapped (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      osspriteop_action action,
      os_trfm const *trfm,
      osspriteop_colour_mapping const *mapping);
extern void osspriteop_put_sprite_trfm_mapped (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_trfm_flags trfm_flags,
      os_box const *source_rect,
      osspriteop_action action,
      os_trfm const *trfm,
      osspriteop_colour_mapping const *mapping);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_insert_delete_rows()
 *
 * Description:   Inserts/deletes rows from a sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                row_no - value of R3 on entry
 *                row_count - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x39.
 */

extern os_error *xosspriteop_insert_delete_rows (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row_no,
      int row_count);
extern void osspriteop_insert_delete_rows (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int row_no,
      int row_count);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_insert_delete_columns()
 *
 * Description:   Inserts/deletes columns from a sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                column_no - value of R3 on entry
 *                column_count - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x3A.
 */

extern os_error *xosspriteop_insert_delete_columns (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column_no,
      int column_count);
extern void osspriteop_insert_delete_columns (osspriteop_flags flags,
      osspriteop_area *area,
      osspriteop_id id,
      int column_no,
      int column_count);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_switch_output_to_sprite()
 *
 * Description:   Switches output to sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                save_area - value of R3 on entry
 *
 * Output:        context0 - value of R0 on exit
 *                context1 - value of R1 on exit
 *                context2 - value of R2 on exit
 *                context3 - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x3C.
 */

extern os_error *xosspriteop_switch_output_to_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_save_area *save_area,
      int *context0,
      int *context1,
      int *context2,
      int *context3);
extern void osspriteop_switch_output_to_sprite (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_save_area *save_area,
      int *context0,
      int *context1,
      int *context2,
      int *context3);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_switch_output_to_mask()
 *
 * Description:   Switches output to mask
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                save_area - value of R3 on entry
 *
 * Output:        context0 - value of R0 on exit
 *                context1 - value of R1 on exit
 *                context2 - value of R2 on exit
 *                context3 - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x3D.
 */

extern os_error *xosspriteop_switch_output_to_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_save_area *save_area,
      int *context0,
      int *context1,
      int *context2,
      int *context3);
extern void osspriteop_switch_output_to_mask (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      osspriteop_save_area *save_area,
      int *context0,
      int *context1,
      int *context2,
      int *context3);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_read_save_area_size()
 *
 * Description:   Reads save area size
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *
 * Output:        size - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2E with R0 |= 0x3E.
 */

extern os_error *xosspriteop_read_save_area_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      int *size);
extern int osspriteop_read_save_area_size (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id);

/* ------------------------------------------------------------------------
 * Function:      osspriteop_unswitch_output()
 *
 * Description:   Switches output back to previous destination
 *
 * Input:         context0 - value of R0 on entry
 *                context1 - value of R1 on entry
 *                context2 - value of R2 on entry
 *                context3 - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x2E.
 */

extern os_error *xosspriteop_unswitch_output (int context0,
      int context1,
      int context2,
      int context3);
__swi (0x2E) void osspriteop_unswitch_output (int context0,
      int context1,
      int context2,
      int context3);

/* ------------------------------------------------------------------------
 * Function:      service_switching_output_to_sprite()
 *
 * Description:   Output switched to sprite, mask or screen
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x72.
 */

extern os_error *xservice_switching_output_to_sprite (void);
extern void service_switching_output_to_sprite (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
