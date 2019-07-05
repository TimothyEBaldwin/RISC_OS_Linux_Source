#ifndef wimp_H
#define wimp_H

/* C header file for Wimp
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 31 July 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#ifndef font_H
#include "oslib/font.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Wimp_Initialise
#define Wimp_Initialise                         0x400C0
#undef  XWimp_Initialise
#define XWimp_Initialise                        0x600C0
#undef  Wimp_Init
#define Wimp_Init                               0x400C0
#undef  XWimp_Init
#define XWimp_Init                              0x600C0
#undef  Wimp_CreateWindow
#define Wimp_CreateWindow                       0x400C1
#undef  XWimp_CreateWindow
#define XWimp_CreateWindow                      0x600C1
#undef  Wimp_CreateIcon
#define Wimp_CreateIcon                         0x400C2
#undef  XWimp_CreateIcon
#define XWimp_CreateIcon                        0x600C2
#undef  Wimp_CreateIconRelative
#define Wimp_CreateIconRelative                 0x400C2
#undef  XWimp_CreateIconRelative
#define XWimp_CreateIconRelative                0x600C2
#undef  Wimp_CreateIconPrioritised
#define Wimp_CreateIconPrioritised              0x400C2
#undef  XWimp_CreateIconPrioritised
#define XWimp_CreateIconPrioritised             0x600C2
#undef  Wimp_DeleteWindow
#define Wimp_DeleteWindow                       0x400C3
#undef  XWimp_DeleteWindow
#define XWimp_DeleteWindow                      0x600C3
#undef  Wimp_DeleteIcon
#define Wimp_DeleteIcon                         0x400C4
#undef  XWimp_DeleteIcon
#define XWimp_DeleteIcon                        0x600C4
#undef  Wimp_OpenWindow
#define Wimp_OpenWindow                         0x400C5
#undef  XWimp_OpenWindow
#define XWimp_OpenWindow                        0x600C5
#undef  Wimp_OpenWindowNested
#define Wimp_OpenWindowNested                   0x400C5
#undef  XWimp_OpenWindowNested
#define XWimp_OpenWindowNested                  0x600C5
#undef  Wimp_OpenWindowNestedWithFlags
#define Wimp_OpenWindowNestedWithFlags          0x400C5
#undef  XWimp_OpenWindowNestedWithFlags
#define XWimp_OpenWindowNestedWithFlags         0x600C5
#undef  Wimp_CloseWindow
#define Wimp_CloseWindow                        0x400C6
#undef  XWimp_CloseWindow
#define XWimp_CloseWindow                       0x600C6
#undef  Wimp_Poll
#define Wimp_Poll                               0x400C7
#undef  XWimp_Poll
#define XWimp_Poll                              0x600C7
#undef  Wimp_RedrawWindow
#define Wimp_RedrawWindow                       0x400C8
#undef  XWimp_RedrawWindow
#define XWimp_RedrawWindow                      0x600C8
#undef  Wimp_UpdateWindow
#define Wimp_UpdateWindow                       0x400C9
#undef  XWimp_UpdateWindow
#define XWimp_UpdateWindow                      0x600C9
#undef  Wimp_GetRectangle
#define Wimp_GetRectangle                       0x400CA
#undef  XWimp_GetRectangle
#define XWimp_GetRectangle                      0x600CA
#undef  Wimp_GetWindowState
#define Wimp_GetWindowState                     0x400CB
#undef  XWimp_GetWindowState
#define XWimp_GetWindowState                    0x600CB
#undef  Wimp_GetWindowStateAndNesting
#define Wimp_GetWindowStateAndNesting           0x400CB
#undef  XWimp_GetWindowStateAndNesting
#define XWimp_GetWindowStateAndNesting          0x600CB
#undef  Wimp_GetWindowInfo
#define Wimp_GetWindowInfo                      0x400CC
#undef  XWimp_GetWindowInfo
#define XWimp_GetWindowInfo                     0x600CC
#undef  Wimp_GetWindowInfoHeaderOnly
#define Wimp_GetWindowInfoHeaderOnly            0x400CC
#undef  XWimp_GetWindowInfoHeaderOnly
#define XWimp_GetWindowInfoHeaderOnly           0x600CC
#undef  Wimp_SetIconState
#define Wimp_SetIconState                       0x400CD
#undef  XWimp_SetIconState
#define XWimp_SetIconState                      0x600CD
#undef  Wimp_SetIconStateFromBlock
#define Wimp_SetIconStateFromBlock              0x400CD
#undef  XWimp_SetIconStateFromBlock
#define XWimp_SetIconStateFromBlock             0x600CD
#undef  Wimp_GetIconState
#define Wimp_GetIconState                       0x400CE
#undef  XWimp_GetIconState
#define XWimp_GetIconState                      0x600CE
#undef  Wimp_GetPointerInfo
#define Wimp_GetPointerInfo                     0x400CF
#undef  XWimp_GetPointerInfo
#define XWimp_GetPointerInfo                    0x600CF
#undef  Wimp_DragBox
#define Wimp_DragBox                            0x400D0
#undef  XWimp_DragBox
#define XWimp_DragBox                           0x600D0
#undef  Wimp_DragBoxWithFlags
#define Wimp_DragBoxWithFlags                   0x400D0
#undef  XWimp_DragBoxWithFlags
#define XWimp_DragBoxWithFlags                  0x600D0
#undef  Wimp_ForceRedraw
#define Wimp_ForceRedraw                        0x400D1
#undef  XWimp_ForceRedraw
#define XWimp_ForceRedraw                       0x600D1
#undef  Wimp_ForceRedrawFurniture
#define Wimp_ForceRedrawFurniture               0x400D1
#undef  XWimp_ForceRedrawFurniture
#define XWimp_ForceRedrawFurniture              0x600D1
#undef  Wimp_ForceRedrawTitle
#define Wimp_ForceRedrawTitle                   0x400D1
#undef  XWimp_ForceRedrawTitle
#define XWimp_ForceRedrawTitle                  0x600D1
#undef  Wimp_SetCaretPosition
#define Wimp_SetCaretPosition                   0x400D2
#undef  XWimp_SetCaretPosition
#define XWimp_SetCaretPosition                  0x600D2
#undef  WimpSetCaretPositionExtended_Caret
#define WimpSetCaretPositionExtended_Caret      0x0
#undef  WimpSetCaretPositionExtended_Selection
#define WimpSetCaretPositionExtended_Selection  0x2
#undef  Wimp_GetCaretPosition
#define Wimp_GetCaretPosition                   0x400D3
#undef  XWimp_GetCaretPosition
#define XWimp_GetCaretPosition                  0x600D3
#undef  WimpGetCaretPositionExtended_Caret
#define WimpGetCaretPositionExtended_Caret      0x0
#undef  WimpGetCaretPositionExtended_Selection
#define WimpGetCaretPositionExtended_Selection  0x2
#undef  Wimp_CreateMenu
#define Wimp_CreateMenu                         0x400D4
#undef  XWimp_CreateMenu
#define XWimp_CreateMenu                        0x600D4
#undef  Wimp_DecodeMenu
#define Wimp_DecodeMenu                         0x400D5
#undef  XWimp_DecodeMenu
#define XWimp_DecodeMenu                        0x600D5
#undef  Wimp_WhichIcon
#define Wimp_WhichIcon                          0x400D6
#undef  XWimp_WhichIcon
#define XWimp_WhichIcon                         0x600D6
#undef  Wimp_SetExtent
#define Wimp_SetExtent                          0x400D7
#undef  XWimp_SetExtent
#define XWimp_SetExtent                         0x600D7
#undef  Wimp_SetPointerShape
#define Wimp_SetPointerShape                    0x400D8
#undef  XWimp_SetPointerShape
#define XWimp_SetPointerShape                   0x600D8
#undef  Wimp_OpenTemplate
#define Wimp_OpenTemplate                       0x400D9
#undef  XWimp_OpenTemplate
#define XWimp_OpenTemplate                      0x600D9
#undef  Wimp_CloseTemplate
#define Wimp_CloseTemplate                      0x400DA
#undef  XWimp_CloseTemplate
#define XWimp_CloseTemplate                     0x600DA
#undef  Wimp_LoadTemplate
#define Wimp_LoadTemplate                       0x400DB
#undef  XWimp_LoadTemplate
#define XWimp_LoadTemplate                      0x600DB
#undef  Wimp_ProcessKey
#define Wimp_ProcessKey                         0x400DC
#undef  XWimp_ProcessKey
#define XWimp_ProcessKey                        0x600DC
#undef  Wimp_CloseDown
#define Wimp_CloseDown                          0x400DD
#undef  XWimp_CloseDown
#define XWimp_CloseDown                         0x600DD
#undef  Wimp_StartTask
#define Wimp_StartTask                          0x400DE
#undef  XWimp_StartTask
#define XWimp_StartTask                         0x600DE
#undef  Wimp_ReportError
#define Wimp_ReportError                        0x400DF
#undef  XWimp_ReportError
#define XWimp_ReportError                       0x600DF
#undef  Wimp_ReportErrorByCategory
#define Wimp_ReportErrorByCategory              0x400DF
#undef  XWimp_ReportErrorByCategory
#define XWimp_ReportErrorByCategory             0x600DF
#undef  Wimp_GetWindowOutline
#define Wimp_GetWindowOutline                   0x400E0
#undef  XWimp_GetWindowOutline
#define XWimp_GetWindowOutline                  0x600E0
#undef  Wimp_PollIdle
#define Wimp_PollIdle                           0x400E1
#undef  XWimp_PollIdle
#define XWimp_PollIdle                          0x600E1
#undef  Wimp_PlotIcon
#define Wimp_PlotIcon                           0x400E2
#undef  XWimp_PlotIcon
#define XWimp_PlotIcon                          0x600E2
#undef  Wimp_PlotIconWithWindow
#define Wimp_PlotIconWithWindow                 0x400E2
#undef  XWimp_PlotIconWithWindow
#define XWimp_PlotIconWithWindow                0x600E2
#undef  Wimp_PlotIconWithSpriteArea
#define Wimp_PlotIconWithSpriteArea             0x400E2
#undef  XWimp_PlotIconWithSpriteArea
#define XWimp_PlotIconWithSpriteArea            0x600E2
#undef  Wimp_SetMode
#define Wimp_SetMode                            0x400E3
#undef  XWimp_SetMode
#define XWimp_SetMode                           0x600E3
#undef  Wimp_SetPalette
#define Wimp_SetPalette                         0x400E4
#undef  XWimp_SetPalette
#define XWimp_SetPalette                        0x600E4
#undef  Wimp_ReadPalette
#define Wimp_ReadPalette                        0x400E5
#undef  XWimp_ReadPalette
#define XWimp_ReadPalette                       0x600E5
#undef  Wimp_ReadTruePalette
#define Wimp_ReadTruePalette                    0x400E5
#undef  XWimp_ReadTruePalette
#define XWimp_ReadTruePalette                   0x600E5
#undef  Wimp_SetColour
#define Wimp_SetColour                          0x400E6
#undef  XWimp_SetColour
#define XWimp_SetColour                         0x600E6
#undef  Wimp_SendMessage
#define Wimp_SendMessage                        0x400E7
#undef  XWimp_SendMessage
#define XWimp_SendMessage                       0x600E7
#undef  Wimp_SendMessageToWindow
#define Wimp_SendMessageToWindow                0x400E7
#undef  XWimp_SendMessageToWindow
#define XWimp_SendMessageToWindow               0x600E7
#undef  Wimp_CreateSubMenu
#define Wimp_CreateSubMenu                      0x400E8
#undef  XWimp_CreateSubMenu
#define XWimp_CreateSubMenu                     0x600E8
#undef  Wimp_BaseOfSprites
#define Wimp_BaseOfSprites                      0x400EA
#undef  XWimp_BaseOfSprites
#define XWimp_BaseOfSprites                     0x600EA
#undef  Wimp_BlockCopy
#define Wimp_BlockCopy                          0x400EB
#undef  XWimp_BlockCopy
#define XWimp_BlockCopy                         0x600EB
#undef  Wimp_SlotSize
#define Wimp_SlotSize                           0x400EC
#undef  XWimp_SlotSize
#define XWimp_SlotSize                          0x600EC
#undef  Wimp_ReadPixTrans
#define Wimp_ReadPixTrans                       0x400ED
#undef  XWimp_ReadPixTrans
#define XWimp_ReadPixTrans                      0x600ED
#undef  Wimp_ClaimFreeMemory
#define Wimp_ClaimFreeMemory                    0x400EE
#undef  XWimp_ClaimFreeMemory
#define XWimp_ClaimFreeMemory                   0x600EE
#undef  WimpClaimFreeMemory_Alloc
#define WimpClaimFreeMemory_Alloc               0x1
#undef  WimpClaimFreeMemory_Free
#define WimpClaimFreeMemory_Free                0x0
#undef  Wimp_CommandWindow
#define Wimp_CommandWindow                      0x400EF
#undef  XWimp_CommandWindow
#define XWimp_CommandWindow                     0x600EF
#undef  Wimp_CommandWindowActivate
#define Wimp_CommandWindowActivate              0x400EF
#undef  XWimp_CommandWindowActivate
#define XWimp_CommandWindowActivate             0x600EF
#undef  Wimp_CommandWindowCloseWithPrompt
#define Wimp_CommandWindowCloseWithPrompt       0x400EF
#undef  XWimp_CommandWindowCloseWithPrompt
#define XWimp_CommandWindowCloseWithPrompt      0x600EF
#undef  Wimp_CommandWindowClose
#define Wimp_CommandWindowClose                 0x400EF
#undef  XWimp_CommandWindowClose
#define XWimp_CommandWindowClose                0x600EF
#undef  Wimp_CommandWindowReadState
#define Wimp_CommandWindowReadState             0x400EF
#undef  XWimp_CommandWindowReadState
#define XWimp_CommandWindowReadState            0x600EF
#undef  Wimp_TextColour
#define Wimp_TextColour                         0x400F0
#undef  XWimp_TextColour
#define XWimp_TextColour                        0x600F0
#undef  Wimp_TransferBlock
#define Wimp_TransferBlock                      0x400F1
#undef  XWimp_TransferBlock
#define XWimp_TransferBlock                     0x600F1
#undef  Wimp_SetFontColours
#define Wimp_SetFontColours                     0x400F3
#undef  XWimp_SetFontColours
#define XWimp_SetFontColours                    0x600F3
#undef  Wimp_GetMenuState
#define Wimp_GetMenuState                       0x400F4
#undef  XWimp_GetMenuState
#define XWimp_GetMenuState                      0x600F4
#undef  Wimp_RegisterFilter
#define Wimp_RegisterFilter                     0x400F5
#undef  XWimp_RegisterFilter
#define XWimp_RegisterFilter                    0x600F5
#undef  Wimp_AddMessages
#define Wimp_AddMessages                        0x400F6
#undef  XWimp_AddMessages
#define XWimp_AddMessages                       0x600F6
#undef  Wimp_RemoveMessages
#define Wimp_RemoveMessages                     0x400F7
#undef  XWimp_RemoveMessages
#define XWimp_RemoveMessages                    0x600F7
#undef  Wimp_SetColourMapping
#define Wimp_SetColourMapping                   0x400F8
#undef  XWimp_SetColourMapping
#define XWimp_SetColourMapping                  0x600F8
#undef  Wimp_TextOp
#define Wimp_TextOp                             0x400F9
#undef  XWimp_TextOp
#define XWimp_TextOp                            0x600F9
#undef  WimpTextOp_SetColour
#define WimpTextOp_SetColour                    0x0
#undef  WimpTextOp_StringWidth
#define WimpTextOp_StringWidth                  0x1
#undef  WimpTextOp_StringWidthWithFlags
#define WimpTextOp_StringWidthWithFlags         0x1
#undef  WimpTextOp_Paint
#define WimpTextOp_Paint                        0x2
#undef  Wimp_SetWatchdogState
#define Wimp_SetWatchdogState                   0x400FA
#undef  XWimp_SetWatchdogState
#define XWimp_SetWatchdogState                  0x600FA
#undef  Wimp_ResizeIcon
#define Wimp_ResizeIcon                         0x400FC
#undef  XWimp_ResizeIcon
#define XWimp_ResizeIcon                        0x600FC
#undef  Wimp_AutoScroll
#define Wimp_AutoScroll                         0x400FD
#undef  XWimp_AutoScroll
#define XWimp_AutoScroll                        0x600FD
#undef  Service_Memory
#define Service_Memory                          0x11
#undef  Service_StartWimp
#define Service_StartWimp                       0x49
#undef  Service_StartedWimp
#define Service_StartedWimp                     0x4A
#undef  Service_MouseTrap
#define Service_MouseTrap                       0x52
#undef  Service_WimpCloseDown
#define Service_WimpCloseDown                   0x53
#undef  Service_WimpReportError
#define Service_WimpReportError                 0x57
#undef  Service_WimpSaveDesktop
#define Service_WimpSaveDesktop                 0x5C
#undef  Service_WimpSaveDesktopW
#define Service_WimpSaveDesktopW                0x5C
#undef  Service_WimpPalette
#define Service_WimpPalette                     0x5D
#undef  Service_DesktopWelcome
#define Service_DesktopWelcome                  0x7C
#undef  Service_ShutDown
#define Service_ShutDown                        0x7E
#undef  Service_ShutDownComplete
#define Service_ShutDownComplete                0x80
#undef  Service_WimpSpritesMoved
#define Service_WimpSpritesMoved                0x85
#undef  Service_WimpRegisterFilters
#define Service_WimpRegisterFilters             0x86
#undef  Service_ErrorStarting
#define Service_ErrorStarting                   0x400C0
#undef  Service_ErrorButtonPressed
#define Service_ErrorButtonPressed              0x400C1
#undef  Service_ErrorEnding
#define Service_ErrorEnding                     0x400C2

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct wimp_w_                          *wimp_w;
typedef struct wimp_t_                          *wimp_t;
typedef union  wimp_icon_data                   wimp_icon_data;
typedef struct wimp_icon                        wimp_icon;
typedef struct wimp_icon_create                 wimp_icon_create;
typedef struct wimp_window                      wimp_window;
typedef struct wimp_window_base                 wimp_window_base;
typedef struct wimp_window_state                wimp_window_state;
typedef struct wimp_icon_state                  wimp_icon_state;
typedef struct wimp_set_icon_state_block        wimp_set_icon_state_block;
typedef struct wimp_window_info                 wimp_window_info;
typedef struct wimp_window_info_base            wimp_window_info_base;
typedef struct wimp_outline                     wimp_outline;
typedef struct wimp_draw                        wimp_draw;
typedef struct wimp_open                        wimp_open;
typedef struct wimp_close                       wimp_close;
typedef struct wimp_leaving                     wimp_leaving;
typedef struct wimp_entering                    wimp_entering;
typedef struct wimp_pointer                     wimp_pointer;
typedef struct wimp_dragged                     wimp_dragged;
typedef struct wimp_key                         wimp_key;
typedef struct wimp_selection                   wimp_selection;
typedef struct wimp_scroll                      wimp_scroll;
typedef struct wimp_pollword                    wimp_pollword;
typedef struct wimp_drag                        wimp_drag;
typedef struct wimp_auto_scroll_info            wimp_auto_scroll_info;
typedef struct wimp_caret                       wimp_caret;
typedef struct wimp_text_selection              wimp_text_selection;
typedef struct wimp_menu_entry                  wimp_menu_entry;
typedef struct wimp_menu                        wimp_menu;
typedef struct wimp_menu_base                   wimp_menu_base;
typedef struct wimp_message_header              wimp_message_header;
typedef struct wimp_message_header_base         wimp_message_header_base;
typedef struct wimp_message_data_xfer           wimp_message_data_xfer;
typedef struct wimp_message_ram_xfer            wimp_message_ram_xfer;
typedef struct wimp_message_prequit             wimp_message_prequit;
typedef struct wimp_message_save_desktop        wimp_message_save_desktop;
typedef struct wimp_message_save_desktopw       wimp_message_save_desktopw;
typedef struct wimp_message_device              wimp_message_device;
typedef struct wimp_message_data_saved          wimp_message_data_saved;
typedef struct wimp_message_shutdown            wimp_message_shutdown;
typedef struct wimp_message_claim_entity        wimp_message_claim_entity;
typedef struct wimp_message_data_request        wimp_message_data_request;
typedef struct wimp_message_dragging            wimp_message_dragging;
typedef struct wimp_message_drag_claim          wimp_message_drag_claim;
typedef struct wimp_message_release_entity      wimp_message_release_entity;
typedef struct wimp_message_app_control         wimp_message_app_control;
typedef struct wimp_full_message_data_xfer      wimp_full_message_data_xfer;
typedef struct wimp_full_message_ram_xfer       wimp_full_message_ram_xfer;
typedef struct wimp_full_message_prequit        wimp_full_message_prequit;
typedef struct wimp_full_message_save_desktopw  wimp_full_message_save_desktopw;
typedef struct wimp_full_message_device         wimp_full_message_device;
typedef struct wimp_full_message_data_saved     wimp_full_message_data_saved;
typedef struct wimp_full_message_shutdown       wimp_full_message_shutdown;
typedef struct wimp_full_message_claim_entity   wimp_full_message_claim_entity;
typedef struct wimp_full_message_data_request   wimp_full_message_data_request;
typedef struct wimp_full_message_dragging       wimp_full_message_dragging;
typedef struct wimp_full_message_drag_claim     wimp_full_message_drag_claim;
typedef struct wimp_full_message_release_entity wimp_full_message_release_entity;
typedef struct wimp_full_message_app_control    wimp_full_message_app_control;
typedef struct wimp_message_menu_warning        wimp_message_menu_warning;
typedef struct wimp_message_task_initialise     wimp_message_task_initialise;
typedef struct wimp_message_slot_size           wimp_message_slot_size;
typedef struct wimp_message_set_slot            wimp_message_set_slot;
typedef struct wimp_message_task_name_rq        wimp_message_task_name_rq;
typedef struct wimp_message_task_name_is        wimp_message_task_name_is;
typedef struct wimp_message_menus_deleted       wimp_message_menus_deleted;
typedef struct wimp_message_iconise             wimp_message_iconise;
typedef struct wimp_message_window_closed       wimp_message_window_closed;
typedef struct wimp_message_window_info         wimp_message_window_info;
typedef struct wimp_message_font_changed        wimp_message_font_changed;
typedef struct wimp_message_iconise_at          wimp_message_iconise_at;
typedef struct wimp_message_toggle_backdrop     wimp_message_toggle_backdrop;
typedef struct wimp_message_screen_edge_notification wimp_message_screen_edge_notification;
typedef struct wimp_full_message_menu_warning   wimp_full_message_menu_warning;
typedef struct wimp_full_message_task_initialise wimp_full_message_task_initialise;
typedef struct wimp_full_message_slot_size      wimp_full_message_slot_size;
typedef struct wimp_full_message_set_slot       wimp_full_message_set_slot;
typedef struct wimp_full_message_task_name_rq   wimp_full_message_task_name_rq;
typedef struct wimp_full_message_task_name_is   wimp_full_message_task_name_is;
typedef struct wimp_full_message_menus_deleted  wimp_full_message_menus_deleted;
typedef struct wimp_full_message_iconise        wimp_full_message_iconise;
typedef struct wimp_full_message_window_closed  wimp_full_message_window_closed;
typedef struct wimp_full_message_window_info    wimp_full_message_window_info;
typedef struct wimp_full_message_font_changed   wimp_full_message_font_changed;
typedef struct wimp_full_message_iconise_at     wimp_full_message_iconise_at;
typedef struct wimp_full_message_toggle_backdrop wimp_full_message_toggle_backdrop;
typedef struct wimp_full_message_screen_edge_notification wimp_full_message_screen_edge_notification;
typedef struct wimp_message                     wimp_message;
typedef union  wimp_block                       wimp_block;
typedef struct wimp_message_list                wimp_message_list;
typedef struct wimp_message_list_base           wimp_message_list_base;

/********************
 * Type definitions *
 ********************/
typedef int wimp_i;

typedef byte wimp_colour;

typedef int wimp_version_no;

typedef int wimp_event_no;

typedef bits wimp_poll_flags;

typedef int wimp_furniture;

typedef bits wimp_window_nesting_flags;

typedef bits wimp_window_flags;

typedef byte wimp_extra_window_flags;

typedef bits wimp_icon_flags;

typedef bits wimp_menu_flags;

typedef bits wimp_mouse_state;
      /*Mouse button state - use the elements of only one of these sets: {Click}, {Click, Drag}, {Single, Drag, Double}*/

typedef int wimp_drag_type;

typedef int wimp_key_no;

typedef bits wimp_drag_box_flags;

typedef bits wimp_auto_scroll_flags;

typedef bits wimp_error_box_flags;

typedef int wimp_error_box_selection;

typedef int wimp_scroll_direction;

union wimp_icon_data
   {  char text [12];
      char sprite [12];
      char text_and_sprite [12];
      struct
      {  char *text;
         char *validation;
         int size;
      }
      indirected_text;
      struct
      {  osspriteop_id id;
         osspriteop_area *area;
         int size;
      }
      indirected_sprite;
      struct
      {  char *text;
         char *validation;
         int size;
      }
      indirected_text_and_sprite;
   };

struct wimp_icon
   {  os_box extent;
      wimp_icon_flags flags;
      wimp_icon_data data;
   };

struct wimp_icon_create
   {  wimp_w w;
      wimp_icon icon;
   };

#define wimp_WINDOW_MEMBERS \
   os_box visible; \
   int xscroll; \
   int yscroll; \
   wimp_w next; \
   wimp_window_flags flags; \
   wimp_colour title_fg; \
   wimp_colour title_bg; \
   wimp_colour work_fg; \
   wimp_colour work_bg; \
   wimp_colour scroll_outer; \
   wimp_colour scroll_inner; \
   wimp_colour highlight_bg; \
   wimp_extra_window_flags extra_flags; \
   os_box extent; \
   wimp_icon_flags title_flags; \
   wimp_icon_flags work_flags; \
   osspriteop_area *sprite_area; \
   short xmin; \
   short ymin; \
   wimp_icon_data title_data; \
   int icon_count;

/* Base wimp_window structure without variable part */
struct wimp_window_base
   {  wimp_WINDOW_MEMBERS
   };

/* legacy structure */
struct wimp_window
   {  wimp_WINDOW_MEMBERS
      wimp_icon icons [UNKNOWN];
   };

#define wimp_WINDOW(N) \
   struct \
      {  wimp_WINDOW_MEMBERS \
         wimp_icon icons [N]; \
      }

#define wimp_SIZEOF_WINDOW(N) \
   (offsetof (wimp_window, icons) + \
         (N)*sizeof ((wimp_window *) NULL)->icons)

struct wimp_window_state
   {  wimp_w w;
      os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
      wimp_window_flags flags;
   };

struct wimp_icon_state
   {  wimp_w w;
      wimp_i i;
      wimp_icon icon;
   };

struct wimp_set_icon_state_block
   {  wimp_w w;
      wimp_i i;
      wimp_icon_flags eor_bits;
      wimp_icon_flags clear_bits;
   };

#define wimp_WINDOW_INFO_MEMBERS \
   wimp_w w; \
   os_box visible; \
   int xscroll; \
   int yscroll; \
   wimp_w next; \
   wimp_window_flags flags; \
   wimp_colour title_fg; \
   wimp_colour title_bg; \
   wimp_colour work_fg; \
   wimp_colour work_bg; \
   wimp_colour scroll_outer; \
   wimp_colour scroll_inner; \
   wimp_colour highlight_bg; \
   wimp_extra_window_flags extra_flags; \
   os_box extent; \
   wimp_icon_flags title_flags; \
   wimp_icon_flags work_flags; \
   osspriteop_area *sprite_area; \
   short xmin; \
   short ymin; \
   wimp_icon_data title_data; \
   int icon_count;

/* Base wimp_window_info structure without variable part */
struct wimp_window_info_base
   {  wimp_WINDOW_INFO_MEMBERS
   };

/* legacy structure */
struct wimp_window_info
   {  wimp_WINDOW_INFO_MEMBERS
      wimp_icon icons [UNKNOWN];
   };

#define wimp_WINDOW_INFO(N) \
   struct \
      {  wimp_WINDOW_INFO_MEMBERS \
         wimp_icon icons [N]; \
      }

#define wimp_SIZEOF_WINDOW_INFO(N) \
   (offsetof (wimp_window_info, icons) + \
         (N)*sizeof ((wimp_window_info *) NULL)->icons)

struct wimp_outline
   {  wimp_w w;
      os_box outline;
   };

struct wimp_draw
   {  wimp_w w;
      os_box box;
      int xscroll;
      int yscroll;
      os_box clip;
   };

struct wimp_open
   {  wimp_w w;
      os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
   };

struct wimp_close
   {  wimp_w w;
   };

struct wimp_leaving
   {  wimp_w w;
   };

struct wimp_entering
   {  wimp_w w;
   };

struct wimp_pointer
   {  os_coord pos;
      wimp_mouse_state buttons;
      wimp_w w;
      wimp_i i;
   };

struct wimp_dragged
   {  os_box final;
   };

struct wimp_key
   {  wimp_w w;
      wimp_i i;
      os_coord pos;
      int height;
      int index;
      wimp_key_no c;
   };

struct wimp_selection
   {  int items [9];
   };

struct wimp_scroll
   {  wimp_w w;
      os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
      wimp_scroll_direction xmin;
      wimp_scroll_direction ymin;
      wimp_i i;
   };

struct wimp_pollword
   {  byte *addr;
      int word;
   };

struct wimp_drag
   {  wimp_w w;
      wimp_drag_type type;
      os_box initial;
      os_box bbox;
      byte *handle;
      void *draw;
      void *undraw;
      void *redraw;
   };

struct wimp_auto_scroll_info
   {  wimp_w w;
      os_box pause_zone_sizes;
      int pause_duration;
      void *state_change;
      byte *handle;
   };

struct wimp_caret
   {  wimp_w w;
      wimp_i i;
      os_coord pos;
      int height;
      int index;
   };

struct wimp_text_selection
   {  wimp_w w;
      wimp_i i;
      int start_index;
      int end_index;
   };

struct wimp_menu_entry
   {  wimp_menu_flags menu_flags;
      wimp_menu *sub_menu;
      wimp_icon_flags icon_flags;
      wimp_icon_data data;
   };

#define wimp_MENU_MEMBERS \
   union \
   {  char text [12]; \
      struct \
      {  char *text; \
         byte reserved [8]; \
      } \
      indirected_text; \
   } \
   title_data; \
   wimp_colour title_fg; \
   wimp_colour title_bg; \
   wimp_colour work_fg; \
   wimp_colour work_bg; \
   int width; \
   int height; \
   int gap;

/* Base wimp_menu structure without variable part */
struct wimp_menu_base
   {  wimp_MENU_MEMBERS
   };

/* legacy structure */
struct wimp_menu
   {  wimp_MENU_MEMBERS
      wimp_menu_entry entries [UNKNOWN];
   };

#define wimp_MENU(N) \
   struct \
      {  wimp_MENU_MEMBERS \
         wimp_menu_entry entries [N]; \
      }

#define wimp_SIZEOF_MENU(N) \
   (offsetof (wimp_menu, entries) + \
         (N)*sizeof ((wimp_menu *) NULL)->entries)

typedef bits wimp_pre_quit_flags;

typedef bits wimp_save_desktop_flags;

typedef bits wimp_shutdown_flags;

typedef bits wimp_claim_flags;

typedef bits wimp_data_request_flags;

typedef bits wimp_dragging_flags;

typedef bits wimp_drag_claim_flags;

typedef bits wimp_release_flags;

typedef bits wimp_app_control_flags;

typedef int wimp_app_control_operation;

#define wimp_MESSAGE_HEADER_MEMBERS \
   int size; \
   wimp_t sender; \
   int my_ref; \
   int your_ref; \
   bits action;

/* Base wimp_message_header structure without variable part */
struct wimp_message_header_base
   {  wimp_MESSAGE_HEADER_MEMBERS
   };

/* legacy structure */
struct wimp_message_header
   {  wimp_MESSAGE_HEADER_MEMBERS
      byte data [UNKNOWN];
   };

#define wimp_MESSAGE_HEADER(N) \
   struct \
      {  wimp_MESSAGE_HEADER_MEMBERS \
         byte data [N]; \
      }

#define wimp_SIZEOF_MESSAGE_HEADER(N) \
   (offsetof (wimp_message_header, data) + \
         (N)*sizeof ((wimp_message_header *) NULL)->data)

struct wimp_message_data_xfer
   {  wimp_w w;
      wimp_i i;
      os_coord pos;
      int est_size;
      bits file_type;
      char file_name [212];
   };

struct wimp_message_ram_xfer
   {  byte *addr;
      int size;
   };

struct wimp_message_prequit
   {  wimp_pre_quit_flags flags;
   };

struct wimp_message_save_desktop
   {  os_f file;
      byte reserved [3];
      wimp_save_desktop_flags flags;
   };

struct wimp_message_save_desktopw
   {  os_fw file;
      wimp_save_desktop_flags flags;
   };

struct wimp_message_device
   {  int major;
      int minor;
      char info [228];
   };

struct wimp_message_data_saved
   {  int ref;
   };

struct wimp_message_shutdown
   {  wimp_shutdown_flags flags;
   };

struct wimp_message_claim_entity
   {  wimp_claim_flags flags;
   };

struct wimp_message_data_request
   {  wimp_w w;
      wimp_i i;
      os_coord pos;
      wimp_data_request_flags flags;
      bits file_types [54];
   };

struct wimp_message_dragging
   {  wimp_w w;
      wimp_i i;
      os_coord pos;
      wimp_dragging_flags flags;
      os_box box;
      bits file_types [50];
   };

struct wimp_message_drag_claim
   {  wimp_drag_claim_flags flags;
      bits file_types [58];
   };

struct wimp_message_release_entity
   {  wimp_release_flags flags;
   };

struct wimp_message_app_control
   {  int protocol_version;
      wimp_app_control_flags flags;
      wimp_app_control_operation operation;
   };

struct wimp_full_message_data_xfer
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      wimp_i i;
      os_coord pos;
      int est_size;
      bits file_type;
      char file_name [212];
   };

struct wimp_full_message_ram_xfer
   {  wimp_MESSAGE_HEADER_MEMBERS
      byte *addr;
      int xfer_size;
   };

struct wimp_full_message_prequit
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_pre_quit_flags flags;
   };

struct wimp_full_message_save_desktopw
   {  wimp_MESSAGE_HEADER_MEMBERS
      os_fw file;
      wimp_save_desktop_flags flags;
   };

struct wimp_full_message_device
   {  wimp_MESSAGE_HEADER_MEMBERS
      int major;
      int minor;
      char info [228];
   };

struct wimp_full_message_data_saved
   {  wimp_MESSAGE_HEADER_MEMBERS
      int ref;
   };

struct wimp_full_message_shutdown
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_shutdown_flags flags;
   };

struct wimp_full_message_claim_entity
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_claim_flags flags;
   };

struct wimp_full_message_data_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      wimp_i i;
      os_coord pos;
      wimp_data_request_flags flags;
      bits file_types [54];
   };

struct wimp_full_message_dragging
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      wimp_i i;
      os_coord pos;
      wimp_dragging_flags flags;
      os_box box;
      bits file_types [50];
   };

struct wimp_full_message_drag_claim
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_drag_claim_flags flags;
      bits file_types [58];
   };

struct wimp_full_message_release_entity
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_release_flags flags;
   };

struct wimp_full_message_app_control
   {  wimp_MESSAGE_HEADER_MEMBERS
      int protocol_version;
      wimp_app_control_flags flags;
      wimp_app_control_operation operation;
   };

typedef bits wimp_iconise_flags;

typedef bits wimp_toggle_backdrop_flags;

typedef bits wimp_screen_edge_notification_flags;

struct wimp_message_menu_warning
   {  wimp_menu *sub_menu;
      os_coord pos;
      wimp_selection selection;
   };

struct wimp_message_task_initialise
   {  byte *cao;
      int size;
      char task_name [228];
   };

struct wimp_message_slot_size
   {  int new_curr;
      int new_next;
   };

struct wimp_message_set_slot
   {  int new_curr;
      wimp_t task;
   };

struct wimp_message_task_name_rq
   {  wimp_t task;
   };

struct wimp_message_task_name_is
   {  wimp_t task;
      int size;
      char task_name [228];
   };

struct wimp_message_menus_deleted
   {  wimp_menu *menu;
   };

struct wimp_message_iconise
   {  wimp_w w;
      wimp_t task;
      char title [20];
   };

struct wimp_message_window_closed
   {  wimp_w w;
   };

struct wimp_message_window_info
   {  wimp_w w;
      int reserved;
      char sprite_name [8];
      char title [20];
   };

struct wimp_message_font_changed
   {  font_f font;
   };

/* ------------------------------------------------------------------------
 * Type:          wimp_message_iconise_at
 *
 * Description:   RISC O S 4+
 */

struct wimp_message_iconise_at
   {  wimp_w w;
      wimp_t task;
      os_coord at;
      wimp_iconise_flags flags;
   };

struct wimp_message_toggle_backdrop
   {  wimp_toggle_backdrop_flags flags;
   };

struct wimp_message_screen_edge_notification
   {  wimp_screen_edge_notification_flags flags;
   };

struct wimp_full_message_menu_warning
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_menu *sub_menu;
      os_coord pos;
      wimp_selection selection;
   };

typedef wimp_message_header_base wimp_full_message_mode_change;

struct wimp_full_message_task_initialise
   {  wimp_MESSAGE_HEADER_MEMBERS
      byte *cao;
      int memory_size;
      char task_name [228];
   };

typedef wimp_message_header_base wimp_full_message_task_close_down;

struct wimp_full_message_slot_size
   {  wimp_MESSAGE_HEADER_MEMBERS
      int new_curr;
      int new_next;
   };

struct wimp_full_message_set_slot
   {  wimp_MESSAGE_HEADER_MEMBERS
      int new_curr;
      wimp_t task;
   };

struct wimp_full_message_task_name_rq
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_t task;
   };

struct wimp_full_message_task_name_is
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_t task;
      int slot_size;
      char task_name [228];
   };

typedef wimp_message_header_base wimp_full_message_task_started;

struct wimp_full_message_menus_deleted
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_menu *menu;
   };

struct wimp_full_message_iconise
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      wimp_t task;
      char title [20];
   };

struct wimp_full_message_window_closed
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
   };

struct wimp_full_message_window_info
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      int reserved;
      char sprite_name [8];
      char title [20];
   };

typedef wimp_message_header_base wimp_full_message_swap;

typedef wimp_message_header_base wimp_full_message_tools_changed;

struct wimp_full_message_font_changed
   {  wimp_MESSAGE_HEADER_MEMBERS
      font_f font;
   };

/* ------------------------------------------------------------------------
 * Type:          wimp_full_message_iconise_at
 *
 * Description:   RISC O S 4+
 */

struct wimp_full_message_iconise_at
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_w w;
      wimp_t task;
      os_coord at;
      wimp_iconise_flags flags;
   };

struct wimp_full_message_toggle_backdrop
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_toggle_backdrop_flags flags;
   };

struct wimp_full_message_screen_edge_notification
   {  wimp_MESSAGE_HEADER_MEMBERS
      wimp_screen_edge_notification_flags flags;
   };

struct wimp_message
   {  wimp_MESSAGE_HEADER_MEMBERS
      union
      {  wimp_message_data_xfer data_xfer;
         wimp_message_ram_xfer ram_xfer;
         wimp_message_prequit prequit;
         wimp_message_save_desktop save_desktop;
         wimp_message_save_desktopw save_desktopw;
         wimp_message_device device;
         wimp_message_data_saved data_saved;
         wimp_message_shutdown shutdown;
         wimp_message_claim_entity claim_entity;
         wimp_message_data_request data_request;
         wimp_message_dragging dragging;
         wimp_message_drag_claim drag_claim;
         wimp_message_release_entity release_entity;
         wimp_message_app_control app_control;
         byte reserved [236];
      }
      data;
   };

union wimp_block
   {  wimp_draw redraw;
      wimp_open open;
      wimp_close close;
      wimp_leaving leaving;
      wimp_entering entering;
      wimp_pointer pointer;
      wimp_dragged dragged;
      wimp_key key;
      wimp_selection selection;
      wimp_scroll scroll;
      wimp_caret caret;
      wimp_pollword pollword;
      wimp_message message;
      byte reserved [256];
   };

struct wimp_message_list
   {  int messages [UNKNOWN];
   };

#define wimp_MESSAGE_LIST(N) \
   struct \
      {  int messages [N]; \
      }

#define wimp_SIZEOF_MESSAGE_LIST(N) \
   ((N)*sizeof ((wimp_message_list *) NULL)->messages)

typedef bits wimp_priority;

typedef bits wimp_plot_icon_flags;

typedef int wimp_command_window_state;

typedef bits wimp_menu_state_flags;

typedef int wimp_filter_action;

typedef bits wimptextop_string_width_flags;

typedef bits wimptextop_paint_flags;

/************************
 * Constant definitions *
 ************************/
#define wimp_VERSION_RO2                        ((wimp_version_no) 0xC8u)
#define wimp_VERSION_RO30                       ((wimp_version_no) 0x12Cu)
#define wimp_VERSION_RO3                        ((wimp_version_no) 0x136u)
#define wimp_VERSION_RO35                       ((wimp_version_no) 0x15Eu)
#define wimp_VERSION_RO36                       ((wimp_version_no) 0x168u)
#define wimp_VERSION_RO37                       ((wimp_version_no) 0x172u)
#define wimp_VERSION_RO38                       ((wimp_version_no) 0x17Cu)
      /*Introduces nested windows (standard in RISC O S 4+)*/
#define wimp_VERSION_RO40                       ((wimp_version_no) 0x190u)
#define wimp_ICON_NAME_LIMIT                    12
#define wimp_TEMPLATE_NAME_LIMIT                12
#define wimp_MENU_NAME_LIMIT                    12
#define wimp_MENU_DEPTH_LIMIT                   8
#define wimp_CHAR_XSIZE                         16
      /*Width of system font (in O S U)*/
#define wimp_CHAR_YSIZE                         32
      /*Height of system font (in O S U)*/
#define wimp_NULL_REASON_CODE                   ((wimp_event_no) 0x0u)
#define wimp_REDRAW_WINDOW_REQUEST              ((wimp_event_no) 0x1u)
#define wimp_OPEN_WINDOW_REQUEST                ((wimp_event_no) 0x2u)
#define wimp_CLOSE_WINDOW_REQUEST               ((wimp_event_no) 0x3u)
#define wimp_POINTER_LEAVING_WINDOW             ((wimp_event_no) 0x4u)
#define wimp_POINTER_ENTERING_WINDOW            ((wimp_event_no) 0x5u)
#define wimp_MOUSE_CLICK                        ((wimp_event_no) 0x6u)
#define wimp_USER_DRAG_BOX                      ((wimp_event_no) 0x7u)
#define wimp_KEY_PRESSED                        ((wimp_event_no) 0x8u)
#define wimp_MENU_SELECTION                     ((wimp_event_no) 0x9u)
#define wimp_SCROLL_REQUEST                     ((wimp_event_no) 0xAu)
#define wimp_LOSE_CARET                         ((wimp_event_no) 0xBu)
#define wimp_GAIN_CARET                         ((wimp_event_no) 0xCu)
#define wimp_POLLWORD_NON_ZERO                  ((wimp_event_no) 0xDu)
#define wimp_USER_MESSAGE                       ((wimp_event_no) 0x11u)
#define wimp_USER_MESSAGE_RECORDED              ((wimp_event_no) 0x12u)
#define wimp_USER_MESSAGE_ACKNOWLEDGE           ((wimp_event_no) 0x13u)
#define wimp_MASK_NULL                          ((wimp_poll_flags) 0x1u)
#define wimp_QUEUE_REDRAW                       ((wimp_poll_flags) 0x2u)
#define wimp_MASK_LEAVING                       ((wimp_poll_flags) 0x10u)
#define wimp_MASK_ENTERING                      ((wimp_poll_flags) 0x20u)
#define wimp_QUEUE_MOUSE                        ((wimp_poll_flags) 0x40u)
#define wimp_QUEUE_KEY                          ((wimp_poll_flags) 0x100u)
#define wimp_MASK_LOSE                          ((wimp_poll_flags) 0x800u)
#define wimp_MASK_GAIN                          ((wimp_poll_flags) 0x1000u)
#define wimp_MASK_POLLWORD                      ((wimp_poll_flags) 0x2000u)
#define wimp_MASK_MESSAGE                       ((wimp_poll_flags) 0x20000u)
#define wimp_MASK_RECORDED                      ((wimp_poll_flags) 0x40000u)
#define wimp_MASK_ACKNOWLEDGE                   ((wimp_poll_flags) 0x80000u)
#define wimp_GIVEN_POLLWORD                     ((wimp_poll_flags) 0x400000u)
#define wimp_POLL_HIGH_PRIORITY                 ((wimp_poll_flags) 0x800000u)
#define wimp_SAVE_FP                            ((wimp_poll_flags) 0x1000000u)
#define wimp_BROADCAST                          ((wimp_t) 0x0u)
#define wimp_BACKGROUND                         ((wimp_w) 0xFFFFFFFFu)
#define wimp_ICON_BAR                           ((wimp_w) 0xFFFFFFFEu)
#define wimp_ICON_BAR_RIGHT                     ((wimp_w) 0xFFFFFFFFu)
#define wimp_ICON_BAR_LEFT                      ((wimp_w) 0xFFFFFFFEu)
#define wimp_ICON_BAR_LEFT_RELATIVE             ((wimp_w) 0xFFFFFFFDu)
#define wimp_ICON_BAR_RIGHT_RELATIVE            ((wimp_w) 0xFFFFFFFCu)
#define wimp_ICON_BAR_LEFT_HIGH_PRIORITY        ((wimp_w) 0xFFFFFFFBu)
#define wimp_ICON_BAR_LEFT_LOW_PRIORITY         ((wimp_w) 0xFFFFFFFAu)
#define wimp_ICON_BAR_RIGHT_LOW_PRIORITY        ((wimp_w) 0xFFFFFFF9u)
#define wimp_ICON_BAR_RIGHT_HIGH_PRIORITY       ((wimp_w) 0xFFFFFFF8u)
#define wimp_TOP                                ((wimp_w) 0xFFFFFFFFu)
#define wimp_BOTTOM                             ((wimp_w) 0xFFFFFFFEu)
#define wimp_HIDDEN                             ((wimp_w) 0xFFFFFFFDu)
#define wimp_NO_ICON                            ((wimp_w) 0xFFFFFFFFu)
#define wimp_ICON_WINDOW                        ((wimp_i) 0xFFFFFFFFu)
#define wimp_ICON_BACK                          ((wimp_i) 0xFFFFFFFEu)
#define wimp_ICON_CLOSE                         ((wimp_i) 0xFFFFFFFDu)
#define wimp_ICON_TITLE                         ((wimp_i) 0xFFFFFFFCu)
#define wimp_ICON_TOGGLE                        ((wimp_i) 0xFFFFFFFBu)
#define wimp_ICON_SCROLL_UP                     ((wimp_i) 0xFFFFFFFAu)
#define wimp_ICON_VSCROLL                       ((wimp_i) 0xFFFFFFF9u)
#define wimp_ICON_SCROLL_DOWN                   ((wimp_i) 0xFFFFFFF8u)
#define wimp_ICON_SIZE                          ((wimp_i) 0xFFFFFFF7u)
#define wimp_ICON_SCROLL_LEFT                   ((wimp_i) 0xFFFFFFF6u)
#define wimp_ICON_HSCROLL                       ((wimp_i) 0xFFFFFFF5u)
#define wimp_ICON_SCROLL_RIGHT                  ((wimp_i) 0xFFFFFFF4u)
#define wimp_ICON_FRAME                         ((wimp_i) 0xFFFFFFF3u)
#define wimp_ICON_ICONISE                       ((wimp_i) 0xFFFFFFF2u)
      /*RISC O S 4+*/
#define wimp_FURNITURE_WHOLE                    ((wimp_furniture) 0x0u)
#define wimp_FURNITURE_BACK                     ((wimp_furniture) 0x1u)
#define wimp_FURNITURE_CLOSE                    ((wimp_furniture) 0x2u)
#define wimp_FURNITURE_TITLE                    ((wimp_furniture) 0x3u)
#define wimp_FURNITURE_TOGGLE                   ((wimp_furniture) 0x4u)
#define wimp_FURNITURE_VSCROLL                  ((wimp_furniture) 0x5u)
#define wimp_FURNITURE_SIZE                     ((wimp_furniture) 0x6u)
#define wimp_FURNITURE_HSCROLL                  ((wimp_furniture) 0x7u)
#define wimp_FURNITURE_ICONISE                  ((wimp_furniture) 0x8u)
#define wimp_CHILD_LINKS_PARENT_WORK_AREA       ((wimp_window_nesting_flags) 0x0u)
      /*link to work area of parent*/
#define wimp_CHILD_LINKS_PARENT_VISIBLE_BOTTOM_OR_LEFT ((wimp_window_nesting_flags) 0x1u)
      /*link to left / bottom of visible area of parent*/
#define wimp_CHILD_LINKS_PARENT_VISIBLE_TOP_OR_RIGHT ((wimp_window_nesting_flags) 0x2u)
      /*link to right / top of visible area of parent*/
#define wimp_CHILD_LINKS_PARENT                 ((wimp_window_nesting_flags) 0x3u)
#define wimp_CHILD_LS_EDGE_SHIFT                16
      /*influences left side edge of child*/
#define wimp_CHILD_BS_EDGE_SHIFT                18
      /*influences bottom side edge of child*/
#define wimp_CHILD_RS_EDGE_SHIFT                20
      /*influences right side edge of child*/
#define wimp_CHILD_TS_EDGE_SHIFT                22
      /*influences top side edge of child*/
#define wimp_CHILD_XORIGIN_SHIFT                24
      /*influences the x origin of child*/
#define wimp_CHILD_YORIGIN_SHIFT                26
      /*influences the y origin of child*/
#define wimp_WINDOW_MOVEABLE                    ((wimp_window_flags) 0x2u)
#define wimp_WINDOW_AUTO_REDRAW                 ((wimp_window_flags) 0x10u)
#define wimp_WINDOW_PANE                        ((wimp_window_flags) 0x20u)
#define wimp_WINDOW_NO_BOUNDS                   ((wimp_window_flags) 0x40u)
#define wimp_WINDOW_SCROLL_REPEAT               ((wimp_window_flags) 0x100u)
#define wimp_WINDOW_SCROLL                      ((wimp_window_flags) 0x200u)
#define wimp_WINDOW_REAL_COLOURS                ((wimp_window_flags) 0x400u)
      /*Not RISC O S 4+*/
#define wimp_WINDOW_BACK                        ((wimp_window_flags) 0x800u)
#define wimp_WINDOW_HOT_KEYS                    ((wimp_window_flags) 0x1000u)
#define wimp_WINDOW_BOUNDED                     ((wimp_window_flags) 0x2000u)
#define wimp_WINDOW_IGNORE_XEXTENT              ((wimp_window_flags) 0x4000u)
#define wimp_WINDOW_IGNORE_YEXTENT              ((wimp_window_flags) 0x8000u)
#define wimp_WINDOW_OPEN                        ((wimp_window_flags) 0x10000u)
#define wimp_WINDOW_NOT_COVERED                 ((wimp_window_flags) 0x20000u)
#define wimp_WINDOW_FULL_SIZE                   ((wimp_window_flags) 0x40000u)
      /*Window at full size, obscuring Iconbar*/
#define wimp_WINDOW_TOGGLED                     ((wimp_window_flags) 0x80000u)
#define wimp_WINDOW_HAS_FOCUS                   ((wimp_window_flags) 0x100000u)
#define wimp_WINDOW_BOUNDED_ONCE                ((wimp_window_flags) 0x200000u)
#define wimp_WINDOW_PARTIAL_SIZE                ((wimp_window_flags) 0x400000u)
      /*Window at full size, not obscuring iconbar - WindowManager 3.98+*/
#define wimp_WINDOW_FURNITURE_WINDOW            ((wimp_window_flags) 0x800000u)
      /*WindowManager 3.98+*/
#define wimp_WINDOW_FOREGROUND_WINDOW           ((wimp_window_flags) 0x800000u)
      /*RISC O S 4+*/
#define wimp_WINDOW_BACK_ICON                   ((wimp_window_flags) 0x1000000u)
#define wimp_WINDOW_CLOSE_ICON                  ((wimp_window_flags) 0x2000000u)
#define wimp_WINDOW_TITLE_ICON                  ((wimp_window_flags) 0x4000000u)
#define wimp_WINDOW_TOGGLE_ICON                 ((wimp_window_flags) 0x8000000u)
#define wimp_WINDOW_VSCROLL                     ((wimp_window_flags) 0x10000000u)
#define wimp_WINDOW_SIZE_ICON                   ((wimp_window_flags) 0x20000000u)
#define wimp_WINDOW_HSCROLL                     ((wimp_window_flags) 0x40000000u)
#define wimp_WINDOW_NEW_FORMAT                  ((wimp_window_flags) 0x80000000u)
#define wimp_WINDOW_USE_TITLE_VALIDATION_COLOURS ((wimp_extra_window_flags) 0x1u)
      /*RISC O S 4+ Prefer Wimp_WindowUseTitleValidationString*/
#define wimp_WINDOW_USE_TITLE_VALIDATION_STRING ((wimp_extra_window_flags) 0x1u)
      /*RISC O S 4+*/
#define wimp_WINDOW_USE_EXTENDED_SCROLL_REQUEST ((wimp_extra_window_flags) 0x2u)
      /*RISC O S 4.32+*/
#define wimp_WINDOW_NEVER3D                     ((wimp_extra_window_flags) 0x4u)
      /*RISC O S 4+*/
#define wimp_WINDOW_ALWAYS3D                    ((wimp_extra_window_flags) 0x8u)
      /*RISC O S 4+*/
#define wimp_ICON_TEXT                          ((wimp_icon_flags) 0x1u)
#define wimp_ICON_SPRITE                        ((wimp_icon_flags) 0x2u)
#define wimp_ICON_BORDER                        ((wimp_icon_flags) 0x4u)
#define wimp_ICON_HCENTRED                      ((wimp_icon_flags) 0x8u)
#define wimp_ICON_VCENTRED                      ((wimp_icon_flags) 0x10u)
#define wimp_ICON_FILLED                        ((wimp_icon_flags) 0x20u)
#define wimp_ICON_ANTI_ALIASED                  ((wimp_icon_flags) 0x40u)
#define wimp_ICON_NEEDS_HELP                    ((wimp_icon_flags) 0x80u)
#define wimp_ICON_INDIRECTED                    ((wimp_icon_flags) 0x100u)
#define wimp_ICON_RJUSTIFIED                    ((wimp_icon_flags) 0x200u)
#define wimp_ICON_ALLOW_ADJUST                  ((wimp_icon_flags) 0x400u)
#define wimp_ICON_HALF_SIZE                     ((wimp_icon_flags) 0x800u)
#define wimp_ICON_BUTTON_TYPE_SHIFT             12
#define wimp_ICON_BUTTON_TYPE                   ((wimp_icon_flags) 0xF000u)
      /*shift button bits by Wimp_IconButtonTypeShift*/
#define wimp_ICON_ESG_SHIFT                     16
#define wimp_ICON_ESG                           ((wimp_icon_flags) 0x1F0000u)
      /*shift ESG bits by Wimp_IconESGShift*/
#define wimp_ICON_SELECTED                      ((wimp_icon_flags) 0x200000u)
#define wimp_ICON_SHADED                        ((wimp_icon_flags) 0x400000u)
#define wimp_ICON_DELETED                       ((wimp_icon_flags) 0x800000u)
#define wimp_ICON_FG_COLOUR_SHIFT               24
#define wimp_ICON_FG_COLOUR                     ((wimp_icon_flags) 0xF000000u)
      /*shift FG Colour bits by Wimp_IconFGColourShift*/
#define wimp_ICON_BG_COLOUR_SHIFT               28
#define wimp_ICON_BG_COLOUR                     ((wimp_icon_flags) 0xF0000000u)
      /*shift BG Colour bits by Wimp_IconBGColourShift*/
#define wimp_ICON_FONT_HANDLE_SHIFT             24
#define wimp_ICON_FONT_HANDLE                   ((wimp_icon_flags) 0xFF000000u)
      /*shift Font Handle bits by Wimp_IconFontHandleShift*/
#define wimp_BUTTON_NEVER                       ((wimp_icon_flags) 0x0u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_ALWAYS                      ((wimp_icon_flags) 0x1u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_REPEAT                      ((wimp_icon_flags) 0x2u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_CLICK                       ((wimp_icon_flags) 0x3u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_RELEASE                     ((wimp_icon_flags) 0x4u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_DOUBLE_CLICK                ((wimp_icon_flags) 0x5u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_CLICK_DRAG                  ((wimp_icon_flags) 0x6u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_RELEASE_DRAG                ((wimp_icon_flags) 0x7u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_DOUBLE_DRAG                 ((wimp_icon_flags) 0x8u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_MENU_ICON                   ((wimp_icon_flags) 0x9u)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_DOUBLE_CLICK_DRAG           ((wimp_icon_flags) 0xAu)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_RADIO                       ((wimp_icon_flags) 0xBu)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_WRITE_CLICK_DRAG            ((wimp_icon_flags) 0xEu)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_BUTTON_WRITABLE                    ((wimp_icon_flags) 0xFu)
      /*shift by Wimp_IconButtonTypeShift*/
#define wimp_MENU_TICKED                        ((wimp_menu_flags) 0x1u)
#define wimp_MENU_SEPARATE                      ((wimp_menu_flags) 0x2u)
#define wimp_MENU_WRITABLE                      ((wimp_menu_flags) 0x4u)
#define wimp_MENU_GIVE_WARNING                  ((wimp_menu_flags) 0x8u)
#define wimp_MENU_SUB_MENU_WHEN_SHADED          ((wimp_menu_flags) 0x10u)
#define wimp_MENU_LAST                          ((wimp_menu_flags) 0x80u)
#define wimp_MENU_TITLE_INDIRECTED              ((wimp_menu_flags) 0x100u)
#define wimp_CLOSE_MENU                         ((wimp_menu *) 0xFFFFFFFFu)
#define wimp_NO_SUB_MENU                        ((wimp_menu *) 0xFFFFFFFFu)
#define wimp_DEFER_SUB_MENU                     ((wimp_menu *) 0x1u)
#define wimp_NO_FONTS                           ((byte *) 0xFFFFFFFFu)
#define wimp_GET_SIZE                           ((wimp_window *) 0x0u)
#define wimp_CLICK_ADJUST                       ((wimp_mouse_state) 0x1u)
#define wimp_DOUBLE_ADJUST                      ((wimp_mouse_state) 0x1u)
#define wimp_CLICK_MENU                         ((wimp_mouse_state) 0x2u)
#define wimp_CLICK_SELECT                       ((wimp_mouse_state) 0x4u)
#define wimp_DOUBLE_SELECT                      ((wimp_mouse_state) 0x4u)
#define wimp_DRAG_ADJUST                        ((wimp_mouse_state) 0x10u)
#define wimp_DRAG_SELECT                        ((wimp_mouse_state) 0x40u)
#define wimp_SINGLE_ADJUST                      ((wimp_mouse_state) 0x100u)
#define wimp_SINGLE_SELECT                      ((wimp_mouse_state) 0x400u)
#define wimp_MENU_ITEM_HEIGHT                   44
#define wimp_MENU_ITEM_GAP                      0
#define wimp_MENU_ITEM_SEPARATION               24
#define wimp_DRAG_SYSTEM_POSITION               ((wimp_drag_type) 0x1u)
#define wimp_DRAG_SYSTEM_SIZE                   ((wimp_drag_type) 0x2u)
#define wimp_DRAG_SYSTEM_HSCROLL                ((wimp_drag_type) 0x3u)
#define wimp_DRAG_SYSTEM_VSCROLL                ((wimp_drag_type) 0x4u)
#define wimp_DRAG_USER_FIXED                    ((wimp_drag_type) 0x5u)
#define wimp_DRAG_USER_RUBBER                   ((wimp_drag_type) 0x6u)
#define wimp_DRAG_USER_POINT                    ((wimp_drag_type) 0x7u)
#define wimp_DRAG_ASM_FIXED                     ((wimp_drag_type) 0x8u)
#define wimp_DRAG_ASM_RUBBER                    ((wimp_drag_type) 0x9u)
#define wimp_DRAG_ASM_FIXED_INDEFINITE          ((wimp_drag_type) 0xAu)
#define wimp_DRAG_ASM_RUBBER_INDEFINITE         ((wimp_drag_type) 0xBu)
#define wimp_DRAG_SYSTEM_SCROLL_BOTH            ((wimp_drag_type) 0xCu)
#define wimp_DRAG_START_TEXT_SELECTION          ((wimp_drag_type) 0xDu)
      /*RISC O S 4.36+*/
#define wimp_KEY_BACKSPACE                      ((wimp_key_no) 0x8u)
#define wimp_KEY_RETURN                         ((wimp_key_no) 0xDu)
#define wimp_KEY_ESCAPE                         ((wimp_key_no) 0x1Bu)
#define wimp_KEY_HOME                           ((wimp_key_no) 0x1Eu)
#define wimp_KEY_DELETE                         ((wimp_key_no) 0x7Fu)
#define wimp_KEY_SHIFT                          ((wimp_key_no) 0x10u)
#define wimp_KEY_CONTROL                        ((wimp_key_no) 0x20u)
#define wimp_KEY_PRINT                          ((wimp_key_no) 0x180u)
#define wimp_KEY_F1                             ((wimp_key_no) 0x181u)
#define wimp_KEY_F2                             ((wimp_key_no) 0x182u)
#define wimp_KEY_F3                             ((wimp_key_no) 0x183u)
#define wimp_KEY_F4                             ((wimp_key_no) 0x184u)
#define wimp_KEY_F5                             ((wimp_key_no) 0x185u)
#define wimp_KEY_F6                             ((wimp_key_no) 0x186u)
#define wimp_KEY_F7                             ((wimp_key_no) 0x187u)
#define wimp_KEY_F8                             ((wimp_key_no) 0x188u)
#define wimp_KEY_F9                             ((wimp_key_no) 0x189u)
#define wimp_KEY_TAB                            ((wimp_key_no) 0x18Au)
#define wimp_KEY_COPY                           ((wimp_key_no) 0x18Bu)
#define wimp_KEY_LEFT                           ((wimp_key_no) 0x18Cu)
#define wimp_KEY_RIGHT                          ((wimp_key_no) 0x18Du)
#define wimp_KEY_LOGO                           ((wimp_key_no) 0x1C0u)
#define wimp_KEY_MENU                           ((wimp_key_no) 0x1C1u)
#define wimp_KEY_F10                            ((wimp_key_no) 0x1CAu)
#define wimp_KEY_F11                            ((wimp_key_no) 0x1CBu)
#define wimp_KEY_F12                            ((wimp_key_no) 0x1CCu)
#define wimp_KEY_INSERT                         ((wimp_key_no) 0x1CDu)
#define wimp_KEY_DOWN                           ((wimp_key_no) 0x18Eu)
#define wimp_KEY_UP                             ((wimp_key_no) 0x18Fu)
#define wimp_KEY_PAGE_DOWN                      ((wimp_key_no) 0x19Eu)
#define wimp_KEY_PAGE_UP                        ((wimp_key_no) 0x19Fu)
#define message_QUIT                            0x0u
#define message_DATA_SAVE                       0x1u
#define message_DATA_SAVE_ACK                   0x2u
#define message_DATA_LOAD                       0x3u
#define message_DATA_LOAD_ACK                   0x4u
#define message_DATA_OPEN                       0x5u
#define message_RAM_FETCH                       0x6u
#define message_RAM_TRANSMIT                    0x7u
#define message_PREQUIT                         0x8u
#define message_PRE_QUIT                        0x8u
#define message_PALETTE_CHANGE                  0x9u
#define message_SAVE_DESKTOP                    0xAu
#define message_DEVICE_CLAIM                    0xBu
#define message_DEVICE_IN_USE                   0xCu
#define message_DATA_SAVED                      0xDu
#define message_SHUTDOWN                        0xEu
#define message_CLAIM_ENTITY                    0xFu
#define message_DATA_REQUEST                    0x10u
#define message_DRAGGING                        0x11u
#define message_DRAG_CLAIM                      0x12u
#define message_RELEASE_ENTITY                  0x13u
#define message_APP_CONTROL                     0x15u
#define message_MENU_WARNING                    0x400C0u
#define message_MODE_CHANGE                     0x400C1u
#define message_TASK_INITIALISE                 0x400C2u
#define message_TASK_CLOSE_DOWN                 0x400C3u
#define message_SLOT_SIZE                       0x400C4u
#define message_SET_SLOT                        0x400C5u
#define message_TASK_NAME_RQ                    0x400C6u
#define message_TASK_NAME_IS                    0x400C7u
#define message_TASK_STARTED                    0x400C8u
#define message_MENUS_DELETED                   0x400C9u
#define message_ICONISE                         0x400CAu
#define message_WINDOW_CLOSED                   0x400CBu
#define message_WINDOW_INFO                     0x400CCu
#define message_SWAP                            0x400CDu
#define message_TOOLS_CHANGED                   0x400CEu
#define message_FONT_CHANGED                    0x400CFu
#define message_ICONISE_AT                      0x400D0u
      /*RISC O S 4+*/
#define message_TOGGLE_BACKDROP                 0x400D1u
      /*RISC O S 4.20+*/
#define message_SCREEN_EDGE_NOTIFICATION        0x400D2u
      /*RISC O S 4.20+*/
#define wimp_DRAG_BOX_KEEP_IN_LINE              ((wimp_drag_box_flags) 0x1u)
      /*RISC O S 4+*/
#define wimp_DRAG_BOX_CLIP                      ((wimp_drag_box_flags) 0x2u)
      /*RISC O S 4+*/
#define wimp_AUTO_SCROLL_ENABLE_HORIZONTAL      ((wimp_auto_scroll_flags) 0x1u)
#define wimp_AUTO_SCROLL_ENABLE_VERTICAL        ((wimp_auto_scroll_flags) 0x2u)
#define wimp_AUTO_SCROLL_DELEGATE_TO_TASK       ((wimp_auto_scroll_flags) 0x4u)
#define wimp_AUTO_SCROLL_READ_STATE             ((wimp_auto_scroll_flags) 0x80u)
#define wimp_ERROR_BOX_OK_ICON                  ((wimp_error_box_flags) 0x1u)
#define wimp_ERROR_BOX_CANCEL_ICON              ((wimp_error_box_flags) 0x2u)
#define wimp_ERROR_BOX_HIGHLIGHT_CANCEL         ((wimp_error_box_flags) 0x4u)
#define wimp_ERROR_BOX_NO_PROMPT                ((wimp_error_box_flags) 0x8u)
#define wimp_ERROR_BOX_SHORT_TITLE              ((wimp_error_box_flags) 0x10u)
#define wimp_ERROR_BOX_LEAVE_OPEN               ((wimp_error_box_flags) 0x20u)
#define wimp_ERROR_BOX_CLOSE                    ((wimp_error_box_flags) 0x40u)
#define wimp_ERROR_BOX_NO_BEEP                  ((wimp_error_box_flags) 0x80u)
#define wimp_ERROR_BOX_GIVEN_CATEGORY           ((wimp_error_box_flags) 0x100u)
#define wimp_ERROR_BOX_CATEGORY                 ((wimp_error_box_flags) 0xE00u)
#define wimp_ERROR_BOX_CATEGORY_SHIFT           9
#define wimp_ERROR_BOX_CATEGORY_INFO            ((wimp_error_box_flags) 0x1u)
#define wimp_ERROR_BOX_CATEGORY_ERROR           ((wimp_error_box_flags) 0x2u)
#define wimp_ERROR_BOX_CATEGORY_PROGRAM         ((wimp_error_box_flags) 0x3u)
#define wimp_ERROR_BOX_CATEGORY_QUESTION        ((wimp_error_box_flags) 0x4u)
#define wimp_ERROR_BOX_CONTINUE_RESPONSE_SHIFT  24
      /*RISC O S 4+*/
#define wimp_ERROR_BOX_QUIT_RESPONSE_SHIFT      28
      /*RISC O S 4+*/
#define wimp_ERROR_BOX_SELECTED_NOTHING         ((wimp_error_box_selection) 0x0u)
#define wimp_ERROR_BOX_SELECTED_OK              ((wimp_error_box_selection) 0x1u)
#define wimp_ERROR_BOX_SELECTED_CANCEL          ((wimp_error_box_selection) 0x2u)
#define wimp_COLOUR_WHITE                       ((wimp_colour) 0x0u)
#define wimp_COLOUR_VERY_LIGHT_GREY             ((wimp_colour) 0x1u)
#define wimp_COLOUR_LIGHT_GREY                  ((wimp_colour) 0x2u)
#define wimp_COLOUR_MID_LIGHT_GREY              ((wimp_colour) 0x3u)
#define wimp_COLOUR_MID_DARK_GREY               ((wimp_colour) 0x4u)
#define wimp_COLOUR_DARK_GREY                   ((wimp_colour) 0x5u)
#define wimp_COLOUR_VERY_DARK_GREY              ((wimp_colour) 0x6u)
#define wimp_COLOUR_BLACK                       ((wimp_colour) 0x7u)
#define wimp_COLOUR_DARK_BLUE                   ((wimp_colour) 0x8u)
#define wimp_COLOUR_YELLOW                      ((wimp_colour) 0x9u)
#define wimp_COLOUR_LIGHT_GREEN                 ((wimp_colour) 0xAu)
#define wimp_COLOUR_RED                         ((wimp_colour) 0xBu)
#define wimp_COLOUR_CREAM                       ((wimp_colour) 0xCu)
#define wimp_COLOUR_DARK_GREEN                  ((wimp_colour) 0xDu)
#define wimp_COLOUR_ORANGE                      ((wimp_colour) 0xEu)
#define wimp_COLOUR_LIGHT_BLUE                  ((wimp_colour) 0xFu)
#define wimp_COLOUR_TRANSPARENT                 ((wimp_colour) 0xFFFFFFFFu)
#define wimp_SCROLL_DOUBLE_EXTENDED_LEFT        ((wimp_scroll_direction) 0xFFFFFFF8u)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_DOUBLE_EXTENDED_DOWN        ((wimp_scroll_direction) 0xFFFFFFF8u)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_SINGLE_EXTENDED_LEFT        ((wimp_scroll_direction) 0xFFFFFFFCu)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_SINGLE_EXTENDED_DOWN        ((wimp_scroll_direction) 0xFFFFFFFCu)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_AUTO_LEFT                   ((wimp_scroll_direction) 0xFFFFFFFDu)
      /*RISC O S 4+*/
#define wimp_SCROLL_AUTO_DOWN                   ((wimp_scroll_direction) 0xFFFFFFFDu)
      /*RISC O S 4+*/
#define wimp_SCROLL_PAGE_LEFT                   ((wimp_scroll_direction) 0xFFFFFFFEu)
#define wimp_SCROLL_PAGE_DOWN                   ((wimp_scroll_direction) 0xFFFFFFFEu)
#define wimp_SCROLL_COLUMN_LEFT                 ((wimp_scroll_direction) 0xFFFFFFFFu)
#define wimp_SCROLL_LINE_DOWN                   ((wimp_scroll_direction) 0xFFFFFFFFu)
#define wimp_SCROLL_NONE                        ((wimp_scroll_direction) 0x0u)
#define wimp_SCROLL_LINE_UP                     ((wimp_scroll_direction) 0x1u)
#define wimp_SCROLL_COLUMN_RIGHT                ((wimp_scroll_direction) 0x1u)
#define wimp_SCROLL_PAGE_UP                     ((wimp_scroll_direction) 0x2u)
#define wimp_SCROLL_PAGE_RIGHT                  ((wimp_scroll_direction) 0x2u)
#define wimp_SCROLL_AUTO_UP                     ((wimp_scroll_direction) 0x3u)
      /*RISC O S 4+*/
#define wimp_SCROLL_AUTO_RIGHT                  ((wimp_scroll_direction) 0x3u)
      /*RISC O S 4+*/
#define wimp_SCROLL_SINGLE_EXTENDED_UP          ((wimp_scroll_direction) 0x4u)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_SINGLE_EXTENDED_RIGHT       ((wimp_scroll_direction) 0x4u)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_DOUBLE_EXTENDED_UP          ((wimp_scroll_direction) 0x8u)
      /*RISC O S 4.32+*/
#define wimp_SCROLL_DOUBLE_EXTENDED_RIGHT       ((wimp_scroll_direction) 0x8u)
      /*RISC O S 4.32+*/
#define wimp_AUTO_SCROLL_NO_HANDLER             ((void *) 0x0u)
#define wimp_AUTO_SCROLL_DEFAULT_HANDLER        ((void *) 0x1u)
#define wimp_PRE_QUIT_TASK_ONLY                 ((wimp_pre_quit_flags) 0x1u)
#define wimp_CLAIM_CARET_OR_SELECTION           ((wimp_claim_flags) 0x3u)
      /*caret or selection being claimed*/
#define wimp_CLAIM_CLIPBOARD                    ((wimp_claim_flags) 0x4u)
      /*clipboard being claimed*/
#define wimp_DATA_REQUEST_CLIPBOARD             ((wimp_data_request_flags) 0x4u)
      /*send data from clipboard*/
#define wimp_DRAGGING_FROM_SELECTION            ((wimp_dragging_flags) 0x2u)
      /*sending data from selection*/
#define wimp_DRAGGING_FROM_CLIPBOARD            ((wimp_dragging_flags) 0x4u)
      /*sending data from clipboard*/
#define wimp_DRAGGING_DELETE_SOURCE             ((wimp_dragging_flags) 0x8u)
      /*source data will be deleted*/
#define wimp_DRAGGING_TERMINATE_DRAG            ((wimp_dragging_flags) 0x10u)
      /*drag is terminating - do not claim this message*/
#define wimp_DRAG_CLAIM_POINTER_CHANGED         ((wimp_drag_claim_flags) 0x1u)
      /*pointer shape has been changed*/
#define wimp_DRAG_CLAIM_SUPRESS_DRAGBOX         ((wimp_drag_claim_flags) 0x2u)
      /*remove wimp dragbox*/
#define wimp_DRAG_CLAIM_DELETE_SOURCE           ((wimp_drag_claim_flags) 0x8u)
      /*source data should be deleted*/
#define wimp_RELEASE_CLIPBOARD                  ((wimp_claim_flags) 0x4u)
      /*clipboard being released*/
#define wimp_APP_CONTROL_IMMEDIATE              ((wimp_app_control_flags) 0x1u)
#define wimp_APP_CONTROL_STOP                   ((wimp_app_control_operation) 0x0u)
#define wimp_APP_CONTROL_WAKE_UP                ((wimp_app_control_operation) 0x1u)
#define wimp_APP_CONTROL_PAUSE                  ((wimp_app_control_operation) 0x2u)
#define wimp_APP_CONTROL_MINIMISE_MEMORY        ((wimp_app_control_operation) 0x3u)
#define wimp_APP_CONTROL_OPEN_CONFIGURATION     ((wimp_app_control_operation) 0x4u)
#define wimp_ICONISE_WITH_SHIFT_CLOSE           ((wimp_iconise_flags) 0x1u)
#define wimp_TOGGLE_BACKDROP_TYPE               ((wimp_toggle_backdrop_flags) 0x3u)
#define wimp_TOGGLE_BACKDROP                    ((wimp_toggle_backdrop_flags) 0x0u)
#define wimp_TOGGLE_BACKDROP_TO_FRONT           ((wimp_toggle_backdrop_flags) 0x1u)
#define wimp_TOGGLE_BACKDROP_TO_BACK            ((wimp_toggle_backdrop_flags) 0x2u)
#define wimp_TOGGLE_BACKDROP_GET_POSITION       ((wimp_toggle_backdrop_flags) 0x3u)
#define wimp_SCREEN_EDGE_NOTIFICATION_LEFT      ((wimp_screen_edge_notification_flags) 0x1u)
#define wimp_SCREEN_EDGE_NOTIFICATION_BOTTOM    ((wimp_screen_edge_notification_flags) 0x2u)
#define wimp_SCREEN_EDGE_NOTIFICATION_RIGHT     ((wimp_screen_edge_notification_flags) 0x4u)
#define wimp_SCREEN_EDGE_NOTIFICATION_TOP       ((wimp_screen_edge_notification_flags) 0x8u)
#define error_WIMP_NO_CLAIM                     0x280u
      /*Wimp unable to claim work area*/
#define error_WIMP_BAD_OP                       0x281u
      /*Invalid Wimp operation in this context*/
#define error_WIMP_RECT_FULL                    0x282u
      /*Rectangle area full*/
#define error_WIMP_TOO_MANY                     0x283u
      /*Too many windows*/
#define error_WIMP_TOO_BIG                      0x284u
      /*Window definition won't fit*/
#define error_WIMP_DIV_BY0                      0x285u
      /*Division by zero*/
#define error_WIMP_GET_RECT                     0x286u
      /*Get_Rectangle not called correctly*/
#define error_WIMP_FOCUS                        0x287u
      /*Input focus window not found*/
#define error_WIMP_BAD_HANDLE                   0x288u
      /*Illegal window handle*/
#define error_WIMP_TOO_MENUS                    0x289u
      /*Too many menus*/
#define error_WIMP_BAD_EXTENT                   0x28Au
      /*Bad work area extent*/
#define error_WIMP_BAD_POINTER                  0x28Bu
      /*Syntax: *POINTER <0|1|2>*/
#define error_WIMP_NO_TEMPLATE_FILE             0x28Cu
      /*Template file not found*/
#define error_WIMP_BAD_TEMPLATE                 0x28Du
      /*Template entry invalid*/
#define error_WIMP_BAD_FONTS                    0x28Eu
      /*Unable to bind font handle*/
#define error_WIMP_BAD_SYNTAX                   0x28Fu
      /*Syntax error in validation string*/
#define error_WIMP_NO_TASKS                     0x290u
      /*Too many tasks*/
#define error_WIMP_NO_TEMPLATE                  0x291u
      /*Template entry not found*/
#define error_WIMP_NOT_PRESENT                  0x292u
      /*Window manager not present/too old*/
#define error_WIMP_IN_USE                       0x293u
      /*Window manager in use*/
#define error_WIMP_BAD_PAL_FILE                 0x294u
      /*Error in palette file*/
#define error_WIMP_BAD_VERSION                  0x295u
      /*Bad version number*/
#define error_WIMP_BAD_MESSAGE_SIZE             0x296u
      /*Message block too big/not a multiple of 4*/
#define error_WIMP_BAD_REASON_CODE              0x297u
      /*Illegal reason code*/
#define error_WIMP_BAD_TASK_HANDLE              0x298u
      /*Illegal task handle*/
#define error_WIMP_CANT_TASK                    0x299u
      /*Can't start task from here*/
#define error_WIMP_BAD_SUB_MENU                 0x29Au
      /*SubMenus require a parent menu tree*/
#define error_WIMP_OWNER_WINDOW                 0x29Bu
      /*Access to window denied*/
#define error_WIMP_BAD_MODE                     0x29Cu
      /*Bad Wimp mode*/
#define error_WIMP_BAD_TRANSFER                 0x29Du
      /*Wimp transfer out of range*/
#define error_WIMP_BAD_SYS_INFO                 0x29Eu
      /*Bad parameter passed to Wimp in R0*/
#define error_WIMP_BAD_PTR_IN_R1                0x29Fu
      /*Bad pointer passed to Wimp in R1*/
#define error_WIMP_BAD_ESCAPE_STATE             0x2A0u
      /*Wimp_Poll called with escape enabled*/
#define error_WIMP_BAD_ICON_HANDLE              0x2A1u
      /*Illegal icon handle*/
#define error_WIMP_BAD_R3                       0x2A2u
      /*Illegal Wimp_Poll pointer in R3*/
#define error_WIMP_NO_DOT_IN_FILENAME           0x2A3u
      /*To save: drag the icon to a directory viewer*/
#define error_WIMP_TEMPLATE_EOF                 0x2A4u
      /*End of file while reading template file*/
#define error_WIMP_BAD_SLOT                     0x2A5u
      /*Wimp transfer required paging in beyond end of slot*/
#define error_WIMP_BAD_CONF_FONT                0x2A6u
      /*bad configuration font*/
#define error_WIMP_NO_SPRITES                   0x2A7u
      /*Not enough room for sprites*/
#define error_WIMP_BAD_PAL_FILE2                0x2A8u
      /*BadPalFile2 */
#define error_WIMP_BAD_SPRITES                  0x2A9u
      /*Squashed or missing sprite file*/
#define error_WIMP_BAD_PARENT                   0x2AAu
      /*Bad parent window*/
#define wimp_PRIORITY_TASK_MANAGER              ((wimp_priority) 0x60000000u)
#define wimp_PRIORITY_PALETTE_UTILITY           ((wimp_priority) 0x20000000u)
#define wimp_PRIORITY_ADFS_FILER_HARD_DISCS     ((wimp_priority) 0x70000000u)
#define wimp_PRIORITY_ADFS_FILER_FLOPPY_DISCS   ((wimp_priority) 0x60000000u)
#define wimp_PRIORITY_RESOURCE_FILER            ((wimp_priority) 0x50000000u)
#define wimp_PRIORITY_RAMFS_FILER               ((wimp_priority) 0x40000000u)
#define wimp_PRIORITY_NFS_FILER                 ((wimp_priority) 0x30000000u)
#define wimp_PRIORITY_NET_FILER                 ((wimp_priority) 0x20000000u)
#define wimp_PRIORITY_PRINTERS                  ((wimp_priority) 0xF000000u)
#define wimp_PRIORITY_TINY_DIRS                 ((wimp_priority) 0xC0000000u)
#define wimp_PLOT_ICON_GIVEN_SPRITE_AREA        ((wimp_plot_icon) 0x1u)
#define wimp_PLOT_ICON_UNDER_POINTER            ((wimp_plot_icon) 0x2u)
#define wimp_COMMAND_WINDOW_INACTIVE            ((wimp_command_window_state) 0x0u)
#define wimp_COMMAND_WINDOW_PENDING             ((wimp_command_window_state) 0x1u)
#define wimp_COMMAND_WINDOW_OPEN                ((wimp_command_window_state) 0x2u)
#define wimp_GIVEN_WINDOW_AND_ICON              ((wimp_menu_state_flags) 0x1u)
#define wimp_FILTER_PRE_POLL                    ((wimp_filter_action) 0x0u)
      /*called on entry to Wimp_Poll*/
#define wimp_FILTER_POST_POLL                   ((wimp_filter_action) 0x1u)
      /*called on exit from Wimp_Poll*/
#define wimp_FILTER_COPY                        ((wimp_filter_action) 0x2u)
      /*called on entry to Wimp_BlockCopy and similar internal operations*/
#define wimp_FILTER_RECT                        ((wimp_filter_action) 0x3u)
      /*called on entry to Wimp_GetRectangle*/
#define wimp_FILTER_POST_RECT                   ((wimp_filter_action) 0x4u)
      /*called on exit from Wimp_GetRectangle*/
#define wimp_FILTER_POST_ICON                   ((wimp_filter_action) 0x5u)
      /*called after plotting icons in Wimp_GetRectangle*/
#define wimp_DEFAULT_PALETTE                    ((os_palette *) 0xFFFFFFFFu)
#define wimp_PALETTE                            ((os_palette *) 0x0u)
#define wimptextop_SIZE_COVERED                 ((wimptextop_string_width_flags) 0x80000000u)
      /*RISC O S 4.32+*/
#define wimptextop_GIVEN_BASELINE               ((wimptextop_paint_flags) 0x40000000u)
#define wimptextop_RJUSTIFY                     ((wimptextop_paint_flags) 0x80000000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      wimp_initialise()
 *
 * Description:   Registers a task with the Wimp
 *
 * Input:         version - value of R0 on entry
 *                name - value of R2 on entry
 *                messages - value of R3 on entry
 *
 * Output:        version_out - value of R0 on exit
 *                task_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C0 with R1 = 0x4B534154.
 */

extern os_error *xwimp_initialise (wimp_version_no version,
      char const *name,
      wimp_message_list const *messages,
      wimp_version_no *version_out,
      wimp_t *task_out);
extern wimp_t wimp_initialise (wimp_version_no version,
      char const *name,
      wimp_message_list const *messages,
      wimp_version_no *version_out);

/* ------------------------------------------------------------------------
 * Function:      wimp_init()
 *
 * Description:   Registers a task with the Wimp, allowing R1 to be
 *                specified
 *
 * Input:         version - value of R0 on entry
 *                r1 - value of R1 on entry
 *                name - value of R2 on entry
 *                messages - value of R3 on entry
 *
 * Output:        version_out - value of R0 on exit
 *                task_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C0.
 */

extern os_error *xwimp_init (wimp_version_no version,
      bits r1,
      char const *name,
      wimp_message_list const *messages,
      wimp_version_no *version_out,
      wimp_t *task_out);
extern wimp_t wimp_init (wimp_version_no version,
      bits r1,
      char const *name,
      wimp_message_list const *messages,
      wimp_version_no *version_out);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_window()
 *
 * Description:   Tells the Wimp what the characteristics of a window are
 *
 * Input:         window - value of R1 on entry
 *
 * Output:        w - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C1.
 */

extern os_error *xwimp_create_window (wimp_window const *window,
      wimp_w *w);
extern wimp_w wimp_create_window (wimp_window const *window);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_icon()
 *
 * Description:   Tells the Wimp what the characteristics of an icon are
 *
 * Input:         icon - value of R1 on entry
 *
 * Output:        i - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C2.
 */

extern os_error *xwimp_create_icon (wimp_icon_create const *icon,
      wimp_i *i);
extern wimp_i wimp_create_icon (wimp_icon_create const *icon);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_icon_relative()
 *
 * Description:   Tells the Wimp what the characteristics of an iconbar
 *                icon with a fixed relative position are
 *
 * Input:         neighbour - value of R0 on entry
 *                icon - value of R1 on entry
 *
 * Output:        i - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C2.
 */

extern os_error *xwimp_create_icon_relative (wimp_i neighbour,
      wimp_icon_create const *icon,
      wimp_i *i);
__swi (0x400C2) wimp_i wimp_create_icon_relative (wimp_i neighbour,
      wimp_icon_create const *icon);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_icon_prioritised()
 *
 * Description:   Tells the Wimp what the characteristics of an iconbar
 *                icon with a fixed priority are
 *
 * Input:         priority - value of R0 on entry
 *                icon - value of R1 on entry
 *
 * Output:        i - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C2.
 */

extern os_error *xwimp_create_icon_prioritised (wimp_priority priority,
      wimp_icon_create const *icon,
      wimp_i *i);
__swi (0x400C2) wimp_i wimp_create_icon_prioritised (wimp_priority priority,
      wimp_icon_create const *icon);

/* ------------------------------------------------------------------------
 * Function:      wimp_delete_window()
 *
 * Description:   Closes a specified window if it is still open, and then
 *                removes its definition
 *
 * Input:         w - component 0
 *
 * Other notes:   Calls SWI 0x400C3.
 */

extern os_error *xwimp_delete_window (wimp_w w);
extern void wimp_delete_window (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimp_delete_icon()
 *
 * Description:   Removes the definition of a specified icon
 *
 * Input:         w - component 0
 *                i - component 1
 *
 * Other notes:   Calls SWI 0x400C4.
 */

extern os_error *xwimp_delete_icon (wimp_w w,
      wimp_i i);
extern void wimp_delete_icon (wimp_w w,
      wimp_i i);

/* ------------------------------------------------------------------------
 * Function:      wimp_open_window()
 *
 * Description:   Updates the list of active windows (ones that are to be
 *                displayed)
 *
 * Input:         open - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400C5 with R2 = 0x0.
 */

extern os_error *xwimp_open_window (wimp_open *open);
extern void wimp_open_window (wimp_open *open);

/* ------------------------------------------------------------------------
 * Function:      wimp_open_window_nested()
 *
 * Description:   Updates the list of active windows (ones that are to be
 *                displayed) linking this to an existing window - nested
 *                Wimp / RISC O S 3.8+
 *
 * Input:         open - value of R1 on entry
 *                parent - value of R3 on entry
 *                linkage - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400C5 with R2 = 0x4B534154.
 */

extern os_error *xwimp_open_window_nested (wimp_open *open,
      wimp_w parent,
      wimp_window_nesting_flags linkage);
extern void wimp_open_window_nested (wimp_open *open,
      wimp_w parent,
      wimp_window_nesting_flags linkage);

/* ------------------------------------------------------------------------
 * Function:      wimp_open_window_nested_with_flags()
 *
 * Description:   Updates the list of active windows (ones that are to be
 *                displayed), setting new flags and linking to another
 *                window - nested Wimp / RISC O S 3.8+
 *
 * Input:         open - value of R1 on entry
 *                parent - value of R3 on entry
 *                linkage - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400C5 with R2 = 0x4B534154, R4 |= 0x1.
 */

extern os_error *xwimp_open_window_nested_with_flags (wimp_window_state *open,
      wimp_w parent,
      wimp_window_nesting_flags linkage);
extern void wimp_open_window_nested_with_flags (wimp_window_state *open,
      wimp_w parent,
      wimp_window_nesting_flags linkage);

/* ------------------------------------------------------------------------
 * Function:      wimp_close_window()
 *
 * Description:   Removes the specified window from the active list
 *
 * Input:         w - component 0
 *
 * Other notes:   Calls SWI 0x400C6.
 */

extern os_error *xwimp_close_window (wimp_w w);
extern void wimp_close_window (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimp_poll()
 *
 * Description:   Polls the Wimp to see whether certain events have
 *                occurred
 *
 * Input:         mask - value of R0 on entry
 *                block - value of R1 on entry
 *                pollword - value of R3 on entry
 *
 * Output:        event - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C7.
 */

extern os_error *xwimp_poll (wimp_poll_flags mask,
      wimp_block *block,
      int *pollword,
      wimp_event_no *event);
extern wimp_event_no wimp_poll (wimp_poll_flags mask,
      wimp_block *block,
      int *pollword);

/* ------------------------------------------------------------------------
 * Function:      wimp_redraw_window()
 *
 * Description:   Starts a redraw of the parts of a window that are not up
 *                to date
 *
 * Input:         redraw - value of R1 on entry
 *
 * Output:        more - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C8.
 */

extern os_error *xwimp_redraw_window (wimp_draw *redraw,
      osbool *more);
extern osbool wimp_redraw_window (wimp_draw *redraw);

/* ------------------------------------------------------------------------
 * Function:      wimp_update_window()
 *
 * Description:   Starts a redraw of the parts of a window that are up to
 *                date
 *
 * Input:         update - value of R1 on entry
 *
 * Output:        more - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400C9.
 */

extern os_error *xwimp_update_window (wimp_draw *update,
      osbool *more);
extern osbool wimp_update_window (wimp_draw *update);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_rectangle()
 *
 * Description:   Returns the details of the next rectangle of the work
 *                area to be drawn
 *
 * Input:         draw - Partially filled in on entry
 *
 * Output:        more - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400CA.
 */

extern os_error *xwimp_get_rectangle (wimp_draw *draw,
      osbool *more);
extern osbool wimp_get_rectangle (wimp_draw *draw);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_window_state()
 *
 * Description:   Returns a summary of the given window's state
 *
 * Input:         state - Partially filled in on entry
 *
 * Other notes:   Calls SWI 0x400CB with R2 = 0x0.
 */

extern os_error *xwimp_get_window_state (wimp_window_state *state);
extern void wimp_get_window_state (wimp_window_state *state);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_window_state_and_nesting()
 *
 * Description:   Returns a summary of the given window's state and
 *                additionally its window nesting - nested Wimp / RISC O S
 *                3.8+
 *
 * Input:         state - Partially filled in on entry
 *
 * Output:        parent - value of R3 on exit (X version only)
 *                linkage - value of R4 on exit
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400CB with R2 = 0x4B534154.
 */

extern os_error *xwimp_get_window_state_and_nesting (wimp_window_state *state,
      wimp_w *parent,
      bits *linkage);
extern wimp_w wimp_get_window_state_and_nesting (wimp_window_state *state,
      bits *linkage);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_window_info()
 *
 * Description:   Returns complete details of the given window's state
 *
 * Input:         info - Partially filled in on entry
 *
 * Other notes:   Calls SWI 0x400CC.
 */

extern os_error *xwimp_get_window_info (wimp_window_info *info);
extern void wimp_get_window_info (wimp_window_info *info);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_window_info_header_only()
 *
 * Description:   Returns complete details of the given window's state,
 *                excluding icons
 *
 * Input:         info - Partially filled in on entry
 *
 * Other notes:   Calls SWI 0x400CC with R1 |= 0x1.
 */

extern os_error *xwimp_get_window_info_header_only (wimp_window_info *info);
extern void wimp_get_window_info_header_only (wimp_window_info *info);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_icon_state()
 *
 * Description:   Sets a given icon's state held in its flags word
 *
 * Input:         w - component 0
 *                i - component 1
 *                eor_bits - component 2
 *                clear_bits - component 3
 *
 * Other notes:   Calls SWI 0x400CD.
 */

extern os_error *xwimp_set_icon_state (wimp_w w,
      wimp_i i,
      wimp_icon_flags eor_bits,
      wimp_icon_flags clear_bits);
extern void wimp_set_icon_state (wimp_w w,
      wimp_i i,
      wimp_icon_flags eor_bits,
      wimp_icon_flags clear_bits);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_icon_state_from_block()
 *
 * Description:   Sets a given icon's state held in its flags word
 *
 * Input:         block - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400CD.
 */

extern os_error *xwimp_set_icon_state_from_block (wimp_set_icon_state_block const *block);
extern void wimp_set_icon_state_from_block (wimp_set_icon_state_block const *block);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_icon_state()
 *
 * Description:   Returns a given icon's state held in its flags word
 *
 * Input:         icon_state - Partially filled in on entry
 *
 * Other notes:   Calls SWI 0x400CE.
 */

extern os_error *xwimp_get_icon_state (wimp_icon_state *icon_state);
extern void wimp_get_icon_state (wimp_icon_state *icon_state);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_pointer_info()
 *
 * Description:   Returns the position of the pointer and the state of the
 *                mouse buttons
 *
 * Input:         pointer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400CF.
 */

extern os_error *xwimp_get_pointer_info (wimp_pointer *pointer);
extern void wimp_get_pointer_info (wimp_pointer *pointer);

/* ------------------------------------------------------------------------
 * Function:      wimp_drag_box()
 *
 * Description:   Initiates or cancels a dragging operation
 *
 * Input:         drag - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D0.
 */

extern os_error *xwimp_drag_box (wimp_drag const *drag);
extern void wimp_drag_box (wimp_drag const *drag);

/* ------------------------------------------------------------------------
 * Function:      wimp_drag_box_with_flags()
 *
 * Description:   Initiates or cancels a dragging operation, setting new
 *                flags - RISC O S 4+
 *
 * Input:         drag - value of R1 on entry
 *                flags - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400D0 with R2 = 0x4B534154.
 */

extern os_error *xwimp_drag_box_with_flags (wimp_drag const *drag,
      wimp_drag_box_flags flags);
extern void wimp_drag_box_with_flags (wimp_drag const *drag,
      wimp_drag_box_flags flags);

/* ------------------------------------------------------------------------
 * Function:      wimp_force_redraw()
 *
 * Description:   Forces an area of a window or the screen to be redrawn
 *                later
 *
 * Input:         w - value of R0 on entry
 *                x0 - value of R1 on entry
 *                y0 - value of R2 on entry
 *                x1 - value of R3 on entry
 *                y1 - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400D1.
 */

extern os_error *xwimp_force_redraw (wimp_w w,
      int x0,
      int y0,
      int x1,
      int y1);
extern void wimp_force_redraw (wimp_w w,
      int x0,
      int y0,
      int x1,
      int y1);

/* ------------------------------------------------------------------------
 * Function:      wimp_force_redraw_furniture()
 *
 * Description:   Forces redraw of a single part of the furniture for a
 *                window - reserved; nested Wimp / RISC O S 3.8+
 *
 * Input:         w - value of R0 on entry
 *                item - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400D1 with R1 = 0x4B534154.
 */

extern os_error *xwimp_force_redraw_furniture (wimp_w w,
      wimp_furniture item);
extern void wimp_force_redraw_furniture (wimp_w w,
      wimp_furniture item);

/* ------------------------------------------------------------------------
 * Function:      wimp_force_redraw_title()
 *
 * Description:   Forces redraw of title for a window - nested Wimp / RISC
 *                O S 3.8+
 *
 * Input:         w - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400D1 with R1 = 0x4B534154, R2 = 0x3.
 */

extern os_error *xwimp_force_redraw_title (wimp_w w);
extern void wimp_force_redraw_title (wimp_w w);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_caret_position()
 *
 * Description:   Sets up the data for a new caret position, and redraws it
 *                there
 *
 * Input:         w - value of R0 on entry
 *                i - value of R1 on entry
 *                x - value of R2 on entry
 *                y - value of R3 on entry
 *                height - value of R4 on entry
 *                index - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400D2.
 */

extern os_error *xwimp_set_caret_position (wimp_w w,
      wimp_i i,
      int x,
      int y,
      int height,
      int index);
extern void wimp_set_caret_position (wimp_w w,
      wimp_i i,
      int x,
      int y,
      int height,
      int index);

/* ------------------------------------------------------------------------
 * Function:      wimpsetcaretpositionextended_caret()
 *
 * Description:   Sets the caret position - RISC O S 4.36+
 *
 * Input:         caret - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D2 with R0 = 0x4B534154, R2 = 0x0.
 */

extern os_error *xwimpsetcaretpositionextended_caret (wimp_caret const *caret);
extern void wimpsetcaretpositionextended_caret (wimp_caret const *caret);

/* ------------------------------------------------------------------------
 * Function:      wimpsetcaretpositionextended_selection()
 *
 * Description:   Sets the text selection position - RISC O S 4.36+
 *
 * Input:         selection - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D2 with R0 = 0x4B534154, R2 = 0x2.
 */

extern os_error *xwimpsetcaretpositionextended_selection (wimp_text_selection const *selection);
extern void wimpsetcaretpositionextended_selection (wimp_text_selection const *selection);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_caret_position()
 *
 * Description:   Returns details of the caret's state
 *
 * Input:         caret - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D3.
 */

extern os_error *xwimp_get_caret_position (wimp_caret *caret);
extern void wimp_get_caret_position (wimp_caret *caret);

/* ------------------------------------------------------------------------
 * Function:      wimpgetcaretpositionextended_caret()
 *
 * Description:   Returns details of the caret's state - RISC O S 4.36+
 *
 * Input:         caret - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D3 with R0 = 0x4B534154, R2 = 0x0.
 */

extern os_error *xwimpgetcaretpositionextended_caret (wimp_caret *caret);
extern void wimpgetcaretpositionextended_caret (wimp_caret *caret);

/* ------------------------------------------------------------------------
 * Function:      wimpgetcaretpositionextended_selection()
 *
 * Description:   Returns details of the text selection - RISC O S 4.36+
 *
 * Input:         selection - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D3 with R0 = 0x4B534154, R2 = 0x2.
 */

extern os_error *xwimpgetcaretpositionextended_selection (wimp_text_selection *selection);
extern void wimpgetcaretpositionextended_selection (wimp_text_selection *selection);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_menu()
 *
 * Description:   Creates a menu structure
 *
 * Input:         menu - value of R1 on entry
 *                x - value of R2 on entry
 *                y - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400D4.
 */

extern os_error *xwimp_create_menu (wimp_menu *menu,
      int x,
      int y);
extern void wimp_create_menu (wimp_menu *menu,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      wimp_decode_menu()
 *
 * Description:   Converts a numerical list of menu selections to a string
 *                containing their text
 *
 * Input:         menu - value of R1 on entry
 *                selection - value of R2 on entry
 *                decode - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400D5.
 */

extern os_error *xwimp_decode_menu (wimp_menu const *menu,
      wimp_selection const *selection,
      char *decode);
extern void wimp_decode_menu (wimp_menu const *menu,
      wimp_selection const *selection,
      char *decode);

/* ------------------------------------------------------------------------
 * Function:      wimp_which_icon()
 *
 * Description:   Searches for icons that match a given flags word
 *
 * Input:         w - value of R0 on entry
 *                which - value of R1 on entry
 *                mask - value of R2 on entry
 *                match - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400D6.
 */

extern os_error *xwimp_which_icon (wimp_w w,
      wimp_i *which,
      wimp_icon_flags mask,
      wimp_icon_flags match);
__swi (0x400D6) void wimp_which_icon (wimp_w w,
      wimp_i *which,
      wimp_icon_flags mask,
      wimp_icon_flags match);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_extent()
 *
 * Description:   Sets the work area extent of a given window
 *
 * Input:         w - value of R0 on entry
 *                box - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D7.
 */

extern os_error *xwimp_set_extent (wimp_w w,
      os_box const *box);
__swi (0x400D7) void wimp_set_extent (wimp_w w,
      os_box const *box);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_pointer_shape()
 *
 * Description:   Sets the shape and active point of the pointer (prefer
 *                WimpSpriteOp_SetPointerShape
 *
 * Input:         shape_no - value of R0 on entry
 *                shape_data - value of R1 on entry
 *                width - value of R2 on entry
 *                height - value of R3 on entry
 *                xactive - value of R4 on entry
 *                yactive - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400D8.
 */

extern os_error *xwimp_set_pointer_shape (int shape_no,
      byte const *shape_data,
      int width,
      int height,
      int xactive,
      int yactive);
extern void wimp_set_pointer_shape (int shape_no,
      byte const *shape_data,
      int width,
      int height,
      int xactive,
      int yactive);

/* ------------------------------------------------------------------------
 * Function:      wimp_open_template()
 *
 * Description:   Opens a specified template file
 *
 * Input:         file_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400D9.
 */

extern os_error *xwimp_open_template (char const *file_name);
extern void wimp_open_template (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      wimp_close_template()
 *
 * Description:   Closes the currently open template file
 *
 * Other notes:   Calls SWI 0x400DA.
 */

extern os_error *xwimp_close_template (void);
__swi (0x400DA) void wimp_close_template (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_load_template()
 *
 * Description:   Loads a template
 *
 * Input:         window - pointer to buffer for template, or Wimp_GetSize to return required buffer size
 *                data - value of R2 on entry
 *                end - value of R3 on entry
 *                font_ref - value of R4 on entry
 *                name - pointer to a (wildcarded) name to match (must be 12 bytes word-aligned)
 *                context - value of R6 on entry
 *
 * Output:        used - value of R1 on exit
 *                data_used - value of R2 on exit
 *                context_out - value of R6 on exit (X version only)
 *
 * Returns:       R6 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400DB.
 */

extern os_error *xwimp_load_template (wimp_window *window,
      char *data,
      char const *end,
      byte *font_ref,
      char *name,
      int context,
      int *used,
      int *data_used,
      int *context_out);
extern int wimp_load_template (wimp_window *window,
      char *data,
      char const *end,
      byte *font_ref,
      char *name,
      int context,
      int *used,
      int *data_used);

/* ------------------------------------------------------------------------
 * Function:      wimp_process_key()
 *
 * Description:   Creates or passes on key presses
 *
 * Input:         c - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400DC.
 */

extern os_error *xwimp_process_key (wimp_key_no c);
__swi (0x400DC) void wimp_process_key (wimp_key_no c);

/* ------------------------------------------------------------------------
 * Function:      wimp_close_down()
 *
 * Description:   Informs the Wimp that a task is about to terminate
 *
 * Input:         t - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400DD with R1 = 0x4B534154.
 */

extern os_error *xwimp_close_down (wimp_t t);
extern void wimp_close_down (wimp_t t);

/* ------------------------------------------------------------------------
 * Function:      wimp_start_task()
 *
 * Description:   Starts a 'child' task from within another program
 *
 * Input:         command - value of R0 on entry
 *
 * Output:        t - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400DE.
 */

extern os_error *xwimp_start_task (char const *command,
      wimp_t *t);
__swi (0x400DE) wimp_t wimp_start_task (char const *command);

/* ------------------------------------------------------------------------
 * Function:      wimp_report_error()
 *
 * Description:   Reports an error
 *
 * Input:         error - value of R0 on entry
 *                flags - value of R1 on entry
 *                name - value of R2 on entry
 *
 * Output:        click - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400DF.
 */

extern os_error *xwimp_report_error (os_error const *error,
      wimp_error_box_flags flags,
      char const *name,
      wimp_error_box_selection *click);
extern wimp_error_box_selection wimp_report_error (os_error const *error,
      wimp_error_box_flags flags,
      char const *name);

/* ------------------------------------------------------------------------
 * Function:      wimp_report_error_by_category()
 *
 * Description:   Reports an error of a given category
 *
 * Input:         error - value of R0 on entry
 *                flags - value of R1 on entry
 *                name - value of R2 on entry
 *                sprite_name - value of R3 on entry
 *                area - value of R4 on entry
 *                buttons - value of R5 on entry
 *
 * Output:        click - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400DF with R1 |= 0x100.
 */

extern os_error *xwimp_report_error_by_category (os_error const *error,
      wimp_error_box_flags flags,
      char const *name,
      char const *sprite_name,
      osspriteop_area const *area,
      char const *buttons,
      wimp_error_box_selection *click);
extern wimp_error_box_selection wimp_report_error_by_category (os_error const *error,
      wimp_error_box_flags flags,
      char const *name,
      char const *sprite_name,
      osspriteop_area const *area,
      char const *buttons);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_window_outline()
 *
 * Description:   Gets the bounding box for a window
 *
 * Input:         outline - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400E0.
 */

extern os_error *xwimp_get_window_outline (wimp_outline *outline);
extern void wimp_get_window_outline (wimp_outline *outline);

/* ------------------------------------------------------------------------
 * Function:      wimp_poll_idle()
 *
 * Description:   Polls the Wimp, sleeping unless certain events have
 *                occurred
 *
 * Input:         mask - value of R0 on entry
 *                block - value of R1 on entry
 *                t - value of R2 on entry
 *                pollword - value of R3 on entry
 *
 * Output:        event - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400E1.
 */

extern os_error *xwimp_poll_idle (wimp_poll_flags mask,
      wimp_block *block,
      os_t t,
      int *pollword,
      wimp_event_no *event);
__swi (0x400E1) wimp_event_no wimp_poll_idle (wimp_poll_flags mask,
      wimp_block *block,
      os_t t,
      int *pollword);

/* ------------------------------------------------------------------------
 * Function:      wimp_plot_icon()
 *
 * Description:   Plots an icon in a window during a window redraw or
 *                update loop
 *
 * Input:         icon - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400E2.
 */

extern os_error *xwimp_plot_icon (wimp_icon const *icon);
extern void wimp_plot_icon (wimp_icon const *icon);

/* ------------------------------------------------------------------------
 * Function:      wimp_plot_icon_with_window()
 *
 * Description:   Plots an icon taking the context from a window if used
 *                outside an update loop - RISC O S 4+
 *
 * Input:         icon - value of R1 on entry
 *                x_origin - value of R3 on entry
 *                y_origin - value of R4 on entry
 *                flags - value of R5 on entry
 *                window - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x400E2 with R2 = 0x4B534154.
 */

extern os_error *xwimp_plot_icon_with_window (wimp_icon const *icon,
      int x_origin,
      int y_origin,
      wimp_plot_icon_flags flags,
      wimp_w window);
extern void wimp_plot_icon_with_window (wimp_icon const *icon,
      int x_origin,
      int y_origin,
      wimp_plot_icon_flags flags,
      wimp_w window);

/* ------------------------------------------------------------------------
 * Function:      wimp_plot_icon_with_sprite_area()
 *
 * Description:   Plots an icon taking the context from a window if used
 *                outside an update loop and using the specified sprite
 *                area - RISC O S 4+
 *
 * Input:         icon - value of R1 on entry
 *                x_origin - value of R3 on entry
 *                y_origin - value of R4 on entry
 *                flags - value of R5 on entry
 *                background_colour - value of R6 on entry
 *                sprite_area - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400E2 with R2 = 0x4B534154, R5 |= 0x1.
 */

extern os_error *xwimp_plot_icon_with_sprite_area (wimp_icon const *icon,
      int x_origin,
      int y_origin,
      wimp_plot_icon_flags flags,
      wimp_colour background_colour,
      osspriteop_area const *sprite_area);
extern void wimp_plot_icon_with_sprite_area (wimp_icon const *icon,
      int x_origin,
      int y_origin,
      wimp_plot_icon_flags flags,
      wimp_colour background_colour,
      osspriteop_area const *sprite_area);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_mode()
 *
 * Description:   Changes the display mode used by the Wimp
 *
 * Input:         mode - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400E3.
 */

extern os_error *xwimp_set_mode (os_mode mode);
__swi (0x400E3) void wimp_set_mode (os_mode mode);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_palette()
 *
 * Description:   Sets the palette
 *
 * Input:         palette - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400E4.
 */

extern os_error *xwimp_set_palette (os_palette const *palette);
extern void wimp_set_palette (os_palette const *palette);

/* ------------------------------------------------------------------------
 * Function:      wimp_read_palette()
 *
 * Description:   Reads the palette
 *
 * Input:         palette - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400E5 with R2 = 0x0.
 */

extern os_error *xwimp_read_palette (os_palette *palette);
extern void wimp_read_palette (os_palette *palette);

/* ------------------------------------------------------------------------
 * Function:      wimp_read_true_palette()
 *
 * Description:   Reads the palette, returning true colour values
 *
 * Input:         palette - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400E5 with R2 = 0x45555254.
 */

extern os_error *xwimp_read_true_palette (os_palette *palette);
extern void wimp_read_true_palette (os_palette *palette);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_colour()
 *
 * Description:   Sets the current graphics foreground or background colour
 *                and action
 *
 * Input:         colour - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400E6.
 */

extern os_error *xwimp_set_colour (wimp_colour colour);
__swi (0x400E6) void wimp_set_colour (wimp_colour colour);

/* ------------------------------------------------------------------------
 * Function:      wimp_send_message()
 *
 * Description:   Sends a message to a task, or broadcasts to all tasks
 *
 * Input:         event - value of R0 on entry
 *                message - Message or other event block
 *                to - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400E7.
 */

extern os_error *xwimp_send_message (wimp_event_no event,
      wimp_message *message,
      wimp_t to);
__swi (0x400E7) void wimp_send_message (wimp_event_no event,
      wimp_message *message,
      wimp_t to);

/* ------------------------------------------------------------------------
 * Function:      wimp_send_message_to_window()
 *
 * Description:   Sends a message to the task that created a window
 *
 * Input:         event - value of R0 on entry
 *                message - Message or other event block
 *                to_w - value of R2 on entry
 *                to_i - value of R3 on entry
 *
 * Output:        to_t - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400E7.
 */

extern os_error *xwimp_send_message_to_window (wimp_event_no event,
      wimp_message *message,
      wimp_w to_w,
      wimp_i to_i,
      wimp_t *to_t);
extern wimp_t wimp_send_message_to_window (wimp_event_no event,
      wimp_message *message,
      wimp_w to_w,
      wimp_i to_i);

/* ------------------------------------------------------------------------
 * Function:      wimp_create_sub_menu()
 *
 * Description:   Creates a submenu
 *
 * Input:         sub_menu - value of R1 on entry
 *                x - value of R2 on entry
 *                y - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400E8.
 */

extern os_error *xwimp_create_sub_menu (wimp_menu *sub_menu,
      int x,
      int y);
extern void wimp_create_sub_menu (wimp_menu *sub_menu,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      wimp_base_of_sprites()
 *
 * Description:   Finds the addresses of the ROM and RAM parts of the
 *                Wimp's sprite pool
 *
 * Output:        rom - value of R0 on exit
 *                ram - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x400EA.
 */

extern os_error *xwimp_base_of_sprites (osspriteop_area **rom,
      osspriteop_area **ram);
extern void wimp_base_of_sprites (osspriteop_area **rom,
      osspriteop_area **ram);

/* ------------------------------------------------------------------------
 * Function:      wimp_block_copy()
 *
 * Description:   Copies a block of work area space to another position
 *
 * Input:         w - value of R0 on entry
 *                x0 - value of R1 on entry
 *                y0 - value of R2 on entry
 *                x1 - value of R3 on entry
 *                y1 - value of R4 on entry
 *                X0 - value of R5 on entry
 *                Y0 - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x400EB.
 */

extern os_error *xwimp_block_copy (wimp_w w,
      int x0,
      int y0,
      int x1,
      int y1,
      int X0,
      int Y0);
extern void wimp_block_copy (wimp_w w,
      int x0,
      int y0,
      int x1,
      int y1,
      int X0,
      int Y0);

/* ------------------------------------------------------------------------
 * Function:      wimp_slot_size()
 *
 * Description:   Reads or sets the size of the current slot, the next
 *                slot, and the Wimp free pool
 *
 * Input:         new_curr_slot - value of R0 on entry
 *                new_next_slot - value of R1 on entry
 *
 * Output:        curr_slot - value of R0 on exit
 *                next_slot - value of R1 on exit
 *                free_slot - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x400EC.
 */

extern os_error *xwimp_slot_size (int new_curr_slot,
      int new_next_slot,
      int *curr_slot,
      int *next_slot,
      int *free_slot);
extern void wimp_slot_size (int new_curr_slot,
      int new_next_slot,
      int *curr_slot,
      int *next_slot,
      int *free_slot);

/* ------------------------------------------------------------------------
 * Function:      wimp_read_pix_trans()
 *
 * Description:   Reads pixel translation table for a given sprite
 *
 * Input:         flags - value of R0 on entry
 *                area - value of R1 on entry
 *                id - value of R2 on entry
 *                factors - value of R6 on entry
 *                trans_tab - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x400ED.
 */

extern os_error *xwimp_read_pix_trans (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      os_factors *factors,
      osspriteop_trans_tab *trans_tab);
extern void wimp_read_pix_trans (osspriteop_flags flags,
      osspriteop_area const *area,
      osspriteop_id id,
      os_factors *factors,
      osspriteop_trans_tab *trans_tab);

/* ------------------------------------------------------------------------
 * Function:      wimpclaimfreememory_alloc()
 *
 * Description:   Claims the whole of the Wimp's free memory pool for the
 *                calling task - Deprecated under Risc OS 3.7+
 *
 * Input:         size - value of R1 on entry
 *
 * Output:        size_out - value of R1 on exit
 *                blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400EE with R0 = 0x1.
 */

extern os_error *xwimpclaimfreememory_alloc (int size,
      int *size_out,
      void **blk);
extern void *wimpclaimfreememory_alloc (int size,
      int *size_out);

/* ------------------------------------------------------------------------
 * Function:      wimpclaimfreememory_free()
 *
 * Description:   Releases the Wimp's free memory pool - Deprecated under
 *                Risc OS 3.7+
 *
 * Other notes:   Calls SWI 0x400EE with R0 = 0x0.
 */

extern os_error *xwimpclaimfreememory_free (void);
extern void wimpclaimfreememory_free (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_command_window()
 *
 * Description:   Opens a text window in which normal VDU 4-type text can
 *                be displayed
 *
 * Input:         op - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400EF.
 */

extern os_error *xwimp_command_window (char const *op);
__swi (0x400EF) void wimp_command_window (char const *op);

/* ------------------------------------------------------------------------
 * Function:      wimp_command_window_activate()
 *
 * Description:   Set the command window status to active
 *
 * Other notes:   Calls SWI 0x400EF with R0 = 0x1.
 */

extern os_error *xwimp_command_window_activate (void);
extern void wimp_command_window_activate (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_command_window_close_with_prompt()
 *
 * Description:   Close the command window, prompting first if any ouput
 *                had been produced
 *
 * Other notes:   Calls SWI 0x400EF with R0 = 0x0.
 */

extern os_error *xwimp_command_window_close_with_prompt (void);
extern void wimp_command_window_close_with_prompt (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_command_window_close()
 *
 * Description:   Close the command window without prompting
 *
 * Other notes:   Calls SWI 0x400EF with R0 = 0xFFFFFFFF.
 */

extern os_error *xwimp_command_window_close (void);
extern void wimp_command_window_close (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_command_window_read_state()
 *
 * Description:   Read the command window state - RISC O S Select
 *
 * Output:        state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400EF with R0 = 0x2.
 */

extern os_error *xwimp_command_window_read_state (wimp_command_window_state *state);
extern wimp_command_window_state wimp_command_window_read_state (void);

/* ------------------------------------------------------------------------
 * Function:      wimp_text_colour()
 *
 * Description:   Sets the text foreground or background colour
 *
 * Input:         colour - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400F0.
 */

extern os_error *xwimp_text_colour (wimp_colour colour);
__swi (0x400F0) void wimp_text_colour (wimp_colour colour);

/* ------------------------------------------------------------------------
 * Function:      wimp_transfer_block()
 *
 * Description:   Copies a block of memory from one task's address space to
 *                another's
 *
 * Input:         from_t - value of R0 on entry
 *                from - value of R1 on entry
 *                to_t - value of R2 on entry
 *                to - value of R3 on entry
 *                len - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400F1.
 */

extern os_error *xwimp_transfer_block (wimp_t from_t,
      byte *from,
      wimp_t to_t,
      byte *to,
      int len);
extern void wimp_transfer_block (wimp_t from_t,
      byte *from,
      wimp_t to_t,
      byte *to,
      int len);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_font_colours()
 *
 * Description:   Sets the anti-aliases font colours from the two (standard
 *                Wimp) colours specified
 *
 * Input:         fg - value of R1 on entry
 *                bg - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400F3.
 */

extern os_error *xwimp_set_font_colours (wimp_colour fg,
      wimp_colour bg);
extern void wimp_set_font_colours (wimp_colour fg,
      wimp_colour bg);

/* ------------------------------------------------------------------------
 * Function:      wimp_get_menu_state()
 *
 * Description:   Gets the state of a menu, showing which item is selected
 *
 * Input:         flags - value of R0 on entry
 *                selection - value of R1 on entry
 *                w - value of R2 on entry
 *                i - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x400F4.
 */

extern os_error *xwimp_get_menu_state (wimp_menu_state_flags flags,
      wimp_selection *selection,
      wimp_w w,
      wimp_i i);
__swi (0x400F4) void wimp_get_menu_state (wimp_menu_state_flags flags,
      wimp_selection *selection,
      wimp_w w,
      wimp_i i);

/* ------------------------------------------------------------------------
 * Function:      wimp_register_filter()
 *
 * Description:   Used by the Filter Manager to register or deregister a
 *                filter with the Wimp
 *
 * Input:         type - value of R0 on entry
 *                filter_code - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400F5.
 */

extern os_error *xwimp_register_filter (wimp_filter_action type,
      void const *filter_code,
      byte *handle);
__swi (0x400F5) void wimp_register_filter (wimp_filter_action type,
      void const *filter_code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      wimp_add_messages()
 *
 * Description:   Adds messages to the list of those known by a certain
 *                task
 *
 * Input:         messages - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400F6.
 */

extern os_error *xwimp_add_messages (wimp_message_list const *messages);
__swi (0x400F6) void wimp_add_messages (wimp_message_list const *messages);

/* ------------------------------------------------------------------------
 * Function:      wimp_remove_messages()
 *
 * Description:   Removes messages from the list of those known by a
 *                certain task
 *
 * Input:         messages - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x400F7.
 */

extern os_error *xwimp_remove_messages (wimp_message_list const *messages);
__swi (0x400F7) void wimp_remove_messages (wimp_message_list const *messages);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_colour_mapping()
 *
 * Description:   Changes the mapping between Wimp colours and physical
 *                colours
 *
 * Input:         palette - value of R1 on entry
 *                map2 - value of R2 on entry
 *                map4 - value of R3 on entry
 *                map16 - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x400F8 with R5 = 0x0, R6 = 0x0, R7 = 0x0.
 */

extern os_error *xwimp_set_colour_mapping (os_palette const *palette,
      byte const *map2,
      byte const *map4,
      byte const *map16);
extern void wimp_set_colour_mapping (os_palette const *palette,
      byte const *map2,
      byte const *map4,
      byte const *map16);

/* ------------------------------------------------------------------------
 * Function:      wimptextop_set_colour()
 *
 * Description:   Sets the colour to use for text plotting with
 *                WimpTextOp_Paint
 *
 * Input:         fg - value of R1 on entry
 *                bg - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x400F9 with R0 = 0x0.
 */

extern os_error *xwimptextop_set_colour (os_colour fg,
      os_colour bg);
extern void wimptextop_set_colour (os_colour fg,
      os_colour bg);

/* ------------------------------------------------------------------------
 * Function:      wimptextop_string_width()
 *
 * Description:   Gets the width of a string for the current desktop font
 *
 * Input:         s - value of R1 on entry
 *                len - value of R2 on entry
 *
 * Output:        width - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400F9 with R0 = 0x1.
 */

extern os_error *xwimptextop_string_width (char const *s,
      int len,
      int *width);
extern int wimptextop_string_width (char const *s,
      int len);

/* ------------------------------------------------------------------------
 * Function:      wimptextop_string_width_with_flags()
 *
 * Description:   Gets the width of a string for the current desktop font
 *
 * Input:         flags - value of R0 on entry
 *                s - value of R1 on entry
 *                len - value of R2 on entry
 *
 * Output:        width - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400F9 with R0 |= 0x1.
 */

extern os_error *xwimptextop_string_width_with_flags (wimptextop_string_width_flags flags,
      char const *s,
      int len,
      int *width);
extern int wimptextop_string_width_with_flags (wimptextop_string_width_flags flags,
      char const *s,
      int len);

/* ------------------------------------------------------------------------
 * Function:      wimptextop_paint()
 *
 * Description:   Plots text on the screen using the current desktop font
 *
 * Input:         flags - value of R0 on entry
 *                s - value of R1 on entry
 *                x0 - value of R4 on entry
 *                y0 - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400F9 with R0 |= 0x2, R2 = 0xFFFFFFFF, R3 = 0xFFFFFFFF.
 */

extern os_error *xwimptextop_paint (wimptextop_paint_flags flags,
      char const *s,
      int x0,
      int y0);
extern void wimptextop_paint (wimptextop_paint_flags flags,
      char const *s,
      int x0,
      int y0);

/* ------------------------------------------------------------------------
 * Function:      wimp_set_watchdog_state()
 *
 * Description:   Sets the state of the Wimp's watchdog
 *
 * Input:         enable - value of R0 on entry
 *                code_word - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x400FA.
 */

extern os_error *xwimp_set_watchdog_state (osbool enable,
      int code_word);
__swi (0x400FA) void wimp_set_watchdog_state (osbool enable,
      int code_word);

/* ------------------------------------------------------------------------
 * Function:      wimp_resize_icon()
 *
 * Description:   Changes the bounding box of an icon
 *
 * Input:         w - value of R0 on entry
 *                i - value of R1 on entry
 *                x0 - value of R2 on entry
 *                y0 - value of R3 on entry
 *                x1 - value of R4 on entry
 *                y1 - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x400FC.
 */

extern os_error *xwimp_resize_icon (wimp_w w,
      wimp_i i,
      int x0,
      int y0,
      int x1,
      int y1);
extern void wimp_resize_icon (wimp_w w,
      wimp_i i,
      int x0,
      int y0,
      int x1,
      int y1);

/* ------------------------------------------------------------------------
 * Function:      wimp_auto_scroll()
 *
 * Description:   Configure window auto scrolling - RISC O S 4+
 *
 * Input:         flags - value of R0 on entry
 *                info - value of R1 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x400FD.
 */

extern os_error *xwimp_auto_scroll (wimp_auto_scroll_flags flags,
      wimp_auto_scroll_info *info,
      wimp_auto_scroll_flags *flags_out);
__swi (0x400FD) wimp_auto_scroll_flags wimp_auto_scroll (wimp_auto_scroll_flags flags,
      wimp_auto_scroll_info *info);

/* ------------------------------------------------------------------------
 * Function:      service_memory()
 *
 * Description:   Memory controller about to be remapped
 *
 * Input:         change - value of R0 on entry
 *                cao - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x11.
 */

extern os_error *xservice_memory (int change,
      byte *cao);
extern void service_memory (int change,
      byte *cao);

/* ------------------------------------------------------------------------
 * Function:      service_start_wimp()
 *
 * Description:   Start up any resident module tasks using Wimp_StartTask
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x49.
 */

extern os_error *xservice_start_wimp (void);
extern void service_start_wimp (void);

/* ------------------------------------------------------------------------
 * Function:      service_started_wimp()
 *
 * Description:   Request to task modules to set task_handle variable to 0
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4A.
 */

extern os_error *xservice_started_wimp (void);
extern void service_started_wimp (void);

/* ------------------------------------------------------------------------
 * Function:      service_mouse_trap()
 *
 * Description:   The Wimp has detected a significant mouse movement
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x52.
 */

extern os_error *xservice_mouse_trap (void);
extern void service_mouse_trap (void);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_close_down()
 *
 * Description:   Notification the the Wimp is about to close down a task
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x53.
 */

extern os_error *xservice_wimp_close_down (void);
extern void service_wimp_close_down (void);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_report_error()
 *
 * Description:   Request to suspend trapping of VDU output so an error can
 *                be displayed
 *
 * Input:         opening - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x57.
 */

extern os_error *xservice_wimp_report_error (osbool opening);
extern void service_wimp_report_error (osbool opening);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_save_desktop()
 *
 * Description:   Save some state to a desktop boot file. Prefer
 *                Service_WimpSaveDesktopW
 *
 * Input:         flags - value of R0 on entry
 *                file - value of R2 on entry
 *
 * Output:        error - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5C.
 */

extern os_error *xservice_wimp_save_desktop (wimp_save_desktop_flags flags,
      os_f file,
      os_error **error,
      osbool *unclaimed);
extern osbool service_wimp_save_desktop (wimp_save_desktop_flags flags,
      os_f file,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_save_desktopw()
 *
 * Description:   Save some state to a desktop boot file. Uses 32-bit file
 *                handle.
 *
 * Input:         flags - value of R0 on entry
 *                file - value of R2 on entry
 *
 * Output:        error - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5C.
 */

extern os_error *xservice_wimp_save_desktopw (wimp_save_desktop_flags flags,
      os_fw file,
      os_error **error,
      osbool *unclaimed);
extern osbool service_wimp_save_desktopw (wimp_save_desktop_flags flags,
      os_fw file,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_palette()
 *
 * Description:   Palette change
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5D.
 */

extern os_error *xservice_wimp_palette (void);
extern void service_wimp_palette (void);

/* ------------------------------------------------------------------------
 * Function:      service_desktop_welcome()
 *
 * Description:   Desktop starting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x7C.
 */

extern os_error *xservice_desktop_welcome (void);
extern void service_desktop_welcome (void);

/* ------------------------------------------------------------------------
 * Function:      service_shut_down()
 *
 * Description:   Task Manager shutting down
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x7E.
 */

extern os_error *xservice_shut_down (void);
extern void service_shut_down (void);

/* ------------------------------------------------------------------------
 * Function:      service_shut_down_complete()
 *
 * Description:   Shutdown complete
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x80.
 */

extern os_error *xservice_shut_down_complete (void);
extern void service_shut_down_complete (void);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_sprites_moved()
 *
 * Description:   Wimp sprite pools have moved
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x85.
 */

extern os_error *xservice_wimp_sprites_moved (void);
extern void service_wimp_sprites_moved (void);

/* ------------------------------------------------------------------------
 * Function:      service_wimp_register_filters()
 *
 * Description:   Allows the Filter Manager to install filters with the
 *                Wimp
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x86.
 */

extern os_error *xservice_wimp_register_filters (void);
extern void service_wimp_register_filters (void);

/* ------------------------------------------------------------------------
 * Function:      service_error_starting()
 *
 * Description:   Issued immediately after Wimp_ReportError is called
 *
 * Input:         error - value of R2 on entry
 *                flags - value of R3 on entry
 *                name - value of R4 on entry
 *                sprite_name - value of R5 on entry
 *                area - value of R6 on entry
 *                buttons - value of R7 on entry
 *
 * Output:        error_out - value of R2 on exit
 *                flags_out - value of R3 on exit
 *                name_out - value of R4 on exit
 *                sprite_name_out - value of R5 on exit
 *                area_out - value of R6 on exit
 *                buttons_out - value of R7 on exit
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x400C0.
 */

extern os_error *xservice_error_starting (os_error const *error,
      wimp_error_box_flags flags,
      char const *name,
      char const *sprite_name,
      osspriteop_area const *area,
      char const *buttons,
      os_error **error_out,
      wimp_error_box_flags *flags_out,
      char **name_out,
      char **sprite_name_out,
      osspriteop_area **area_out,
      char **buttons_out);
extern void service_error_starting (os_error const *error,
      wimp_error_box_flags flags,
      char const *name,
      char const *sprite_name,
      osspriteop_area const *area,
      char const *buttons,
      os_error **error_out,
      wimp_error_box_flags *flags_out,
      char **name_out,
      char **sprite_name_out,
      osspriteop_area **area_out,
      char **buttons_out);

/* ------------------------------------------------------------------------
 * Function:      service_error_button_pressed()
 *
 * Description:   Issued when any button on the error report is pressed
 *
 * Input:         button - value of R2 on entry
 *                button_list - value of R3 on entry
 *
 * Output:        redisplay - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *                button_out - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0x400C1.
 */

extern os_error *xservice_error_button_pressed (wimp_error_box_selection button,
      char const *button_list,
      osbool *redisplay,
      osbool *unclaimed,
      wimp_error_box_selection *button_out);
extern osbool service_error_button_pressed (wimp_error_box_selection button,
      char const *button_list,
      osbool *redisplay,
      wimp_error_box_selection *button_out);

/* ------------------------------------------------------------------------
 * Function:      service_error_ending()
 *
 * Description:   Issued immediately before an error report closes
 *
 * Input:         button - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                button_out - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x400C2.
 */

extern os_error *xservice_error_ending (wimp_error_box_selection button,
      osbool *unclaimed,
      wimp_error_box_selection *button_out);
extern osbool service_error_ending (wimp_error_box_selection button,
      wimp_error_box_selection *button_out);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef wimp32_H
#include "oslib/wimp32.h"
#endif

#endif
