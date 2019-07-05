#ifndef nfs_H
#define nfs_H

/* C header file for NFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 July 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  NFS_Mount
#define NFS_Mount                               0x410C0
#undef  XNFS_Mount
#define XNFS_Mount                              0x610C0
#undef  NFS_MountList
#define NFS_MountList                           0x410C1
#undef  XNFS_MountList
#define XNFS_MountList                          0x610C1
#undef  NFS_SetUser
#define NFS_SetUser                             0x410C2
#undef  XNFS_SetUser
#define XNFS_SetUser                            0x610C2
#undef  NFS_Dismount
#define NFS_Dismount                            0x410C3
#undef  XNFS_Dismount
#define XNFS_Dismount                           0x610C3
#undef  NFS_MountInfo
#define NFS_MountInfo                           0x410C4
#undef  XNFS_MountInfo
#define XNFS_MountInfo                          0x610C4
#undef  NFS_FreeSpace
#define NFS_FreeSpace                           0x410C5
#undef  XNFS_FreeSpace
#define XNFS_FreeSpace                          0x610C5
#undef  Service_NFS
#define Service_NFS                             0x61

/************************
 * Constant definitions *
 ************************/
#define nfs_NOBODY_ID                           32767
#define nfs_NOBODY_GROUP                        9999

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      nfs_mount()
 *
 * Description:   Mounts a directory
 *
 * Input:         file_server - value of R0 on entry
 *                mount_name - value of R1 on entry
 *                path - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x410C0.
 */

extern os_error *xnfs_mount (char const *file_server,
      char const *mount_name,
      char const *path);
__swi (0x410C0) void nfs_mount (char const *file_server,
      char const *mount_name,
      char const *path);

/* ------------------------------------------------------------------------
 * Function:      nfs_mount_list()
 *
 * Description:   Lists current mount points
 *
 * Input:         file_server - value of R0 on entry
 *                context - value of R1 on entry
 *
 * Output:        context_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x410C1.
 */

extern os_error *xnfs_mount_list (char const *file_server,
      char *context,
      char **context_out);
extern char *nfs_mount_list (char const *file_server,
      char *context);

/* ------------------------------------------------------------------------
 * Function:      nfs_set_user()
 *
 * Description:   Sets the current user
 *
 * Input:         name_server - value of R0 on entry
 *                user_name - value of R1 on entry
 *                password - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x410C2.
 */

extern os_error *xnfs_set_user (char const *name_server,
      char const *user_name,
      char const *password);
__swi (0x410C2) void nfs_set_user (char const *name_server,
      char const *user_name,
      char const *password);

/* ------------------------------------------------------------------------
 * Function:      nfs_dismount()
 *
 * Description:   Dismounts a directory
 *
 * Input:         file_server - value of R0 on entry
 *                mount_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x410C3.
 */

extern os_error *xnfs_dismount (char const *file_server,
      char const *mount_name);
__swi (0x410C3) void nfs_dismount (char const *file_server,
      char const *mount_name);

/* ------------------------------------------------------------------------
 * Function:      nfs_mount_info()
 *
 * Description:   Provides information about a given mount
 *
 * Input:         mount_name - value of R1 on entry
 *
 * Output:        file_server - value of R0 on exit
 *                path - value of R2 on exit
 *                user_name - value of R3 on exit
 *                name_server - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x410C4.
 */

extern os_error *xnfs_mount_info (char const *mount_name,
      char **file_server,
      char **path,
      char **user_name,
      char **name_server);
extern void nfs_mount_info (char const *mount_name,
      char **file_server,
      char **path,
      char **user_name,
      char **name_server);

/* ------------------------------------------------------------------------
 * Function:      nfs_free_space()
 *
 * Description:   Provides free-space information about a mount
 *
 * Input:         mount_name - value of R1 on entry
 *
 * Output:        free - value of R0 on exit (X version only)
 *                size - value of R2 on exit
 *                unused - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x410C5.
 */

extern os_error *xnfs_free_space (char const *mount_name,
      int *free,
      int *size,
      int *unused);
extern int nfs_free_space (char const *mount_name,
      int *size,
      int *unused);

/* ------------------------------------------------------------------------
 * Function:      service_nfs()
 *
 * Description:   An N F S mount or dismount has occurred
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x61.
 */

extern os_error *xservice_nfs (void);
extern void service_nfs (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
