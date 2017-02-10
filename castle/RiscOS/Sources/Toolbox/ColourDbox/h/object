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
 * Purpose: object list handling for the ColourDbox module
 * Author:  TGR
 * History: 4-Mar-94: TGR: created
 *
 */

#ifndef __object_h
#define __object_h

#ifndef __colpicker_h
#include "colpicker.h"
#endif

typedef struct {
   int                           extension_size;
   ColourModelData               ext;
} ColourModelBlock;

typedef struct _colourdbox_internal
{
   struct _colourdbox_internal   *forward;
   struct _colourdbox_internal   *backward;
   ObjectID                       object_id;
   int                            show_type;
   int                            flags,x,y,
                                  colour;
   ColourModelBlock              *colour_model_block;
   ColourDescriptorBlock         *colour_block_extd;
   int                            window_handle;
   int                            dialogue_handle;
   char                          *title;
   int                            max_title;
   char                          *help_message;
   int                            max_help;
}  ColourDboxInternal;

#define ColourDboxInternal_GenerateShowEvent    0x00000001
#define ColourDboxInternal_GenerateHideEvent    0x00000002
#define ColourDboxInternal_MenuSemantics        0x00000010
#define ColourDboxInternal_SubMenuSemantics     0x00000020
#define ColourDboxInternal_ShowAtDefault        0x00000040
#define ColourDboxInternal_IncludeNoneButton    0x00000080
#define ColourDboxInternal_SelectNoneButton     0x00000100
#define ColourDboxInternal_IsShowing            0x00001000

#endif
