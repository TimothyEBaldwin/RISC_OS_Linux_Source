#ifndef sharedclibrary_H
#define sharedclibrary_H

/* C header file for SharedCLibrary
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  SharedCLibrary_LibInitAPCS_A
#define SharedCLibrary_LibInitAPCS_A            0x80680
#undef  XSharedCLibrary_LibInitAPCS_A
#define XSharedCLibrary_LibInitAPCS_A           0xA0680
#undef  SharedCLibrary_LibInitAPCS_R
#define SharedCLibrary_LibInitAPCS_R            0x80681
#undef  XSharedCLibrary_LibInitAPCS_R
#define XSharedCLibrary_LibInitAPCS_R           0xA0681
#undef  SharedCLibrary_LibInitModule
#define SharedCLibrary_LibInitModule            0x80682
#undef  XSharedCLibrary_LibInitModule
#define XSharedCLibrary_LibInitModule           0xA0682
#undef  SharedCLibrary_LibInitAPCS_32
#define SharedCLibrary_LibInitAPCS_32           0x80683
#undef  XSharedCLibrary_LibInitAPCS_32
#define XSharedCLibrary_LibInitAPCS_32          0xA0683
#undef  SharedCLibrary_LibInitModuleAPCS_32
#define SharedCLibrary_LibInitModuleAPCS_32     0x80684
#undef  XSharedCLibrary_LibInitModuleAPCS_32
#define XSharedCLibrary_LibInitModuleAPCS_32    0xA0684

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct sharedclibrary_stub              sharedclibrary_stub;
typedef struct sharedclibrary_stub_list         sharedclibrary_stub_list;
typedef struct sharedclibrary_stub_list_base    sharedclibrary_stub_list_base;

/********************
 * Type definitions *
 ********************/
struct sharedclibrary_stub
   {  int chunk_id;
      byte **entry_vector;
      byte **entry_vector_limit;
      byte *static_data;
      byte *static_data_limit;
   };

struct sharedclibrary_stub_list
   {  sharedclibrary_stub stub [UNKNOWN];
   };

#define sharedclibrary_STUB_LIST(N) \
   struct \
      {  sharedclibrary_stub stub [N]; \
      }

#define sharedclibrary_SIZEOF_STUB_LIST(N) \
   ((N)*sizeof ((sharedclibrary_stub_list *) NULL)->stub)

/************************
 * Constant definitions *
 ************************/
#define sharedclibrary_ROOT_STACK_SIZE_SHIFT    16

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      sharedclibrary_lib_init_apcs_r()
 *
 * Description:   Interfaces an application using A P C S-R with the Shared
 *                C Library
 *
 * Input:         stub_list - value of R0 on entry
 *                workspace - value of R1 on entry
 *                workspace_limit - value of R2 on entry
 *                shifted_root_stack_size - value of R6 on entry
 *
 * Output:        stack - value of R1 on exit
 *                stack_limit - value of R2 on exit
 *                version - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x80681 with R3 = 0xFFFFFFFF, R4 = 0x0, R5 = 0xFFFFFFFF.
 */

extern os_error *xsharedclibrary_lib_init_apcs_r (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);
extern void sharedclibrary_lib_init_apcs_r (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);

/* ------------------------------------------------------------------------
 * Function:      sharedclibrary_lib_init_module()
 *
 * Description:   Interfaces a module using A P C S-R with the Shared C
 *                Library
 *
 * Input:         stub_list - value of R0 on entry
 *                workspace - value of R1 on entry
 *                workspace_limit - value of R2 on entry
 *                clear - value of R3 on entry
 *                static_data - value of R4 on entry
 *                static_data_limit - value of R5 on entry
 *                shifted_root_stack_size - value of R6 on entry
 *
 * Output:        stack - value of R1 on exit
 *                stack_limit - value of R2 on exit
 *                version - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x80682.
 */

extern os_error *xsharedclibrary_lib_init_module (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      byte *clear,
      byte const *static_data,
      byte *static_data_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);
extern void sharedclibrary_lib_init_module (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      byte *clear,
      byte const *static_data,
      byte *static_data_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);

/* ------------------------------------------------------------------------
 * Function:      sharedclibrary_lib_init_apcs_32()
 *
 * Description:   Interfaces an application using A P C S-32 with the
 *                Shared C Library
 *
 * Input:         stub_list - value of R0 on entry
 *                workspace - value of R1 on entry
 *                workspace_limit - value of R2 on entry
 *                shifted_root_stack_size - value of R6 on entry
 *
 * Output:        stack - value of R1 on exit
 *                stack_limit - value of R2 on exit
 *                version - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x80683 with R3 = 0xFFFFFFFF, R4 = 0x0, R5 = 0xFFFFFFFF.
 */

extern os_error *xsharedclibrary_lib_init_apcs_32 (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);
extern void sharedclibrary_lib_init_apcs_32 (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);

/* ------------------------------------------------------------------------
 * Function:      sharedclibrary_lib_init_module_apcs_32()
 *
 * Description:   Interfaces a module using A P C S-32 with the Shared C
 *                Library
 *
 * Input:         stub_list - value of R0 on entry
 *                workspace - value of R1 on entry
 *                workspace_limit - value of R2 on entry
 *                clear - value of R3 on entry
 *                static_data - value of R4 on entry
 *                static_data_limit - value of R5 on entry
 *                shifted_root_stack_size - value of R6 on entry
 *
 * Output:        stack - value of R1 on exit
 *                stack_limit - value of R2 on exit
 *                version - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x80684.
 */

extern os_error *xsharedclibrary_lib_init_module_apcs_32 (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      byte *clear,
      byte const *static_data,
      byte *static_data_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);
extern void sharedclibrary_lib_init_module_apcs_32 (sharedclibrary_stub_list const *stub_list,
      void *workspace,
      void *workspace_limit,
      byte *clear,
      byte const *static_data,
      byte *static_data_limit,
      int shifted_root_stack_size,
      byte **stack,
      byte **stack_limit,
      int *version);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
