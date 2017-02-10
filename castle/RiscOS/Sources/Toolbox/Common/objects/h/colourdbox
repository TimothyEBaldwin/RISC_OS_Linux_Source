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
/* File:    colourdbox.h
 * Purpose: ColourDbox Objects
 * Author:  Timothy G Roddis
 * History: 4-Mar-94: TGR: created
 *
 */

#ifndef __ColourDbox_h
#define __ColourDbox_h

#ifndef __os_h
#include "os.h"
#endif

#ifndef __window_h
#include "objects/window.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

/* ColourDbox Templates **************************************************************************/

/* flags */

#define ColourDbox_GenerateShowEvent        0x00000001
#define ColourDbox_GenerateHideEvent        0x00000002
#define ColourDbox_IncludeNoneButton        0x00000004
#define ColourDbox_SelectNoneButton         0x00000008

/* templates */

typedef struct
{
        unsigned int  flags;
        char         *title;
        int           max_title;
/*        char         *help_message;
        int           max_help;
*/        unsigned int  colour;
} ColourDboxTemplate;

/* ColourDbox SWI calls **************************************************************************/

#define ColourDbox_SWIChunkBase    0x829c0
#define ColourDbox_ObjectClass     ColourDbox_SWIChunkBase
#define ColourDbox_ClassSWI        (ColourDbox_SWIChunkBase + 0)
#define ColourDbox_PostFilter      (ColourDbox_SWIChunkBase + 1)
#define ColourDbox_PreFilter       (ColourDbox_SWIChunkBase + 2)

/* ColourDbox Methods ****************************************************************************/

#define ColourDbox_GetWimpHandle           0
#define ColourDbox_GetDialogueHandle       1
#define ColourDbox_SetColour               2
#define ColourDbox_GetColour               3
#define ColourDbox_SetColourModel          4
#define ColourDbox_GetColourModel          5
#define ColourDbox_SetNoneAvailable        6
#define ColourDbox_GetNoneAvailable        7
#define ColourDbox_SetHelpMessage          8
#define ColourDbox_GetHelpMessage          9


/* ColourDbox Toolbox Events *********************************************************************/

#define ColourDbox_AboutToBeShown     ColourDbox_SWIChunkBase
#define ColourDbox_DialogueCompleted  (ColourDbox_SWIChunkBase + 1)
#define ColourDbox_ColourSelected     (ColourDbox_SWIChunkBase + 2)

typedef struct {
   ToolboxEventHeader hdr;
   int                show_type;
   union {
      struct {
         int                x,y;
      } coords;
      WindowShowObjectBlock full;

   } info;

} ColourDbox_AboutToBeShown_Event;

typedef struct {
   ToolboxEventHeader hdr;
} ColourDbox_DialogueCompleted_Event;

typedef struct {
   ToolboxEventHeader hdr;
   unsigned int       colour_block[(212/4)];
} ColourDbox_ColourSelected_Event;

/* ColourDbox Errors *****************************************************************************/

#define ColourDbox_ErrorBase          (Program_Error | 0x0080AE00)

#define ColourDbox_AllocFailed        (ColourDbox_ErrorBase+0x01)
#define ColourDbox_ShortBuffer        (ColourDbox_ErrorBase+0x02)
#define ColourDbox_NoSuchTask         (ColourDbox_ErrorBase+0x11)
#define ColourDbox_NoSuchMethod       (ColourDbox_ErrorBase+0x12)
#define ColourDbox_NoSuchMiscOpMethod (ColourDbox_ErrorBase+0x13)
#define ColourDbox_TasksActive        (ColourDbox_ErrorBase+0x00)

#endif
