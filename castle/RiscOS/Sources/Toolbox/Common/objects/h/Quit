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
/* File:    Quit.h
 * Purpose: client-visible information for the Quit Object class
 * Author:  Ian Johnson
 * History: 8-Dec-93: IDJ: created
 *
 */


#ifndef __Quit_h
#define __Quit_h

#ifndef __toolbox_h
#include "objects/toolbox.h"
#endif


/* ----------------------------------------- Quit templates ----------------------------------------- */

/* flags */

#define Quit_GenerateAboutToBeShown              0x00000001
#define Quit_GenerateDialogueCompleted           0x00000002

/* template definition */

typedef struct
{
        int   flags;
        char *  title;
        int     max_title;
        char *  message;
        int     max_message;
        char *  window;
} QuitTemplate;

/* ------------------------------ Quit SWIs and Toolbox_MiscOp reason codes ------------------------- */

#define Quit_SWIChunkBase    0x82a90                                    /* &10 + DCSSWIChunk */
#define Quit_ObjectClass     Quit_SWIChunkBase
#define Quit_ClassSWI        (Quit_SWIChunkBase + 0)
#define Quit_PostFilter      (Quit_SWIChunkBase + 1 - 0x10)
#define Quit_PreFilter       (Quit_SWIChunkBase + 2 - 0x10)             /* same as DCS */


/* miscop reason codes */

#define Quit_GetWindowID         0
#define Quit_SetMessage          1
#define Quit_GetMessage          2
#define Quit_SetTitle            3
#define Quit_GetTitle            4


/* ----------------------------------------- Quit Toolbox Events ------------------------------------ */

/* event codes */

#define Quit_AboutToBeShown      (Quit_SWIChunkBase+0)       /* remember these are just on from DCS */
#define Quit_Quit                (Quit_SWIChunkBase+1)
#define Quit_DialogueCompleted   (Quit_SWIChunkBase+2)
#define Quit_Cancel              (Quit_SWIChunkBase+3)

typedef struct
{
        ToolboxEventHeader           hdr;
        int                          r2;
        union
        {
            TopLeft                  top_left;
            WindowShowObjectBlock    full_spec;

        }                            r3;

} QuitAboutToBeShownEvent;


/* ----------------------------------------- Quit Error Numbers ------------------------------------- */


#endif

