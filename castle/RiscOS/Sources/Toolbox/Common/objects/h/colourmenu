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
/* File:    colourmenu.h
 * Purpose: Colour Menu Objects
 * Author:  Timothy G Roddis
 * History: 10-Jan-94: TGR: created
 *
 */

#ifndef __colourmenu_h
#define __colourmenu_h

#ifndef __toolbox_h
#include "objects/toolbox.h"
#endif

/* Colour Menu Templates ************************************************************************/

typedef struct
{
        int   flags;
        char *title;
        int   max_title;
        int   colour;
} ColourMenuTemplate;

#define ColourMenu_GenerateShowEvent    0x00000001
#define ColourMenu_GenerateHideEvent    0x00000002
#define ColourMenu_NoneEntry            0x00000004

/* Colour Menu SWI calls ************************************************************************/

#define ColourMenu_SWIChunkBase         0x82980
#define ColourMenu_ObjectClass          ColourMenu_SWIChunkBase
#define ColourMenu_ClassSWI             (ColourMenu_SWIChunkBase + 0)
#define ColourMenu_PostFilter           (ColourMenu_SWIChunkBase + 1)
#define ColourMenu_PreFilter            (ColourMenu_SWIChunkBase + 2)

/* Colour Menu Methods **************************************************************************/

#define ColourMenu_SetColour            0
#define ColourMenu_GetColour            1
#define ColourMenu_SetNoneAvailable     2
#define ColourMenu_GetNoneAvailable     3
#define ColourMenu_SetTitle             4
#define ColourMenu_GetTitle             5

/* Colour Menu Toolbox Events *******************************************************************/

#define ColourMenu_AboutToBeShown       ColourMenu_SWIChunkBase
#define ColourMenu_HasBeenHidden        (ColourMenu_SWIChunkBase + 1)
#define ColourMenu_Selection            (ColourMenu_SWIChunkBase + 2)

typedef struct {
   ToolboxEventHeader hdr;
   int                show_type;
   int                x,y;
} ColourMenu_AboutToBeShown_Event;

typedef struct {
   ToolboxEventHeader hdr;
} ColourMenu_HasBeenHidden_Event;

typedef struct {
   ToolboxEventHeader hdr;
   int                colour;
} ColourMenu_Selection_Event;


/* Colour Menu Errors ****************************************************************************/

#define ColourMenu_ErrorBase             (Program_Error | 0x0080AD00)

#define ColourMenu_AllocFailed          (ColourMenu_ErrorBase+0x01)
#define ColourMenu_ShortBuffer          (ColourMenu_ErrorBase+0x02)
#define ColourMenu_NoSuchTask           (ColourMenu_ErrorBase+0x11)
#define ColourMenu_NoSuchMethod         (ColourMenu_ErrorBase+0x12)
#define ColourMenu_NoSuchMiscOpMethod   (ColourMenu_ErrorBase+0x13)
#define ColourMenu_TasksActive          (ColourMenu_ErrorBase+0x00)

#endif
