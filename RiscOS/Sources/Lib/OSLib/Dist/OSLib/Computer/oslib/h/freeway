#ifndef freeway_H
#define freeway_H

/* C header file for Freeway
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 5 June 1995
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
#undef  Freeway_Register
#define Freeway_Register                        0x47A80
#undef  XFreeway_Register
#define XFreeway_Register                       0x67A80
#undef  Freeway_Write
#define Freeway_Write                           0x47A81
#undef  XFreeway_Write
#define XFreeway_Write                          0x67A81
#undef  Freeway_Read
#define Freeway_Read                            0x47A82
#undef  XFreeway_Read
#define XFreeway_Read                           0x67A82
#undef  Freeway_Enumerate
#define Freeway_Enumerate                       0x47A83
#undef  XFreeway_Enumerate
#define XFreeway_Enumerate                      0x67A83
#undef  Service_FreewayStarting
#define Service_FreewayStarting                 0x95
#undef  Service_FreewayTerminating
#define Service_FreewayTerminating              0x96
#undef  UpCall_Freeway
#define UpCall_Freeway                          0xC

/********************
 * Type definitions *
 ********************/
typedef int freeway_object_type;

typedef bits freeway_interest_flags;

typedef bits freeway_object_flags;

typedef bits freeway_read_flags;

typedef bits freeway_enumerate_flags;

typedef bits freeway_starting_flags;

typedef bits freeway_terminating_flags;

typedef int freeway_upcall_reason;

/************************
 * Constant definitions *
 ************************/
#define freeway_TYPE_DISC                       ((freeway_object_type) 0x1u)
#define freeway_TYPE_PRINTER                    ((freeway_object_type) 0x2u)
#define freeway_TYPE_HOST                       ((freeway_object_type) 0x5u)
#define freeway_INTEREST_REGISTER               ((freeway_interest_flags) 0x0u)
#define freeway_INTEREST_DEREGISTER             ((freeway_interest_flags) 0x1u)
#define freeway_INTEREST_UNAUTHENTICATED        ((freeway_interest_flags) 0x0u)
#define freeway_INTEREST_AUTHENTICATED          ((freeway_interest_flags) 0x2u)
#define freeway_OBJECT_ADD                      ((freeway_object_flags) 0x0u)
#define freeway_OBJECT_REMOVE                   ((freeway_object_flags) 0x1u)
#define freeway_OBJECT_UNAUTHENTICATED          ((freeway_object_flags) 0x0u)
#define freeway_OBJECT_AUTHENTICATED            ((freeway_object_flags) 0x2u)
#define freeway_READ_GIVEN_AUTHENTICATION       ((freeway_read_flags) 0x1u)
#define freeway_NO_MORE                         (-1)
#define freeway_ENUMERATE_AUTHENTICATED         ((freeway_enumerate_flags) 0x1u)
#define freeway_OBJECT_ADDED                    ((freeway_upcall_reason) 0x0u)
#define freeway_OBJECT_REMOVED                  ((freeway_upcall_reason) 0x1u)
#define freeway_OBJECT_CHANGED                  ((freeway_upcall_reason) 0x2u)
#define freeway_OBJECT_DELETED                  ((freeway_upcall_reason) 0x3u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      freeway_register()
 *
 * Description:   Registers/deregisters interest in objects of a given
 *                Freeway type
 *
 * Input:         flags - value of R0 on entry
 *                type - value of R1 on entry
 *                authentication - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47A80.
 */

extern os_error *xfreeway_register (freeway_interest_flags flags,
      freeway_object_type type,
      int authentication);
__swi (0x47A80) void freeway_register (freeway_interest_flags flags,
      freeway_object_type type,
      int authentication);

/* ------------------------------------------------------------------------
 * Function:      freeway_write()
 *
 * Description:   Adds/removes an object of a given type
 *
 * Input:         flags - value of R0 on entry
 *                type - value of R1 on entry
 *                obj_name - value of R2 on entry
 *                size - value of R3 on entry
 *                desc - value of R4 on entry
 *                authentication - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x47A81.
 */

extern os_error *xfreeway_write (freeway_object_flags flags,
      freeway_object_type type,
      char const *obj_name,
      int size,
      char const *desc,
      int authentication);
extern void freeway_write (freeway_object_flags flags,
      freeway_object_type type,
      char const *obj_name,
      int size,
      char const *desc,
      int authentication);

/* ------------------------------------------------------------------------
 * Function:      freeway_read()
 *
 * Description:   Reads attributes of an object
 *
 * Input:         flags - value of R0 on entry
 *                type - value of R1 on entry
 *                obj_name - value of R2 on entry
 *                size - value of R3 on entry
 *                desc - value of R4 on entry
 *                authentication - value of R5 on entry
 *
 * Output:        size_out - value of R3 on exit (X version only)
 *                ip_addr - value of R5 on exit
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x47A82.
 */

extern os_error *xfreeway_read (freeway_read_flags flags,
      freeway_object_type type,
      char const *obj_name,
      int size,
      char *desc,
      int authentication,
      int *size_out,
      bits *ip_addr);
extern int freeway_read (freeway_read_flags flags,
      freeway_object_type type,
      char const *obj_name,
      int size,
      char *desc,
      int authentication,
      bits *ip_addr);

/* ------------------------------------------------------------------------
 * Function:      freeway_enumerate()
 *
 * Description:   Enumerates objects of a given type
 *
 * Input:         flags - value of R0 on entry
 *                type - value of R1 on entry
 *                obj_name_size - value of R2 on entry
 *                obj_name - value of R3 on entry
 *                desc_size - value of R4 on entry
 *                desc - value of R5 on entry
 *                context - value of R7 on entry
 *                authentication - value of R8 on entry
 *
 * Output:        obj_name_size_out - value of R2 on exit
 *                desc_size_out - value of R4 on exit
 *                ip_addr - value of R6 on exit
 *                context_out - value of R7 on exit (X version only)
 *
 * Returns:       R7 (non-X version only)
 *
 * Other notes:   Calls SWI 0x47A83 with R6 = 0x0.
 */

extern os_error *xfreeway_enumerate (freeway_enumerate_flags flags,
      freeway_object_type type,
      int obj_name_size,
      char *obj_name,
      int desc_size,
      char *desc,
      int context,
      int authentication,
      int *obj_name_size_out,
      int *desc_size_out,
      bits *ip_addr,
      int *context_out);
extern int freeway_enumerate (freeway_enumerate_flags flags,
      freeway_object_type type,
      int obj_name_size,
      char *obj_name,
      int desc_size,
      char *desc,
      int context,
      int authentication,
      int *obj_name_size_out,
      int *desc_size_out,
      bits *ip_addr);

/* ------------------------------------------------------------------------
 * Function:      service_freeway_starting()
 *
 * Description:   Freeway is starting up
 *
 * Input:         flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x95.
 */

extern os_error *xservice_freeway_starting (freeway_starting_flags flags);
extern void service_freeway_starting (freeway_starting_flags flags);

/* ------------------------------------------------------------------------
 * Function:      service_freeway_terminating()
 *
 * Description:   Freeway is terminating
 *
 * Input:         flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x96.
 */

extern os_error *xservice_freeway_terminating (freeway_terminating_flags flags);
extern void service_freeway_terminating (freeway_terminating_flags flags);

/* ------------------------------------------------------------------------
 * Function:      upcall_freeway()
 *
 * Description:   Warns that an object has been added or changed, removed
 *                (by the holder), or deleted (by Freeway)
 *
 * Input:         reason - value of R1 on entry
 *                type - value of R2 on entry
 *                obj_name - value of R3 on entry
 *                desc_size - value of R4 on entry
 *                desc - value of R5 on entry
 *                ip_addr - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xC.
 */

extern os_error *xupcall_freeway (freeway_upcall_reason reason,
      freeway_object_type type,
      char const *obj_name,
      int desc_size,
      char const *desc,
      bits ip_addr);
extern void upcall_freeway (freeway_upcall_reason reason,
      freeway_object_type type,
      char const *obj_name,
      int desc_size,
      char const *desc,
      bits ip_addr);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
