#ifndef sharefs_H
#define sharefs_H

/* C header file for ShareFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 22 Aug 1995
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

#ifndef freeway_H
#include "oslib/freeway.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ShareFS_CreateShare
#define ShareFS_CreateShare                     0x47AC0
#undef  XShareFS_CreateShare
#define XShareFS_CreateShare                    0x67AC0
#undef  ShareFS_StopShare
#define ShareFS_StopShare                       0x47AC1
#undef  XShareFS_StopShare
#define XShareFS_StopShare                      0x67AC1
#undef  ShareFS_EnumerateShares
#define ShareFS_EnumerateShares                 0x47AC2
#undef  XShareFS_EnumerateShares
#define XShareFS_EnumerateShares                0x67AC2
#undef  Service_ShareFSStarting
#define Service_ShareFSStarting                 0x97
#undef  Service_ShareFSTerminating
#define Service_ShareFSTerminating              0x98

/********************
 * Type definitions *
 ********************/
typedef bits sharefs_attr;

typedef bits sharefs_share_flags;

typedef bits sharefs_stop_flags;

typedef bits sharefs_enumerate_flags;

typedef bits sharefs_starting_flags;

typedef bits sharefs_terminating_flags;

/************************
 * Constant definitions *
 ************************/
#define sharefs_ATTR_DISC                       ((sharefs_attr) 0x1u)
#define sharefs_ATTR_DISCP                      ((sharefs_attr) 0x2u)
#define sharefs_ATTR_DISC_RO                    ((sharefs_attr) 0x4u)
#define sharefs_ATTR_HIDDEN                     ((sharefs_attr) 0x8u)
#define sharefs_ATTR_SUBDIR_AUTH                ((sharefs_attr) 0x10u)
#define sharefs_ATTR_CDROM                      ((sharefs_attr) 0x20u)
#define sharefs_ATTR_CDROM_AUTH                 ((sharefs_attr) 0x40u)
#define sharefs_FILE_TYPE_DISCP                 0xBD9u
#define sharefs_FILE_TYPE_DISC                  0xBDAu
#define sharefs_FILE_TYPE_SUBDIR                0xFAFu
#define sharefs_FILE_TYPE_CDROM                 0xFADu
#define sharefs_FILE_TYPE_DISCR                 0xFB4u
#define sharefs_FILE_TYPE_NO_DISC               0xFB5u
#define sharefs_SHARE_DISC                      ((sharefs_share_flags) 0x0u)
#define sharefs_SHARE_DISCP                     ((sharefs_share_flags) 0x1u)
#define sharefs_SHARE_DISC_RO                   ((sharefs_share_flags) 0x2u)
#define sharefs_SHARE_HIDDEN                    ((sharefs_share_flags) 0x4u)
#define sharefs_SHARE_SUBDIR_AUTH               ((sharefs_share_flags) 0x8u)
#define sharefs_SHARE_CDROM                     ((sharefs_share_flags) 0x10u)
#define sharefs_SHARE_CDROM_AUTH                ((sharefs_share_flags) 0x20u)
#define sharefs_NO_MORE                         (-1)
#define sharefs_ENUMERATE_PROTECTED             ((sharefs_enumerate_flags) 0x1u)
#define sharefs_ENUMERATE_READ_ONLY             ((sharefs_enumerate_flags) 0x2u)
#define sharefs_ENUMERATE_HIDDEN                ((sharefs_enumerate_flags) 0x4u)
#define sharefs_ENUMERATE_SUBDIR                ((sharefs_enumerate_flags) 0x8u)
#define sharefs_ENUMERATE_CDROM                 ((sharefs_enumerate_flags) 0x10u)
#define sharefs_ENUMERATE_AUTHENTICATED         ((sharefs_enumerate_flags) 0x80000000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      sharefs_create_share()
 *
 * Description:   Start sharing a local disc or subdirectory, or change the
 *                mode of an existing share
 *
 * Input:         flags - value of R0 on entry
 *                obj_name - value of R1 on entry
 *                dir_path - value of R2 on entry
 *                authentication - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x47AC0.
 */

extern os_error *xsharefs_create_share (sharefs_share_flags flags,
      char const *obj_name,
      char const *dir_path,
      int authentication);
__swi (0x47AC0) void sharefs_create_share (sharefs_share_flags flags,
      char const *obj_name,
      char const *dir_path,
      int authentication);

/* ------------------------------------------------------------------------
 * Function:      sharefs_stop_share()
 *
 * Description:   Stop sharing a local directory
 *
 * Input:         flags - value of R0 on entry
 *                obj_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47AC1.
 */

extern os_error *xsharefs_stop_share (sharefs_stop_flags flags,
      char const *obj_name);
__swi (0x47AC1) void sharefs_stop_share (sharefs_stop_flags flags,
      char const *obj_name);

/* ------------------------------------------------------------------------
 * Function:      sharefs_enumerate_shares()
 *
 * Description:   Enumerates authenticated or unauthenticated shares
 *                currently active on this machine
 *
 * Input:         flags - value of R0 on entry
 *                context - value of R4 on entry
 *
 * Output:        obj_name - value of R1 on exit
 *                dir_path - value of R2 on exit
 *                attr - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *                authentication - value of R5 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x47AC2.
 */

extern os_error *xsharefs_enumerate_shares (sharefs_enumerate_flags flags,
      int context,
      char **obj_name,
      char **dir_path,
      sharefs_attr *attr,
      int *context_out,
      int *authentication);
extern int sharefs_enumerate_shares (sharefs_enumerate_flags flags,
      int context,
      char **obj_name,
      char **dir_path,
      sharefs_attr *attr,
      int *authentication);

/* ------------------------------------------------------------------------
 * Function:      service_share_fs_starting()
 *
 * Description:   ShareFS has started up
 *
 * Input:         flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x97.
 */

extern os_error *xservice_share_fs_starting (sharefs_starting_flags flags);
extern void service_share_fs_starting (sharefs_starting_flags flags);

/* ------------------------------------------------------------------------
 * Function:      service_share_fs_terminating()
 *
 * Description:   ShareFS is terminating
 *
 * Input:         flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x98.
 */

extern os_error *xservice_share_fs_terminating (sharefs_terminating_flags flags);
extern void service_share_fs_terminating (sharefs_terminating_flags flags);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
