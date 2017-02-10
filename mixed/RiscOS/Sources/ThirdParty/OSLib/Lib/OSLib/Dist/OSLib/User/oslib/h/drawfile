#ifndef drawfile_H
#define drawfile_H

/* C header file for DrawFile
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
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

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#ifndef draw_H
#include "oslib/draw.h"
#endif

#ifndef font_H
#include "oslib/font.h"
#endif

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#ifndef jpeg_H
#include "oslib/jpeg.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  DrawFile_Render
#define DrawFile_Render                         0x45540
#undef  XDrawFile_Render
#define XDrawFile_Render                        0x65540
#undef  DrawFile_RenderMapped
#define DrawFile_RenderMapped                   0x45540
#undef  XDrawFile_RenderMapped
#define XDrawFile_RenderMapped                  0x65540
#undef  DrawFile_BBox
#define DrawFile_BBox                           0x45541
#undef  XDrawFile_BBox
#define XDrawFile_BBox                          0x65541
#undef  DrawFile_DeclareFonts
#define DrawFile_DeclareFonts                   0x45542
#undef  XDrawFile_DeclareFonts
#define XDrawFile_DeclareFonts                  0x65542
#undef  Service_DrawObjectRender
#define Service_DrawObjectRender                0x45540
#undef  Service_DrawObjectDeclareFonts
#define Service_DrawObjectDeclareFonts          0x45541

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct drawfile_font_def                drawfile_font_def;
typedef struct drawfile_font_def_base           drawfile_font_def_base;
typedef struct drawfile_text_style              drawfile_text_style;
typedef struct drawfile_path_style              drawfile_path_style;
typedef struct drawfile_font_table              drawfile_font_table;
typedef struct drawfile_font_table_base         drawfile_font_table_base;
typedef struct drawfile_text                    drawfile_text;
typedef struct drawfile_text_base               drawfile_text_base;
typedef struct drawfile_path                    drawfile_path;
typedef struct drawfile_path_with_pattern       drawfile_path_with_pattern;
typedef struct drawfile_sprite                  drawfile_sprite;
typedef struct drawfile_sprite_base             drawfile_sprite_base;
typedef struct drawfile_group                   drawfile_group;
typedef struct drawfile_group_base              drawfile_group_base;
typedef struct drawfile_tagged                  drawfile_tagged;
typedef struct drawfile_tagged_base             drawfile_tagged_base;
typedef struct drawfile_text_column             drawfile_text_column;
typedef struct drawfile_text_column_list        drawfile_text_column_list;
typedef struct drawfile_text_column_list_base   drawfile_text_column_list_base;
typedef struct drawfile_area_text               drawfile_area_text;
typedef struct drawfile_area_text_base          drawfile_area_text_base;
typedef struct drawfile_text_area               drawfile_text_area;
typedef struct drawfile_options                 drawfile_options;
typedef struct drawfile_trfm_text               drawfile_trfm_text;
typedef struct drawfile_trfm_text_base          drawfile_trfm_text_base;
typedef struct drawfile_trfm_sprite             drawfile_trfm_sprite;
typedef struct drawfile_trfm_sprite_base        drawfile_trfm_sprite_base;
typedef struct drawfile_jpeg                    drawfile_jpeg;
typedef struct drawfile_object                  drawfile_object;
typedef struct drawfile_diagram                 drawfile_diagram;
typedef struct drawfile_diagram_base            drawfile_diagram_base;
typedef struct drawfile_render_state            drawfile_render_state;
typedef struct drawfile_declare_fonts_state     drawfile_declare_fonts_state;

/********************
 * Type definitions *
 ********************/
typedef int drawfile_type;

typedef byte drawfile_path_style_flags;

typedef bits drawfile_text_flags;

typedef bits drawfile_render_flags;

typedef bits drawfile_declare_fonts_flags;

typedef bits drawfile_paper_options;

typedef bits drawfile_entry_mode;

#define drawfile_FONT_DEF_MEMBERS \
   byte font_index;

/* Base drawfile_font_def structure without variable part */
struct drawfile_font_def_base
   {  drawfile_FONT_DEF_MEMBERS
   };

/* legacy structure */
struct drawfile_font_def
   {  drawfile_FONT_DEF_MEMBERS
      char font_name [UNKNOWN];
   };

#define drawfile_FONT_DEF(N) \
   struct \
      {  drawfile_FONT_DEF_MEMBERS \
         char font_name [N]; \
      }

#define drawfile_SIZEOF_FONT_DEF(N) \
   (offsetof (drawfile_font_def, font_name) + \
         (N)*sizeof ((drawfile_font_def *) NULL)->font_name)

struct drawfile_text_style
   {  byte font_index;
      byte reserved [3];
   };

struct drawfile_path_style
   {  drawfile_path_style_flags flags;
      byte reserved;
      byte cap_width;
      byte cap_length;
   };

struct drawfile_font_table
   {  drawfile_font_def font_def [UNKNOWN];
   };

#define drawfile_TEXT_MEMBERS \
   os_box bbox; \
   os_colour fill; \
   os_colour bg_hint; \
   drawfile_text_style style; \
   int xsize; \
   int ysize; \
   os_coord base;

/* Base drawfile_text structure without variable part */
struct drawfile_text_base
   {  drawfile_TEXT_MEMBERS
   };

/* legacy structure */
struct drawfile_text
   {  drawfile_TEXT_MEMBERS
      char text [UNKNOWN];
   };

#define drawfile_TEXT(N) \
   struct \
      {  drawfile_TEXT_MEMBERS \
         char text [N]; \
      }

#define drawfile_SIZEOF_TEXT(N) \
   (offsetof (drawfile_text, text) + \
         (N)*sizeof ((drawfile_text *) NULL)->text)

struct drawfile_path
   {  os_box bbox;
      os_colour fill;
      os_colour outline;
      int width;
      drawfile_path_style style;
      draw_path path;
   };

struct drawfile_path_with_pattern
   {  os_box bbox;
      os_colour fill;
      os_colour outline;
      int width;
      drawfile_path_style style;
      draw_dash_pattern pattern;
      draw_path path;
   };

#define drawfile_SPRITE_MEMBERS \
   os_box bbox; \
   osspriteop_header header;

/* Base drawfile_sprite structure without variable part */
struct drawfile_sprite_base
   {  drawfile_SPRITE_MEMBERS
   };

/* legacy structure */
struct drawfile_sprite
   {  drawfile_SPRITE_MEMBERS
      byte data [UNKNOWN];
   };

#define drawfile_SPRITE(N) \
   struct \
      {  drawfile_SPRITE_MEMBERS \
         byte data [N]; \
      }

#define drawfile_SIZEOF_SPRITE(N) \
   (offsetof (drawfile_sprite, data) + \
         (N)*sizeof ((drawfile_sprite *) NULL)->data)

#define drawfile_GROUP_MEMBERS \
   os_box bbox; \
   char name [12];

/* Base drawfile_group structure without variable part */
struct drawfile_group_base
   {  drawfile_GROUP_MEMBERS
   };

/* legacy structure */
struct drawfile_group
   {  drawfile_GROUP_MEMBERS
      int objects [UNKNOWN];
   };

#define drawfile_GROUP(N) \
   struct \
      {  drawfile_GROUP_MEMBERS \
         int objects [N]; \
      }

#define drawfile_SIZEOF_GROUP(N) \
   (offsetof (drawfile_group, objects) + \
         (N)*sizeof ((drawfile_group *) NULL)->objects)

#define drawfile_TAGGED_MEMBERS \
   os_box bbox; \
   drawfile_type tag;

/* Base drawfile_tagged structure without variable part */
struct drawfile_tagged_base
   {  drawfile_TAGGED_MEMBERS
   };

/* legacy structure */
struct drawfile_tagged
   {  drawfile_TAGGED_MEMBERS
      int object [UNKNOWN];
   };

#define drawfile_TAGGED(N) \
   struct \
      {  drawfile_TAGGED_MEMBERS \
         int object [N]; \
      }

#define drawfile_SIZEOF_TAGGED(N) \
   (offsetof (drawfile_tagged, object) + \
         (N)*sizeof ((drawfile_tagged *) NULL)->object)

struct drawfile_text_column
   {  os_box box;
   };

struct drawfile_text_column_list
   {  struct
      {  drawfile_type type;
         int size;
         drawfile_text_column data;
      }
      columns [UNKNOWN];
   };

#define drawfile_TEXT_COLUMN_LIST(N) \
   struct \
      {  struct \
   {  drawfile_type type; \
      int size; \
      drawfile_text_column data; \
   } \
   columns [N]; \
      }

#define drawfile_SIZEOF_TEXT_COLUMN_LIST(N) \
   ((N)*sizeof ((drawfile_text_column_list *) NULL)->columns)

#define drawfile_AREA_TEXT_MEMBERS \
   drawfile_type type; \
   int reserved [2]; \
   os_colour fill; \
   os_colour bg_hint;

/* Base drawfile_area_text structure without variable part */
struct drawfile_area_text_base
   {  drawfile_AREA_TEXT_MEMBERS
   };

/* legacy structure */
struct drawfile_area_text
   {  drawfile_AREA_TEXT_MEMBERS
      char text [UNKNOWN];
   };

#define drawfile_AREA_TEXT(N) \
   struct \
      {  drawfile_AREA_TEXT_MEMBERS \
         char text [N]; \
      }

#define drawfile_SIZEOF_AREA_TEXT(N) \
   (offsetof (drawfile_area_text, text) + \
         (N)*sizeof ((drawfile_area_text *) NULL)->text)

struct drawfile_text_area
   {  os_box bbox;
      drawfile_text_column_list header;
      drawfile_area_text area_text;
   };

struct drawfile_options
   {  os_box bbox;
      int paper_size;
      drawfile_paper_options paper_options;
      double grid_spacing;
      int grid_division;
      osbool isometric;
      osbool auto_adjust;
      osbool show;
      osbool lock;
      osbool cm;
      int zoom_mul;
      int zoom_div;
      osbool zoom_lock;
      osbool toolbox;
      drawfile_entry_mode entry_mode;
      int undo_size;
   };

#define drawfile_TRFM_TEXT_MEMBERS \
   os_box bbox; \
   os_trfm trfm; \
   drawfile_text_flags flags; \
   os_colour fill; \
   os_colour bg_hint; \
   drawfile_text_style style; \
   int xsize; \
   int ysize; \
   os_coord base;

/* Base drawfile_trfm_text structure without variable part */
struct drawfile_trfm_text_base
   {  drawfile_TRFM_TEXT_MEMBERS
   };

/* legacy structure */
struct drawfile_trfm_text
   {  drawfile_TRFM_TEXT_MEMBERS
      char text [UNKNOWN];
   };

#define drawfile_TRFM_TEXT(N) \
   struct \
      {  drawfile_TRFM_TEXT_MEMBERS \
         char text [N]; \
      }

#define drawfile_SIZEOF_TRFM_TEXT(N) \
   (offsetof (drawfile_trfm_text, text) + \
         (N)*sizeof ((drawfile_trfm_text *) NULL)->text)

#define drawfile_TRFM_SPRITE_MEMBERS \
   os_box bbox; \
   os_trfm trfm; \
   osspriteop_header header;

/* Base drawfile_trfm_sprite structure without variable part */
struct drawfile_trfm_sprite_base
   {  drawfile_TRFM_SPRITE_MEMBERS
   };

/* legacy structure */
struct drawfile_trfm_sprite
   {  drawfile_TRFM_SPRITE_MEMBERS
      byte data [UNKNOWN];
   };

#define drawfile_TRFM_SPRITE(N) \
   struct \
      {  drawfile_TRFM_SPRITE_MEMBERS \
         byte data [N]; \
      }

#define drawfile_SIZEOF_TRFM_SPRITE(N) \
   (offsetof (drawfile_trfm_sprite, data) + \
         (N)*sizeof ((drawfile_trfm_sprite *) NULL)->data)

struct drawfile_jpeg
   {  os_box bbox;
      int width;
      int height;
      int xdpi;
      int ydpi;
      os_trfm trfm;
      int len;
      jpeg_image image;
   };

/* ------------------------------------------------------------------------
 * Type:          drawfile_object
 *
 * Description:   This type is used to declare pointers rather than objects
 */

struct drawfile_object
   {  drawfile_type type;
      int size;
      union
      {  drawfile_font_table font_table;
         drawfile_text text;
         drawfile_path path;
         drawfile_path_with_pattern path_with_pattern;
         drawfile_sprite sprite;
         drawfile_group group;
         drawfile_tagged tagged;
         drawfile_text_column text_column;
         drawfile_text_area text_area;
         drawfile_options options;
         drawfile_trfm_text trfm_text;
         drawfile_trfm_sprite trfm_sprite;
         drawfile_jpeg jpeg;
      }
      data;
   };

#define drawfile_DIAGRAM_MEMBERS \
   char tag [4]; \
   int major_version; \
   int minor_version; \
   char source [12]; \
   os_box bbox;

/* Base drawfile_diagram structure without variable part */
struct drawfile_diagram_base
   {  drawfile_DIAGRAM_MEMBERS
   };

/* legacy structure */
struct drawfile_diagram
   {  drawfile_DIAGRAM_MEMBERS
      drawfile_object objects [UNKNOWN];
   };

typedef bits drawfile_bbox_flags;

struct drawfile_render_state
   {  drawfile_object *object;
      drawfile_diagram *diagram;
      drawfile_object *font_table;
      drawfile_render_flags flags;
      os_trfm *trfm;
      os_box *clip;
      int flatness;
      os_error *error;
      osspriteop_colour_mapping *mapping;
   };

struct drawfile_declare_fonts_state
   {  drawfile_object *object;
      drawfile_diagram *diagram;
      drawfile_object *font_table;
      drawfile_declare_fonts_flags flags;
      os_error *error;
   };

/************************
 * Constant definitions *
 ************************/
#define error_DRAW_FILE_NOT_DRAW                0x20C00u
#define error_DRAW_FILE_VERSION                 0x20C01u
#define error_DRAW_FILE_FONT_TAB                0x20C02u
#define error_DRAW_FILE_BAD_FONT_NO             0x20C03u
#define error_DRAW_FILE_BAD_MODE                0x20C04u
#define error_DRAW_FILE_BAD_FILE                0x20C05u
#define error_DRAW_FILE_BAD_GROUP               0x20C06u
#define error_DRAW_FILE_BAD_TAG                 0x20C07u
#define error_DRAW_FILE_SYNTAX                  0x20C08u
#define error_DRAW_FILE_FONT_NO                 0x20C09u
#define error_DRAW_FILE_AREA_VER                0x20C0Au
#define error_DRAW_FILE_NO_AREA_VER             0x20C0Bu
#define drawfile_TYPE_FONT_TABLE                ((drawfile_type) 0x0u)
#define drawfile_TYPE_TEXT                      ((drawfile_type) 0x1u)
#define drawfile_TYPE_PATH                      ((drawfile_type) 0x2u)
#define drawfile_TYPE_SPRITE                    ((drawfile_type) 0x5u)
#define drawfile_TYPE_GROUP                     ((drawfile_type) 0x6u)
#define drawfile_TYPE_TAGGED                    ((drawfile_type) 0x7u)
#define drawfile_TYPE_TEXT_AREA                 ((drawfile_type) 0x9u)
#define drawfile_TYPE_TEXT_COLUMN               ((drawfile_type) 0xAu)
#define drawfile_TYPE_OPTIONS                   ((drawfile_type) 0xBu)
#define drawfile_TYPE_TRFM_TEXT                 ((drawfile_type) 0xCu)
#define drawfile_TYPE_TRFM_SPRITE               ((drawfile_type) 0xDu)
#define drawfile_TYPE_JPEG                      ((drawfile_type) 0x10u)
#define drawfile_PATH_MITRED                    ((drawfile_path_style_flags) 0x0u)
#define drawfile_PATH_ROUND                     ((drawfile_path_style_flags) 0x1u)
#define drawfile_PATH_BEVELLED                  ((drawfile_path_style_flags) 0x2u)
#define drawfile_PATH_BUTT                      ((drawfile_path_style_flags) 0x0u)
#define drawfile_PATH_SQUARE                    ((drawfile_path_style_flags) 0x2u)
#define drawfile_PATH_TRIANGLE                  ((drawfile_path_style_flags) 0x3u)
#define drawfile_PATH_JOIN_SHIFT                0
#define drawfile_PATH_JOIN                      ((drawfile_path_style_flags) 0x3u)
#define drawfile_PATH_END_SHIFT                 2
#define drawfile_PATH_END                       ((drawfile_path_style_flags) 0xCu)
#define drawfile_PATH_START_SHIFT               4
#define drawfile_PATH_START                     ((drawfile_path_style_flags) 0x30u)
#define drawfile_PATH_WINDING_EVEN_ODD          ((drawfile_path_style_flags) 0x40u)
#define drawfile_PATH_DASHED                    ((drawfile_path_style_flags) 0x80u)
#define drawfile_PATH_CAP_WIDTH_SHIFT           16
#define drawfile_PATH_CAP_WIDTH                 ((drawfile_path_style_flags) 0xFF0000u)
#define drawfile_PATH_CAP_LENGTH_SHIFT          24
#define drawfile_PATH_CAP_LENGTH                ((drawfile_path_style_flags) 0xFF000000u)
#define drawfile_TEXT_KERN                      ((drawfile_text_flags) 0x1u)
#define drawfile_TEXT_RIGHT_TO_LEFT             ((drawfile_text_flags) 0x2u)
#define drawfile_TEXT_UNDERLINE                 ((drawfile_text_flags) 0x4u)
#define drawfile_RENDER_BBOXES                  ((drawfile_render_flags) 0x1u)
#define drawfile_RENDER_SUPPRESS                ((drawfile_render_flags) 0x2u)
#define drawfile_RENDER_GIVEN_FLATNESS          ((drawfile_render_flags) 0x4u)
#define drawfile_RENDER_GIVEN_COLOUR_MAPPING    ((drawfile_render_flags) 0x8u)
#define drawfile_NO_DOWNLOAD                    ((drawfile_declare_fonts_flags) 0x1u)
#define drawfile_PAPER_SHOW                     ((drawfile_paper_options) 0x1u)
#define drawfile_PAPER_LANDSCAPE                ((drawfile_paper_options) 0x10u)
#define drawfile_PAPER_DEFAULT                  ((drawfile_paper_options) 0x100u)
#define drawfile_ENTRY_MODE_LINE                ((drawfile_entry_mode) 0x1u)
#define drawfile_ENTRY_MODE_CLOSED_LINE         ((drawfile_entry_mode) 0x2u)
#define drawfile_ENTRY_MODE_CURVE               ((drawfile_entry_mode) 0x4u)
#define drawfile_ENTRY_MODE_CLOSED_CURVE        ((drawfile_entry_mode) 0x8u)
#define drawfile_ENTRY_MODE_RECTANGLE           ((drawfile_entry_mode) 0x10u)
#define drawfile_ENTRY_MODE_ELLIPSE             ((drawfile_entry_mode) 0x20u)
#define drawfile_ENTRY_MODE_TEXT_LINE           ((drawfile_entry_mode) 0x40u)
#define drawfile_ENTRY_MODE_SELECT              ((drawfile_entry_mode) 0x80u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      drawfile_render()
 *
 * Description:   Calls SWI 0x45540
 *
 * Input:         flags - value of R0 on entry
 *                diagram - value of R1 on entry
 *                size - value of R2 on entry
 *                trfm - value of R3 on entry
 *                clip - value of R4 on entry
 *                flatness - value of R5 on entry
 */

extern os_error *xdrawfile_render (drawfile_render_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box const *clip,
      int flatness);
extern void drawfile_render (drawfile_render_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box const *clip,
      int flatness);

/* ------------------------------------------------------------------------
 * Function:      drawfile_render_mapped()
 *
 * Description:   RISC O S 4+
 *
 * Input:         flags - value of R0 on entry
 *                diagram - value of R1 on entry
 *                size - value of R2 on entry
 *                trfm - value of R3 on entry
 *                clip - value of R4 on entry
 *                flatness - value of R5 on entry
 *                mapping - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x45540 with R0 |= 0x8.
 */

extern os_error *xdrawfile_render_mapped (drawfile_render_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box const *clip,
      int flatness,
      osspriteop_colour_mapping const *mapping);
extern void drawfile_render_mapped (drawfile_render_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box const *clip,
      int flatness,
      osspriteop_colour_mapping const *mapping);

/* ------------------------------------------------------------------------
 * Function:      drawfile_bbox()
 *
 * Description:   Calls SWI 0x45541
 *
 * Input:         flags - value of R0 on entry
 *                diagram - value of R1 on entry
 *                size - value of R2 on entry
 *                trfm - value of R3 on entry
 *                bbox - value of R4 on entry
 */

extern os_error *xdrawfile_bbox (drawfile_bbox_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box *bbox);
extern void drawfile_bbox (drawfile_bbox_flags flags,
      drawfile_diagram const *diagram,
      int size,
      os_trfm const *trfm,
      os_box *bbox);

/* ------------------------------------------------------------------------
 * Function:      drawfile_declare_fonts()
 *
 * Description:   Calls SWI 0x45542
 *
 * Input:         flags - value of R0 on entry
 *                diagram - value of R1 on entry
 *                size - value of R2 on entry
 */

extern os_error *xdrawfile_declare_fonts (drawfile_declare_fonts_flags flags,
      drawfile_diagram const *diagram,
      int size);
__swi (0x45542) void drawfile_declare_fonts (drawfile_declare_fonts_flags flags,
      drawfile_diagram const *diagram,
      int size);

/* ------------------------------------------------------------------------
 * Function:      service_draw_object_render()
 *
 * Description:   Render unknown Draw object in Draw file
 *
 * Input:         type - value of R0 on entry
 *                state - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x45540.
 */

extern os_error *xservice_draw_object_render (drawfile_type type,
      drawfile_render_state *state,
      osbool *unclaimed);
extern osbool service_draw_object_render (drawfile_type type,
      drawfile_render_state *state);

/* ------------------------------------------------------------------------
 * Function:      service_draw_object_declare_fonts()
 *
 * Description:   Declare fonts for unknown Draw object in Draw file
 *
 * Input:         type - value of R0 on entry
 *                state - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x45541.
 */

extern os_error *xservice_draw_object_declare_fonts (drawfile_type type,
      drawfile_declare_fonts_state *state,
      osbool *unclaimed);
extern osbool service_draw_object_declare_fonts (drawfile_type type,
      drawfile_declare_fonts_state *state);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
