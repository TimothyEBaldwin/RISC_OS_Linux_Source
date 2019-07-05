#ifndef draw_H
#define draw_H

/* C header file for Draw
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Draw_ProcessPath
#define Draw_ProcessPath                        0x40700
#undef  XDraw_ProcessPath
#define XDraw_ProcessPath                       0x60700
#undef  Draw_Fill
#define Draw_Fill                               0x40702
#undef  XDraw_Fill
#define XDraw_Fill                              0x60702
#undef  Draw_Stroke
#define Draw_Stroke                             0x40704
#undef  XDraw_Stroke
#define XDraw_Stroke                            0x60704
#undef  Draw_StrokePath
#define Draw_StrokePath                         0x40706
#undef  XDraw_StrokePath
#define XDraw_StrokePath                        0x60706
#undef  Draw_FlattenPath
#define Draw_FlattenPath                        0x40708
#undef  XDraw_FlattenPath
#define XDraw_FlattenPath                       0x60708
#undef  Draw_TransformPath
#define Draw_TransformPath                      0x4070A
#undef  XDraw_TransformPath
#define XDraw_TransformPath                     0x6070A
#undef  Draw_FillClipped
#define Draw_FillClipped                        0x4070C
#undef  XDraw_FillClipped
#define XDraw_FillClipped                       0x6070C
#undef  Draw_StrokeClipped
#define Draw_StrokeClipped                      0x4070E
#undef  XDraw_StrokeClipped
#define XDraw_StrokeClipped                     0x6070E
#undef  DrawV
#define DrawV                                   0x20

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct draw_path_element                draw_path_element;
typedef struct draw_line_style                  draw_line_style;
typedef struct draw_dash_pattern                draw_dash_pattern;
typedef struct draw_dash_pattern_base           draw_dash_pattern_base;
typedef struct draw_path                        draw_path;
typedef struct draw_clip_descriptor             draw_clip_descriptor;

/********************
 * Type definitions *
 ********************/
typedef byte draw_tag;

typedef bits draw_fill_style;

typedef byte draw_join_style;

typedef byte draw_cap_style;

typedef draw_path *draw_output_path;

struct draw_path_element
   {  draw_tag tag;
      byte reserved [3];
      union
      {  int end_path;
         draw_path_element *continuation;
         os_coord move_to;
         os_coord special_move_to;
         os_coord bezier_to [3];
         os_coord gap_to;
         os_coord line_to;
         byte reserved [24];
      }
      data;
   };

struct draw_line_style
   {  draw_join_style join_style;
      draw_cap_style end_cap_style;
      draw_cap_style start_cap_style;
      byte reserved;
      int mitre_limit;
      short start_cap_width;
      short start_cap_length;
      short end_cap_width;
      short end_cap_length;
   };

#define draw_DASH_PATTERN_MEMBERS \
   int start; \
   int element_count;

/* Base draw_dash_pattern structure without variable part */
struct draw_dash_pattern_base
   {  draw_DASH_PATTERN_MEMBERS
   };

/* legacy structure */
struct draw_dash_pattern
   {  draw_DASH_PATTERN_MEMBERS
      int elements [UNKNOWN];
   };

#define draw_DASH_PATTERN(N) \
   struct \
      {  draw_DASH_PATTERN_MEMBERS \
         int elements [N]; \
      }

#define draw_SIZEOF_DASH_PATTERN(N) \
   (offsetof (draw_dash_pattern, elements) + \
         (N)*sizeof ((draw_dash_pattern *) NULL)->elements)

struct draw_path
   {  draw_path_element elements [UNKNOWN];
   };

struct draw_clip_descriptor
   {  draw_path *path;
      draw_fill_style fill_style;
      os_trfm trfm;
   };

/************************
 * Constant definitions *
 ************************/
#define draw_OS_UNIT                            256
      /*1 O S unit in draw units*/
#define draw_INCH                               46080
      /*1in in draw units*/
#define draw_POINT                              640
      /*1pt in draw units*/
#define draw_END_PATH                           ((draw_tag) 0x0u)
#define draw_CONTINUATION                       ((draw_tag) 0x1u)
#define draw_MOVE_TO                            ((draw_tag) 0x2u)
#define draw_SPECIAL_MOVE_TO                    ((draw_tag) 0x3u)
#define draw_CLOSE_GAP                          ((draw_tag) 0x4u)
#define draw_CLOSE_LINE                         ((draw_tag) 0x5u)
#define draw_BEZIER_TO                          ((draw_tag) 0x6u)
#define draw_GAP_TO                             ((draw_tag) 0x7u)
#define draw_LINE_TO                            ((draw_tag) 0x8u)
#define draw_FILL_NONZERO                       ((draw_fill_style) 0x0u)
#define draw_FILL_NEGATIVE                      ((draw_fill_style) 0x1u)
#define draw_FILL_EVEN_ODD                      ((draw_fill_style) 0x2u)
#define draw_FILL_POSITIVE                      ((draw_fill_style) 0x3u)
#define draw_FILL_WINDING_RULE_SHIFT            0
#define draw_FILL_WINDING_RULE                  ((draw_fill_style) 0x3u)
#define draw_FILL_FULL_EXTERIOR                 ((draw_fill_style) 0x4u)
#define draw_FILL_EXTERIOR_BOUNDARY             ((draw_fill_style) 0x8u)
#define draw_FILL_INTERIOR_BOUNDARY             ((draw_fill_style) 0x10u)
#define draw_FILL_FULL_INTERIOR                 ((draw_fill_style) 0x20u)
#define draw_FILL_OUTPUT_BBOX                   ((draw_fill_style) 0x2000000u)
      /*RISC O S 5*/
#define draw_FILL32_BIT_CLEAN                   ((draw_fill_style) 0x4000000u)
      /*RISC O S 5*/
#define draw_FILL_CLOSE_OPEN_SUBPATHS           ((draw_fill_style) 0x8000000u)
#define draw_FILL_FLATTEN                       ((draw_fill_style) 0x10000000u)
#define draw_FILL_THICKEN                       ((draw_fill_style) 0x20000000u)
#define draw_FILL_REFLATTEN                     ((draw_fill_style) 0x40000000u)
#define draw_FILL_FLOAT                         ((draw_fill_style) 0x80000000u)
#define draw_JOIN_MITRED                        ((draw_join_style) 0x0u)
#define draw_JOIN_ROUND                         ((draw_join_style) 0x1u)
#define draw_JOIN_BEVELLED                      ((draw_join_style) 0x2u)
#define draw_CAP_BUTT                           ((draw_cap_style) 0x0u)
#define draw_CAP_ROUND                          ((draw_cap_style) 0x1u)
#define draw_CAP_SQUARE                         ((draw_cap_style) 0x2u)
#define draw_CAP_TRIANGULAR                     ((draw_cap_style) 0x3u)
#define draw_SPECIAL_IN_SITU                    ((draw_output_path) 0x0u)
#define draw_SPECIAL_FILL                       ((draw_output_path) 0x1u)
#define draw_SPECIAL_FILL_BY_SUBPATHS           ((draw_output_path) 0x2u)
#define draw_SPECIAL_COUNT                      ((draw_output_path) 0x3u)
#define draw_SPECIAL_BBOX                       ((draw_output_path) 0x80000000u)
#define error_DRAW_NO_DRAW_IN_IRQ_MODE          0x980u
#define error_DRAW_BAD_DRAW_REASON_CODE         0x981u
#define error_DRAW_RESERVED_DRAW_BITS           0x982u
#define error_DRAW_INVALID_DRAW_ADDRESS         0x983u
#define error_DRAW_BAD_PATH_ELEMENT             0x984u
#define error_DRAW_BAD_PATH_SEQUENCE            0x985u
#define error_DRAW_MAY_EXPAND_PATH              0x986u
#define error_DRAW_PATH_FULL                    0x987u
#define error_DRAW_PATH_NOT_FLAT                0x988u
#define error_DRAW_BAD_CAPS_OR_JOINS            0x989u
#define error_DRAW_TRANSFORM_OVERFLOW           0x98Au
#define error_DRAW_DRAW_NEEDS_GRAPHICS_MODE     0x98Bu
#define error_DRAW_UNIMPLEMENTED_DRAW           0x9FFu

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      draw_process_path()
 *
 * Description:   Main Draw SWI
 *
 * Input:         path - value of R0 on entry
 *                fill_style - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *                thickness - value of R4 on entry
 *                line_style - value of R5 on entry
 *                dash_pattern - value of R6 on entry
 *                processed_path - value of R7 on entry
 *
 * Output:        end_or_used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40700.
 */

extern os_error *xdraw_process_path (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern,
      draw_output_path processed_path,
      byte **end_or_used);
extern byte *draw_process_path (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern,
      draw_output_path processed_path);

/* ------------------------------------------------------------------------
 * Function:      draw_fill()
 *
 * Description:   Processes a path and sends it to the VDU, filling the
 *                interior portion
 *
 * Input:         path - value of R0 on entry
 *                fill_style - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40702.
 */

extern os_error *xdraw_fill (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness);
__swi (0x40702) void draw_fill (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness);

/* ------------------------------------------------------------------------
 * Function:      draw_stroke()
 *
 * Description:   Processes a path and sends it to the VDU
 *
 * Input:         path - value of R0 on entry
 *                fill_style - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *                thickness - value of R4 on entry
 *                line_style - value of R5 on entry
 *                dash_pattern - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x40704.
 */

extern os_error *xdraw_stroke (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern);
extern void draw_stroke (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern);

/* ------------------------------------------------------------------------
 * Function:      draw_stroke_path()
 *
 * Description:   Processes a path and writes its output to another path
 *
 * Input:         path - value of R0 on entry
 *                stroked_path - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *                thickness - value of R4 on entry
 *                line_style - value of R5 on entry
 *                dash_pattern - value of R6 on entry
 *
 * Output:        end_or_used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40706.
 */

extern os_error *xdraw_stroke_path (draw_path const *path,
      draw_path *stroked_path,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern,
      byte **end_or_used);
extern byte *draw_stroke_path (draw_path const *path,
      draw_path *stroked_path,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern);

/* ------------------------------------------------------------------------
 * Function:      draw_flatten_path()
 *
 * Description:   Flattens a path and writes its output to another path
 *
 * Input:         path - value of R0 on entry
 *                flattened_path - value of R1 on entry
 *                flatness - value of R2 on entry
 *
 * Output:        end_or_used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40708.
 */

extern os_error *xdraw_flatten_path (draw_path const *path,
      draw_path *flattened_path,
      int flatness,
      byte **end_or_used);
__swi (0x40708) byte *draw_flatten_path (draw_path const *path,
      draw_path *flattened_path,
      int flatness);

/* ------------------------------------------------------------------------
 * Function:      draw_transform_path()
 *
 * Description:   Transforms a path and writes its output to another path
 *
 * Input:         path - value of R0 on entry
 *                transformed_path - value of R1 on entry
 *                trfm - value of R2 on entry
 *
 * Output:        end_or_used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4070A with R3 = 0x0.
 */

extern os_error *xdraw_transform_path (draw_path const *path,
      draw_path *transformed_path,
      os_trfm const *trfm,
      byte **end_or_used);
extern byte *draw_transform_path (draw_path const *path,
      draw_path *transformed_path,
      os_trfm const *trfm);

/* ------------------------------------------------------------------------
 * Function:      draw_fill_clipped()
 *
 * Description:   Processes a path and sends it to the VDU, filling the
 *                interior portion and clipping against the clip descriptor
 *                - RISC O S 5+
 *
 * Input:         path - value of R0 on entry
 *                fill_style - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *                clip_descriptor - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4070C.
 */

extern os_error *xdraw_fill_clipped (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      draw_clip_descriptor const *clip_descriptor);
extern void draw_fill_clipped (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      draw_clip_descriptor const *clip_descriptor);

/* ------------------------------------------------------------------------
 * Function:      draw_stroke_clipped()
 *
 * Description:   Processes a path and sends it to the VDU after clipping
 *                against the clip descriptor - RISC O S 5+
 *
 * Input:         path - value of R0 on entry
 *                fill_style - value of R1 on entry
 *                trfm - value of R2 on entry
 *                flatness - value of R3 on entry
 *                thickness - value of R4 on entry
 *                line_style - value of R5 on entry
 *                dash_pattern - value of R6 on entry
 *                clip_descriptor - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4070E.
 */

extern os_error *xdraw_stroke_clipped (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern,
      draw_clip_descriptor const *clip_descriptor);
extern void draw_stroke_clipped (draw_path const *path,
      draw_fill_style fill_style,
      os_trfm const *trfm,
      int flatness,
      int thickness,
      draw_line_style const *line_style,
      draw_dash_pattern const *dash_pattern,
      draw_clip_descriptor const *clip_descriptor);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
