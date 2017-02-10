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
/* File:    fileinfo.h
 * Purpose: FileInfo Objects
 * Author:  Timothy G Roddis
 * History: 7-Feb-94: TGR: created
 *
 */

#ifndef __FileInfo_h
#define __FileInfo_h

#ifndef __os_h
#include "os.h"
#endif

#ifndef __window_h
#include "objects/window.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif


/* FileInfo SWI calls ****************************************************************************/

#define FileInfo_SWIChunkBase    0x82ac0
#define FileInfo_ObjectClass     FileInfo_SWIChunkBase
#define FileInfo_ClassSWI        (FileInfo_SWIChunkBase + 0)
#define FileInfo_PostFilter      (FileInfo_SWIChunkBase + 1)
#define FileInfo_PreFilter       (FileInfo_SWIChunkBase + 2)

/* FileInfo Templates ****************************************************************************/

/* flags */

#define FileInfo_GenerateShowEvent    0x00000001
#define FileInfo_GenerateHideEvent    0x00000002

/* templates */

typedef struct
{
        int        flags;
        char      *title;
        int        max_title;
        int        modified;
        int        filetype;
        char      *filename;
        int        filesize;
        os_UTC     date;
        char      *window;

} FileInfoTemplate;

/* component IDs */

#define FileInfo_ComponentIDBase              (FileInfo_SWIChunkBase<<4)

#define FileInfo_DisplayField_Date            (FileInfo_ComponentIDBase)
#define FileInfo_DisplayField_FileSize        (FileInfo_ComponentIDBase + 1)
#define FileInfo_DisplayField_FileName        (FileInfo_ComponentIDBase + 2)
#define FileInfo_DisplayField_FileType        (FileInfo_ComponentIDBase + 3)
#define FileInfo_DisplayField_Modified        (FileInfo_ComponentIDBase + 4)
#define FileInfo_Button_FileType              (FileInfo_ComponentIDBase + 5)

/* FileInfo Methods ******************************************************************************/

#define FileInfo_GetWindowID        0
#define FileInfo_SetModified        1
#define FileInfo_GetModified        2
#define FileInfo_SetFileType        3
#define FileInfo_GetFileType        4
#define FileInfo_SetFileName        5
#define FileInfo_GetFileName        6
#define FileInfo_SetFileSize        7
#define FileInfo_GetFileSize        8
#define FileInfo_SetDate            9
#define FileInfo_GetDate           10
#define FileInfo_SetTitle          11
#define FileInfo_GetTitle          12

/* FileInfo Toolbox Events ***********************************************************************/

#define FileInfo_AboutToBeShown     FileInfo_SWIChunkBase
#define FileInfo_DialogueCompleted  (FileInfo_SWIChunkBase + 1)

typedef struct {
   ToolboxEventHeader hdr;
   int                show_type;
   union {

      struct {
         int                   x,y;
      } coords;

      WindowShowObjectBlock full;

   } info;

} FileInfo_AboutToBeShown_Event;

typedef struct {
   ToolboxEventHeader hdr;
} FileInfo_DialogueCompleted_Event;


/* FileInfo Errors *******************************************************************************/

#define FileInfo_ErrorBase           (Program_Error | 0x0080B200)

#define FileInfo_AllocFailed        (FileInfo_ErrorBase+0x01)
#define FileInfo_ShortBuffer        (FileInfo_ErrorBase+0x02)
#define FileInfo_NoSuchTask         (FileInfo_ErrorBase+0x11)
#define FileInfo_NoSuchMethod       (FileInfo_ErrorBase+0x12)
#define FileInfo_NoSuchMiscOpMethod (FileInfo_ErrorBase+0x13)
#define FileInfo_TasksActive        (FileInfo_ErrorBase+0x00)

#endif
