#ifndef blendtable_H
#define blendtable_H

/* C header file for BlendTable
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:27 2007
 * Tom Hughes, tom@compton.nu, 20 Nov 2002
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  BlendTable_GenerateTableModeToMode
#define BlendTable_GenerateTableModeToMode      0x56280
#undef  XBlendTable_GenerateTableModeToMode
#define XBlendTable_GenerateTableModeToMode     0x76280
#undef  BlendTable_GenerateTableModeToSprite
#define BlendTable_GenerateTableModeToSprite    0x56280
#undef  XBlendTable_GenerateTableModeToSprite
#define XBlendTable_GenerateTableModeToSprite   0x76280
#undef  BlendTable_GenerateTableSpriteToMode
#define BlendTable_GenerateTableSpriteToMode    0x56280
#undef  XBlendTable_GenerateTableSpriteToMode
#define XBlendTable_GenerateTableSpriteToMode   0x76280
#undef  BlendTable_GenerateTableSpriteToSprite
#define BlendTable_GenerateTableSpriteToSprite  0x56280
#undef  XBlendTable_GenerateTableSpriteToSprite
#define XBlendTable_GenerateTableSpriteToSprite 0x76280
#undef  BlendTable_UnlockTable
#define BlendTable_UnlockTable                  0x56281
#undef  XBlendTable_UnlockTable
#define XBlendTable_UnlockTable                 0x76281

/********************
 * Type definitions *
 ********************/
typedef bits blendtable_generate_flags;

/************************
 * Constant definitions *
 ************************/
#define blendtable_SOURCE_IS_POINTER            ((blendtable_generate_flags) 0x1u)
#define blendtable_DESTINAION_IS_POINTER        ((blendtable_generate_flags) 0x2u)
#define blendtable_LOCK_TABLE                   ((blendtable_generate_flags) 0x4u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      blendtable_generate_table_mode_to_mode()
 *
 * Description:   Generate a table of blended palette entries for blending
 *                between two modes - RISC O S 4.31+
 *
 * Input:         flags - value of R0 on entry
 *                source_mode - value of R1 on entry
 *                destination_mode - value of R3 on entry
 *                translucency - value of R5 on entry
 *                buffer_in - value of R6 on entry
 *
 * Output:        source_colours - value of R0 on exit
 *                destination_colours - value of R1 on exit
 *                size - value of R2 on exit
 *                buffer_out - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x56280 with R2 = 0x0, R4 = 0x0.
 */

extern os_error *xblendtable_generate_table_mode_to_mode (blendtable_generate_flags flags,
      os_mode source_mode,
      os_mode destination_mode,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);
extern void blendtable_generate_table_mode_to_mode (blendtable_generate_flags flags,
      os_mode source_mode,
      os_mode destination_mode,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);

/* ------------------------------------------------------------------------
 * Function:      blendtable_generate_table_mode_to_sprite()
 *
 * Description:   Generate a table of blended palette entries for blending
 *                from a mode to a sprite - RISC O S 4.31+
 *
 * Input:         flags - value of R0 on entry
 *                source_mode - value of R1 on entry
 *                destination_area - value of R3 on entry
 *                destination_id - value of R4 on entry
 *                translucency - value of R5 on entry
 *                buffer_in - value of R6 on entry
 *
 * Output:        source_colours - value of R0 on exit
 *                destination_colours - value of R1 on exit
 *                size - value of R2 on exit
 *                buffer_out - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x56280 with R2 = 0x0.
 */

extern os_error *xblendtable_generate_table_mode_to_sprite (blendtable_generate_flags flags,
      os_mode source_mode,
      osspriteop_area const *destination_area,
      osspriteop_id destination_id,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);
extern void blendtable_generate_table_mode_to_sprite (blendtable_generate_flags flags,
      os_mode source_mode,
      osspriteop_area const *destination_area,
      osspriteop_id destination_id,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);

/* ------------------------------------------------------------------------
 * Function:      blendtable_generate_table_sprite_to_mode()
 *
 * Description:   Generate a table of blended palette entries for blending
 *                from a sprite to a mode - RISC O S 4.31+
 *
 * Input:         flags - value of R0 on entry
 *                source_area - value of R1 on entry
 *                source_id - value of R2 on entry
 *                destination_mode - value of R3 on entry
 *                translucency - value of R5 on entry
 *                buffer_in - value of R6 on entry
 *
 * Output:        source_colours - value of R0 on exit
 *                destination_colours - value of R1 on exit
 *                size - value of R2 on exit
 *                buffer_out - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x56280 with R4 = 0x0.
 */

extern os_error *xblendtable_generate_table_sprite_to_mode (blendtable_generate_flags flags,
      osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode destination_mode,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);
extern void blendtable_generate_table_sprite_to_mode (blendtable_generate_flags flags,
      osspriteop_area const *source_area,
      osspriteop_id source_id,
      os_mode destination_mode,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);

/* ------------------------------------------------------------------------
 * Function:      blendtable_generate_table_sprite_to_sprite()
 *
 * Description:   Generate a table of blended palette entries for blending
 *                between two sprites - RISC O S 4.31+
 *
 * Input:         flags - value of R0 on entry
 *                source_area - value of R1 on entry
 *                source_id - value of R2 on entry
 *                destination_area - value of R3 on entry
 *                destination_id - value of R4 on entry
 *                translucency - value of R5 on entry
 *                buffer_in - value of R6 on entry
 *
 * Output:        source_colours - value of R0 on exit
 *                destination_colours - value of R1 on exit
 *                size - value of R2 on exit
 *                buffer_out - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x56280.
 */

extern os_error *xblendtable_generate_table_sprite_to_sprite (blendtable_generate_flags flags,
      osspriteop_area const *source_area,
      osspriteop_id source_id,
      osspriteop_area const *destination_area,
      osspriteop_id destination_id,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);
extern void blendtable_generate_table_sprite_to_sprite (blendtable_generate_flags flags,
      osspriteop_area const *source_area,
      osspriteop_id source_id,
      osspriteop_area const *destination_area,
      osspriteop_id destination_id,
      int translucency,
      byte *buffer_in,
      int *source_colours,
      int *destination_colours,
      int *size,
      byte **buffer_out);

/* ------------------------------------------------------------------------
 * Function:      blendtable_unlock_table()
 *
 * Description:   Unlock a blend table - RISC O S 4.31+
 *
 * Input:         buffer - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x56281.
 */

extern os_error *xblendtable_unlock_table (byte *buffer);
__swi (0x56281) void blendtable_unlock_table (byte *buffer);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
