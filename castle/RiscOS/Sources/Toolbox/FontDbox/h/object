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
/* Title:   object.h
 * Purpose: object list handling for the FontDbox module
 * Author:  TGR
 * History: 3-Mar-94: TGR: created
 *
 */


#ifndef __object_h
#define __object_h

#ifndef __window_h
#include "objects.h.window"
#endif

typedef struct _coords {
   int x,y;
} Coordinates;

typedef union _show_info {
   WindowShowObjectBlock  window_info;
   Coordinates            coords;
} ShowInfo;

typedef struct _font_dbox_internal
{
   struct _font_dbox_internal   *forward;
   struct _font_dbox_internal   *backward;
   int                           flags;
   int                           show_type;
   ShowInfo                     *show_info;
   ObjectID                      object_id, sub_object_id;
   char                         *selected_font;
} FontDboxInternal;

#define FontDboxInternal_GenerateShowEvent    0x00000001
#define FontDboxInternal_GenerateHideEvent    0x00000002
#define FontDboxInternal_IsShowing            0x00000010
#define FontDboxInternal_IncludeSystemFont    0x00000020
#define FontDboxInternal_FullInfoShow         0x00000400

#endif
