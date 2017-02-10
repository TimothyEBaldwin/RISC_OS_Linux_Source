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
/* File:    iconbar.h
 * Purpose: Iconbar Icon Objects
 * Author:  Ian Johnson
 * History: 8-Dec-93: IDJ: created
 *
 */


#ifndef __iconbar_h
#define __iconbar_h


#ifndef __toolbox_h
#include "objects/toolbox.h"
#endif


/* ----------------------------------------- Iconbar templates ----------------------------------------- */

/* flags */

#define Iconbar_GenerateSelectAboutToBeShown  0x00000001
#define Iconbar_GenerateAdjustAboutToBeShown  0x00000002
#define Iconbar_ShowSelectTransient           0x00000004
#define Iconbar_ShowAdjustTransient           0x00000008
#define Iconbar_HasText                       0x00000010    /* resreved bit - not settable by client */
#define Iconbar_GenerateSelectClickedEvent    0x00000020
#define Iconbar_GenerateAdjustClickedEvent    0x00000040
#define Iconbar_ShowSelectCentred             0x00000080
#define Iconbar_ShowAdjustCentred             0x00000100
#define Iconbar_ShowSelectAtPointer           0x00000200
#define Iconbar_ShowAdjustAtPointer           0x00000400

#define Iconbar_ValidFlags                    0x000007ef


/* template definition */

typedef struct
{
        int   flags;
        int   position;
        int   priority;
        char *sprite_name;
        int   max_sprite;
        char *text;
        int   max_text_len;
        char *menu;
        int   select_event;
        int   adjust_event;
        char *select_show;
        char *adjust_show;
        char *help_message;
        int   max_help;
} IconbarTemplate;



/* ------------------------------ Iconbar SWIs and Toolbox_MiscOp reason codes ------------------------- */

#define Iconbar_SWIChunkBase    0x82900
#define Iconbar_ObjectClass     Iconbar_SWIChunkBase
#define Iconbar_ClassSWI        (Iconbar_SWIChunkBase + 0)
#define Iconbar_PostFilter      (Iconbar_SWIChunkBase + 1)
#define Iconbar_PreFilter       (Iconbar_SWIChunkBase + 2)


/* miscop reason codes */

#define Iconbar_GetIconHandle      0
#define Iconbar_SetMenu            1
#define Iconbar_GetMenu            2
#define Iconbar_SetEvent           3
#define Iconbar_GetEvent           4
#define Iconbar_SetShow            5
#define Iconbar_GetShow            6
#define Iconbar_SetHelpMessage     7
#define Iconbar_GetHelpMessage     8
#define Iconbar_SetText            9
#define Iconbar_GetText           10
#define Iconbar_SetSprite         11
#define Iconbar_GetSprite         12


/* flags for Iconbar_SetEvent */

#define Iconbar_SetEvent_Select   0x00000001
#define Iconbar_SetEvent_Adjust   0x00000002

/* flags for Iconbar_SetShow */

#define Iconbar_SetShow_Select    0x00000001
#define Iconbar_SetShow_Adjust    0x00000002


/* ----------------------------------------- Iconbar Toolbox Events ------------------------------------ */

/* event codes */

#define Iconbar_Clicked              (Iconbar_SWIChunkBase + 0)
#define Iconbar_SelectAboutToBeShown (Iconbar_SWIChunkBase + 1)
#define Iconbar_AdjustAboutToBeShown (Iconbar_SWIChunkBase + 2)



/* clicked event block */

#define Iconbar_Clicked_Adjust       0x00000001
#define Iconbar_Clicked_Select       0x00000004


typedef struct
{
        ToolboxEventHeader hdr;
} IconbarClickedEvent;



/* object about to be shown on SELECT/ADJUST click */

typedef struct
{
        ToolboxEventHeader hdr;
        ObjectID           id;
} IconbarAboutToBeShownEvent;




/* ----------------------------------------- Iconbar Error Numbers ------------------------------------- */

#define Iconbar_ErrorBase          (Program_Error | 0x80ab00)

#define Iconbar_AllocFailed        (Iconbar_ErrorBase+0x01)
#define Iconbar_ShortBuffer        (Iconbar_ErrorBase+0x02)
#define Iconbar_BadObjectVersion   (Iconbar_ErrorBase+0x03)
#define Iconbar_BadFlags           (Iconbar_ErrorBase+0x04)
#define Iconbar_NoSuchTask         (Iconbar_ErrorBase+0x11)
#define Iconbar_NoSuchMethod       (Iconbar_ErrorBase+0x12)
#define Iconbar_NoSuchMiscOpMethod (Iconbar_ErrorBase+0x13)
#define Iconbar_WrongShowType      (Iconbar_ErrorBase+0x14)
#define Iconbar_NoText             (Iconbar_ErrorBase+0x20)
#define Iconbar_TasksActive        (Iconbar_ErrorBase+0x21)

#endif

