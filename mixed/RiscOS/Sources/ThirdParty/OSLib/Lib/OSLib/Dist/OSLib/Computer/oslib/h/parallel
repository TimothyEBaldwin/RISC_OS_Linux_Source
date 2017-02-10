#ifndef parallel_H
#define parallel_H

/* C header file for Parallel
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Parallel_HardwareAddress
#define Parallel_HardwareAddress                0x42EC0
#undef  XParallel_HardwareAddress
#define XParallel_HardwareAddress               0x62EC0
#undef  Parallel_Op
#define Parallel_Op                             0x42EC1
#undef  XParallel_Op
#define XParallel_Op                            0x62EC1
#undef  ParallelOp_Read
#define ParallelOp_Read                         0x0
#undef  ParallelOp_WriteData
#define ParallelOp_WriteData                    0x1
#undef  ParallelOp_WriteControl
#define ParallelOp_WriteControl                 0x2

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      parallelop_read()
 *
 * Description:   Reads the data and status registers
 *
 * Output:        data_register - value of R1 on exit
 *                status_register - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x42EC1 with R0 = 0x0.
 */

extern os_error *xparallelop_read (bits *data_register,
      bits *status_register);
extern void parallelop_read (bits *data_register,
      bits *status_register);

/* ------------------------------------------------------------------------
 * Function:      parallelop_write_data()
 *
 * Description:   Writes the data register
 *
 * Input:         data - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x42EC1 with R0 = 0x1.
 */

extern os_error *xparallelop_write_data (bits data);
extern void parallelop_write_data (bits data);

/* ------------------------------------------------------------------------
 * Function:      parallelop_write_control()
 *
 * Description:   Reads/writes the control register
 *
 * Input:         eor_mask - value of R1 on entry
 *                and_mask - value of R2 on entry
 *
 * Output:        old_control - value of R1 on exit (X version only)
 *                new_control - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42EC1 with R0 = 0x2.
 */

extern os_error *xparallelop_write_control (bits eor_mask,
      bits and_mask,
      bits *old_control,
      bits *new_control);
extern bits parallelop_write_control (bits eor_mask,
      bits and_mask,
      bits *new_control);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
