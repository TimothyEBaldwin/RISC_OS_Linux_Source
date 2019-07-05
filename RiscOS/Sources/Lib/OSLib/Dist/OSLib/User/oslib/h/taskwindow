#ifndef taskwindow_H
#define taskwindow_H

/* C header file for TaskWindow
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 May 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  TaskWindow_TaskInfo
#define TaskWindow_TaskInfo                     0x43380
#undef  XTaskWindow_TaskInfo
#define XTaskWindow_TaskInfo                    0x63380
#undef  TaskWindowTaskInfo_WindowTask
#define TaskWindowTaskInfo_WindowTask           0x0
#undef  UpCall_Sleep
#define UpCall_Sleep                            0x6

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct taskwindow_message_data          taskwindow_message_data;
typedef struct taskwindow_message_ego           taskwindow_message_ego;
typedef struct taskwindow_message_new_task      taskwindow_message_new_task;
typedef struct taskwindow_full_message_data     taskwindow_full_message_data;
typedef struct taskwindow_full_message_ego      taskwindow_full_message_ego;
typedef struct taskwindow_full_message_new_task taskwindow_full_message_new_task;

/********************
 * Type definitions *
 ********************/
struct taskwindow_message_data
   {  int size;
      char data [232];
   };

struct taskwindow_message_ego
   {  int txt;
   };

struct taskwindow_message_new_task
   {  char command [236];
   };

struct taskwindow_full_message_data
   {  wimp_MESSAGE_HEADER_MEMBERS
      int data_size;
      char data [232];
   };

struct taskwindow_full_message_ego
   {  wimp_MESSAGE_HEADER_MEMBERS
      int txt;
   };

struct taskwindow_full_message_new_task
   {  wimp_MESSAGE_HEADER_MEMBERS
      char command [236];
   };

/************************
 * Constant definitions *
 ************************/
#define error_TASK_WINDOW_CANT_KILL             0xA80u
#define error_TASK_WINDOW_BAD_SWI_ENTRY         0xA81u
#define error_TASK_WINDOW_BAD_TASK_HANDLE       0xA82u
#define error_TASK_WINDOW_DYING                 0xA83u
#define error_TASK_WINDOW_FILE_SLEEP            0xA84u
#define error_TASK_WINDOW_NO_EDITOR             0xA85u
#define error_TASK_WINDOW_NO_REDIRECTION        0xA86u
#define message_TASK_WINDOW_INPUT               0x808C0u
#define message_TASK_WINDOW_OUTPUT              0x808C1u
#define message_TASK_WINDOW_EGO                 0x808C2u
#define message_TASK_WINDOW_MORIO               0x808C3u
#define message_TASK_WINDOW_MORITE              0x808C4u
#define message_TASK_WINDOW_NEW_TASK            0x808C5u
#define message_TASK_WINDOW_SUSPEND             0x808C6u
#define message_TASK_WINDOW_RESUME              0x808C7u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      taskwindowtaskinfo_window_task()
 *
 * Description:   Obtains whether the calling task is running in a task
 *                window
 *
 * Output:        window_task - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43380 with R0 = 0x0.
 */

extern os_error *xtaskwindowtaskinfo_window_task (osbool *window_task);
extern osbool taskwindowtaskinfo_window_task (void);

/* ------------------------------------------------------------------------
 * Function:      upcall_sleep()
 *
 * Description:   Informs the TaskWindow module that a task wants to sleep
 *                until some termination condition is met
 *
 * Input:         pollword - value of R1 on entry
 *
 * Output:        claimed - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x6.
 */

extern os_error *xupcall_sleep (int *pollword,
      osbool *claimed);
extern osbool upcall_sleep (int *pollword);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
