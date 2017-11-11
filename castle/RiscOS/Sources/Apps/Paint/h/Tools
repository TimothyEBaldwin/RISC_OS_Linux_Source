/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
#ifndef tools_H
#define tools_H

/* > h.Tools */
/*
 *  Export tool structure defs
 *
 */

extern toolwindow_block
    tools_pixelpaint,
    tools_circlepaint,
    tools_linepaint,
    tools_circleoutlinepaint,
    tools_trianglepaint,
    tools_ellipsepaint,
    tools_ellipseoutlinepaint,
    tools_sectorpaint,
    tools_arcpaint,
    tools_segmentpaint,
    tools_parallelogrampaint,
    tools_parallelogramoutlinepaint,
    tools_rectanglepaint,
    tools_rectangleoutlinepaint,
    tools_floodfillpaint,
    tools_scissorpaint,
    tools_grabberpaint,
    tools_camerapaint,
    tools_textpaint,
    tools_spraycanpaint,
    tools_brushpaint;

extern char
    tools_text_buffer [],
    tools_text_xsize [],
    tools_text_ysize[],
    tools_text_xspace[],
    tools_spray_density[],
    tools_spray_radius[],
    tools_brushsprite[],
    tools_newbrushsprite[],
    tools_brush_nxscalem[],
    tools_brush_nyscalem[],
    tools_brush_nxscaled[],
    tools_brush_nyscaled[],
    tools_brush_cxscalem[],
    tools_brush_cyscalem[],
    tools_brush_cxscaled[],
    tools_brush_cyscaled[];

extern wimp_i tools_icons [];
extern main_sprite *tools_brushsprite_ptr;
extern main_scaling_block tools_brushscale;
extern BOOL
    tools_flood_local,
    tools_brush_use_gcol,
    tools_exporting_sprite;

typedef enum
{ tools_bicon_NameText,
  tools_bicon_NewName,
  tools_bicon_XScText,
  tools_bicon_XNScBox,
  tools_bicon_XNScaleM,
  tools_bicon_XNScaleD,
  tools_bicon_YScText,
  tools_bicon_YNScBox,
  tools_bicon_YNScaleM,
  tools_bicon_YNScaleD,
  tools_bicon_UseNew,
  tools_bicon_UseGCOL,
  tools_bicon_Max                /* use as a limit */
} tools_brushicon_number;

extern void tools_mouse_to_pixel (main_window *, wimp_mousestr *,
    int *, int *);

extern void tools_mouse_to_pixel_overflow (main_window *, wimp_mousestr *,
                            int *, int *, int *, int *);

extern void tools_remove_brush (void);
extern void tools_replace_brush (void);

/* note the following must allow for any dynamic icons too */
#define tools_COUNT 22
#define tools_DESC_ICON 22
#define tools_MODE_ICON_BASE 24
#define tools_ICON_COUNT (tools_COUNT + tools_bicon_Max + 6)

typedef struct
{ wimp_wind t;
  wimp_icon i [tools_ICON_COUNT + 1];
} tools_template;

extern tools_template tools_tool_template;

#define tools_BRUSH_MAGIC ('X' << 24 | 'L' << 16 | 'E' << 8 | 'F')

extern void tools_get_default_text_size (void);
extern void Temporary_Name(sprite_area *, char *);

#endif
