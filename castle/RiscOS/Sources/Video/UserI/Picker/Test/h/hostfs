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
#ifndef hostfs_H
#define hostfs_H

/* C header file for HostFS
 * written by DefMod (Oct 24 1994) on Thu Dec  8 10:54:32 1994
 * Copyright © Acorn Computers Ltd, 1994
 */

#ifndef types_H
   #include "types.h"
#endif

#ifndef os_H
   #include "os.h"
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  HostFS_HostVdu
#define HostFS_HostVdu                          0x40100
#undef  XHostFS_HostVdu
#define XHostFS_HostVdu                         0x60100
#undef  HostFS_TubeVdu
#define HostFS_TubeVdu                          0x40101
#undef  XHostFS_TubeVdu
#define XHostFS_TubeVdu                         0x60101
#undef  HostFS_WriteC
#define HostFS_WriteC                           0x40102
#undef  XHostFS_WriteC
#define XHostFS_WriteC                          0x60102

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      hostfs_host_vdu()
 *
 * Description:   Calls SWI 0x40100
 */

extern os_error *xhostfs_host_vdu (void);
__swi (0x40100) void hostfs_host_vdu (void);

/* ------------------------------------------------------------------------
 * Function:      hostfs_tube_vdu()
 *
 * Description:   Calls SWI 0x40101
 */

extern os_error *xhostfs_tube_vdu (void);
__swi (0x40101) void hostfs_tube_vdu (void);

/* ------------------------------------------------------------------------
 * Function:      hostfs_writec()
 *
 * Description:   Calls SWI 0x40102
 *
 * Input:         c - value of R0 on entry
 */

extern os_error *xhostfs_writec (char c);
__swi (0x40102) void hostfs_writec (char c);

#ifdef __cplusplus
   }
#endif

#endif
