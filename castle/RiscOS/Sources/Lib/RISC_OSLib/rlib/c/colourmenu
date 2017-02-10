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
/************************************************************************/
/* © Acorn Computers Ltd, 1992.                                         */
/*                                                                      */
/* This file forms part of an unsupported source release of RISC_OSLib. */
/*                                                                      */
/* It may be freely used to create executable images for saleable       */
/* products but cannot be sold in source form or as an object library   */
/* without the prior written consent of Acorn Computers Ltd.            */
/*                                                                      */
/* If this file is re-distributed (even if modified) it should retain   */
/* this copyright notice.                                               */
/*                                                                      */
/************************************************************************/

/*
 * Title: colourmenu.c
 * Purpose: create a wimp colour setting menu
 * History: IDJ: 05-Feb-92: prepared for source release
 *
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>

#include "os.h"
#include "wimp.h"
#include "menu.h"
#include "colourmenu.h"

/* Macro - form weighted sum of colours. From is an index into the palette */
#define ColourSum(from) (palette.c[from].bytes.red + \
                  palette.c[from].bytes.green + palette.c[from].bytes.blue)

/* Creates a menu containing each of the 16 wimp colours, and optionally a
   'None' entry, and returns a handle to it. The text in the colour is plotted
   in black or white, depending on the background
*/

menu colourmenu_make(char *title, BOOL includeNone)
{
  menu m;
  wimp_palettestr palette;
  int i, white, black, threshold;

  /* Create the menu */
  if (includeNone)
    m = menu_new(title,
 "  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,None"
              );
  else
    m = menu_new(title,
 "  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15"
              );

  /* See whether colour 0 or colour 7 is white to allow for inverted palette */
  wimp_readpalette(&palette);
  if (ColourSum(0) > ColourSum(7))
  {
    white = 0;
    black = 7;
  }
  else
  {
    white = 7;
    black = 0;
  }

  /* Set threshold to half the white intensity */
  threshold = ColourSum(white) / 2;

  /* Check each colour against the threshold */
  for (i = 0; i <= 15; ++i)
  {
    menu_setcolours(m, i + 1, (ColourSum(i) > threshold) ? black : white, i);
  }

  return(m);
}

/* end */
