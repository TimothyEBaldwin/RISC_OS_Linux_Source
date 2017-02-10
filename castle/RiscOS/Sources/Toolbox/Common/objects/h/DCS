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
/* File:    DCS.h
 * Purpose: client-visible information for the DCS Object class
 * Author:  Ian Johnson
 * History: 8-Dec-93: IDJ: created
 *
 */


#ifndef __DCS_h
#define __DCS_h

#include "objects/window.h"

/* ----------------------------------------- DCS templates ----------------------------------------- */

/* flags */

#define DCS_GenerateAboutToBeShown              0x00000001
#define DCS_GenerateDialogueCompleted           0x00000002

/* template definition */

typedef struct
{
        int   flags;
        char *  title;
        int     max_title;
        char *  message;
        int     max_message;
        char *  window;
} DCSTemplate;


/* ------------------------------ DCS SWIs and Toolbox_MiscOp reason codes ------------------------- */

#define DCS_SWIChunkBase    0x82a80
#define DCS_ObjectClass     DCS_SWIChunkBase
#define DCS_ClassSWI        (DCS_SWIChunkBase + 0)
#define DCS_PostFilter      (DCS_SWIChunkBase + 1)
#define DCS_PreFilter       (DCS_SWIChunkBase + 2)


/* miscop reason codes */

#define DCS_GetWindowID         0
#define DCS_SetMessage          1
#define DCS_GetMessage          2
#define DCS_SetTitle            3
#define DCS_GetTitle            4


/* ----------------------------------------- DCS Toolbox Events ------------------------------------ */

/* event codes */

#define DCS_AboutToBeShown      (DCS_SWIChunkBase+0)
#define DCS_Discard             (DCS_SWIChunkBase+1)
#define DCS_Save                (DCS_SWIChunkBase+2)
#define DCS_DialogueCompleted   (DCS_SWIChunkBase+3)
#define DCS_Cancel              (DCS_SWIChunkBase+4)

typedef struct
{
        ToolboxEventHeader           hdr;
        int                          r2;
        union
        {
            TopLeft                  top_left;
            WindowShowObjectBlock    full_spec;

        }                            r3;

} DCSAboutToBeShownEvent;

typedef struct
{
        ToolboxEventHeader           hdr;

} DCSDiscardEvent;

typedef struct
{
        ToolboxEventHeader           hdr;

} DCSSaveEvent;

typedef struct
{
        ToolboxEventHeader           hdr;

} DCSDialogueCompletedEvent;

typedef struct
{
        ToolboxEventHeader           hdr;

} DCSCancelEvent;

/* ----------------------------------------- DCS Error Numbers ------------------------------------- */

#define DCS_ErrorBase                (Program_Error | 0x0080b100)

#define DCS_NoMemory                 (DCS_ErrorBase+0x01)
#define DCS_TasksActive              (DCS_ErrorBase+0x02)

#endif

