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
/* File:    menu.h
 * Purpose: Menu Objects
 * Author:  Timothy G Roddis
 * History: 8-Dec-93: TGR: created
 *
 */

#ifndef __menu_h
#define __menu_h

#ifndef __toolbox_h
#include "objects/toolbox.h"
#endif


/* Menu Templates *******************************************************************************/

/* flags */

#define Menu_GenerateShowEvent          0x00000001
#define Menu_GenerateHideEvent          0x00000002

#define Menu_Entry_Ticked               0x00000001
#define Menu_Entry_DottedLine           0x00000002
#define Menu_Entry_Faded                0x00000100
#define Menu_Entry_IsSprite             0x00000200
#define Menu_Entry_SubMenu              0x00000400
#define Menu_Entry_GenerateSubMenuEvent 0x00000800
#define Menu_Entry_ClickShowTransient   0x00001000
#define Menu_Entry_ClickShowCentred     0x00002000
#define Menu_Entry_ClickShowAtPointer	0x00004000

/* templates */

typedef struct
{
        int   flags;
        char *title;
        int   max_title;
        char *help_message;
        int   max_help;
        int   num_entries;
} MenuTemplateHeader101;

typedef struct
{
        int   flags;
        char *title;
        int   max_title;
        char *help_message;
        int   max_help;
        int   show_event;
        int   hide_event;
        int   num_entries;
} MenuTemplateHeader102, MenuTemplateHeader; /* move name 'MenuTemplateHeader' to current version's struct upon update */



typedef struct
{
        int           flags;
        ComponentID   component_id;
        char         *text;
        int           max_text;
        char         *click_show;
        char         *submenu_show;
        int           submenu_event;
        int           click_event;
        char         *help_message;
        int           max_entry_help;
} MenuTemplateEntry;

typedef struct {
        MenuTemplateHeader  hdr;
        /* array of entries follows in memory (as defined below) */
} MenuTemplate;

/* access to templates */

/* #define menu_template_entry(m, i)  (((MenuTemplateEntry*)(&m->hdr + 1)) + i)*/

/* Menu SWI calls *******************************************************************************/

#define Menu_SWIChunkBase    0x828c0
#define Menu_ObjectClass     Menu_SWIChunkBase
#define Menu_ClassSWI        (Menu_SWIChunkBase + 0)
#define Menu_PostFilter      (Menu_SWIChunkBase + 1)
#define Menu_PreFilter       (Menu_SWIChunkBase + 2)
#define Menu_UpdateTree      (Menu_SWIChunkBase + 3)

/* Menu Methods *********************************************************************************/

#define Menu_SetTick                   0
#define Menu_GetTick                   1
#define Menu_SetFade                   2
#define Menu_GetFade                   3
#define Menu_SetEntryText              4
#define Menu_GetEntryText              5
#define Menu_SetEntrySprite            6
#define Menu_GetEntrySprite            7
#define Menu_SetSubMenuShow            8
#define Menu_GetSubMenuShow            9
#define Menu_SetSubMenuEvent          10
#define Menu_GetSubMenuEvent          11
#define Menu_SetClickShow             12
#define Menu_GetClickShow             13
#define Menu_SetClickEvent            14
#define Menu_GetClickEvent            15
#define Menu_SetHelpMessage           16
#define Menu_GetHelpMessage           17
#define Menu_SetEntryHelpMessage      18
#define Menu_GetEntryHelpMessage      19
#define Menu_AddEntry                 20
#define Menu_RemoveEntry              21
#define Menu_GetHeight                22
#define Menu_GetWidth                 23
#define Menu_SetTitle                 24
#define Menu_GetTitle                 25

/* Menu Toolbox Events **************************************************************************/

#define Menu_AboutToBeShown     Menu_SWIChunkBase
#define Menu_HasBeenHidden      (Menu_SWIChunkBase + 1)
#define Menu_SubMenu            (Menu_SWIChunkBase + 2)
#define Menu_Selection          (Menu_SWIChunkBase + 3)

typedef struct {
   ToolboxEventHeader hdr;
   int                show_type;
   int                x,y;
} Menu_AboutToBeShown_Event;

typedef struct {
   ToolboxEventHeader hdr;
} Menu_HasBeenHidden_Event;

typedef struct {
   ToolboxEventHeader hdr;
   int                x,y;
} Menu_SubMenu_Event;

typedef struct {
   ToolboxEventHeader hdr;
} Menu_Selection_Event;

/* Menu Errors **********************************************************************************/

#define Menu_ErrorBase           (Program_Error | 0x0080AA00)

#define Menu_AllocFailed        (Menu_ErrorBase+0x01)
#define Menu_ShortBuffer        (Menu_ErrorBase+0x02)
#define Menu_NoSuchTask         (Menu_ErrorBase+0x11)
#define Menu_NoSuchMethod       (Menu_ErrorBase+0x12)
#define Menu_NoSuchMiscOpMethod (Menu_ErrorBase+0x13)
#define Menu_NoSuchComponent    (Menu_ErrorBase+0x14)
#define Menu_SpriteNotText      (Menu_ErrorBase+0x21)
#define Menu_TextNotSprite      (Menu_ErrorBase+0x22)
#define Menu_NoTopMenu          (Menu_ErrorBase+0x31)
#define Menu_UnknownSubMenu     (Menu_ErrorBase+0x32)
#define Menu_NoSpriteName       (Menu_ErrorBase+0x33)
#define Menu_TasksActive        (Menu_ErrorBase+0x00)

#endif
