#ifndef proginfo_H
#define proginfo_H

/* C header file for ProgInfo
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 5 Sept 1995
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

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#ifndef window_H
#include "oslib/window.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ProgInfo_ClassSWI
#define ProgInfo_ClassSWI                       0x82B40
#undef  XProgInfo_ClassSWI
#define XProgInfo_ClassSWI                      0xA2B40
#undef  ProgInfo_PostFilter
#define ProgInfo_PostFilter                     0x82B41
#undef  XProgInfo_PostFilter
#define XProgInfo_PostFilter                    0xA2B41
#undef  ProgInfo_PreFilter
#define ProgInfo_PreFilter                      0x82B42
#undef  XProgInfo_PreFilter
#define XProgInfo_PreFilter                     0xA2B42
#undef  ProgInfo_GetWindowID
#define ProgInfo_GetWindowID                    0x0
#undef  ProgInfo_SetVersion
#define ProgInfo_SetVersion                     0x1
#undef  ProgInfo_GetVersion
#define ProgInfo_GetVersion                     0x2
#undef  ProgInfo_SetLicenceType
#define ProgInfo_SetLicenceType                 0x3
#undef  ProgInfo_GetLicenceType
#define ProgInfo_GetLicenceType                 0x4
#undef  ProgInfo_SetTitle
#define ProgInfo_SetTitle                       0x5
#undef  ProgInfo_GetTitle
#define ProgInfo_GetTitle                       0x6
#undef  ProgInfo_SetURI
#define ProgInfo_SetURI                         0x7
#undef  ProgInfo_GetURI
#define ProgInfo_GetURI                         0x8
#undef  ProgInfo_GetWebEvent
#define ProgInfo_GetWebEvent                    0x9
#undef  ProgInfo_SetWebEvent
#define ProgInfo_SetWebEvent                    0xA

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct proginfo_object                  proginfo_object;
typedef struct proginfo_object_template         proginfo_object_template;
typedef struct proginfo_action_about_to_be_shown proginfo_action_about_to_be_shown;
typedef struct proginfo_action_about_to_be_shown_block proginfo_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits proginfo_flags;

typedef int proginfo_licence;

/* ------------------------------------------------------------------------
 * Type:          proginfo_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 *
 * Fields:        uri - Added in ProgInfo 1.01
 *                uri_action - Added in ProgInfo 1.01
 */

struct proginfo_object
   {  proginfo_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference purpose;
      toolbox_msg_reference author;
      proginfo_licence licence_type;
      toolbox_msg_reference version;
      toolbox_string_reference alternative_window_name;
      toolbox_msg_reference uri;
      bits uri_action;
   };

struct proginfo_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      proginfo_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference purpose;
      toolbox_msg_reference author;
      proginfo_licence licence_type;
      toolbox_msg_reference prog_version;
      toolbox_string_reference alternative_window_name;
      toolbox_msg_reference uri;
      bits uri_action;
   };

typedef toolbox_full proginfo_full;

/* ------------------------------------------------------------------------
 * Type:          proginfo_action_about_to_be_shown
 *
 * Description:   Prefer ProgInfo_ActionAboutToBeShownBlock
 */

struct proginfo_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         proginfo_full full;
      }
      position;
   };

struct proginfo_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         proginfo_full full;
      }
      position;
   };

typedef toolbox_action_header_base proginfo_action_dialogue_completed_block;

typedef toolbox_action_header_base proginfo_action_launch_web_page_block;

/************************
 * Constant definitions *
 ************************/
#define class_PROG_INFO                         ((toolbox_class) 0x82B40u)
#define proginfo_GENERATE_ABOUT_TO_BE_SHOWN     ((proginfo_flags) 0x1u)
#define proginfo_GENERATE_DIALOGUE_COMPLETED    ((proginfo_flags) 0x2u)
#define proginfo_INCLUDE_LICENCE_TYPE           ((proginfo_flags) 0x4u)
#define proginfo_INCLUDE_WEB_PAGE_BUTTON        ((proginfo_flags) 0x8u)
#define proginfo_GENERATE_WEB_PAGE_CLICKED      ((proginfo_flags) 0x10u)
#define proginfo_NAME                           ((toolbox_c) 0x82B400u)
#define proginfo_PURPOSE                        ((toolbox_c) 0x82B401u)
#define proginfo_AUTHOR                         ((toolbox_c) 0x82B402u)
#define proginfo_LICENCE_TYPE                   ((toolbox_c) 0x82B403u)
#define proginfo_VERSION                        ((toolbox_c) 0x82B404u)
#define proginfo_NAME_LABEL                     ((toolbox_c) 0x82B405u)
#define proginfo_PURPOSE_LABEL                  ((toolbox_c) 0x82B406u)
#define proginfo_AUTHOR_LABEL                   ((toolbox_c) 0x82B407u)
#define proginfo_LICENCE_LABEL                  ((toolbox_c) 0x82B408u)
#define proginfo_VERSION_LABEL                  ((toolbox_c) 0x82B409u)
#define proginfo_WEB_SITE                       ((toolbox_c) 0x80B40Au)
#define proginfo_LICENCE_PUBLIC_DOMAIN          ((proginfo_licence) 0x0u)
#define proginfo_LICENCE_SINGLE_USER            ((proginfo_licence) 0x1u)
#define proginfo_LICENCE_SINGLE_MACHINE         ((proginfo_licence) 0x2u)
#define proginfo_LICENCE_SITE                   ((proginfo_licence) 0x3u)
#define proginfo_LICENCE_NETWORK                ((proginfo_licence) 0x4u)
#define proginfo_LICENCE_AUTHORITY              ((proginfo_licence) 0x5u)
#define action_PROG_INFO_ABOUT_TO_BE_SHOWN      0x82B40u
#define action_PROG_INFO_DIALOGUE_COMPLETED     0x82B41u
#define action_PROG_INFO_LAUNCH_WEB_PAGE        0x82B42u
#define error_PROG_INFO_TASKS_ACTIVE            0x80B400u
#define error_PROG_INFO_ALLOC_FAILED            0x80B401u
#define error_PROG_INFO_SHORT_BUFFER            0x80B402u
#define error_PROG_INFO_NO_SUCH_TASK            0x80B411u
#define error_PROG_INFO_NO_SUCH_METHOD          0x80B412u
#define error_PROG_INFO_NO_SUCH_MISC_OP_METHOD  0x80B413u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_window_id()
 *
 * Description:   Gets the ID of the underlying window object
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x0.
 */

extern os_error *xproginfo_get_window_id (bits flags,
      toolbox_o prog_info,
      toolbox_o *window);
extern toolbox_o proginfo_get_window_id (bits flags,
      toolbox_o prog_info);

/* ------------------------------------------------------------------------
 * Function:      proginfo_set_version()
 *
 * Description:   Sets the version string displayed in the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                version - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x1.
 */

extern os_error *xproginfo_set_version (bits flags,
      toolbox_o prog_info,
      char const *version);
extern void proginfo_set_version (bits flags,
      toolbox_o prog_info,
      char const *version);

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_version()
 *
 * Description:   Gets the version string displayed in the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x2.
 */

extern os_error *xproginfo_get_version (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size,
      int *used);
extern int proginfo_get_version (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      proginfo_set_licence_type()
 *
 * Description:   Sets the licence type displayed in the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                licence_type - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x3.
 */

extern os_error *xproginfo_set_licence_type (bits flags,
      toolbox_o prog_info,
      proginfo_licence licence_type);
extern void proginfo_set_licence_type (bits flags,
      toolbox_o prog_info,
      proginfo_licence licence_type);

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_licence_type()
 *
 * Description:   Gets the licence type displayed in the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *
 * Output:        licence_type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4.
 */

extern os_error *xproginfo_get_licence_type (bits flags,
      toolbox_o prog_info,
      proginfo_licence *licence_type);
extern proginfo_licence proginfo_get_licence_type (bits flags,
      toolbox_o prog_info);

/* ------------------------------------------------------------------------
 * Function:      proginfo_set_title()
 *
 * Description:   Sets the title of the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x5.
 */

extern os_error *xproginfo_set_title (bits flags,
      toolbox_o prog_info,
      char const *title);
extern void proginfo_set_title (bits flags,
      toolbox_o prog_info,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_title()
 *
 * Description:   Gets the title of the ProgInfo window
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x6.
 */

extern os_error *xproginfo_get_title (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size,
      int *used);
extern int proginfo_get_title (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      proginfo_set_uri()
 *
 * Description:   Sets the URI to be launched after a click on the Web Page
 *                button
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                uri - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x7.
 */

extern os_error *xproginfo_set_uri (bits flags,
      toolbox_o prog_info,
      char const *uri);
extern void proginfo_set_uri (bits flags,
      toolbox_o prog_info,
      char const *uri);

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_uri()
 *
 * Description:   Gets the URI to be launched after a click on the Web Page
 *                button
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x8.
 */

extern os_error *xproginfo_get_uri (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size,
      int *used);
extern int proginfo_get_uri (bits flags,
      toolbox_o prog_info,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      proginfo_get_web_event()
 *
 * Description:   Gets the event number returned for a click on the Web
 *                Page button
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *
 * Output:        action - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x9.
 */

extern os_error *xproginfo_get_web_event (bits flags,
      toolbox_o prog_info,
      bits *action);
extern bits proginfo_get_web_event (bits flags,
      toolbox_o prog_info);

/* ------------------------------------------------------------------------
 * Function:      proginfo_set_web_event()
 *
 * Description:   Sets the event number returned for a click on the Web
 *                Page button
 *
 * Input:         flags - value of R0 on entry
 *                prog_info - value of R1 on entry
 *                action - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xA.
 */

extern os_error *xproginfo_set_web_event (bits flags,
      toolbox_o prog_info,
      bits action);
extern void proginfo_set_web_event (bits flags,
      toolbox_o prog_info,
      bits action);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
