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
#ifndef _FONT_H
#define _FONT_H

typedef struct
{
    int x, y;
} coords;

typedef struct
{
    coords	space;
    coords	letter;
    int		split_char;
    wimp_Bbox	bounds;
} FontScanStringCoordsBlock;

extern _kernel_oserror *font_find_font(const char *font,
			unsigned int width, unsigned int height,
			int x_res, int y_res,
			unsigned int *font_handle);
extern _kernel_oserror *font_lose_font(unsigned int font_handle);

typedef int FontTransform[3][2];
typedef int FontCoord[4][2];

extern _kernel_oserror *font_paint(unsigned int font_handle,
			const char *text, unsigned int plot_type,
			int x, int y, FontCoord *coord,
			FontTransform *transform, unsigned int length);

extern _kernel_oserror *font_convert_to_points(int x, int y,
			int *new_x, int *new_y);

extern _kernel_oserror *font_scan_string(unsigned int font_handle,
			const char *text, unsigned int plot_type,
			int x, int y, FontScanStringCoordsBlock *coords,
			FontTransform *transform,
			unsigned int length, char **pos,
			int *new_x, int *new_y, unsigned int *count);

#endif
