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
 * Purpose: object list handling for the ColourMenu module
 * Author:  TGR
 * History: 17-Jan-94: TGR: created
 *
 */


#ifndef __object_h
#define __object_h

typedef struct _colour_menu_internal
{
   struct _colour_menu_internal  *forward;
   struct _colour_menu_internal  *backward;
   unsigned int                   flags,
                                  width;
   int                            colour; /* -1 = no colour, 16 = transparent ("None") */
   ObjectID                       object_id;
   char                          *title;
   int                            title_len;
} ColourMenuInternal;

#define ColourMenuInternal_GenerateShowEvent    0x00000001
#define ColourMenuInternal_GenerateHideEvent    0x00000002
#define ColourMenuInternal_NoneEntry            0x00000004

#endif
