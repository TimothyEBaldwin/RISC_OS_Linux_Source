#ifndef filer_H
#define filer_H

/* C header file for Filer
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 23 June 1995
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#ifndef fileraction_H
#include "oslib/fileraction.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Service_StartFiler
#define Service_StartFiler                      0x4B
#undef  Service_StartedFiler
#define Service_StartedFiler                    0x4C
#undef  Service_FilerDying
#define Service_FilerDying                      0x4F
#undef  Service_EnumerateFormats
#define Service_EnumerateFormats                0x6A
#undef  Service_DiscDismounted
#define Service_DiscDismounted                  0x7D

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct filer_message_open_dir           filer_message_open_dir;
typedef struct filer_message_open_dir_at        filer_message_open_dir_at;
typedef struct filer_message_selection_dir      filer_message_selection_dir;
typedef struct filer_message_add_selection      filer_message_add_selection;
typedef struct filer_message_action             filer_message_action;
typedef struct filer_message_control_action     filer_message_control_action;
typedef struct filer_message_selection          filer_message_selection;
typedef struct filer_message_device_dir         filer_message_device_dir;
typedef struct filer_full_message_open_dir      filer_full_message_open_dir;
typedef struct filer_full_message_open_dir_at   filer_full_message_open_dir_at;
typedef struct filer_full_message_selection_dir filer_full_message_selection_dir;
typedef struct filer_full_message_add_selection filer_full_message_add_selection;
typedef struct filer_full_message_action        filer_full_message_action;
typedef struct filer_full_message_control_action filer_full_message_control_action;
typedef struct filer_full_message_selection     filer_full_message_selection;
typedef struct filer_full_message_device_dir    filer_full_message_device_dir;
typedef struct filer_format                     filer_format;

/********************
 * Type definitions *
 ********************/
typedef int filer_control;

struct filer_message_open_dir
   {  fileswitch_fs_no fs_no;
      byte reserved [3];
      bits flags;
      char dir_name [228];
   };

struct filer_message_open_dir_at
   {  fileswitch_fs_no fs_no;
      byte reserved [3];
      bits flags;
      os_coord at;
      int width;
      int height;
      byte display;
      char dir_name [211];
   };

struct filer_message_selection_dir
   {  char dir_name [236];
   };

struct filer_message_add_selection
   {  char leaf_list [236];
   };

struct filer_message_action
   {  fileraction_operation operation;
      fileraction_flags options;
      union
      {  char destination_dir_name [228];
         struct
         {  short access;
            short mask;
         }
         access;
         bits file_type;
         char find_leaf [228];
      }
      data;
   };

struct filer_message_control_action
   {  filer_control control;
   };

struct filer_message_selection
   {  os_box bbox;
      int width;
      int height;
      bits display;
      int col0;
      int row0;
      int col1;
      int row1;
   };

struct filer_message_device_dir
   {  char path_name [236];
   };

struct filer_full_message_open_dir
   {  wimp_MESSAGE_HEADER_MEMBERS
      fileswitch_fs_no fs_no;
      byte reserved [3];
      bits flags;
      char dir_name [228];
   };

struct filer_full_message_open_dir_at
   {  wimp_MESSAGE_HEADER_MEMBERS
      fileswitch_fs_no fs_no;
      byte reserved [3];
      bits flags;
      os_coord at;
      int width;
      int height;
      byte display;
      char dir_name [211];
   };

struct filer_full_message_selection_dir
   {  wimp_MESSAGE_HEADER_MEMBERS
      char dir_name [236];
   };

struct filer_full_message_add_selection
   {  wimp_MESSAGE_HEADER_MEMBERS
      char leaf_list [236];
   };

struct filer_full_message_action
   {  wimp_MESSAGE_HEADER_MEMBERS
      fileraction_operation operation;
      fileraction_flags options;
      union
      {  char destination_dir_name [228];
         struct
         {  short access;
            short mask;
         }
         access;
         bits file_type;
         char find_leaf [228];
      }
      data;
   };

struct filer_full_message_control_action
   {  wimp_MESSAGE_HEADER_MEMBERS
      filer_control control;
   };

struct filer_full_message_selection
   {  wimp_MESSAGE_HEADER_MEMBERS
      os_box bbox;
      int width;
      int height;
      bits display;
      int col0;
      int row0;
      int col1;
      int row1;
   };

struct filer_full_message_device_dir
   {  wimp_MESSAGE_HEADER_MEMBERS
      char path_name [236];
   };

struct filer_format
   {  filer_format *next;
      char *menu_text;
      char *help_text;
      int disc_format_swi;
      int disc_format_handle;
      int layout_structure_swi;
      int layout_structure_handle;
      bits flags;
   };

/************************
 * Constant definitions *
 ************************/
#define error_FILER_NO_RECURSION                0xB80u
#define error_FILER_NO_TEMPLATE                 0xB81u
#define error_FILER_FAILED_SAVE                 0xB82u
#define error_FILER_BAD_PATH                    0xB83u
#define message_FILER_OPEN_DIR                  0x400u
#define message_FILER_CLOSE_DIR                 0x401u
#define message_FILER_OPEN_DIR_AT               0x402u
#define message_FILER_SELECTION_DIR             0x403u
#define message_FILER_ADD_SELECTION             0x404u
#define message_FILER_ACTION                    0x405u
#define message_FILER_CONTROL_ACTION            0x406u
#define message_FILER_SELECTION                 0x407u
#define message_FILER_DEVICE_DIR                0x408u
      /*RISC O S 4+*/
#define filer_FORMAT_NATIVE                     0x1u
#define filer_DIR_NONCANONICAL                  0x1u
#define filer_DISPLAY_LARGE_ICONS               0x0u
#define filer_DISPLAY_SMALL_ICONS               0x1u
#define filer_DISPLAY_FULL_INFO                 0x2u
#define filer_DISPLAY                           0x3u
#define filer_DISPLAY_SHIFT                     0
#define filer_SORT_BY_NAME                      0x0u
#define filer_SORT_BY_SIZE                      0x1u
#define filer_SORT_BY_TYPE                      0x2u
#define filer_SORT_BY_DATE                      0x3u
#define filer_SORT                              0xCu
#define filer_SORT_SHIFT                        2
#define filer_GIVEN_DISPLAY                     0x10u
#define filer_GIVEN_SORT                        0x20u
#define filer_CONTROL_ACKNOWLEDGE               ((filer_control) 0x0u)
#define filer_CONTROL_VERBOSE_ON                ((filer_control) 0x1u)
#define filer_CONTROL_VERBOSE_OFF               ((filer_control) 0x2u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      service_start_filer()
 *
 * Description:   Request to filing-system-specific desktop filers to start
 *                up
 *
 * Input:         task - value of R0 on entry
 *
 * Output:        command - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4B.
 */

extern os_error *xservice_start_filer (wimp_t task,
      char **command,
      osbool *unclaimed);
extern osbool service_start_filer (wimp_t task,
      char **command);

/* ------------------------------------------------------------------------
 * Function:      service_started_filer()
 *
 * Description:   Request to filing-system-specific desktop filers to set
 *                task_handle variable to 0
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4C.
 */

extern os_error *xservice_started_filer (void);
extern void service_started_filer (void);

/* ------------------------------------------------------------------------
 * Function:      service_filer_dying()
 *
 * Description:   Notification that the Filer module is about to close down
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4F.
 */

extern os_error *xservice_filer_dying (void);
extern void service_filer_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_enumerate_formats()
 *
 * Description:   Enumerate available disc formats
 *
 * Input:         format_list - value of R2 on entry
 *
 * Output:        format_list_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x6A.
 */

extern os_error *xservice_enumerate_formats (filer_format *format_list,
      filer_format **format_list_out);
extern void service_enumerate_formats (filer_format *format_list,
      filer_format **format_list_out);

/* ------------------------------------------------------------------------
 * Function:      service_disc_dismounted()
 *
 * Description:   Disc dismounted
 *
 * Input:         disc_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x7D.
 */

extern os_error *xservice_disc_dismounted (char const *disc_name);
extern void service_disc_dismounted (char const *disc_name);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
