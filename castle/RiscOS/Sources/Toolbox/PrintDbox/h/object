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
 * Purpose: object list handling for the PrintDbox module
 * Author:  TGR
 * History: 27-May-94: TGR: created
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

typedef struct _print_dbox_internal
{
   struct _print_dbox_internal   *forward;
   struct _print_dbox_internal   *backward;
   int                            flags;
   ShowInfo                      *show_info;
   ObjectID                       object_id, sub_object_id;
   int                            from;
   int                            to;
   ObjectID                       further_options;
} PrintDboxInternal;

#define OrdinaryDisplacement                        (8+52)   /* vertical gap + max gadget height*/
#define FullDisplacement_AllFromTo                  (28+52)
#define FullDisplacement_CopiesOrScale              (14+52)
#define FullDisplacement_CopiesAndScale             (14+28+52+52)
#define FullDisplacement_OrientationDraft           (20+44)
#define WindowYMin                                  (-392)

#define PrintDboxInternal_GenerateShowEvent         0x00000001
#define PrintDboxInternal_GenerateHideEvent         0x00000002
#define PrintDboxInternal_GenerateShowSetUpEvent    0x00000004
#define PrintDboxInternal_IsShowing                 0x00000010
#define PrintDboxInternal_MenuSemantics             0x00000100
#define PrintDboxInternal_SubMenuSemantics          0x00000200
#define PrintDboxInternal_FullInfoShow              0x00000400
#define PrintDboxInternal_SelectFromTo              0x00010000
#define PrintDboxInternal_SelectSideways            0x00020000
#define PrintDboxInternal_SelectDraft               0x00040000
#define PrintDboxInternal_CentreShow                0x00100000
#define PrintDboxInternal_AtPointerShow             0x00200000

#define PrintDboxInternal_ShowMask	(~(PrintDboxInternal_FullInfoShow | \
					PrintDboxInternal_CentreShow | \
					PrintDboxInternal_AtPointerShow))

#define PrintDboxInternal_ShowTypeMask            (~0x00001f00)

#endif
