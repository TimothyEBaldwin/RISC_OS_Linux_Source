#ifndef fileraction_H
#define fileraction_H

/* C header file for FilerAction
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 18 May 1995
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
#undef  FilerAction_SendSelectedDirectory
#define FilerAction_SendSelectedDirectory       0x40F80
#undef  XFilerAction_SendSelectedDirectory
#define XFilerAction_SendSelectedDirectory      0x60F80
#undef  FilerAction_SendSelectedFile
#define FilerAction_SendSelectedFile            0x40F81
#undef  XFilerAction_SendSelectedFile
#define XFilerAction_SendSelectedFile           0x60F81
#undef  FilerAction_SendStartOperation
#define FilerAction_SendStartOperation          0x40F82
#undef  XFilerAction_SendStartOperation
#define XFilerAction_SendStartOperation         0x60F82
#undef  FilerActionSendStartOperation_Copy
#define FilerActionSendStartOperation_Copy      0x0
#undef  FilerActionSendStartOperation_MoveLocal
#define FilerActionSendStartOperation_MoveLocal 0x1
#undef  FilerActionSendStartOperation_Delete
#define FilerActionSendStartOperation_Delete    0x2
#undef  FilerActionSendStartOperation_Access
#define FilerActionSendStartOperation_Access    0x3
#undef  FilerActionSendStartOperation_SetType
#define FilerActionSendStartOperation_SetType   0x4
#undef  FilerActionSendStartOperation_Count
#define FilerActionSendStartOperation_Count     0x5
#undef  FilerActionSendStartOperation_Move
#define FilerActionSendStartOperation_Move      0x6
#undef  FilerActionSendStartOperation_CopyLocal
#define FilerActionSendStartOperation_CopyLocal 0x7
#undef  FilerActionSendStartOperation_Stamp
#define FilerActionSendStartOperation_Stamp     0x8
#undef  FilerActionSendStartOperation_Find
#define FilerActionSendStartOperation_Find      0x9

/********************
 * Type definitions *
 ********************/
typedef int fileraction_operation;

typedef bits fileraction_flags;

/************************
 * Constant definitions *
 ************************/
#define fileraction_COPY                        ((fileraction_operation) 0x0u)
#define fileraction_MOVE_LOCAL                  ((fileraction_operation) 0x1u)
#define fileraction_DELETE                      ((fileraction_operation) 0x2u)
#define fileraction_ACCESS                      ((fileraction_operation) 0x3u)
#define fileraction_SET_TYPE                    ((fileraction_operation) 0x4u)
#define fileraction_COUNT                       ((fileraction_operation) 0x5u)
#define fileraction_MOVE                        ((fileraction_operation) 0x6u)
#define fileraction_COPY_LOCAL                  ((fileraction_operation) 0x7u)
#define fileraction_STAMP                       ((fileraction_operation) 0x8u)
#define fileraction_FIND                        ((fileraction_operation) 0x9u)
#define fileraction_VERBOSE                     ((fileraction_flags) 0x1u)
#define fileraction_CONFIRM                     ((fileraction_flags) 0x2u)
#define fileraction_FORCE                       ((fileraction_flags) 0x4u)
#define fileraction_NEWER                       ((fileraction_flags) 0x8u)
#define fileraction_RECURSE                     ((fileraction_flags) 0x10u)
#define fileraction_CONFIRM_DELETES_ONLY        ((fileraction_flags) 0x20u)
      /*RISC O S 4+*/
#define fileraction_FASTER                      ((fileraction_flags) 0x40u)
      /*RISC O S 4+*/
#define fileraction_NEVER_PROXY                 ((fileraction_flags) 0x80u)
      /*RISC O S Select*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fileraction_send_selected_directory()
 *
 * Description:   Sends a message specifying the directory containing the
 *                selection
 *
 * Input:         task - value of R0 on entry
 *                name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40F80.
 */

extern os_error *xfileraction_send_selected_directory (wimp_t task,
      char const *name);
__swi (0x40F80) void fileraction_send_selected_directory (wimp_t task,
      char const *name);

/* ------------------------------------------------------------------------
 * Function:      fileraction_send_selected_file()
 *
 * Description:   Sends a message specifying a selected file within the
 *                given directory
 *
 * Input:         task - value of R0 on entry
 *                leaf_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40F81.
 */

extern os_error *xfileraction_send_selected_file (wimp_t task,
      char const *leaf_name);
__swi (0x40F81) void fileraction_send_selected_file (wimp_t task,
      char const *leaf_name);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_copy()
 *
 * Description:   Sends a message to start a copy
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                destination - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x0.
 */

extern os_error *xfileractionsendstartoperation_copy (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);
extern void fileractionsendstartoperation_copy (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_move_local()
 *
 * Description:   Sends a message to start a move (by renaming)
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                destination - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x1.
 */

extern os_error *xfileractionsendstartoperation_move_local (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);
extern void fileractionsendstartoperation_move_local (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_delete()
 *
 * Description:   Sends a message to start a delete
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x2, R4 = 0x0.
 */

extern os_error *xfileractionsendstartoperation_delete (wimp_t task,
      fileraction_flags flags);
extern void fileractionsendstartoperation_delete (wimp_t task,
      fileraction_flags flags);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_access()
 *
 * Description:   Sends a message to start an access modification
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                access - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x3, R4 = 0x4.
 */

extern os_error *xfileractionsendstartoperation_access (wimp_t task,
      fileraction_flags flags,
      int const *access);
extern void fileractionsendstartoperation_access (wimp_t task,
      fileraction_flags flags,
      int const *access);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_set_type()
 *
 * Description:   Sends a message to start a set type
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                file_type - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x4, R4 = 0x4.
 */

extern os_error *xfileractionsendstartoperation_set_type (wimp_t task,
      fileraction_flags flags,
      bits const *file_type);
extern void fileractionsendstartoperation_set_type (wimp_t task,
      fileraction_flags flags,
      bits const *file_type);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_count()
 *
 * Description:   Sends a message to start a count
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x5, R4 = 0x0.
 */

extern os_error *xfileractionsendstartoperation_count (wimp_t task,
      fileraction_flags flags);
extern void fileractionsendstartoperation_count (wimp_t task,
      fileraction_flags flags);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_move()
 *
 * Description:   Sends a message to start a move (by copying and deleting)
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                destination - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x6.
 */

extern os_error *xfileractionsendstartoperation_move (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);
extern void fileractionsendstartoperation_move (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_copy_local()
 *
 * Description:   Sends a message to start a copy within a directory
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                destination - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x7.
 */

extern os_error *xfileractionsendstartoperation_copy_local (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);
extern void fileractionsendstartoperation_copy_local (wimp_t task,
      fileraction_flags flags,
      char const *destination,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_stamp()
 *
 * Description:   Sends a message to start a stamp
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x8, R4 = 0x0.
 */

extern os_error *xfileractionsendstartoperation_stamp (wimp_t task,
      fileraction_flags flags);
extern void fileractionsendstartoperation_stamp (wimp_t task,
      fileraction_flags flags);

/* ------------------------------------------------------------------------
 * Function:      fileractionsendstartoperation_find()
 *
 * Description:   Sends a message to start a file search
 *
 * Input:         task - value of R0 on entry
 *                flags - value of R2 on entry
 *                file_name - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40F82 with R1 = 0x9.
 */

extern os_error *xfileractionsendstartoperation_find (wimp_t task,
      fileraction_flags flags,
      char const *file_name,
      int size);
extern void fileractionsendstartoperation_find (wimp_t task,
      fileraction_flags flags,
      char const *file_name,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
