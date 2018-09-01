#ifndef zapredraw_H
#define zapredraw_H

/* C header file for ZapRedraw
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Christian Ludlam, <chris@recoil.org> 09-Feb-02 23:39
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

#ifndef wimp_H
#include "oslib/wimp.h"
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
#undef  ZapRedraw_RedrawArea
#define ZapRedraw_RedrawArea                    0x48480
#undef  XZapRedraw_RedrawArea
#define XZapRedraw_RedrawArea                   0x68480
#undef  ZapRedraw_GetPaletteEntry
#define ZapRedraw_GetPaletteEntry               0x48481
#undef  XZapRedraw_GetPaletteEntry
#define XZapRedraw_GetPaletteEntry              0x68481
#undef  ZapRedraw_RedrawRaster
#define ZapRedraw_RedrawRaster                  0x48482
#undef  XZapRedraw_RedrawRaster
#define XZapRedraw_RedrawRaster                 0x68482
#undef  ZapRedraw_ConvertBitmap
#define ZapRedraw_ConvertBitmap                 0x48483
#undef  XZapRedraw_ConvertBitmap
#define XZapRedraw_ConvertBitmap                0x68483
#undef  ZapRedraw_PrepareDataLine
#define ZapRedraw_PrepareDataLine               0x48484
#undef  XZapRedraw_PrepareDataLine
#define XZapRedraw_PrepareDataLine              0x68484
#undef  ZapRedraw_AddCursor
#define ZapRedraw_AddCursor                     0x48485
#undef  XZapRedraw_AddCursor
#define XZapRedraw_AddCursor                    0x68485
#undef  ZapRedraw_FindCharacter
#define ZapRedraw_FindCharacter                 0x48486
#undef  XZapRedraw_FindCharacter
#define XZapRedraw_FindCharacter                0x68486
#undef  ZapRedraw_MoveBytes
#define ZapRedraw_MoveBytes                     0x48487
#undef  XZapRedraw_MoveBytes
#define XZapRedraw_MoveBytes                    0x68487
#undef  ZapRedraw_CachedCharSize
#define ZapRedraw_CachedCharSize                0x48488
#undef  XZapRedraw_CachedCharSize
#define XZapRedraw_CachedCharSize               0x68488
#undef  ZapRedraw_ConvBitmapChar
#define ZapRedraw_ConvBitmapChar                0x48489
#undef  XZapRedraw_ConvBitmapChar
#define XZapRedraw_ConvBitmapChar               0x68489
#undef  ZapRedraw_CreatePalette
#define ZapRedraw_CreatePalette                 0x4848A
#undef  XZapRedraw_CreatePalette
#define XZapRedraw_CreatePalette                0x6848A
#undef  ZapRedraw_InsertChar
#define ZapRedraw_InsertChar                    0x4848B
#undef  XZapRedraw_InsertChar
#define XZapRedraw_InsertChar                   0x6848B
#undef  ZapRedraw_ReadSystemChars
#define ZapRedraw_ReadSystemChars               0x4848C
#undef  XZapRedraw_ReadSystemChars
#define XZapRedraw_ReadSystemChars              0x6848C
#undef  ZapRedraw_ReverseBitmaps
#define ZapRedraw_ReverseBitmaps                0x4848D
#undef  XZapRedraw_ReverseBitmaps
#define XZapRedraw_ReverseBitmaps               0x6848D
#undef  ZapRedraw_ReadVduVars
#define ZapRedraw_ReadVduVars                   0x4848E
#undef  XZapRedraw_ReadVduVars
#define XZapRedraw_ReadVduVars                  0x6848E
#undef  ZapRedraw_GetRectangle
#define ZapRedraw_GetRectangle                  0x4848F
#undef  XZapRedraw_GetRectangle
#define XZapRedraw_GetRectangle                 0x6848F
#undef  ZapRedraw_AddVduBitmaps
#define ZapRedraw_AddVduBitmaps                 0x48490
#undef  XZapRedraw_AddVduBitmaps
#define XZapRedraw_AddVduBitmaps                0x68490
#undef  ZapRedraw_CacheFontChars
#define ZapRedraw_CacheFontChars                0x48491
#undef  XZapRedraw_CacheFontChars
#define XZapRedraw_CacheFontChars               0x68491
#undef  ZapRedrawCacheFontChars_CurrentMode
#define ZapRedrawCacheFontChars_CurrentMode     0x1
#undef  ZapRedrawCacheFontChars_1bpp
#define ZapRedrawCacheFontChars_1bpp            0x2
#undef  ZapRedraw_SpriteSize
#define ZapRedraw_SpriteSize                    0x48492
#undef  XZapRedraw_SpriteSize
#define XZapRedraw_SpriteSize                   0x68492
#undef  ZapRedrawSpriteSize_CurrentMode
#define ZapRedrawSpriteSize_CurrentMode         0x1
#undef  ZapRedrawSpriteSize_1bpp
#define ZapRedrawSpriteSize_1bpp                0x2
#undef  ZapRedraw_RedrawWindow
#define ZapRedraw_RedrawWindow                  0x48493
#undef  XZapRedraw_RedrawWindow
#define XZapRedraw_RedrawWindow                 0x68493
#undef  ZapRedraw_Divide
#define ZapRedraw_Divide                        0x48494
#undef  XZapRedraw_Divide
#define XZapRedraw_Divide                       0x68494
#undef  ZapRedraw_PlotRectangle
#define ZapRedraw_PlotRectangle                 0x48495
#undef  XZapRedraw_PlotRectangle
#define XZapRedraw_PlotRectangle                0x68495
#undef  ZapRedraw_AddCursorSmart
#define ZapRedraw_AddCursorSmart                0x48496
#undef  XZapRedraw_AddCursorSmart
#define XZapRedraw_AddCursorSmart               0x68496
#undef  ZapRedraw_FindFont
#define ZapRedraw_FindFont                      0x48497
#undef  XZapRedraw_FindFont
#define XZapRedraw_FindFont                     0x68497
#undef  ZapRedraw_LoseFont
#define ZapRedraw_LoseFont                      0x48498
#undef  XZapRedraw_LoseFont
#define XZapRedraw_LoseFont                     0x68498
#undef  ZapRedraw_ReadCharSize
#define ZapRedraw_ReadCharSize                  0x48499
#undef  XZapRedraw_ReadCharSize
#define XZapRedraw_ReadCharSize                 0x68499
#undef  ZapRedraw_Version
#define ZapRedraw_Version                       0x4849A
#undef  XZapRedraw_Version
#define XZapRedraw_Version                      0x6849A
#undef  ZapRedraw_ListFonts
#define ZapRedraw_ListFonts                     0x4849B
#undef  XZapRedraw_ListFonts
#define XZapRedraw_ListFonts                    0x6849B
#undef  ZapRedraw_UpdateWindow
#define ZapRedraw_UpdateWindow                  0x4849C
#undef  XZapRedraw_UpdateWindow
#define XZapRedraw_UpdateWindow                 0x6849C
#undef  ZapRedraw_ReadFontInfo
#define ZapRedraw_ReadFontInfo                  0x4849D
#undef  XZapRedraw_ReadFontInfo
#define XZapRedraw_ReadFontInfo                 0x6849D
#undef  ZapRedraw_ReadFontName
#define ZapRedraw_ReadFontName                  0x0
#undef  ZapRedraw_ReadModeBPP
#define ZapRedraw_ReadModeBPP                   0x4849E
#undef  XZapRedraw_ReadModeBPP
#define XZapRedraw_ReadModeBPP                  0x6849E
#undef  ZapRedraw_DecodeMenu
#define ZapRedraw_DecodeMenu                    0x4849F
#undef  XZapRedraw_DecodeMenu
#define XZapRedraw_DecodeMenu                   0x6849F
#undef  ZapRedraw_Encoding
#define ZapRedraw_Encoding                      0x484A0
#undef  XZapRedraw_Encoding
#define XZapRedraw_Encoding                     0x684A0
#undef  ZapRedrawEncoding_Find
#define ZapRedrawEncoding_Find                  0x484A0
#undef  XZapRedrawEncoding_Find
#define XZapRedrawEncoding_Find                 0x684A0
#undef  ZapRedrawEncoding_Lose
#define ZapRedrawEncoding_Lose                  0x484A0
#undef  XZapRedrawEncoding_Lose
#define XZapRedrawEncoding_Lose                 0x684A0
#undef  ZapRedrawEncoding_Table
#define ZapRedrawEncoding_Table                 0x484A0
#undef  XZapRedrawEncoding_Table
#define XZapRedrawEncoding_Table                0x684A0

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct zapredraw_f_                     *zapredraw_f;
typedef struct zapredraw_e_                     *zapredraw_e;
typedef struct zapredraw_dsa_block              zapredraw_dsa_block;
typedef struct zapredraw_vdu_block              zapredraw_vdu_block;
typedef struct zapredraw_font_block             zapredraw_font_block;
typedef union  zapredraw_block                  zapredraw_block;
typedef struct zapredraw_dsa_palette            zapredraw_dsa_palette;
typedef struct zapredraw_dsa_palette_base       zapredraw_dsa_palette_base;
typedef struct zapredraw_vdu_palette            zapredraw_vdu_palette;
typedef struct zapredraw_vdu_palette_base       zapredraw_vdu_palette_base;
typedef union  zapredraw_palette                zapredraw_palette;

/********************
 * Type definitions *
 ********************/
typedef bits zapredraw_flags;

typedef byte *zapredraw_char_cache;

typedef byte zapredraw_colour;

typedef char zapredraw_substyle;

typedef bits zapredraw_encoding_table [256];

struct zapredraw_dsa_block
   {  zapredraw_flags flags;
      os_box box;
      byte *screen;
      int bpl;
      int log2_bpp;
      int charw;
      int charh;
      zapredraw_char_cache *caddr;
      int cbpl;
      int cbpc;
      int linesp;
      char **data;
      int scrollx;
      int scrolly;
      zapredraw_palette *palette;
      int fg;
      int bg;
      void *workarea;
      int magx;
      int magy;
      int xsize;
      int ysize;
      os_mode mode;
      int length;
      int lmargin;
      int tmargin;
      zapredraw_e encoding;
   };

struct zapredraw_vdu_block
   {  zapredraw_flags flags;
      os_box box;
      byte *reserved0;
      int reserved1;
      int log2_bpp;
      int charw;
      int charh;
      char *caddr;
      int offsetx;
      int offsety;
      int linesp;
      char **data;
      int scrollx;
      int scrolly;
      zapredraw_palette *palette;
      int fg;
      int bg;
      void *workarea;
      int magx;
      int magy;
      int xsize;
      int ysize;
      os_mode mode;
      int length;
      int lmargin;
      int tmargin;
      zapredraw_e encoding;
   };

struct zapredraw_font_block
   {  zapredraw_flags flags;
      os_box box;
      byte *screen;
      int bpl;
      int log2_bpp;
      int charw;
      int charh;
      zapredraw_f font;
      int cbpl;
      int cbpc;
      int linesp;
      char **data;
      int scrollx;
      int scrolly;
      zapredraw_palette *palette;
      int fg;
      int bg;
      void *workarea;
      int magx;
      int magy;
      int xsize;
      int ysize;
      os_mode mode;
      int length;
      int lmargin;
      int tmargin;
      zapredraw_e encoding;
   };

union zapredraw_block
   {  zapredraw_vdu_block vdu;
      zapredraw_dsa_block dsa;
      zapredraw_font_block font;
   };

struct zapredraw_dsa_palette
   {  bits dup_colour [UNKNOWN];
   };

#define zapredraw_DSA_PALETTE(N) \
   struct \
      {  bits dup_colour [N]; \
      }

#define zapredraw_SIZEOF_DSA_PALETTE(N) \
   ((N)*sizeof ((zapredraw_dsa_palette *) NULL)->dup_colour)

struct zapredraw_vdu_palette
   {  os_colour colour [UNKNOWN];
   };

#define zapredraw_VDU_PALETTE(N) \
   struct \
      {  os_colour colour [N]; \
      }

#define zapredraw_SIZEOF_VDU_PALETTE(N) \
   ((N)*sizeof ((zapredraw_vdu_palette *) NULL)->colour)

union zapredraw_palette
   {  zapredraw_vdu_palette vdu;
      zapredraw_dsa_palette dsa;
   };

typedef int zapredraw_reason;

typedef bits zapredrawcreatepalette_flags;

typedef bits zapredrawspritesize_reason;

typedef bits zapredraw_add_cursor_match;

typedef bits zapredraw_add_cursor_cursor;

typedef bits zapredrawfindfont_flags;

typedef os_box zapredraw_reduction_block;

typedef bits zapredrawreadcharsize_flags;

/************************
 * Constant definitions *
 ************************/
#define zapredraw_DSA                           ((zapredraw_flags) 0x0u)
#define zapredraw_VDU                           ((zapredraw_flags) 0x1u)
#define zapredraw_DOUBLE_HEIGHT                 ((zapredraw_flags) 0x2u)
      /*(DSA mode)*/
#define zapredraw_GIVEN_EXTENSION_ROUTINE       ((zapredraw_flags) 0x4u)
      /*(DSA mode)*/
#define zapredraw_SUBSTYLES                     ((zapredraw_flags) 0x8u)
#define zapredraw_FAST_RECTANGLES               ((zapredraw_flags) 0x10u)
      /*(DSA mode)*/
#define zapredraw_AUTO_SCALE                    ((zapredraw_flags) 0x20u)
#define zapredraw_EXTEND                        ((zapredraw_flags) 0x40u)
#define zapredraw_RTOL                          ((zapredraw_flags) 0x80u)
      /*(VDU mode)*/
#define zapredraw_TRANSPARENT                   ((zapredraw_flags) 0x100u)
      /*(VDU mode)*/
#define zapredraw_AA_SUPPRESS                   ((zapredraw_flags) 0x200u)
      /*(DSAVDU mode)*/
#define zapredraw_16_BIT                        ((zapredraw_flags) 0x400u)
      /*(PrepareDataLine) */
#define zapredraw_32_BIT                        ((zapredraw_flags) 0x800u)
      /*(PrepareDataLine) */
#define zapredraw_SMALL_COLOURS                 ((zapredraw_flags) 0x1000u)
      /*(PrepareDataLine) */
#define zapredraw_NORMAL                        ((zapredraw_substyle) 0x0u)
#define zapredraw_STRIKETHROUGH                 ((zapredraw_substyle) 0x1u)
#define zapredraw_INVERSE                       ((zapredraw_substyle) 0x8u)
      /*PrepareDataLine only*/
#define zapredraw_BOLD                          ((zapredraw_substyle) 0x20u)
#define zapredraw_ITALIC                        ((zapredraw_substyle) 0x40u)
#define zapredraw_UNDERLINED                    ((zapredraw_substyle) 0x80u)
#define zapredrawecoding_UTF8                   ((zapredraw_encoding_table) 0x1u)
#define zapredrawecoding_UTF16                  ((zapredraw_encoding_table) 0x2u)
#define zapredraw_COMMAND                       ((char) '\x00')
      /*followed by command number*/
#define zapredraw_COMMAND_NULL                  ((char) '\x00')
      /*followed by 'c'*/
#define zapredraw_COMMAND_SET_COLOURS           ((char) '\x01')
      /*followed by 'f', 'b'*/
#define zapredraw_COMMAND_EOL                   ((char) '\x02')
#define zapredraw_COMMAND16BIT_CHAR             ((char) '\x03')
      /*followed by 'l', 'h'*/
#define zapredraw_COMMAND_MERGE                 ((char) '\x04')
      /*followed by 'f', 'b', 'c0', 'c1'*/
#define zapredraw_COMMAND_RESERVED              ((char) '\x05')
      /*reserved */
#define zapredraw_COMMAND_SET_FG                ((char) '\x06')
      /*followed by 'f'*/
#define zapredraw_COMMAND_SET_BG                ((char) '\x07')
      /*followed by 'b'*/
#define zapredraw_COMMAND_CURSOR_MERGE          ((char) '\x08')
      /*followed by 'f', 'b', 'x', 'y'*/
#define zapredraw_COMMAND_SET_STYLE             ((char) '\x09')
      /*followed by 's'*/
#define zapredraw_COMMAND_SET_STYLE_COL         ((char) '\x0A')
      /*followed by 'f', 'b', 's'*/
#define zapredraw_COMMAND_SET_CHUNK             ((char) '\x0B')
      /*followed by chunk bits 8-15*/
#define zapredraw_COMMAND_SET_CHUNK_LONG        ((char) '\x0C')
      /*followed by chunk bits 8-15, then bits 16-23*/
#define zapredraw_COMMAND_DELETE                ((char) '\x7F')
#define zapredraw_NEW_RASTER                    ((zapredraw_reason) 0x0u)
#define zapredraw_SET_COLOURS                   ((zapredraw_reason) 0x1u)
#define zapredraw_MERGE                         ((zapredraw_reason) 0x4u)
#define zapredraw_SET_FG                        ((zapredraw_reason) 0x6u)
#define zapredraw_SET_BG                        ((zapredraw_reason) 0x7u)
#define zapredraw_CURSOR_MERGE                  ((zapredraw_reason) 0x8u)
#define zapredraw_SET_STYLE                     ((zapredraw_reason) 0x9u)
#define zapredraw_SET_STYLE_COLOURS             ((zapredraw_reason) 0xAu)
#define zapredraw_SET_CHUNK                     ((zapredraw_reason) 0xBu)
#define zapredraw_SET_LARGE_CHUNK               ((zapredraw_reason) 0xCu)
#define zapredrawcreatepalette_WIMP_TO_VDU      ((zapredrawcreatepalette_flags) 0x1u)
#define zapredrawcreatepalette_VDU_TO_DSA       ((zapredrawcreatepalette_flags) 0x2u)
#define zapredrawspritesizereason_PASS_ONE      ((zapredrawspritesize_reason) 0x0u)
#define zapredrawspritesizereason_PASS_TWO      ((zapredrawspritesize_reason) 0x80u)
#define zapredraw_MATCH_FOR_COLOUR_SHIFT        8
      /*shift for background colour to match*/
#define zapredraw_MATCH_FOR                     ((zapredraw_add_cursor_match) 0x40000000u)
      /*match foreground*/
#define zapredraw_MATCH_BAC                     ((zapredraw_add_cursor_match) 0x80000000u)
      /*match background*/
#define zapredraw_CURSOR_HIGH_BYTE_SHIFT        0
      /*shift for cursor high byte*/
#define zapredraw_CURSOR_FOR_SHIFT              24
      /*shift for cursor background colour*/
#define zapredraw_CURSOR_MERGE_CHARACTER        ((zapredraw_add_cursor_cursor) 0x400u)
      /*use merge character sequence*/
#define zapredraw_CURSOR_MERGE_CURSOR           ((zapredraw_add_cursor_cursor) 0x800u)
      /*use merge cursor sequence*/
#define zapredrawfindfont_DSA                   ((zapredrawfindfont_flags) 0x0u)
#define zapredrawfindfont_VDU                   ((zapredrawfindfont_flags) 0x1u)
#define zapredrawfindfont_REDUCTION_BLOCK       ((zapredrawfindfont_flags) 0x2u)
#define zapredrawreadcharsize_PIXELS            ((zapredrawreadcharsize_flags) 0x0u)
#define zapredrawreadcharsize_OS                ((zapredrawreadcharsize_flags) 0x1u)
#define zapredrawreadcharsize_LINESP            ((zapredrawreadcharsize_flags) 0x2u)
#define zapredrawreadcharsize_SCALE             ((zapredrawreadcharsize_flags) 0x4u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      zapredraw_redraw_area()
 *
 * Description:   Redraws a rectangle of characters on the screen
 *
 * Input:         redraw_block - value of R1 on entry
 *                extension_fn - value of R2 on entry
 *                extension_handle - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x48480.
 */

extern os_error *xzapredraw_redraw_area (zapredraw_block const *redraw_block,
      void const *extension_fn,
      void *extension_handle);
extern void zapredraw_redraw_area (zapredraw_block const *redraw_block,
      void const *extension_fn,
      void *extension_handle);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_get_palette_entry()
 *
 * Description:   Takes a colour bitmap and duplicates it to create a DSA
 *                colour mask
 *
 * Input:         colour_number - value of R0 on entry
 *                bpp - value of R1 on entry
 *
 * Output:        dup_colour - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48481.
 */

extern os_error *xzapredraw_get_palette_entry (os_colour_number colour_number,
      int bpp,
      int *dup_colour);
__swi (0x48481) int zapredraw_get_palette_entry (os_colour_number colour_number,
      int bpp);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_convert_bitmap()
 *
 * Description:   Converts a 1bpp bitmap for use by ZapRedraw_RedrawArea
 *
 * Input:         redraw_block - value of R1 on entry
 *                first - value of R2 on entry
 *                last - value of R3 on entry
 *                bitmaps - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x48483.
 */

extern os_error *xzapredraw_convert_bitmap (zapredraw_block const *redraw_block,
      int first,
      int last,
      zapredraw_char_cache bitmaps);
extern void zapredraw_convert_bitmap (zapredraw_block const *redraw_block,
      int first,
      int last,
      zapredraw_char_cache bitmaps);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_prepare_data_line()
 *
 * Description:   Helps prepare the 'r_data' field of the redraw block
 *
 * Input:         ctrl_colour - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *                input - value of R2 on entry
 *                fg - value of R3 on entry
 *                bg - value of R4 on entry
 *                length - value of R5 on entry
 *                output - value of R6 on entry
 *                substyles - value of R7 on entry
 *
 * Output:        highest - value of R0 on exit
 *                length_out - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48484.
 */

extern os_error *xzapredraw_prepare_data_line (zapredraw_colour ctrl_colour,
      zapredraw_block const *redraw_block,
      char const *input,
      zapredraw_colour const *fg,
      zapredraw_colour const *bg,
      int length,
      char *output,
      zapredraw_substyle const *substyles,
      int *highest,
      int *length_out);
extern int zapredraw_prepare_data_line (zapredraw_colour ctrl_colour,
      zapredraw_block const *redraw_block,
      char const *input,
      zapredraw_colour const *fg,
      zapredraw_colour const *bg,
      int length,
      char *output,
      zapredraw_substyle const *substyles,
      int *highest);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_find_character()
 *
 * Description:   Finds the (n + 1)th printable character within a line
 *
 * Input:         count - value of R0 on entry
 *                input - value of R1 on entry
 *                fg - value of R2 on entry
 *                bg - value of R3 on entry
 *                style - value of R4 on entry
 *
 * Output:        something - value of R0 on exit
 *                next_char - value of R1 on exit (X version only)
 *                fg_out - value of R2 on exit
 *                bg_out - value of R3 on exit
 *                style_out - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48486.
 */

extern os_error *xzapredraw_find_character (int count,
      char const *input,
      zapredraw_colour fg,
      zapredraw_colour bg,
      zapredraw_substyle style,
      char **something,
      char **next_char,
      zapredraw_colour *fg_out,
      zapredraw_colour *bg_out,
      zapredraw_substyle *style_out);
extern char *zapredraw_find_character (int count,
      char const *input,
      zapredraw_colour fg,
      zapredraw_colour bg,
      zapredraw_substyle style,
      char **something,
      zapredraw_colour *fg_out,
      zapredraw_colour *bg_out,
      zapredraw_substyle *style_out);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_move_bytes()
 *
 * Description:   Fast byte shifting
 *
 * Input:         source - value of R1 on entry
 *                dest - value of R2 on entry
 *                length - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x48487.
 */

extern os_error *xzapredraw_move_bytes (byte const *source,
      byte *dest,
      int length);
extern void zapredraw_move_bytes (byte const *source,
      byte *dest,
      int length);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_cached_char_size()
 *
 * Description:   Calculates cbpl, cbpc from charw, charh, bpp
 *
 * Input:         bpp - value of R0 on entry
 *                charw - value of R2 on entry
 *                charh - value of R3 on entry
 *
 * Output:        cbpl - value of R2 on exit
 *                cbpc - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x48488.
 */

extern os_error *xzapredraw_cached_char_size (int bpp,
      int charw,
      int charh,
      int *cbpl,
      int *cbpc);
extern void zapredraw_cached_char_size (int bpp,
      int charw,
      int charh,
      int *cbpl,
      int *cbpc);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_conv_bitmap_char()
 *
 * Description:   Performs the bitmap conversion for one character
 *
 * Input:         redraw_block - value of R1 on entry
 *                source_bpl - value of R2 on entry
 *                dest_bpl - value of R3 on entry
 *                source_bitmap - value of R4 on entry
 *                dest_bitmap - value of R5 on entry
 *                bit_mask - value of R6 on entry
 *                bpp - value of R7 on entry
 *
 * Output:        next_source - value of R4 on exit
 *                next_dest - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48489.
 */

extern os_error *xzapredraw_conv_bitmap_char (zapredraw_block const *redraw_block,
      int source_bpl,
      int dest_bpl,
      zapredraw_char_cache source_bitmap,
      zapredraw_char_cache dest_bitmap,
      bits bit_mask,
      int bpp,
      zapredraw_char_cache *next_source,
      zapredraw_char_cache *next_dest);
extern zapredraw_char_cache zapredraw_conv_bitmap_char (zapredraw_block const *redraw_block,
      int source_bpl,
      int dest_bpl,
      zapredraw_char_cache source_bitmap,
      zapredraw_char_cache dest_bitmap,
      bits bit_mask,
      int bpp,
      zapredraw_char_cache *next_source);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_create_palette()
 *
 * Description:   Performs various operations on palette data
 *
 * Input:         flags - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *                in - value of R2 on entry
 *                out - value of R3 on entry
 *                number - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4848A.
 */

extern os_error *xzapredraw_create_palette (zapredrawcreatepalette_flags flags,
      zapredraw_block const *redraw_block,
      zapredraw_palette const *in,
      zapredraw_palette *out,
      int number);
extern void zapredraw_create_palette (zapredrawcreatepalette_flags flags,
      zapredraw_block const *redraw_block,
      zapredraw_palette const *in,
      zapredraw_palette *out,
      int number);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_insert_char()
 *
 * Description:   Inserts a single character into a string of 'data' format
 *
 * Input:         c - value of R0 on entry
 *                address - value of R1 on entry
 *
 * Output:        address_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4848B.
 */

extern os_error *xzapredraw_insert_char (int c,
      char *address,
      char **address_out);
extern char *zapredraw_insert_char (int c,
      char *address);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_read_system_chars()
 *
 * Description:   Converts the system characters to a form usable for
 *                ZapRedraw_RedrawArea
 *
 * Input:         buffer - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4848C.
 */

extern os_error *xzapredraw_read_system_chars (zapredraw_char_cache buffer,
      zapredraw_block const *redraw_block);
__swi (0x4848C) void zapredraw_read_system_chars (zapredraw_char_cache buffer,
      zapredraw_block const *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_reverse_bitmaps()
 *
 * Description:   Reverses the bits of each byte
 *
 * Input:         source - value of R1 on entry
 *                dest - value of R2 on entry
 *                number - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4848D.
 */

extern os_error *xzapredraw_reverse_bitmaps (zapredraw_char_cache source,
      zapredraw_char_cache dest,
      int number);
extern void zapredraw_reverse_bitmaps (zapredraw_char_cache source,
      zapredraw_char_cache dest,
      int number);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_read_vdu_vars()
 *
 * Description:   Fills in bpl, bpp, magx, magy, xsize, ysize, mode
 *
 * Input:         redraw_block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4848E.
 */

extern os_error *xzapredraw_read_vdu_vars (zapredraw_block *redraw_block);
extern void zapredraw_read_vdu_vars (zapredraw_block *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_get_rectangle()
 *
 * Description:   Takes the redraw rectangle block as returned by
 *                Wimp_RedrawWindow or Wimp_GetRectangle and uses it to
 *                fill in the ZapRedraw block
 *
 * Input:         wimp_block - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4848F.
 */

extern os_error *xzapredraw_get_rectangle (wimp_draw const *wimp_block,
      zapredraw_block *redraw_block);
__swi (0x4848F) void zapredraw_get_rectangle (wimp_draw const *wimp_block,
      zapredraw_block *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_add_vdu_bitmaps()
 *
 * Description:   Creates bitmaps for extra characters from a standard
 *                bitmap of the normal characters
 *
 * Input:         redraw_block - value of R1 on entry
 *                first - value of R2 on entry
 *                last - value of R3 on entry
 *                address - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x48490.
 */

extern os_error *xzapredraw_add_vdu_bitmaps (zapredraw_block const *redraw_block,
      int first,
      int last,
      zapredraw_char_cache address);
extern void zapredraw_add_vdu_bitmaps (zapredraw_block const *redraw_block,
      int first,
      int last,
      zapredraw_char_cache address);

/* ------------------------------------------------------------------------
 * Function:      zapredrawcachefontchars_current_mode()
 *
 * Description:   Caches a range of characters as bitmaps in the curent
 *                mode
 *
 * Input:         redraw_block - value of R1 on entry
 *                font_name - value of R2 on entry
 *                size - value of R3 on entry
 *                xoff - value of R4 on entry
 *                yoff - value of R5 on entry
 *                first - value of R6 on entry
 *                last - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x48491 with R0 = 0x1.
 */

extern os_error *xzapredrawcachefontchars_current_mode (zapredraw_block const *redraw_block,
      char const *font_name,
      int size,
      int xoff,
      int yoff,
      int first,
      int last);
extern void zapredrawcachefontchars_current_mode (zapredraw_block const *redraw_block,
      char const *font_name,
      int size,
      int xoff,
      int yoff,
      int first,
      int last);

/* ------------------------------------------------------------------------
 * Function:      zapredrawcachefontchars_1bpp()
 *
 * Description:   Caches a range of characters as bitmaps in 1bpp
 *
 * Input:         redraw_block - value of R1 on entry
 *                font_name - value of R2 on entry
 *                size - value of R3 on entry
 *                xoff - value of R4 on entry
 *                yoff - value of R5 on entry
 *                first - value of R6 on entry
 *                last - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x48491 with R0 = 0x2.
 */

extern os_error *xzapredrawcachefontchars_1bpp (zapredraw_block const *redraw_block,
      char const *font_name,
      int size,
      int xoff,
      int yoff,
      int first,
      int last);
extern void zapredrawcachefontchars_1bpp (zapredraw_block const *redraw_block,
      char const *font_name,
      int size,
      int xoff,
      int yoff,
      int first,
      int last);

/* ------------------------------------------------------------------------
 * Function:      zapredrawspritesize_current_mode()
 *
 * Description:   Returns the size required for the sprite area in the
 *                current mode
 *
 * Input:         pass - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Output:        size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48492 with R0 |= 0x1.
 */

extern os_error *xzapredrawspritesize_current_mode (zapredrawspritesize_reason pass,
      zapredraw_block const *redraw_block,
      int *size);
extern int zapredrawspritesize_current_mode (zapredrawspritesize_reason pass,
      zapredraw_block const *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredrawspritesize_1bpp()
 *
 * Description:   Returns the size required for the sprite area in a 1bpp
 *                mode
 *
 * Input:         pass - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Output:        size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48492 with R0 |= 0x2.
 */

extern os_error *xzapredrawspritesize_1bpp (zapredrawspritesize_reason pass,
      zapredraw_block const *redraw_block,
      int *size);
extern int zapredrawspritesize_1bpp (zapredrawspritesize_reason pass,
      zapredraw_block const *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_redraw_window()
 *
 * Description:   The whole Wimp_RedrawWindowRequest event handler
 *
 * Input:         wimp_block - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x48493.
 */

extern os_error *xzapredraw_redraw_window (wimp_draw const *wimp_block,
      zapredraw_block const *redraw_block);
__swi (0x48493) void zapredraw_redraw_window (wimp_draw const *wimp_block,
      zapredraw_block const *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_divide()
 *
 * Description:   Fast unsigned integer division / modulus
 *
 * Input:         numerator - value of R0 on entry
 *                denominator - value of R1 on entry
 *
 * Output:        div - value of R0 on exit (X version only)
 *                mod - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48494.
 */

extern os_error *xzapredraw_divide (bits numerator,
      bits denominator,
      bits *div,
      bits *mod);
extern bits zapredraw_divide (bits numerator,
      bits denominator,
      bits *mod);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_plot_rectangle()
 *
 * Description:   Fast rectangle fill routine using DSA
 *
 * Input:         x0 - value of R0 on entry
 *                y0 - value of R1 on entry
 *                x1 - value of R2 on entry
 *                y1 - value of R3 on entry
 *                colour - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x48495.
 */

extern os_error *xzapredraw_plot_rectangle (int x0,
      int y0,
      int x1,
      int y1,
      os_colour_number colour);
extern void zapredraw_plot_rectangle (int x0,
      int y0,
      int x1,
      int y1,
      os_colour_number colour);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_add_cursor_smart()
 *
 * Description:   Adds in the codes to place 'cursors' over some of the
 *                text
 *
 * Input:         dest - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *                offset - offset in characters of start of cursor
 *                length - length in characters of cursor string
 *                cursors - string of low bytes of cursor characters
 *                source - 0,2 terminated
 *                match - value of R6 on entry
 *                cursor - value of R7 on entry
 *
 * Output:        end - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x48496.
 */

extern os_error *xzapredraw_add_cursor_smart (char *dest,
      zapredraw_block const *redraw_block,
      int offset,
      int length,
      char const *cursors,
      char const *source,
      zapredraw_add_cursor_match match,
      zapredraw_add_cursor_cursor cursor,
      char **end);
extern void zapredraw_add_cursor_smart (char *dest,
      zapredraw_block const *redraw_block,
      int offset,
      int length,
      char const *cursors,
      char const *source,
      zapredraw_add_cursor_match match,
      zapredraw_add_cursor_cursor cursor,
      char **end);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_find_font()
 *
 * Description:   Opens a font and returns a font handle
 *
 * Input:         name - value of R0 on entry
 *                flags - value of R1 on entry
 *                size - value of R2 on entry
 *                aspect - value of R3 on entry
 *                block - value of R4 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x48497.
 */

extern os_error *xzapredraw_find_font (char const *name,
      zapredrawfindfont_flags flags,
      int size,
      int aspect,
      zapredraw_reduction_block const *block,
      zapredraw_f *handle);
extern zapredraw_f zapredraw_find_font (char const *name,
      zapredrawfindfont_flags flags,
      int size,
      int aspect,
      zapredraw_reduction_block const *block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_lose_font()
 *
 * Description:   Closes a font
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x48498.
 */

extern os_error *xzapredraw_lose_font (zapredraw_f handle);
__swi (0x48498) void zapredraw_lose_font (zapredraw_f handle);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_read_char_size()
 *
 * Description:   Reads the character size of an opened font
 *
 * Input:         handle - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *                flags - value of R2 on entry
 *
 * Output:        charw - value of R2 on exit
 *                charh - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x48499.
 */

extern os_error *xzapredraw_read_char_size (zapredraw_f handle,
      zapredraw_block const *redraw_block,
      zapredrawreadcharsize_flags flags,
      int *charw,
      int *charh);
extern void zapredraw_read_char_size (zapredraw_f handle,
      zapredraw_block const *redraw_block,
      zapredrawreadcharsize_flags flags,
      int *charw,
      int *charh);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_version()
 *
 * Description:   Reads the version of ZapRedraw
 *
 * Output:        Version - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4849A.
 */

extern os_error *xzapredraw_version (int *Version);
__swi (0x4849A) int zapredraw_version (void);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_list_fonts()
 *
 * Description:   Scans for fonts, returning their identifiers one at a
 *                time, or or builds a menu of fonts
 *
 * Input:         buffer1 - value of R1 on entry
 *                context - value of R2 on entry
 *                size1 - value of R3 on entry
 *                buffer2 - value of R4 on entry
 *                size2 - value of R5 on entry
 *                tick_font - value of R6 on entry
 *
 * Output:        context_out - value of R2 on exit (X version only)
 *                used1 - value of R3 on exit
 *                used2 - value of R5 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4849B.
 */

extern os_error *xzapredraw_list_fonts (byte *buffer1,
      font_list_context context,
      int size1,
      byte *buffer2,
      int size2,
      char const *tick_font,
      font_list_context *context_out,
      int *used1,
      int *used2);
extern font_list_context zapredraw_list_fonts (byte *buffer1,
      font_list_context context,
      int size1,
      byte *buffer2,
      int size2,
      char const *tick_font,
      int *used1,
      int *used2);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_update_window()
 *
 * Description:   Updates a wimpdow by calling Wimp_UpdateWindow and
 *                ZapRedraw_RedrawWindow
 *
 * Input:         update - value of R0 on entry
 *                redraw_block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4849C.
 */

extern os_error *xzapredraw_update_window (wimp_draw const *update,
      zapredraw_block const *redraw_block);
__swi (0x4849C) void zapredraw_update_window (wimp_draw const *update,
      zapredraw_block const *redraw_block);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_read_font_name()
 *
 * Description:   Read the font name of an open font
 *
 * Input:         handle - value of R1 on entry
 *
 * Output:        name - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4849D with R0 = 0x0.
 */

extern os_error *xzapredraw_read_font_name (zapredraw_f handle,
      char **name);
extern char *zapredraw_read_font_name (zapredraw_f handle);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_read_mode_bpp()
 *
 * Description:   Read the Log2 BPP for the current mode, adjusted for
 *                ViewFinder
 *
 * Output:        bpp - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4849E.
 */

extern os_error *xzapredraw_read_mode_bpp (int *bpp);
__swi (0x4849E) int zapredraw_read_mode_bpp (void);

/* ------------------------------------------------------------------------
 * Function:      zapredraw_decode_menu()
 *
 * Description:   Decode a selection made from a font menu
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                block - value of R2 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        next_selection - value of R3 on exit
 *                used - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x4849F.
 */

extern os_error *xzapredraw_decode_menu (font_decode_flags flags,
      byte const *menu,
      byte const *block,
      byte *buffer,
      int size,
      int **next_selection,
      int *used);
extern void zapredraw_decode_menu (font_decode_flags flags,
      byte const *menu,
      byte const *block,
      byte *buffer,
      int size,
      int **next_selection,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      zapredrawencoding_find()
 *
 * Description:   Opens an encoding for later use
 *
 * Input:         name - value of R1 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x484A0 with R0 = 0x0.
 */

extern os_error *xzapredrawencoding_find (char const *name,
      zapredraw_e *handle);
extern zapredraw_e zapredrawencoding_find (char const *name);

/* ------------------------------------------------------------------------
 * Function:      zapredrawencoding_lose()
 *
 * Description:   Closes an encoding
 *
 * Input:         handle - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x484A0 with R0 = 0x1.
 */

extern os_error *xzapredrawencoding_lose (zapredraw_e handle);
extern void zapredrawencoding_lose (zapredraw_e handle);

/* ------------------------------------------------------------------------
 * Function:      zapredrawencoding_table()
 *
 * Description:   Returns the encoding table for an open encoding file
 *
 * Input:         handle - value of R1 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x484A0 with R0 = 0x2.
 */

extern os_error *xzapredrawencoding_table (zapredraw_e handle,
      zapredraw_encoding_table **table);
extern zapredraw_encoding_table *zapredrawencoding_table (zapredraw_e handle);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
