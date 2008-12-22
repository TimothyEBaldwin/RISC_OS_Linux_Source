#ifndef toolbox_H
#define toolbox_H

/* C header file for Toolbox
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Sept 1995
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#ifndef messagetrans_H
#include "oslib/messagetrans.h"
#endif

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Toolbox_CreateObject
#define Toolbox_CreateObject                    0x44EC0
#undef  XToolbox_CreateObject
#define XToolbox_CreateObject                   0x64EC0
#undef  Toolbox_CreateObjectFromTemplate
#define Toolbox_CreateObjectFromTemplate        0x44EC0
#undef  XToolbox_CreateObjectFromTemplate
#define XToolbox_CreateObjectFromTemplate       0x64EC0
#undef  Toolbox_DeleteObject
#define Toolbox_DeleteObject                    0x44EC1
#undef  XToolbox_DeleteObject
#define XToolbox_DeleteObject                   0x64EC1
#undef  Toolbox_ShowObject
#define Toolbox_ShowObject                      0x44EC3
#undef  XToolbox_ShowObject
#define XToolbox_ShowObject                     0x64EC3
#undef  Toolbox_HideObject
#define Toolbox_HideObject                      0x44EC4
#undef  XToolbox_HideObject
#define XToolbox_HideObject                     0x64EC4
#undef  Toolbox_GetObjectInfo
#define Toolbox_GetObjectInfo                   0x44EC5
#undef  XToolbox_GetObjectInfo
#define XToolbox_GetObjectInfo                  0x64EC5
#undef  Toolbox_ObjectMiscOp
#define Toolbox_ObjectMiscOp                    0x44EC6
#undef  XToolbox_ObjectMiscOp
#define XToolbox_ObjectMiscOp                   0x64EC6
#undef  Toolbox_SetClientHandle
#define Toolbox_SetClientHandle                 0x44EC7
#undef  XToolbox_SetClientHandle
#define XToolbox_SetClientHandle                0x64EC7
#undef  Toolbox_GetClientHandle
#define Toolbox_GetClientHandle                 0x44EC8
#undef  XToolbox_GetClientHandle
#define XToolbox_GetClientHandle                0x64EC8
#undef  Toolbox_GetObjectClass
#define Toolbox_GetObjectClass                  0x44EC9
#undef  XToolbox_GetObjectClass
#define XToolbox_GetObjectClass                 0x64EC9
#undef  Toolbox_GetParent
#define Toolbox_GetParent                       0x44ECA
#undef  XToolbox_GetParent
#define XToolbox_GetParent                      0x64ECA
#undef  Toolbox_GetAncestor
#define Toolbox_GetAncestor                     0x44ECB
#undef  XToolbox_GetAncestor
#define XToolbox_GetAncestor                    0x64ECB
#undef  Toolbox_GetTemplateName
#define Toolbox_GetTemplateName                 0x44ECC
#undef  XToolbox_GetTemplateName
#define XToolbox_GetTemplateName                0x64ECC
#undef  Toolbox_RaiseToolboxEvent
#define Toolbox_RaiseToolboxEvent               0x44ECD
#undef  XToolbox_RaiseToolboxEvent
#define XToolbox_RaiseToolboxEvent              0x64ECD
#undef  Toolbox_GetSysInfo
#define Toolbox_GetSysInfo                      0x44ECE
#undef  XToolbox_GetSysInfo
#define XToolbox_GetSysInfo                     0x64ECE
#undef  ToolboxGetSysInfo_TaskName
#define ToolboxGetSysInfo_TaskName              0x0
#undef  ToolboxGetSysInfo_MessageTransControlBlock
#define ToolboxGetSysInfo_MessageTransControlBlock 0x1
#undef  ToolboxGetSysInfo_DirName
#define ToolboxGetSysInfo_DirName               0x2
#undef  ToolboxGetSysInfo_Task
#define ToolboxGetSysInfo_Task                  0x3
#undef  ToolboxGetSysInfo_SpriteArea
#define ToolboxGetSysInfo_SpriteArea            0x4
#undef  Toolbox_Initialise
#define Toolbox_Initialise                      0x44ECF
#undef  XToolbox_Initialise
#define XToolbox_Initialise                     0x64ECF
#undef  Toolbox_LoadResources
#define Toolbox_LoadResources                   0x44ED0
#undef  XToolbox_LoadResources
#define XToolbox_LoadResources                  0x64ED0
#undef  Toolbox_Memory
#define Toolbox_Memory                          0x44EF9
#undef  XToolbox_Memory
#define XToolbox_Memory                         0x64EF9
#undef  ToolboxMemory_Allocate
#define ToolboxMemory_Allocate                  0x0
#undef  ToolboxMemory_Free
#define ToolboxMemory_Free                      0x1
#undef  ToolboxMemory_Extend
#define ToolboxMemory_Extend                    0x2
#undef  Toolbox_DeRegisterObjectModule
#define Toolbox_DeRegisterObjectModule          0x44EFA
#undef  XToolbox_DeRegisterObjectModule
#define XToolbox_DeRegisterObjectModule         0x64EFA
#undef  Toolbox_TemplateLookUp
#define Toolbox_TemplateLookUp                  0x44EFB
#undef  XToolbox_TemplateLookUp
#define XToolbox_TemplateLookUp                 0x64EFB
#undef  Toolbox_GetInternalHandle
#define Toolbox_GetInternalHandle               0x44EFC
#undef  XToolbox_GetInternalHandle
#define XToolbox_GetInternalHandle              0x64EFC
#undef  Toolbox_RegisterObjectModule
#define Toolbox_RegisterObjectModule            0x44EFD
#undef  XToolbox_RegisterObjectModule
#define XToolbox_RegisterObjectModule           0x64EFD
#undef  Toolbox_RegisterPreFilter
#define Toolbox_RegisterPreFilter               0x44EFE
#undef  XToolbox_RegisterPreFilter
#define XToolbox_RegisterPreFilter              0x64EFE
#undef  Toolbox_RegisterPostFilter
#define Toolbox_RegisterPostFilter              0x44EFF
#undef  XToolbox_RegisterPostFilter
#define XToolbox_RegisterPostFilter             0x64EFF
#undef  Service_ToolboxStarting
#define Service_ToolboxStarting                 0x44EC1
#undef  Service_ToolboxTaskBorn
#define Service_ToolboxTaskBorn                 0x44EC2
#undef  Service_ToolboxTaskDied
#define Service_ToolboxTaskDied                 0x44EC3
#undef  Service_ToolboxDying
#define Service_ToolboxDying                    0x44EC4
#undef  Service_WindowDeleted
#define Service_WindowDeleted                   0x44EC5
#undef  Service_RedrawingWindow
#define Service_RedrawingWindow                 0x44EC6

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct toolbox_o_                       *toolbox_o;
      /*Abstract type for Toolbox objects*/
typedef struct toolbox_id_                      *toolbox_id;
      /*Should be union of string and various object definition types, but that's inconvenient because the list is subject to later extension, and you can't project into unions by cast*/
typedef struct toolbox_full                     toolbox_full;
typedef union  toolbox_position                 toolbox_position;
typedef struct toolbox_block                    toolbox_block;
typedef struct toolbox_resource_file_object     toolbox_resource_file_object;
typedef struct toolbox_resource_file_object_base toolbox_resource_file_object_base;
typedef struct toolbox_object_descriptor_       *toolbox_object_descriptor;
      /*Pointer to the object descriptor - Cast from <xxx>_object or <xxx>_object_base as appropriate*/
typedef struct toolbox_template                 toolbox_template;
typedef struct toolbox_relocation               toolbox_relocation;
typedef struct toolbox_relocation_table         toolbox_relocation_table;
typedef struct toolbox_relocation_table_base    toolbox_relocation_table_base;
typedef struct toolbox_relocatable_object       toolbox_relocatable_object;
typedef struct toolbox_resource_file            toolbox_resource_file;
typedef struct toolbox_resource_file_base       toolbox_resource_file_base;
typedef struct toolbox_action_list              toolbox_action_list;
typedef struct toolbox_action_list_base         toolbox_action_list_base;
typedef struct toolbox_event_pair               toolbox_event_pair;
typedef struct toolbox_event_pair_list          toolbox_event_pair_list;
typedef struct toolbox_event_pair_list_base     toolbox_event_pair_list_base;
typedef struct toolbox_message_pair             toolbox_message_pair;
typedef struct toolbox_message_pair_list        toolbox_message_pair_list;
typedef struct toolbox_message_pair_list_base   toolbox_message_pair_list_base;
typedef struct toolbox_action_pair              toolbox_action_pair;
typedef struct toolbox_action_pair_list         toolbox_action_pair_list;
typedef struct toolbox_action_pair_list_base    toolbox_action_pair_list_base;
typedef union  toolbox_pair_list                toolbox_pair_list;
typedef struct toolbox_action_interest          toolbox_action_interest;
typedef struct toolbox_action_header            toolbox_action_header;
typedef struct toolbox_action_header_base       toolbox_action_header_base;
typedef struct toolbox_action_error             toolbox_action_error;
typedef struct toolbox_action_error_block       toolbox_action_error_block;
typedef struct toolbox_action_object_auto_created toolbox_action_object_auto_created;
typedef struct toolbox_action_object_auto_created_block toolbox_action_object_auto_created_block;
typedef struct toolbox_action_object_deleted    toolbox_action_object_deleted;
typedef struct toolbox_action_object_deleted_block toolbox_action_object_deleted_block;
typedef struct toolbox_action                   toolbox_action;
typedef struct toolbox_message                  toolbox_message;
typedef struct toolbox_full_message             toolbox_full_message;

/********************
 * Type definitions *
 ********************/
typedef int toolbox_c;
      /*Type for Toolbox components*/

typedef bits toolbox_class;
      /*Toolbox class identification number*/

typedef int toolbox_position_tag;
      /*Discriminates between the ways of specifying a position*/

/* ------------------------------------------------------------------------
 * Type:          toolbox_full
 *
 * Description:   One way of specifying a position
 */

struct toolbox_full
   {  os_box visible;
      int xscroll;
      int yscroll;
      wimp_w next;
   };

/* ------------------------------------------------------------------------
 * Type:          toolbox_position
 *
 * Description:   One way of specifying a position
 *
 * Fields:        full - A distributed union for each object type
 */

union toolbox_position
   {  os_coord top_left;
      toolbox_full full;
   };

typedef bits toolbox_object_flags;

struct toolbox_block
   {  toolbox_o ancestor_obj;
      toolbox_c ancestor_cmp;
      toolbox_o parent_obj;
      toolbox_c parent_cmp;
      toolbox_o this_obj;
      toolbox_c this_cmp;
   };

#define toolbox_RESOURCE_FILE_OBJECT_MEMBERS \
   toolbox_class class_no; \
   bits flags; \
   int version; \
   char name [12]; \
   int size; \
   int header_size; \
   int body_size;

/* Base toolbox_resource_file_object structure without variable part */
struct toolbox_resource_file_object_base
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
   };

/* legacy structure */
struct toolbox_resource_file_object
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      int object [UNKNOWN];
   };

#define toolbox_RESOURCE_FILE_OBJECT(N) \
   struct \
      {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS \
         int object [N]; \
      }

#define toolbox_SIZEOF_RESOURCE_FILE_OBJECT(N) \
   (offsetof (toolbox_resource_file_object, object) + \
         (N)*sizeof ((toolbox_resource_file_object *) NULL)->object)

typedef toolbox_resource_file_object_base toolbox_object_template_header;

/* ------------------------------------------------------------------------
 * Type:          toolbox_template
 *
 * Description:   Header structure for in-memory construction of a toolbox object
 */

struct toolbox_template
   {  toolbox_class class_no;
      bits flags;
      int version;
      char name [12];
      int reserved;
      toolbox_object_descriptor class_template;
      int body_size;
   };

typedef char *toolbox_string_reference;
      /*Type of a string reference after relocation*/

typedef char *toolbox_msg_reference;
      /*Type of a message reference after relocation*/

typedef osspriteop_area *toolbox_sprite_area_reference;
      /*Type of a sprite area reference after relocation*/

typedef int *toolbox_object_offset;
      /*Type of an object offset after relocation*/

typedef int toolbox_relocation_directive;

struct toolbox_relocation
   {  int word;
      toolbox_relocation_directive relocation;
   };

#define toolbox_RELOCATION_TABLE_MEMBERS \
   int relocation_count;

/* Base toolbox_relocation_table structure without variable part */
struct toolbox_relocation_table_base
   {  toolbox_RELOCATION_TABLE_MEMBERS
   };

/* legacy structure */
struct toolbox_relocation_table
   {  toolbox_RELOCATION_TABLE_MEMBERS
      toolbox_relocation relocations [UNKNOWN];
   };

#define toolbox_RELOCATION_TABLE(N) \
   struct \
      {  toolbox_RELOCATION_TABLE_MEMBERS \
         toolbox_relocation relocations [N]; \
      }

#define toolbox_SIZEOF_RELOCATION_TABLE(N) \
   (offsetof (toolbox_relocation_table, relocations) + \
         (N)*sizeof ((toolbox_relocation_table *) NULL)->relocations)

struct toolbox_relocatable_object
   {  int string_table_offset;
      int message_table_offset;
      int relocation_table_offset;
      toolbox_resource_file_object rf_obj;
   };

#define toolbox_RESOURCE_FILE_MEMBERS \
   int file_id; \
   int version; \
   int header_size;

/* Base toolbox_resource_file structure without variable part */
struct toolbox_resource_file_base
   {  toolbox_RESOURCE_FILE_MEMBERS
   };

/* legacy structure */
struct toolbox_resource_file
   {  toolbox_RESOURCE_FILE_MEMBERS
      toolbox_relocatable_object rel_obj [UNKNOWN];
   };

struct toolbox_action_list
   {  bits action_nos [UNKNOWN];
   };

#define toolbox_ACTION_LIST(N) \
   struct \
      {  bits action_nos [N]; \
      }

#define toolbox_SIZEOF_ACTION_LIST(N) \
   ((N)*sizeof ((toolbox_action_list *) NULL)->action_nos)

typedef bits toolbox_create_flags;

typedef bits toolbox_delete_flags;

typedef bits toolbox_show_flags;

typedef bits toolbox_hide_flags;

typedef bits toolbox_get_info_flags;

typedef bits toolbox_info;

typedef bits toolbox_misc_op_flags;

typedef bits toolbox_handle_flags;

typedef bits toolbox_get_class_flags;

typedef bits toolbox_get_parent_flags;

typedef bits toolbox_get_ancestor_flags;

typedef bits toolbox_get_template_flags;

typedef bits toolbox_event_flags;

typedef bits toolbox_initialise_flags;

typedef bits toolbox_load_flags;

typedef bits toolbox_look_up_flags;

typedef int toolbox_filter_type;

struct toolbox_event_pair
   {  int event;
      toolbox_class class_no;
   };

struct toolbox_event_pair_list
   {  toolbox_event_pair pair [UNKNOWN];
   };

#define toolbox_EVENT_PAIR_LIST(N) \
   struct \
      {  toolbox_event_pair pair [N]; \
      }

#define toolbox_SIZEOF_EVENT_PAIR_LIST(N) \
   ((N)*sizeof ((toolbox_event_pair_list *) NULL)->pair)

struct toolbox_message_pair
   {  bits message;
      toolbox_class class_no;
   };

struct toolbox_message_pair_list
   {  toolbox_message_pair pair [UNKNOWN];
   };

#define toolbox_MESSAGE_PAIR_LIST(N) \
   struct \
      {  toolbox_message_pair pair [N]; \
      }

#define toolbox_SIZEOF_MESSAGE_PAIR_LIST(N) \
   ((N)*sizeof ((toolbox_message_pair_list *) NULL)->pair)

struct toolbox_action_pair
   {  bits action_no;
      toolbox_class class_no;
   };

struct toolbox_action_pair_list
   {  toolbox_action_pair pair [UNKNOWN];
   };

#define toolbox_ACTION_PAIR_LIST(N) \
   struct \
      {  toolbox_action_pair pair [N]; \
      }

#define toolbox_SIZEOF_ACTION_PAIR_LIST(N) \
   ((N)*sizeof ((toolbox_action_pair_list *) NULL)->pair)

union toolbox_pair_list
   {  toolbox_event_pair_list events;
      toolbox_message_pair_list messages;
      toolbox_action_pair_list action_pairs;
   };

typedef bits toolbox_register_flags;

struct toolbox_action_interest
   {  bits action_no;
      toolbox_class class_no;
   };

#define toolbox_ACTION_HEADER_MEMBERS \
   int size; \
   int ref_no; \
   bits action_no; \
   bits flags;

/* Base toolbox_action_header structure without variable part */
struct toolbox_action_header_base
   {  toolbox_ACTION_HEADER_MEMBERS
   };

/* legacy structure */
struct toolbox_action_header
   {  toolbox_ACTION_HEADER_MEMBERS
      byte action [UNKNOWN];
   };

#define toolbox_ACTION_HEADER(N) \
   struct \
      {  toolbox_ACTION_HEADER_MEMBERS \
         byte action [N]; \
      }

#define toolbox_SIZEOF_ACTION_HEADER(N) \
   (offsetof (toolbox_action_header, action) + \
         (N)*sizeof ((toolbox_action_header *) NULL)->action)

/* ------------------------------------------------------------------------
 * Type:          toolbox_action_error
 *
 * Description:   Prefer Toolbox_ActionErrorBlock
 */

struct toolbox_action_error
   {  bits errnum;
      char errmess [208];
   };

struct toolbox_action_error_block
   {  toolbox_ACTION_HEADER_MEMBERS
      bits errnum;
      char errmess [208];
   };

/* ------------------------------------------------------------------------
 * Type:          toolbox_action_object_auto_created
 *
 * Description:   Prefer Toolbox_ActionObjectAutoCreatedBlock
 */

struct toolbox_action_object_auto_created
   {  char name [212];
   };

struct toolbox_action_object_auto_created_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char name [212];
   };

/* ------------------------------------------------------------------------
 * Type:          toolbox_action_object_deleted
 *
 * Description:   Prefer Toolbox_ActionObjectDeletedBlock
 */

struct toolbox_action_object_deleted
   {  toolbox_class class_no;
      void *client_handle;
   };

struct toolbox_action_object_deleted_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_class class_no;
      void *client_handle;
   };

struct toolbox_action
   {  int size;
      int ref_no;
      bits action_no;
      bits flags;
      union
      {  toolbox_action_error error;
         toolbox_action_object_auto_created created;
         toolbox_action_object_deleted deleted;
         byte reserved [212];
      }
      data;
   };

struct toolbox_message
   {  toolbox_o o;
      toolbox_c c;
      toolbox_action action_no;
   };

struct toolbox_full_message
   {  wimp_MESSAGE_HEADER_MEMBERS
      toolbox_o o;
      toolbox_c c;
      toolbox_action action_no;
   };

/************************
 * Constant definitions *
 ************************/
#define toolbox_NULL_OBJECT                     ((toolbox_o) 0x0u)
#define toolbox_NULL_COMPONENT                  ((toolbox_c) 0xFFFFFFFFu)
#define toolbox_WINDOW_FOCUS                    ((toolbox_c) 0xFFFFFFFEu)
#define toolbox_NAME_LIMIT                      12
#define toolbox_WIMP_OBJECTS                    ((toolbox_class) 0x0u)
#define toolbox_ALL                             ((toolbox_class) 0xFFFFFFFFu)
#define toolbox_EVENT                           0x200u
      /*Wimp event number of a Toolbox action*/
#define error_TOOLBOX_NO_MEM                    0x80CB00u
#define error_TOOLBOX_BAD_SWI                   0x80CB01u
#define error_TOOLBOX_INVALID_OBJECT_ID         0x80CB02u
#define error_TOOLBOX_NOT_ATOOLBOX_TASK         0x80CB03u
#define error_TOOLBOX_NO_DIR_NAME               0x80CB04u
#define error_TOOLBOX_NO_MSGS_FD                0x80CB05u
#define error_TOOLBOX_NO_ID_BLOCK               0x80CB06u
#define error_TOOLBOX_BAD_RES_FILE              0x80CB07u
#define error_TOOLBOX_TASKS_ACTIVE              0x80CB08u
#define error_TOOLBOX_TEMPLATE_NOT_FOUND        0x80CB09u
#define error_TOOLBOX_NO_SUCH_PRE_FILTER        0x80CB0Au
#define error_TOOLBOX_NOT_ARES_FILE             0x80CB0Bu
#define error_TOOLBOX_BAD_RES_FILE_VERSION      0x80CB0Cu
#define error_TOOLBOX_BAD_FLAGS                 0x80CB0Du
#define toolbox_OBJECT_CREATE_ON_LOAD           ((toolbox_object_flags) 0x1u)
#define toolbox_OBJECT_SHOW_ON_CREATE           ((toolbox_object_flags) 0x2u)
#define toolbox_OBJECT_SHARED                   ((toolbox_object_flags) 0x4u)
#define toolbox_OBJECT_ANCESTOR                 ((toolbox_object_flags) 0x8u)
#define toolbox_RESOURCE_FILE_VERSION           101
#define toolbox_RELOCATE_STRING_REFERENCE       ((toolbox_relocation_directive) 0x1u)
#define toolbox_RELOCATE_MSG_REFERENCE          ((toolbox_relocation_directive) 0x2u)
#define toolbox_RELOCATE_SPRITE_AREA_REFERENCE  ((toolbox_relocation_directive) 0x3u)
#define toolbox_RELOCATE_OBJECT_OFFSET          ((toolbox_relocation_directive) 0x4u)
#define toolbox_CREATE_GIVEN_OBJECT             ((toolbox_create_flags) 0x1u)
#define toolbox_DELETE_NO_RECURSE               ((toolbox_delete_flags) 0x1u)
#define toolbox_SHOW_AS_MENU                    ((toolbox_show_flags) 0x1u)
#define toolbox_SHOW_AS_SUB_MENU                ((toolbox_show_flags) 0x2u)
#define toolbox_INFO_SHOWING                    ((toolbox_info) 0x1u)
#define toolbox_REGISTER_EVENT_FILTER           ((toolbox_filter_type) 0x1u)
#define toolbox_REGISTER_MESSAGE_FILTER         ((toolbox_filter_type) 0x2u)
#define toolbox_REGISTER_ACTION_FILTER          ((toolbox_filter_type) 0x3u)
#define toolbox_DE_REGISTER_FILTER              ((toolbox_register_flags) 0x1u)
#define toolbox_POSITION_DEFAULT                ((toolbox_position_tag) 0x0u)
#define toolbox_POSITION_FULL                   ((toolbox_position_tag) 0x1u)
#define toolbox_POSITION_TOP_LEFT               ((toolbox_position_tag) 0x2u)
#define toolbox_POSITION_CENTRED                ((toolbox_position_tag) 0x3u)
#define toolbox_POSITION_AT_POINTER             ((toolbox_position_tag) 0x4u)
#define toolbox_WIMP_OBJECT_POST_FILTER         ((toolbox_class) 0x0u)
#define toolbox_ANY_POST_FILTER                 ((toolbox_class) 0xFFFFFFFFu)
#define action_ERROR                            0x44EC0u
#define action_OBJECT_AUTO_CREATED              0x44EC1u
#define action_OBJECT_DELETED                   0x44EC2u
#define toolbox_ACTION_OBJECT_DELETED_EXTENDED_INFORMATION 0x1u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      toolbox_create_object()
 *
 * Description:   Creates an object from a named resource or an object
 *                structure
 *
 * Input:         flags - value of R0 on entry
 *                id - value of R1 on entry
 *
 * Output:        obj - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC0.
 */

extern os_error *xtoolbox_create_object (toolbox_create_flags flags,
      toolbox_id id,
      toolbox_o *obj);
__swi (0x44EC0) toolbox_o toolbox_create_object (toolbox_create_flags flags,
      toolbox_id id);

/* ------------------------------------------------------------------------
 * Function:      toolbox_create_object_from_template()
 *
 * Description:   Creates an object from a memory template structure by
 *                calling Toolbox_CreateObject with flags =
 *                Toolbox_CreateGivenObject
 *
 * Input:         flags - value of R0 on entry
 *                toolbox_template - value of R1 on entry
 *
 * Output:        obj - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC0 with R0 |= 0x1.
 */

extern os_error *xtoolbox_create_object_from_template (toolbox_create_flags flags,
      toolbox_template const *toolbox_template,
      toolbox_o *obj);
extern toolbox_o toolbox_create_object_from_template (toolbox_create_flags flags,
      toolbox_template const *toolbox_template);

/* ------------------------------------------------------------------------
 * Function:      toolbox_delete_object()
 *
 * Description:   Deletes an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44EC1.
 */

extern os_error *xtoolbox_delete_object (toolbox_delete_flags flags,
      toolbox_o obj);
__swi (0x44EC1) void toolbox_delete_object (toolbox_delete_flags flags,
      toolbox_o obj);

/* ------------------------------------------------------------------------
 * Function:      toolbox_show_object()
 *
 * Description:   Shows an object on the screen
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *                tag - value of R2 on entry
 *                position - value of R3 on entry
 *                parent_obj - value of R4 on entry
 *                parent_cmp - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC3.
 */

extern os_error *xtoolbox_show_object (toolbox_show_flags flags,
      toolbox_o obj,
      toolbox_position_tag tag,
      toolbox_position const *position,
      toolbox_o parent_obj,
      toolbox_c parent_cmp);
extern void toolbox_show_object (toolbox_show_flags flags,
      toolbox_o obj,
      toolbox_position_tag tag,
      toolbox_position const *position,
      toolbox_o parent_obj,
      toolbox_c parent_cmp);

/* ------------------------------------------------------------------------
 * Function:      toolbox_hide_object()
 *
 * Description:   Removes an object from the screen, if it is being shown
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44EC4.
 */

extern os_error *xtoolbox_hide_object (toolbox_hide_flags flags,
      toolbox_o obj);
__swi (0x44EC4) void toolbox_hide_object (toolbox_hide_flags flags,
      toolbox_o obj);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_object_info()
 *
 * Description:   Returns current information for an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Output:        info - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC5.
 */

extern os_error *xtoolbox_get_object_info (toolbox_get_info_flags flags,
      toolbox_o obj,
      toolbox_info *info);
__swi (0x44EC5) toolbox_info toolbox_get_object_info (toolbox_get_info_flags flags,
      toolbox_o obj);

/* ------------------------------------------------------------------------
 * Function:      toolbox_set_client_handle()
 *
 * Description:   Sets the value of a handle associated with an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x44EC7.
 */

extern os_error *xtoolbox_set_client_handle (toolbox_handle_flags flags,
      toolbox_o obj,
      void *handle);
__swi (0x44EC7) void toolbox_set_client_handle (toolbox_handle_flags flags,
      toolbox_o obj,
      void *handle);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_client_handle()
 *
 * Description:   Returns the handle associated with an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC8.
 */

extern os_error *xtoolbox_get_client_handle (toolbox_handle_flags flags,
      toolbox_o obj,
      void **handle);
__swi (0x44EC8) void *toolbox_get_client_handle (toolbox_handle_flags flags,
      toolbox_o obj);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_object_class()
 *
 * Description:   Returns the class of the specified object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Output:        class_no - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC9.
 */

extern os_error *xtoolbox_get_object_class (toolbox_get_class_flags flags,
      toolbox_o obj,
      toolbox_class *class_no);
__swi (0x44EC9) toolbox_class toolbox_get_object_class (toolbox_get_class_flags flags,
      toolbox_o obj);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_parent()
 *
 * Description:   Returns the parent of an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Output:        parent_obj - value of R0 on exit
 *                parent_cmp - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44ECA.
 */

extern os_error *xtoolbox_get_parent (toolbox_get_parent_flags flags,
      toolbox_o obj,
      toolbox_o *parent_obj,
      toolbox_c *parent_cmp);
extern void toolbox_get_parent (toolbox_get_parent_flags flags,
      toolbox_o obj,
      toolbox_o *parent_obj,
      toolbox_c *parent_cmp);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_ancestor()
 *
 * Description:   Returns the ancestor of an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *
 * Output:        ancestor_obj - value of R0 on exit
 *                ancestor_cmp - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44ECB.
 */

extern os_error *xtoolbox_get_ancestor (toolbox_get_ancestor_flags flags,
      toolbox_o obj,
      toolbox_o *ancestor_obj,
      toolbox_c *ancestor_cmp);
extern void toolbox_get_ancestor (toolbox_get_ancestor_flags flags,
      toolbox_o obj,
      toolbox_o *ancestor_obj,
      toolbox_c *ancestor_cmp);

/* ------------------------------------------------------------------------
 * Function:      toolbox_get_template_name()
 *
 * Description:   Gets the name of the resource used to create an object
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        used - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECC.
 */

extern os_error *xtoolbox_get_template_name (toolbox_get_template_flags flags,
      toolbox_o obj,
      char *buffer,
      int size,
      int *used);
extern int toolbox_get_template_name (toolbox_get_template_flags flags,
      toolbox_o obj,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      toolbox_raise_toolbox_event()
 *
 * Description:   Raises a toolbox action
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R1 on entry
 *                cmp - value of R2 on entry
 *                action - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44ECD.
 */

extern os_error *xtoolbox_raise_toolbox_event (toolbox_event_flags flags,
      toolbox_o obj,
      toolbox_c cmp,
      toolbox_action const *action);
__swi (0x44ECD) void toolbox_raise_toolbox_event (toolbox_event_flags flags,
      toolbox_o obj,
      toolbox_c cmp,
      toolbox_action const *action);

/* ------------------------------------------------------------------------
 * Function:      toolboxgetsysinfo_task_name()
 *
 * Description:   Returns the task name
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECE with R0 = 0x0.
 */

extern os_error *xtoolboxgetsysinfo_task_name (char *buffer,
      int size,
      int *used);
extern int toolboxgetsysinfo_task_name (char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      toolboxgetsysinfo_message_trans_control_block()
 *
 * Description:   Returns the message file control block
 *
 * Input:         cb - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44ECE with R0 = 0x1.
 */

extern os_error *xtoolboxgetsysinfo_message_trans_control_block (messagetrans_control_block *cb);
extern void toolboxgetsysinfo_message_trans_control_block (messagetrans_control_block *cb);

/* ------------------------------------------------------------------------
 * Function:      toolboxgetsysinfo_dir_name()
 *
 * Description:   Returns the 'home directory'
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECE with R0 = 0x2.
 */

extern os_error *xtoolboxgetsysinfo_dir_name (char *buffer,
      int size,
      int *used);
extern int toolboxgetsysinfo_dir_name (char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      toolboxgetsysinfo_task()
 *
 * Description:   Returns the task handle
 *
 * Output:        task - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECE with R0 = 0x3.
 */

extern os_error *xtoolboxgetsysinfo_task (wimp_t *task);
extern wimp_t toolboxgetsysinfo_task (void);

/* ------------------------------------------------------------------------
 * Function:      toolboxgetsysinfo_sprite_area()
 *
 * Description:   Returns a pointer to the sprite area
 *
 * Output:        area - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECE with R0 = 0x4.
 */

extern os_error *xtoolboxgetsysinfo_sprite_area (osspriteop_area **area);
extern osspriteop_area *toolboxgetsysinfo_sprite_area (void);

/* ------------------------------------------------------------------------
 * Function:      toolbox_initialise()
 *
 * Description:   Initialises the Toolbox
 *
 * Input:         flags - value of R0 on entry
 *                version - value of R1 on entry
 *                messages - value of R2 on entry
 *                action_nos - value of R3 on entry
 *                resource_dir_name - value of R4 on entry
 *                cb - value of R5 on entry
 *                block - value of R6 on entry
 *
 * Output:        version_out - value of R0 on exit
 *                task_out - value of R1 on exit (X version only)
 *                area - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44ECF.
 */

extern os_error *xtoolbox_initialise (toolbox_initialise_flags flags,
      int version,
      wimp_message_list const *messages,
      toolbox_action_list const *action_nos,
      char const *resource_dir_name,
      messagetrans_control_block *cb,
      toolbox_block *block,
      int *version_out,
      wimp_t *task_out,
      osspriteop_area **area);
extern wimp_t toolbox_initialise (toolbox_initialise_flags flags,
      int version,
      wimp_message_list const *messages,
      toolbox_action_list const *action_nos,
      char const *resource_dir_name,
      messagetrans_control_block *cb,
      toolbox_block *block,
      int *version_out,
      osspriteop_area **area);

/* ------------------------------------------------------------------------
 * Function:      toolbox_load_resources()
 *
 * Description:   Loads a resource file
 *
 * Input:         flags - value of R0 on entry
 *                resource_file_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44ED0.
 */

extern os_error *xtoolbox_load_resources (toolbox_load_flags flags,
      char const *resource_file_name);
__swi (0x44ED0) void toolbox_load_resources (toolbox_load_flags flags,
      char const *resource_file_name);

/* ------------------------------------------------------------------------
 * Function:      toolboxmemory_allocate()
 *
 * Description:   Gets a block of memory for use by object modules or
 *                gadgets - Toolbox 1.40+
 *
 * Input:         size - value of R1 on entry
 *
 * Output:        blk - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EF9 with R0 = 0x0.
 */

extern os_error *xtoolboxmemory_allocate (int size,
      void **blk);
extern void *toolboxmemory_allocate (int size);

/* ------------------------------------------------------------------------
 * Function:      toolboxmemory_free()
 *
 * Description:   Frees a block of memory for use by object modules or
 *                gadgets - Toolbox 1.40+
 *
 * Input:         blk - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44EF9 with R0 = 0x1.
 */

extern os_error *xtoolboxmemory_free (void *blk);
extern void toolboxmemory_free (void *blk);

/* ------------------------------------------------------------------------
 * Function:      toolboxmemory_extend()
 *
 * Description:   Extends or shrinks a block of memory for use by object
 *                modules or gadgets - Toolbox 1.40+
 *
 * Input:         blk - value of R1 on entry
 *                change_by - value of R2 on entry
 *
 * Output:        blk_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EF9 with R0 = 0x2.
 */

extern os_error *xtoolboxmemory_extend (void *blk,
      int change_by,
      void **blk_out);
extern void *toolboxmemory_extend (void *blk,
      int change_by);

/* ------------------------------------------------------------------------
 * Function:      toolbox_de_register_object_module()
 *
 * Description:   Deregisters an object module
 *
 * Input:         flags - value of R0 on entry
 *                class_no - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x44EFA.
 */

extern os_error *xtoolbox_de_register_object_module (bits flags,
      toolbox_class class_no);
__swi (0x44EFA) void toolbox_de_register_object_module (bits flags,
      toolbox_class class_no);

/* ------------------------------------------------------------------------
 * Function:      toolbox_template_look_up()
 *
 * Description:   Returns the object pointer for a named resource
 *
 * Input:         flags - value of R0 on entry
 *                object_name - value of R1 on entry
 *
 * Output:        id - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EFB.
 */

extern os_error *xtoolbox_template_look_up (toolbox_look_up_flags flags,
      char const *object_name,
      toolbox_id *id);
__swi (0x44EFB) toolbox_id toolbox_template_look_up (toolbox_look_up_flags flags,
      char const *object_name);

/* ------------------------------------------------------------------------
 * Function:      toolbox_register_object_module()
 *
 * Description:   Registers an object module
 *
 * Input:         flags - value of R0 on entry
 *                class_no - value of R1 on entry
 *                swi_base - value of R2 on entry
 *                resource_file_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EFD.
 */

extern os_error *xtoolbox_register_object_module (bits flags,
      toolbox_class class_no,
      bits swi_base,
      char const *resource_file_name);
__swi (0x44EFD) void toolbox_register_object_module (bits flags,
      toolbox_class class_no,
      bits swi_base,
      char const *resource_file_name);

/* ------------------------------------------------------------------------
 * Function:      toolbox_register_pre_filter()
 *
 * Description:   Registers an object module's pre-filter
 *
 * Input:         flags - value of R0 on entry
 *                swi_no - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x44EFE.
 */

extern os_error *xtoolbox_register_pre_filter (toolbox_register_flags flags,
      bits swi_no,
      void *handle);
__swi (0x44EFE) void toolbox_register_pre_filter (toolbox_register_flags flags,
      bits swi_no,
      void *handle);

/* ------------------------------------------------------------------------
 * Function:      toolbox_register_post_filter()
 *
 * Description:   Registers an object module's post-filter
 *
 * Input:         flags - value of R0 on entry
 *                swi_no - value of R1 on entry
 *                handle - value of R2 on entry
 *                filter_type - value of R3 on entry
 *                pairs - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EFF.
 */

extern os_error *xtoolbox_register_post_filter (toolbox_register_flags flags,
      bits swi_no,
      void *handle,
      toolbox_filter_type filter_type,
      toolbox_pair_list const *pairs);
extern void toolbox_register_post_filter (toolbox_register_flags flags,
      bits swi_no,
      void *handle,
      toolbox_filter_type filter_type,
      toolbox_pair_list const *pairs);

/* ------------------------------------------------------------------------
 * Function:      service_toolbox_starting()
 *
 * Description:   Toolbox starting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC1.
 */

extern os_error *xservice_toolbox_starting (void);
extern void service_toolbox_starting (void);

/* ------------------------------------------------------------------------
 * Function:      service_toolbox_task_born()
 *
 * Description:   New Toolbox task started
 *
 * Input:         task - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC2.
 */

extern os_error *xservice_toolbox_task_born (wimp_t task);
extern void service_toolbox_task_born (wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      service_toolbox_task_died()
 *
 * Description:   Toolbox task died
 *
 * Input:         task - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC3.
 */

extern os_error *xservice_toolbox_task_died (wimp_t task);
extern void service_toolbox_task_died (wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      service_toolbox_dying()
 *
 * Description:   Toolbox dying - Toolbox 1.40+
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC4.
 */

extern os_error *xservice_toolbox_dying (void);
extern void service_toolbox_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_window_deleted()
 *
 * Description:   Window deleted
 *
 * Input:         w - value of R0 on entry
 *                task - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC5.
 */

extern os_error *xservice_window_deleted (wimp_w w,
      wimp_t task);
extern void service_window_deleted (wimp_w w,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      service_redrawing_window()
 *
 * Description:   Window is being redrawn
 *
 * Input:         type - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44EC6.
 */

extern os_error *xservice_redrawing_window (int type);
extern void service_redrawing_window (int type);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
