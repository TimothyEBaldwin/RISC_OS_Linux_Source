#ifndef fslock_H
#define fslock_H

/* C header file for FSLock
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  FSLock_Version
#define FSLock_Version                          0x44780
#undef  XFSLock_Version
#define XFSLock_Version                         0x64780
#undef  FSLock_Status
#define FSLock_Status                           0x44781
#undef  XFSLock_Status
#define XFSLock_Status                          0x64781
#undef  FSLock_ChangeStatus
#define FSLock_ChangeStatus                     0x44782
#undef  XFSLock_ChangeStatus
#define XFSLock_ChangeStatus                    0x64782

/********************
 * Type definitions *
 ********************/
typedef int fslock_lock_status;

/************************
 * Constant definitions *
 ************************/
#define fslock_STATUS_UNLOCKED                  ((fslock_lock_status) 0x0u)
#define fslock_STATUS_PROTECTED                 ((fslock_lock_status) 0x1u)
#define fslock_STATUS_LOCKED                    ((fslock_lock_status) 0x2u)
#define error_FS_LOCK_UNKNOWN_SWI               0x806500u
#define error_FS_LOCK_LOCKED                    0x806501u
#define error_FS_LOCK_UNKNOWN_FS                0x806502u
#define error_FS_LOCK_FS_NOT_LOCKABLE           0x806503u
#define error_FS_LOCK_NO_LOCKED_FS              0x806504u
#define error_FS_LOCK_PROTECTED_DISC            0x806505u
#define error_FS_LOCK_KILLED                    0x806506u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fslock_version()
 *
 * Description:   Returns information describing the FSLock module - RISC O
 *                S 3.5+
 *
 * Output:        version - value of R0 on exit (X version only)
 *                workspace - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44780.
 */

extern os_error *xfslock_version (int *version,
      void **workspace);
extern int fslock_version (void **workspace);

/* ------------------------------------------------------------------------
 * Function:      fslock_status()
 *
 * Description:   Returns the current lock status, and the locked filing
 *                system's number - RISC O S 3.5+
 *
 * Output:        lock_status - value of R0 on exit (X version only)
 *                fs_no - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44781.
 */

extern os_error *xfslock_status (fslock_lock_status *lock_status,
      fileswitch_fs_no *fs_no);
extern fslock_lock_status fslock_status (fileswitch_fs_no *fs_no);

/* ------------------------------------------------------------------------
 * Function:      fslock_change_status()
 *
 * Description:   Changes one or more of the lock status, the password and
 *                the locked filing system - RISC O S 3.5+
 *
 * Input:         new_lock_status - value of R0 on entry
 *                password - value of R1 on entry
 *                new_password - value of R2 on entry
 *                new_fs_no - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44782.
 */

extern os_error *xfslock_change_status (fslock_lock_status new_lock_status,
      char const *password,
      char const *new_password,
      fileswitch_fs_no new_fs_no);
__swi (0x44782) void fslock_change_status (fslock_lock_status new_lock_status,
      char const *password,
      char const *new_password,
      fileswitch_fs_no new_fs_no);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
