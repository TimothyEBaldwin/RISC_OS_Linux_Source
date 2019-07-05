#ifndef font_H
#define font_H

/* C header file for Font
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1996
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
#undef  Font_CacheAddr
#define Font_CacheAddr                          0x40080
#undef  XFont_CacheAddr
#define XFont_CacheAddr                         0x60080
#undef  Font_FindFont
#define Font_FindFont                           0x40081
#undef  XFont_FindFont
#define XFont_FindFont                          0x60081
#undef  Font_LoseFont
#define Font_LoseFont                           0x40082
#undef  XFont_LoseFont
#define XFont_LoseFont                          0x60082
#undef  Font_ReadDefn
#define Font_ReadDefn                           0x40083
#undef  XFont_ReadDefn
#define XFont_ReadDefn                          0x60083
#undef  Font_ReadIdentifier
#define Font_ReadIdentifier                     0x40083
#undef  XFont_ReadIdentifier
#define XFont_ReadIdentifier                    0x60083
#undef  Font_ReadInfo
#define Font_ReadInfo                           0x40084
#undef  XFont_ReadInfo
#define XFont_ReadInfo                          0x60084
#undef  Font_StringWidth
#define Font_StringWidth                        0x40085
#undef  XFont_StringWidth
#define XFont_StringWidth                       0x60085
#undef  Font_Paint
#define Font_Paint                              0x40086
#undef  XFont_Paint
#define XFont_Paint                             0x60086
#undef  Font_Caret
#define Font_Caret                              0x40087
#undef  XFont_Caret
#define XFont_Caret                             0x60087
#undef  Font_ConverttoOS
#define Font_ConverttoOS                        0x40088
#undef  XFont_ConverttoOS
#define XFont_ConverttoOS                       0x60088
#undef  Font_Converttopoints
#define Font_Converttopoints                    0x40089
#undef  XFont_Converttopoints
#define XFont_Converttopoints                   0x60089
#undef  Font_SetFont
#define Font_SetFont                            0x4008A
#undef  XFont_SetFont
#define XFont_SetFont                           0x6008A
#undef  Font_CurrentFont
#define Font_CurrentFont                        0x4008B
#undef  XFont_CurrentFont
#define XFont_CurrentFont                       0x6008B
#undef  Font_FutureFont
#define Font_FutureFont                         0x4008C
#undef  XFont_FutureFont
#define XFont_FutureFont                        0x6008C
#undef  Font_FindCaret
#define Font_FindCaret                          0x4008D
#undef  XFont_FindCaret
#define XFont_FindCaret                         0x6008D
#undef  Font_CharBBox
#define Font_CharBBox                           0x4008E
#undef  XFont_CharBBox
#define XFont_CharBBox                          0x6008E
#undef  Font_ReadScaleFactor
#define Font_ReadScaleFactor                    0x4008F
#undef  XFont_ReadScaleFactor
#define XFont_ReadScaleFactor                   0x6008F
#undef  Font_SetScaleFactor
#define Font_SetScaleFactor                     0x40090
#undef  XFont_SetScaleFactor
#define XFont_SetScaleFactor                    0x60090
#undef  Font_ListFonts
#define Font_ListFonts                          0x40091
#undef  XFont_ListFonts
#define XFont_ListFonts                         0x60091
#undef  Font_SetFontColours
#define Font_SetFontColours                     0x40092
#undef  XFont_SetFontColours
#define XFont_SetFontColours                    0x60092
#undef  Font_SetPalette
#define Font_SetPalette                         0x40093
#undef  XFont_SetPalette
#define XFont_SetPalette                        0x60093
#undef  Font_SetTruePalette
#define Font_SetTruePalette                     0x40093
#undef  XFont_SetTruePalette
#define XFont_SetTruePalette                    0x60093
#undef  Font_ReadThresholds
#define Font_ReadThresholds                     0x40094
#undef  XFont_ReadThresholds
#define XFont_ReadThresholds                    0x60094
#undef  Font_SetThresholds
#define Font_SetThresholds                      0x40095
#undef  XFont_SetThresholds
#define XFont_SetThresholds                     0x60095
#undef  Font_FindCaretJ
#define Font_FindCaretJ                         0x40096
#undef  XFont_FindCaretJ
#define XFont_FindCaretJ                        0x60096
#undef  Font_StringBBox
#define Font_StringBBox                         0x40097
#undef  XFont_StringBBox
#define XFont_StringBBox                        0x60097
#undef  Font_ReadColourTable
#define Font_ReadColourTable                    0x40098
#undef  XFont_ReadColourTable
#define XFont_ReadColourTable                   0x60098
#undef  Font_MakeBitmap
#define Font_MakeBitmap                         0x40099
#undef  XFont_MakeBitmap
#define XFont_MakeBitmap                        0x60099
#undef  Font_UnCacheFile
#define Font_UnCacheFile                        0x4009A
#undef  XFont_UnCacheFile
#define XFont_UnCacheFile                       0x6009A
#undef  Font_SetFontMax
#define Font_SetFontMax                         0x4009B
#undef  XFont_SetFontMax
#define XFont_SetFontMax                        0x6009B
#undef  Font_ReadFontMax
#define Font_ReadFontMax                        0x4009C
#undef  XFont_ReadFontMax
#define XFont_ReadFontMax                       0x6009C
#undef  Font_ReadFontPrefix
#define Font_ReadFontPrefix                     0x4009D
#undef  XFont_ReadFontPrefix
#define XFont_ReadFontPrefix                    0x6009D
#undef  Font_SwitchOutputToBuffer
#define Font_SwitchOutputToBuffer               0x4009E
#undef  XFont_SwitchOutputToBuffer
#define XFont_SwitchOutputToBuffer              0x6009E
#undef  Font_SwitchOutputToBufferFlags
#define Font_SwitchOutputToBufferFlags          0x4009E
#undef  XFont_SwitchOutputToBufferFlags
#define XFont_SwitchOutputToBufferFlags         0x6009E
#undef  Font_ReadFontMetrics
#define Font_ReadFontMetrics                    0x4009F
#undef  XFont_ReadFontMetrics
#define XFont_ReadFontMetrics                   0x6009F
#undef  Font_ReadFontMetricsUCS
#define Font_ReadFontMetricsUCS                 0x4009F
#undef  XFont_ReadFontMetricsUCS
#define XFont_ReadFontMetricsUCS                0x6009F
#undef  Font_DecodeMenu
#define Font_DecodeMenu                         0x400A0
#undef  XFont_DecodeMenu
#define XFont_DecodeMenu                        0x600A0
#undef  Font_ScanString
#define Font_ScanString                         0x400A1
#undef  XFont_ScanString
#define XFont_ScanString                        0x600A1
#undef  Font_SetColourTable
#define Font_SetColourTable                     0x400A2
#undef  XFont_SetColourTable
#define XFont_SetColourTable                    0x600A2
#undef  Font_CurrentRGB
#define Font_CurrentRGB                         0x400A3
#undef  XFont_CurrentRGB
#define XFont_CurrentRGB                        0x600A3
#undef  Font_FutureRGB
#define Font_FutureRGB                          0x400A4
#undef  XFont_FutureRGB
#define XFont_FutureRGB                         0x600A4
#undef  Font_ReadEncodingFilename
#define Font_ReadEncodingFilename               0x400A5
#undef  XFont_ReadEncodingFilename
#define XFont_ReadEncodingFilename              0x600A5
#undef  Font_FindField
#define Font_FindField                          0x400A6
#undef  XFont_FindField
#define XFont_FindField                         0x600A6
#undef  Font_ApplyFields
#define Font_ApplyFields                        0x400A7
#undef  XFont_ApplyFields
#define XFont_ApplyFields                       0x600A7
#undef  Font_LookupFont
#define Font_LookupFont                         0x400A8
#undef  XFont_LookupFont
#define XFont_LookupFont                        0x600A8
#undef  Font_EnumerateCharacters
#define Font_EnumerateCharacters                0x400A9
#undef  XFont_EnumerateCharacters
#define XFont_EnumerateCharacters               0x600A9
#undef  Service_FontsChanged
#define Service_FontsChanged                    0x6E

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct font_paint_block                 font_paint_block;
typedef struct font_scan_block                  font_scan_block;
typedef struct font_thresholds                  font_thresholds;
typedef struct font_thresholds_base             font_thresholds_base;
typedef struct font_colour_table                font_colour_table;
typedef struct font_colour_table_base           font_colour_table_base;
typedef struct font_bbox_info                   font_bbox_info;
typedef struct font_width_info                  font_width_info;
typedef struct font_misc_info                   font_misc_info;
typedef struct font_metrics_misc_info           font_metrics_misc_info;
typedef struct font_long_kern_pair              font_long_kern_pair;
typedef union  font_kern_info                   font_kern_info;
typedef struct font_short_kern_pair_ucs         font_short_kern_pair_ucs;
typedef struct font_long_kern_pair_ucs          font_long_kern_pair_ucs;
typedef union  font_kern_info_ucs               font_kern_info_ucs;

/********************
 * Type definitions *
 ********************/
typedef bits font_string_flags;
      /*Flags for painting and scanning strings*/

typedef bits font_output_flags;
      /*Flags for outputting DrawFile objects to a buffer*/

typedef byte font_f;
      /*Font handle, for design fulfilment, 8 bits*/

struct font_paint_block
   {  os_coord space;
      os_coord letter;
      os_box rubout;
   };

struct font_scan_block
   {  os_coord space;
      os_coord letter;
      int split_char;
      os_box bbox;
   };

struct font_thresholds
   {  byte t [UNKNOWN];
   };

#define font_THRESHOLDS(N) \
   struct \
      {  byte t [N]; \
      }

#define font_SIZEOF_THRESHOLDS(N) \
   ((N)*sizeof ((font_thresholds *) NULL)->t)

struct font_colour_table
   {  byte c [UNKNOWN];
   };

#define font_COLOUR_TABLE(N) \
   struct \
      {  byte c [N]; \
      }

#define font_SIZEOF_COLOUR_TABLE(N) \
   ((N)*sizeof ((font_colour_table *) NULL)->c)

typedef bits font_bitmap_type;

typedef bits font_characteristic_flags;

typedef int font_list_context;

typedef bits font_kern_flags;

typedef bits font_metric_flags;

struct font_bbox_info
   {  os_box bboxes [256];
   };

struct font_width_info
   {  int widths [256];
   };

struct font_misc_info
   {  short x0;
      short y0;
      short x1;
      short y1;
      short xkern;
      short ykern;
      short italic_correction;
      byte underline_position;
      byte underline_thickness;
      short cap_height;
      short xheight;
      short descender;
      short ascender;
      int reserved;
   };

struct font_metrics_misc_info
   {  int x0;
      int y0;
      int x1;
      int y1;
      int xkern;
      int ykern;
      int italic_correction;
      byte underline_position;
      byte underline_thickness;
      byte reserved_0;
      byte reserved_1;
      int cap_height;
      int xheight;
      int descender;
      int ascender;
      int reserved;
   };

typedef bits font_short_kern_pair;

struct font_long_kern_pair
   {  int c;
      int xkern;
      int ykern;
   };

union font_kern_info
   {  struct
      {  int table [256];
         int size;
         font_kern_flags flags;
         font_long_kern_pair pairs [UNKNOWN];
      }
      long_info;
      struct
      {  int table [256];
         int size;
         font_kern_flags flags;
         font_short_kern_pair pairs [UNKNOWN];
      }
      short_info;
   };

struct font_short_kern_pair_ucs
   {  char c1;
      char c2;
      short kern;
   };

struct font_long_kern_pair_ucs
   {  short c1;
      short c2;
      short xkern;
      short ykern;
   };

union font_kern_info_ucs
   {  struct
      {  int table [256];
         int size;
         font_kern_flags flags;
         font_long_kern_pair_ucs pairs [UNKNOWN];
      }
      long_info;
      struct
      {  int table [256];
         int size;
         font_kern_flags flags;
         font_short_kern_pair_ucs pairs [UNKNOWN];
      }
      short_info;
   };

typedef bits font_decode_flags;

/************************
 * Constant definitions *
 ************************/
#define font_OS_UNIT                            400
      /*1 O S unit in millipoints*/
#define font_INCH                               72000
      /*1in in millipoints*/
#define font_POINT                              1000
      /*1pt in millipoints*/
#define font_COMMAND_NULL                       ((char) '\x00')
#define font_COMMAND_XMOVE                      ((char) '\x09')
#define font_COMMAND_LINEFEED                   ((char) '\x0A')
#define font_COMMAND_YMOVE                      ((char) '\x0B')
#define font_COMMAND_RETURN                     ((char) '\x0D')
#define font_COMMAND_GCOL                       ((char) '\x11')
#define font_COMMAND_COLOURS                    ((char) '\x12')
#define font_COMMAND_TRUE_COLOURS               ((char) '\x13')
#define font_COMMAND_COMMENT                    ((char) '\x15')
#define font_COMMAND_UNDERLINE                  ((char) '\x19')
#define font_COMMAND_FONT                       ((char) '\x1A')
#define font_COMMAND_HOM_TRFM                   ((char) '\x1B')
#define font_COMMAND_TRFM                       ((char) '\x1C')
#define font_JUSTIFY                            ((font_string_flags) 0x1u)
      /*Use when painting*/
#define font_RUBOUT                             ((font_string_flags) 0x2u)
      /*Use when painting*/
#define font_OS_UNITS                           ((font_string_flags) 0x10u)
      /*Use when painting, scanning, caret or charbbox*/
#define font_GIVEN_BLOCK                        ((font_string_flags) 0x20u)
      /*Use when painting or scanning*/
#define font_GIVEN_TRFM                         ((font_string_flags) 0x40u)
      /*Use when painting or scanning*/
#define font_GIVEN_LENGTH                       ((font_string_flags) 0x80u)
      /*Use when painting or scanning*/
#define font_GIVEN_FONT                         ((font_string_flags) 0x100u)
      /*Use when painting or scanning*/
#define font_KERN                               ((font_string_flags) 0x200u)
      /*Use when painting or scanning*/
#define font_RIGHT_TO_LEFT                      ((font_string_flags) 0x400u)
      /*Use when painting or scanning*/
#define font_BLEND_FONT                         ((font_string_flags) 0x800u)
      /*Use when painting or scanning*/
#define font_GIVEN16_BIT                        ((font_string_flags) 0x1000u)
      /*Use when painting or scanning - RISC O S 5+*/
#define font_GIVEN32_BIT                        ((font_string_flags) 0x2000u)
      /*Use when painting or scanning - RISC O S 5+*/
#define font_RETURN_CARET_POS                   ((font_string_flags) 0x20000u)
      /*Use when scanning*/
#define font_RETURN_BBOX                        ((font_string_flags) 0x40000u)
      /*Use when scanning*/
#define font_RETURN_MATRIX                      ((font_string_flags) 0x80000u)
      /*Use when scanning*/
#define font_RETURN_SPLIT_COUNT                 ((font_string_flags) 0x100000u)
      /*Use when scanning*/
#define font_NO_OUTPUT                          ((font_output_flags) 0x1u)
#define font_ADD_HINTS                          ((font_output_flags) 0x2u)
#define font_OUTPUT_SKELETON                    ((font_output_flags) 0x4u)
#define font_CONVERT_BITMAP                     ((font_output_flags) 0x8u)
#define font_ERROR_IF_BITMAP                    ((font_output_flags) 0x10u)
#define error_FONT_NO_ROOM                      0x200u
      /*Not enough memory for Font cache*/
#define error_FONT_CACHE_FULL                   0x201u
      /*Font cache full*/
#define error_FONT_NO_CACHE                     0x202u
      /*No font cache present*/
#define error_FONT_TOO_LONG                     0x203u
      /*String too long*/
#define error_FONT64K                           0x204u
      /*Font definition too large*/
#define error_FONT_PAL_TOO_BIG                  0x205u
      /*Undefined font colour*/
#define error_FONT_BAD_TRAN_BITS                0x206u
      /*Invalid data passed to Font_SetTransfer*/
#define error_FONT_NOT_ENOUGH_BITS              0x207u
      /*Invalid font colour*/
#define error_FONT_NO_FONT                      0x208u
      /*Undefined font handle*/
#define error_FONT_NO_PIXELS                    0x209u
      /*No pixel data for this font*/
#define error_FONT_BAD_FONT_NUMBER              0x20Au
      /*Font handle out of range*/
#define error_FONT_NOT_FOUND                    0x20Bu
      /*%0 font not found*/
#define error_FONT_BAD_FONT_FILE                0x20Cu
      /*Illegal font file*/
#define error_FONT_NO_HANDLES                   0x20Du
      /*No more font handles*/
#define error_FONT_BAD_COUNTER                  0x20Eu
      /*Fonts must be read sequentially*/
#define error_FONT_BAD_CTRL_CHAR                0x20Fu
      /*Illegal control character in font string*/
#define error_FONTS_IN_USE                      0x210u
      /*Font manager in use*/
#define error_FONT_BAD_SEGMENT                  0x211u
      /*Illegal line segment in outline font*/
#define error_FONT_BAD_PREFIX                   0x212u
      /*%1 (while scanning Font$Path)*/
#define error_FONT_RESERVED                     0x213u
      /*Reserved fields must be zero*/
#define error_FONT_BAD_CHAR_CODE                0x214u
      /*Character code out of range*/
#define error_FONT_NO_BITMAPS                   0x215u
      /*ROM font directory cannot contain bitmaps*/
#define error_FONT_NO_BITMAPS2                  0x216u
      /*Can't convert bitmap characters into outlines*/
#define error_FONT_BAD_FONT_CACHE_FILE          0x217u
      /*Invalid font cache file*/
#define error_FONT_FIELD_NOT_FOUND              0x218u
      /*%0 field not present in font string*/
#define error_FONT_BAD_MATRIX                   0x219u
      /*Invalid matrix passed to Font Manager*/
#define error_FONT_OVERFLOW                     0x21Au
      /*Number too big*/
#define error_FONT_DIVBY0                       0x21Bu
      /*Division by zero*/
#define error_FONT_BAD_READ_METRICS             0x21Cu
      /*Font_ReadFontMetrics not allowed on a transformed font*/
#define error_FONT_BAD_RGB                      0x21Du
      /*Undefined RGB font colours*/
#define error_FONT_ENCODING_NOT_FOUND           0x21Eu
      /*%0 encoding not found*/
#define error_FONT_MUST_HAVE_SLASH              0x21Fu
      /*Identifier '%1' should be preceded by '/' in encoding '%0'*/
#define error_FONT_BAD_ENCODING_SIZE            0x220u
      /*Max total size of input and output encoding files is 16k*/
#define error_FONT_TOO_MANY_IDS                 0x221u
      /*Too many identifiers in %0 encoding*/
#define error_FONT_TOO_FEW_IDS                  0x222u
      /*Not enough identifiers in %0 encoding*/
#define error_FONT_NO_BASE_ENCODING             0x223u
      /*Base encoding %0 not found*/
#define error_FONT_IDENTIFIER_NOT_FOUND         0x224u
      /*Identifier %1 not found in encoding %0*/
#define error_FONT_TOO_MANY_CHUNKS              0x225u
      /*Too many characters in %0*/
#define error_FONT_BAD_FONT_FILE2               0x226u
      /*Illegal font file in %0*/
#define error_FONT_DATA_NOT_FOUND               0x20Bu
      /*Font data not found*/
#define error_FONT_DATA_NOT_FOUND2              0x20Bu
      /*No suitable font data for %0*/
#define font_NAME_LIMIT                         40
#define font_SYSTEM                             ((font_f) 0x0u)
      /*Value used as system font or no font*/
#define font_CURRENT                            ((font_f) 0x0u)
      /*Value for scanning*/
#define font_BITMAP_DEEP                        ((font_bitmap_type) 0x1u)
#define font_BITMAP_HORIZONTAL_SUB_PIXEL        ((font_bitmap_type) 0x2u)
#define font_BITMAP_VERTICAL_SUB_PIXEL          ((font_bitmap_type) 0x4u)
#define font_BITMAP_DELETE                      ((font_bitmap_type) 0x8u)
#define font_CHARACTERISTIC_OLD_FORMAT          ((font_characteristic_flags) 0x1u)
#define font_CHARACTERISTIC_ROM                 ((font_characteristic_flags) 0x2u)
#define font_CHARACTERISTIC_MONOCHROME          ((font_characteristic_flags) 0x4u)
#define font_CHARACTERISTIC_FILL_RULE_NON_ZERO  ((font_characteristic_flags) 0x8u)
#define font_RETURN_FONT_NAME                   ((font_list_context) 0x10000u)
#define font_RETURN_LOCAL_FONT_NAME             ((font_list_context) 0x20000u)
#define font_USE_LINEFEED                       ((font_list_context) 0x40000u)
#define font_RETURN_FONT_MENU                   ((font_list_context) 0x80000u)
#define font_ALLOW_SYSTEM_FONT                  ((font_list_context) 0x100000u)
#define font_GIVEN_TICK                         ((font_list_context) 0x200000u)
#define font_RETURN_ENCODING_MENU               ((font_list_context) 0x480000u)
#define font_TICK_NONE                          ((char *) 0x0u)
#define font_TICK_SYSTEM_FONT                   ((char *) 0x1u)
#define font_KERN_NO_BBOXES                     ((font_kern_flags) 0x1u)
#define font_KERN_NO_XOFFSETS                   ((font_kern_flags) 0x2u)
#define font_KERN_NO_YOFFSETS                   ((font_kern_flags) 0x4u)
#define font_METRICS_KERN_YONLY                 ((font_metric_flags) 0x2u)
#define font_METRICS_KERN_XONLY                 ((font_metric_flags) 0x4u)
#define font_METRICS_MANY_KERN_PAIRS            ((font_metric_flags) 0x8u)
#define font_GIVEN_ENCODING_MENU                ((font_decode_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      font_cache_addr()
 *
 * Description:   Gets the version number, font cache size and amount used
 *
 * Output:        version - value of R0 on exit
 *                cache_size - value of R2 on exit
 *                cache_used - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x40080.
 */

extern os_error *xfont_cache_addr (int *version,
      int *cache_size,
      int *cache_used);
extern void font_cache_addr (int *version,
      int *cache_size,
      int *cache_used);

/* ------------------------------------------------------------------------
 * Function:      font_find_font()
 *
 * Description:   Gets the handle for a font
 *
 * Input:         font_name - value of R1 on entry
 *                xsize - value of R2 on entry
 *                ysize - value of R3 on entry
 *                xres - value of R4 on entry
 *                yres - value of R5 on entry
 *
 * Output:        font - value of R0 on exit (X version only)
 *                xres_out - value of R4 on exit
 *                yres_out - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40081.
 */

extern os_error *xfont_find_font (char const *font_name,
      int xsize,
      int ysize,
      int xres,
      int yres,
      font_f *font,
      int *xres_out,
      int *yres_out);
extern font_f font_find_font (char const *font_name,
      int xsize,
      int ysize,
      int xres,
      int yres,
      int *xres_out,
      int *yres_out);

/* ------------------------------------------------------------------------
 * Function:      font_lose_font()
 *
 * Description:   Finishes use of a font
 *
 * Input:         font - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40082.
 */

extern os_error *xfont_lose_font (font_f font);
__swi (0x40082) void font_lose_font (font_f font);

/* ------------------------------------------------------------------------
 * Function:      font_read_defn()
 *
 * Description:   Reads details about a font
 *
 * Input:         font - Font handle
 *                font_id - Buffer to hold font identifier
 *
 * Output:        xsize - value of R2 on exit
 *                ysize - value of R3 on exit
 *                xres - value of R4 on exit
 *                yres - value of R5 on exit
 *                age - value of R6 on exit
 *                usage_count - value of R7 on exit
 *
 * Other notes:   Calls SWI 0x40083 with R3 = 0x0.
 */

extern os_error *xfont_read_defn (font_f font,
      byte *font_id,
      int *xsize,
      int *ysize,
      int *xres,
      int *yres,
      int *age,
      int *usage_count);
extern void font_read_defn (font_f font,
      byte *font_id,
      int *xsize,
      int *ysize,
      int *xres,
      int *yres,
      int *age,
      int *usage_count);

/* ------------------------------------------------------------------------
 * Function:      font_read_identifier()
 *
 * Description:   Reads the full font identifier by calling Font_ReadDefn
 *                with R3 = 'FULL'
 *
 * Input:         font - value of R0 on entry
 *                buffer - if 0, then required buffer size is returned in R2
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40083 with R3 = 0x4C4C5546.
 */

extern os_error *xfont_read_identifier (font_f font,
      byte *buffer,
      int *used);
extern int font_read_identifier (font_f font,
      byte *buffer);

/* ------------------------------------------------------------------------
 * Function:      font_read_info()
 *
 * Description:   Gets the font bounding box
 *
 * Input:         font - value of R0 on entry
 *
 * Output:        x0 - value of R1 on exit
 *                y0 - value of R2 on exit
 *                x1 - value of R3 on exit
 *                y1 - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x40084.
 */

extern os_error *xfont_read_info (font_f font,
      int *x0,
      int *y0,
      int *x1,
      int *y1);
extern void font_read_info (font_f font,
      int *x0,
      int *y0,
      int *x1,
      int *y1);

/* ------------------------------------------------------------------------
 * Function:      font_string_width()
 *
 * Description:   Calculates how wide a string would be in the current font
 *                - prefer Font_ScanString
 *
 * Input:         s - value of R1 on entry
 *                xmax - value of R2 on entry
 *                ymax - value of R3 on entry
 *                split - value of R4 on entry
 *                length - value of R5 on entry
 *
 * Output:        split_point - value of R1 on exit
 *                x - value of R2 on exit
 *                y - value of R3 on exit
 *                length_out - value of R4 on exit
 *                index_out - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x40085.
 */

extern os_error *xfont_string_width (char const *s,
      int xmax,
      int ymax,
      int split,
      int length,
      char **split_point,
      int *x,
      int *y,
      int *length_out,
      int *index_out);
extern void font_string_width (char const *s,
      int xmax,
      int ymax,
      int split,
      int length,
      char **split_point,
      int *x,
      int *y,
      int *length_out,
      int *index_out);

/* ------------------------------------------------------------------------
 * Function:      font_paint()
 *
 * Description:   Writes a string to the screen
 *
 * Input:         font - value of R0 on entry
 *                string - value of R1 on entry
 *                flags - value of R2 on entry
 *                xpos - value of R3 on entry
 *                ypos - value of R4 on entry
 *                block - value of R5 on entry
 *                trfm - value of R6 on entry
 *                length - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x40086.
 */

extern os_error *xfont_paint (font_f font,
      char const *string,
      font_string_flags flags,
      int xpos,
      int ypos,
      font_paint_block const *block,
      os_trfm const *trfm,
      int length);
extern void font_paint (font_f font,
      char const *string,
      font_string_flags flags,
      int xpos,
      int ypos,
      font_paint_block const *block,
      os_trfm const *trfm,
      int length);

/* ------------------------------------------------------------------------
 * Function:      font_caret()
 *
 * Description:   Defines text cursor for Font Manager
 *
 * Input:         colour_number - value of R0 on entry
 *                height - value of R1 on entry
 *                unit_flags - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40087.
 */

extern os_error *xfont_caret (os_colour_number colour_number,
      int height,
      font_string_flags unit_flags,
      int x,
      int y);
extern void font_caret (os_colour_number colour_number,
      int height,
      font_string_flags unit_flags,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      font_convertto_os()
 *
 * Description:   Converts internal coordinates to OS coordinates
 *
 * Input:         x - value of R1 on entry
 *                y - value of R2 on entry
 *
 * Output:        x_out - value of R1 on exit
 *                y_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40088.
 */

extern os_error *xfont_convertto_os (int x,
      int y,
      int *x_out,
      int *y_out);
extern void font_convertto_os (int x,
      int y,
      int *x_out,
      int *y_out);

/* ------------------------------------------------------------------------
 * Function:      font_converttopoints()
 *
 * Description:   Converts OS coordinates to internal coordinates
 *
 * Input:         x - value of R1 on entry
 *                y - value of R2 on entry
 *
 * Output:        x_out - value of R1 on exit
 *                y_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40089.
 */

extern os_error *xfont_converttopoints (int x,
      int y,
      int *x_out,
      int *y_out);
extern void font_converttopoints (int x,
      int y,
      int *x_out,
      int *y_out);

/* ------------------------------------------------------------------------
 * Function:      font_set_font()
 *
 * Description:   Selects the font to be subsequently used
 *
 * Input:         font - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4008A.
 */

extern os_error *xfont_set_font (font_f font);
__swi (0x4008A) void font_set_font (font_f font);

/* ------------------------------------------------------------------------
 * Function:      font_current_font()
 *
 * Description:   Gets the current font handle and colours
 *
 * Output:        font - value of R0 on exit (X version only)
 *                bg_hint - value of R1 on exit
 *                fill - value of R2 on exit
 *                offset - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4008B.
 */

extern os_error *xfont_current_font (font_f *font,
      os_gcol *bg_hint,
      os_gcol *fill,
      int *offset);
extern font_f font_current_font (os_gcol *bg_hint,
      os_gcol *fill,
      int *offset);

/* ------------------------------------------------------------------------
 * Function:      font_future_font()
 *
 * Description:   Checks font characteristics after Font_StringWidth
 *
 * Output:        font - value of R0 on exit (X version only)
 *                bg_hint - value of R1 on exit
 *                fill - value of R2 on exit
 *                offset - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4008C.
 */

extern os_error *xfont_future_font (font_f *font,
      os_gcol *bg_hint,
      os_gcol *fill,
      int *offset);
extern font_f font_future_font (os_gcol *bg_hint,
      os_gcol *fill,
      int *offset);

/* ------------------------------------------------------------------------
 * Function:      font_find_caret()
 *
 * Description:   Finds where the caret is in a string
 *
 * Input:         s - value of R1 on entry
 *                x - value of R2 on entry
 *                y - value of R3 on entry
 *
 * Output:        split_point - value of R1 on exit
 *                x_out - value of R2 on exit
 *                y_out - value of R3 on exit
 *                length_out - value of R4 on exit
 *                index_out - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x4008D.
 */

extern os_error *xfont_find_caret (char const *s,
      int x,
      int y,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out,
      int *index_out);
extern void font_find_caret (char const *s,
      int x,
      int y,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out,
      int *index_out);

/* ------------------------------------------------------------------------
 * Function:      font_char_bbox()
 *
 * Description:   Gets the bounding box of a character
 *
 * Input:         font - value of R0 on entry
 *                c - value of R1 on entry
 *                unit_flags - value of R2 on entry
 *
 * Output:        x0 - value of R1 on exit
 *                y0 - value of R2 on exit
 *                x1 - value of R3 on exit
 *                y1 - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x4008E.
 */

extern os_error *xfont_char_bbox (font_f font,
      char c,
      font_string_flags unit_flags,
      int *x0,
      int *y0,
      int *x1,
      int *y1);
extern void font_char_bbox (font_f font,
      char c,
      font_string_flags unit_flags,
      int *x0,
      int *y0,
      int *x1,
      int *y1);

/* ------------------------------------------------------------------------
 * Function:      font_read_scale_factor()
 *
 * Description:   Reads the internal to OS conversion factor
 *
 * Output:        xfactor - value of R1 on exit
 *                yfactor - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x4008F.
 */

extern os_error *xfont_read_scale_factor (int *xfactor,
      int *yfactor);
extern void font_read_scale_factor (int *xfactor,
      int *yfactor);

/* ------------------------------------------------------------------------
 * Function:      font_set_scale_factor()
 *
 * Description:   Sets the internal to OS conversion factor
 *
 * Input:         xfactor - value of R1 on entry
 *                yfactor - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40090.
 */

extern os_error *xfont_set_scale_factor (int xfactor,
      int yfactor);
extern void font_set_scale_factor (int xfactor,
      int yfactor);

/* ------------------------------------------------------------------------
 * Function:      font_list_fonts()
 *
 * Description:   Scans for fonts, returning their identifiers one at a
 *                time; or or builds a menu of fonts
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
 * Other notes:   Calls SWI 0x40091.
 */

extern os_error *xfont_list_fonts (byte *buffer1,
      font_list_context context,
      int size1,
      byte *buffer2,
      int size2,
      char const *tick_font,
      font_list_context *context_out,
      int *used1,
      int *used2);
extern font_list_context font_list_fonts (byte *buffer1,
      font_list_context context,
      int size1,
      byte *buffer2,
      int size2,
      char const *tick_font,
      int *used1,
      int *used2);

/* ------------------------------------------------------------------------
 * Function:      font_set_font_colours()
 *
 * Description:   Changes the current colours and (optionally) the current
 *                font - prefer ColourTrans_SetFontColours
 *
 * Input:         font - value of R0 on entry
 *                bg_hint - value of R1 on entry
 *                fill - value of R2 on entry
 *                offset - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40092.
 */

extern os_error *xfont_set_font_colours (font_f font,
      os_gcol bg_hint,
      os_gcol fill,
      int offset);
__swi (0x40092) void font_set_font_colours (font_f font,
      os_gcol bg_hint,
      os_gcol fill,
      int offset);

/* ------------------------------------------------------------------------
 * Function:      font_set_palette()
 *
 * Description:   Defines the anti-alias palette
 *
 * Input:         bg_hint - value of R1 on entry
 *                fill - value of R2 on entry
 *                offset - value of R3 on entry
 *                bg_hint_out - value of R4 on entry
 *                fill_out - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40093 with R6 = 0x0.
 */

extern os_error *xfont_set_palette (os_gcol bg_hint,
      os_gcol fill,
      int offset,
      os_colour bg_hint_out,
      os_colour fill_out);
extern void font_set_palette (os_gcol bg_hint,
      os_gcol fill,
      int offset,
      os_colour bg_hint_out,
      os_colour fill_out);

/* ------------------------------------------------------------------------
 * Function:      font_set_true_palette()
 *
 * Description:   Defines the anti-alias palette with true colour values
 *
 * Input:         bg_hint - value of R1 on entry
 *                fill - value of R2 on entry
 *                offset - value of R3 on entry
 *                bg_hint_out - value of R4 on entry
 *                fill_out - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40093 with R6 = 0x65757254.
 */

extern os_error *xfont_set_true_palette (os_gcol bg_hint,
      os_gcol fill,
      int offset,
      os_colour bg_hint_out,
      os_colour fill_out);
extern void font_set_true_palette (os_gcol bg_hint,
      os_gcol fill,
      int offset,
      os_colour bg_hint_out,
      os_colour fill_out);

/* ------------------------------------------------------------------------
 * Function:      font_read_thresholds()
 *
 * Description:   Reads the list of threshold values for painting
 *
 * Input:         buffer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40094.
 */

extern os_error *xfont_read_thresholds (font_thresholds *buffer);
extern void font_read_thresholds (font_thresholds *buffer);

/* ------------------------------------------------------------------------
 * Function:      font_set_thresholds()
 *
 * Description:   Defines the list of threshold values for painting
 *
 * Input:         thresholds - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40095.
 */

extern os_error *xfont_set_thresholds (font_thresholds const *thresholds);
extern void font_set_thresholds (font_thresholds const *thresholds);

/* ------------------------------------------------------------------------
 * Function:      font_find_caretj()
 *
 * Description:   Finds where the caret is in a justified string
 *
 * Input:         s - value of R1 on entry
 *                x - value of R2 on entry
 *                y - value of R3 on entry
 *                xjust - value of R4 on entry
 *                yjust - value of R5 on entry
 *
 * Output:        split_point - value of R1 on exit
 *                x_out - value of R2 on exit
 *                y_out - value of R3 on exit
 *                length_out - value of R4 on exit
 *                index_out - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x40096.
 */

extern os_error *xfont_find_caretj (char const *s,
      int x,
      int y,
      int xjust,
      int yjust,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out,
      int *index_out);
extern void font_find_caretj (char const *s,
      int x,
      int y,
      int xjust,
      int yjust,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out,
      int *index_out);

/* ------------------------------------------------------------------------
 * Function:      font_string_bbox()
 *
 * Description:   Measures the size of a string - prefer Font_ScanString
 *
 * Input:         s - value of R1 on entry
 *
 * Output:        x0 - value of R1 on exit
 *                y0 - value of R2 on exit
 *                x1 - value of R3 on exit
 *                y1 - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x40097.
 */

extern os_error *xfont_string_bbox (char const *s,
      int *x0,
      int *y0,
      int *x1,
      int *y1);
extern void font_string_bbox (char const *s,
      int *x0,
      int *y0,
      int *x1,
      int *y1);

/* ------------------------------------------------------------------------
 * Function:      font_read_colour_table()
 *
 * Description:   Reads the anti-alias colour table
 *
 * Input:         colour_table - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40098.
 */

extern os_error *xfont_read_colour_table (font_colour_table const *colour_table);
extern void font_read_colour_table (font_colour_table const *colour_table);

/* ------------------------------------------------------------------------
 * Function:      font_make_bitmap()
 *
 * Description:   Make a font bitmap file
 *
 * Input:         font_name - value of R1 on entry
 *                xsize - value of R2 on entry
 *                ysize - value of R3 on entry
 *                xres - value of R4 on entry
 *                yres - value of R5 on entry
 *                flags - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x40099.
 */

extern os_error *xfont_make_bitmap (char const *font_name,
      int xsize,
      int ysize,
      int xres,
      int yres,
      font_bitmap_type flags);
extern void font_make_bitmap (char const *font_name,
      int xsize,
      int ysize,
      int xres,
      int yres,
      font_bitmap_type flags);

/* ------------------------------------------------------------------------
 * Function:      font_un_cache_file()
 *
 * Description:   Deletes font cache information, or recaches it
 *
 * Input:         file_name - value of R0 on entry
 *                recache - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4009A.
 */

extern os_error *xfont_un_cache_file (char const *file_name,
      osbool recache);
__swi (0x4009A) void font_un_cache_file (char const *file_name,
      osbool recache);

/* ------------------------------------------------------------------------
 * Function:      font_set_font_max()
 *
 * Description:   Sets the FontMax values
 *
 * Input:         font_max - value of R0 on entry
 *                font_max1 - value of R1 on entry
 *                font_max2 - value of R2 on entry
 *                font_max3 - value of R3 on entry
 *                font_max4 - value of R4 on entry
 *                font_max5 - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x4009B with R6 = 0x0, R7 = 0x0.
 */

extern os_error *xfont_set_font_max (int font_max,
      int font_max1,
      int font_max2,
      int font_max3,
      int font_max4,
      int font_max5);
extern void font_set_font_max (int font_max,
      int font_max1,
      int font_max2,
      int font_max3,
      int font_max4,
      int font_max5);

/* ------------------------------------------------------------------------
 * Function:      font_read_font_max()
 *
 * Description:   Reads the FontMax values
 *
 * Output:        font_max - value of R0 on exit
 *                font_max1 - value of R1 on exit
 *                font_max2 - value of R2 on exit
 *                font_max3 - value of R3 on exit
 *                font_max4 - value of R4 on exit
 *                font_max5 - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x4009C.
 */

extern os_error *xfont_read_font_max (int *font_max,
      int *font_max1,
      int *font_max2,
      int *font_max3,
      int *font_max4,
      int *font_max5);
extern void font_read_font_max (int *font_max,
      int *font_max1,
      int *font_max2,
      int *font_max3,
      int *font_max4,
      int *font_max5);

/* ------------------------------------------------------------------------
 * Function:      font_read_font_prefix()
 *
 * Description:   Finds the directory prefix for a given font handle
 *
 * Input:         font - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4009D.
 */

extern os_error *xfont_read_font_prefix (font_f font,
      char *buffer,
      int size,
      char **end);
extern char *font_read_font_prefix (font_f font,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      font_switch_output_to_buffer()
 *
 * Description:   Switches output to a buffer, creating a Draw file
 *                structure
 *
 * Input:         flags - value of R0 on entry
 *                buffer - value of R1 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4009E.
 */

extern os_error *xfont_switch_output_to_buffer (font_output_flags flags,
      byte *buffer,
      char **end);
extern char *font_switch_output_to_buffer (font_output_flags flags,
      byte *buffer);

/* ------------------------------------------------------------------------
 * Function:      font_switch_output_to_buffer_flags()
 *
 * Description:   Returns the current output switch flags
 *
 * Output:        flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4009E with R0 = 0x0, R1 = 0xFFFFFFFF.
 */

extern os_error *xfont_switch_output_to_buffer_flags (font_output_flags *flags);
extern font_output_flags font_switch_output_to_buffer_flags (void);

/* ------------------------------------------------------------------------
 * Function:      font_read_font_metrics()
 *
 * Description:   Reads the full metrics information held in a font's
 *                IntMetrics file
 *
 * Input:         font - value of R0 on entry
 *                bbox_info - value of R1 on entry
 *                xwidth_info - value of R2 on entry
 *                ywidth_info - value of R3 on entry
 *                misc_info - value of R4 on entry
 *                kern_info - ignored in RISC O S 5+
 *
 * Output:        flags - value of R0 on exit
 *                bbox_info_size - value of R1 on exit
 *                xwidth_info_size - value of R2 on exit
 *                ywidth_info_size - value of R3 on exit
 *                misc_info_size - value of R4 on exit
 *                kern_info_size - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x4009F with R6 = 0x0, R7 = 0x0.
 */

extern os_error *xfont_read_font_metrics (font_f font,
      font_bbox_info *bbox_info,
      font_width_info *xwidth_info,
      font_width_info *ywidth_info,
      font_metrics_misc_info *misc_info,
      font_kern_info *kern_info,
      font_metric_flags *flags,
      int *bbox_info_size,
      int *xwidth_info_size,
      int *ywidth_info_size,
      int *misc_info_size,
      int *kern_info_size);
extern void font_read_font_metrics (font_f font,
      font_bbox_info *bbox_info,
      font_width_info *xwidth_info,
      font_width_info *ywidth_info,
      font_metrics_misc_info *misc_info,
      font_kern_info *kern_info,
      font_metric_flags *flags,
      int *bbox_info_size,
      int *xwidth_info_size,
      int *ywidth_info_size,
      int *misc_info_size,
      int *kern_info_size);

/* ------------------------------------------------------------------------
 * Function:      font_read_font_metrics_ucs()
 *
 * Description:   Reads the full metrics information held in a font's
 *                IntMetrics file for UCS fonts - RISC O S 5+
 *
 * Input:         font - value of R0 on entry
 *                misc_info - value of R4 on entry
 *                kern_info - value of R6 on entry
 *
 * Output:        flags - value of R0 on exit
 *                misc_info_size - value of R4 on exit
 *                kern_info_size - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x4009F with R1 = 0x0, R2 = 0x0, R3 = 0x0, R5 = 0x0, R7 = 0x0.
 */

extern os_error *xfont_read_font_metrics_ucs (font_f font,
      font_metrics_misc_info *misc_info,
      font_kern_info_ucs *kern_info,
      font_metric_flags *flags,
      int *misc_info_size,
      int *kern_info_size);
extern void font_read_font_metrics_ucs (font_f font,
      font_metrics_misc_info *misc_info,
      font_kern_info_ucs *kern_info,
      font_metric_flags *flags,
      int *misc_info_size,
      int *kern_info_size);

/* ------------------------------------------------------------------------
 * Function:      font_decode_menu()
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
 * Other notes:   Calls SWI 0x400A0.
 */

extern os_error *xfont_decode_menu (font_decode_flags flags,
      byte const *menu,
      byte const *block,
      byte *buffer,
      int size,
      int **next_selection,
      int *used);
extern void font_decode_menu (font_decode_flags flags,
      byte const *menu,
      byte const *block,
      byte *buffer,
      int size,
      int **next_selection,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      font_scan_string()
 *
 * Description:   Returns information on a string
 *
 * Input:         font - value of R0 on entry
 *                s - value of R1 on entry
 *                flags - value of R2 on entry
 *                x - value of R3 on entry
 *                y - value of R4 on entry
 *                block - value of R5 on entry
 *                trfm - value of R6 on entry
 *                length - value of R7 on entry
 *
 * Output:        split_point - value of R1 on exit
 *                x_out - value of R3 on exit
 *                y_out - value of R4 on exit
 *                length_out - value of R7 on exit
 *
 * Other notes:   Calls SWI 0x400A1.
 */

extern os_error *xfont_scan_string (font_f font,
      char const *s,
      font_string_flags flags,
      int x,
      int y,
      font_scan_block *block,
      os_trfm const *trfm,
      int length,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out);
extern void font_scan_string (font_f font,
      char const *s,
      font_string_flags flags,
      int x,
      int y,
      font_scan_block *block,
      os_trfm const *trfm,
      int length,
      char **split_point,
      int *x_out,
      int *y_out,
      int *length_out);

/* ------------------------------------------------------------------------
 * Function:      font_current_rgb()
 *
 * Description:   Reads the settings of colours after calling Font_Paint
 *
 * Output:        font - value of R0 on exit (X version only)
 *                bg_hint - value of R1 on exit
 *                fill - value of R2 on exit
 *                offset - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A3.
 */

extern os_error *xfont_current_rgb (font_f *font,
      os_colour *bg_hint,
      os_colour *fill,
      int *offset);
extern font_f font_current_rgb (os_colour *bg_hint,
      os_colour *fill,
      int *offset);

/* ------------------------------------------------------------------------
 * Function:      font_future_rgb()
 *
 * Description:   Reads the settings of colours after calling various
 *                Font... SWIs
 *
 * Output:        font - value of R0 on exit (X version only)
 *                bg_hint - value of R1 on exit
 *                fill - value of R2 on exit
 *                offset - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A4.
 */

extern os_error *xfont_future_rgb (font_f *font,
      os_colour *bg_hint,
      os_colour *fill,
      int *offset);
extern font_f font_future_rgb (os_colour *bg_hint,
      os_colour *fill,
      int *offset);

/* ------------------------------------------------------------------------
 * Function:      font_read_encoding_filename()
 *
 * Description:   Returns the file name of the encoding file used for a
 *                given font handle
 *
 * Input:         font - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A5.
 */

extern os_error *xfont_read_encoding_filename (font_f font,
      char *buffer,
      int size,
      char **end);
extern char *font_read_encoding_filename (font_f font,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      font_find_field()
 *
 * Description:   Returns a pointer to a specified field within a font
 *                identifier
 *
 * Input:         identifier - value of R1 on entry
 *                qualifier - value of R2 on entry
 *
 * Output:        field - value of R1 on exit
 *                found - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A6.
 */

extern os_error *xfont_find_field (char const *identifier,
      char qualifier,
      char **field,
      osbool *found);
extern osbool font_find_field (char const *identifier,
      char qualifier,
      char **field);

/* ------------------------------------------------------------------------
 * Function:      font_apply_fields()
 *
 * Description:   Merges a new set of fields with those already in a given
 *                font identifier
 *
 * Input:         identifier - value of R0 on entry
 *                fields - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        spare - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A7.
 */

extern os_error *xfont_apply_fields (char const *identifier,
      char const *fields,
      char *buffer,
      int size,
      int *spare);
extern int font_apply_fields (char const *identifier,
      char const *fields,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      font_lookup_font()
 *
 * Description:   Returns information about a given font
 *
 * Input:         font - value of R0 on entry
 *
 * Output:        flags - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400A8 with R1 = 0x0, R2 = 0x0.
 */

extern os_error *xfont_lookup_font (font_f font,
      font_characteristic_flags *flags);
extern font_characteristic_flags font_lookup_font (font_f font);

/* ------------------------------------------------------------------------
 * Function:      font_enumerate_characters()
 *
 * Description:   Enumerate mapped characters - RISC O S 5+
 *
 * Input:         font - value of R0 on entry
 *                character - value of R1 on entry
 *
 * Output:        next_character - value of R1 on exit
 *                internal_character_code - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x400A9.
 */

extern os_error *xfont_enumerate_characters (font_f font,
      int character,
      int *next_character,
      int *internal_character_code);
extern void font_enumerate_characters (font_f font,
      int character,
      int *next_character,
      int *internal_character_code);

/* ------------------------------------------------------------------------
 * Function:      service_fonts_changed()
 *
 * Description:   New Font$Path detected
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x6E.
 */

extern os_error *xservice_fonts_changed (void);
extern void service_fonts_changed (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
