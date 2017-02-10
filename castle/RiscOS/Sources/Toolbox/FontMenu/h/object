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
 * Purpose: object list handling for the FontMenu module
 * Author:  TGR
 * History: 10-Jan-94: TGR: created
 *
 */


#ifndef __object_h
#define __object_h

typedef struct _font_menu_internal {
   struct _font_menu_internal  *forward;
   struct _font_menu_internal  *backward;
   int                          flags;
   ObjectID                     object_id;
   char                        *ticked_font;
} FontMenuInternal;

#define FontMenuInternal_GenerateShowEvent        0x00000001
#define FontMenuInternal_GenerateHideEvent        0x00000002
#define FontMenuInternal_IncludeSystemFont        0x00000010
#define FontMenuInternal_FontListFileOpen         0x00000100

#endif
