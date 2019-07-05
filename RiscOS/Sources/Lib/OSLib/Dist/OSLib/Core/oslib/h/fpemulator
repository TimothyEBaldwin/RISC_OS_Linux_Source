#ifndef fpemulator_H
#define fpemulator_H

/* C header file for FPEmulator
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 Apr 1994
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
#undef  FPEmulator_Version
#define FPEmulator_Version                      0x40480
#undef  XFPEmulator_Version
#define XFPEmulator_Version                     0x60480
#undef  FPEmulator_DeactivateContext
#define FPEmulator_DeactivateContext            0x40481
#undef  XFPEmulator_DeactivateContext
#define XFPEmulator_DeactivateContext           0x60481
#undef  FPEmulator_ActivateContext
#define FPEmulator_ActivateContext              0x40482
#undef  XFPEmulator_ActivateContext
#define XFPEmulator_ActivateContext             0x60482
#undef  FPEmulator_ChangedContext
#define FPEmulator_ChangedContext               0x40483
#undef  XFPEmulator_ChangedContext
#define XFPEmulator_ChangedContext              0x60483
#undef  FPEmulator_ContextLength
#define FPEmulator_ContextLength                0x40484
#undef  XFPEmulator_ContextLength
#define XFPEmulator_ContextLength               0x60484
#undef  FPEmulator_InitContext
#define FPEmulator_InitContext                  0x40485
#undef  XFPEmulator_InitContext
#define XFPEmulator_InitContext                 0x60485
#undef  FPEmulator_ExceptionDump
#define FPEmulator_ExceptionDump                0x40486
#undef  XFPEmulator_ExceptionDump
#define XFPEmulator_ExceptionDump               0x60486
#undef  FPEmulator_Abort
#define FPEmulator_Abort                        0x40487
#undef  XFPEmulator_Abort
#define XFPEmulator_Abort                       0x60487
#undef  FPEmulator_LoadContext
#define FPEmulator_LoadContext                  0x40488
#undef  XFPEmulator_LoadContext
#define XFPEmulator_LoadContext                 0x60488
#undef  FPEmulator_SaveContext
#define FPEmulator_SaveContext                  0x40489
#undef  XFPEmulator_SaveContext
#define XFPEmulator_SaveContext                 0x60489

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct fpemulator_context_              *fpemulator_context;
typedef struct fpemulator_register_dump         fpemulator_register_dump;

/********************
 * Type definitions *
 ********************/
typedef bits fpemulator_fpsr;

struct fpemulator_register_dump
   {  fpemulator_fpsr fpsr;
      byte f0 [12];
      byte f1 [12];
      byte f2 [12];
      byte f3 [12];
      byte f4 [12];
      byte f5 [12];
      byte f6 [12];
      byte f7 [12];
   };

/************************
 * Constant definitions *
 ************************/
#define fpemulator_NO_CONTEXT                   ((fpemulator_context) 0x0u)
      /*FPEmulator 4.12+*/
#define fpemulator_DEFAULT_CONTEXT              ((fpemulator_context) 0xFFFFFFFFu)
      /*FPEmulator 4.12+*/
#define fpemulator_CURRENT_CONTEXT              ((fpemulator_context) 0xFFFFFFFEu)
      /*FPEmulator 4.12+*/
#define fpemulator_FPSR_CUMULATIVE_IVO          ((fpemulator_fpsr) 0x1u)
      /*Invalid operation cumulative exception flag*/
#define fpemulator_FPSR_CUMULATIVE_DVZ          ((fpemulator_fpsr) 0x2u)
      /*Division by zero cumulative exception flag*/
#define fpemulator_FPSR_CUMULATIVE_OFL          ((fpemulator_fpsr) 0x4u)
      /*Overflow cumulative exception flag*/
#define fpemulator_FPSR_CUMULATIVE_UFL          ((fpemulator_fpsr) 0x8u)
      /*Underflow cumulative exception flag*/
#define fpemulator_FPSR_CUMULATIVE_INX          ((fpemulator_fpsr) 0x10u)
      /*Inexact cumulative exception flag*/
#define fpemulator_FPSR_CONTROL_ND              ((fpemulator_fpsr) 0x100u)
      /*No denormalised numbers*/
#define fpemulator_FPSR_CONTROL_NE              ((fpemulator_fpsr) 0x200u)
      /*NaN exception*/
#define fpemulator_FPSR_CONTROL_SO              ((fpemulator_fpsr) 0x400u)
      /*Select synchronous operation of FPA*/
#define fpemulator_FPSR_CONTROL_EP              ((fpemulator_fpsr) 0x800u)
      /*Use expanded packed decimal format*/
#define fpemulator_FPSR_CONTROL_AC              ((fpemulator_fpsr) 0x1000u)
      /*Use alternative definition for C flag on compare operations*/
#define fpemulator_FPSR_ENABLE_IVO              ((fpemulator_fpsr) 0x10000u)
      /*Invalid operation trap enable*/
#define fpemulator_FPSR_ENABLE_DVZ              ((fpemulator_fpsr) 0x20000u)
      /*Division by zero trap enable*/
#define fpemulator_FPSR_ENABLE_OFL              ((fpemulator_fpsr) 0x40000u)
      /*Overflow trap enable*/
#define fpemulator_FPSR_ENABLE_UFL              ((fpemulator_fpsr) 0x80000u)
      /*Underflow trap enable*/
#define fpemulator_FPSR_ENABLE_INX              ((fpemulator_fpsr) 0x100000u)
      /*Inexact trap enable*/
#define fpemulator_FPSR_SYSTEM_ID               ((fpemulator_fpsr) 0xFF000000u)
      /*System ID mask*/
#define fpemulator_FPSR_SYSTEM_ID_SHIFT         24
      /*System ID shift*/
#define fpemulator_FPSR_SYSTEM_CLASS            ((fpemulator_fpsr) 0x80000000u)
      /*System class*/
#define fpemulator_FPSR_SYSTEM_CLASS_SHIFT      31
      /*System class shift*/
#define fpemulator_SYSTEM_OLD_FPE               0
      /*Old Floating Point Emulator*/
#define fpemulator_SYSTEM_FPE400                1
      /*New Floating Point Emulator*/
#define fpemulator_SYSTEM_FPPC                  128
      /*Floating Point Protocol Convertor with WE32206*/
#define fpemulator_SYSTEM_FPA                   129
      /*ARM Floating Point Accelerator*/
#define fpemulator_CLASS_SOFTWARE               0
#define fpemulator_CLASS_HARDWARE               1

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fpemulator_version()
 *
 * Description:   Returns the version number of the Floating Point Emulator
 *
 * Output:        version - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40480.
 */

extern os_error *xfpemulator_version (int *version);
__swi (0x40480) int fpemulator_version (void);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_deactivate_context()
 *
 * Description:   Deactivates the the current floating point context -
 *                FPEmulator 4.12+
 *
 * Output:        old_context - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40481.
 */

extern os_error *xfpemulator_deactivate_context (fpemulator_context *old_context);
__swi (0x40481) fpemulator_context fpemulator_deactivate_context (void);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_activate_context()
 *
 * Description:   Activates a floating point context - FPEmulator 4.12+
 *
 * Input:         new_context - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40482.
 */

extern os_error *xfpemulator_activate_context (fpemulator_context new_context);
__swi (0x40482) void fpemulator_activate_context (fpemulator_context new_context);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_changed_context()
 *
 * Description:   Change the currrent floating point context - FPEmulator
 *                4.12+
 *
 * Input:         new_context - value of R0 on entry
 *
 * Output:        old_context - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40483.
 */

extern os_error *xfpemulator_changed_context (fpemulator_context new_context,
      fpemulator_context *old_context);
__swi (0x40483) fpemulator_context fpemulator_changed_context (fpemulator_context new_context);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_context_length()
 *
 * Description:   Returns the size of a floating point context - FPEmulator
 *                4.12+
 *
 * Output:        context_length - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40484.
 */

extern os_error *xfpemulator_context_length (int *context_length);
__swi (0x40484) int fpemulator_context_length (void);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_init_context()
 *
 * Description:   Initialises a floating point context - FPEmulator 4.12+
 *
 * Input:         context - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40485.
 */

extern os_error *xfpemulator_init_context (fpemulator_context context);
__swi (0x40485) void fpemulator_init_context (fpemulator_context context);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_exception_dump()
 *
 * Description:   Returns the address of the floating point register dump -
 *                FPEmulator 4.12+
 *
 * Output:        register_dump - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40486.
 */

extern os_error *xfpemulator_exception_dump (fpemulator_register_dump **register_dump);
__swi (0x40486) fpemulator_register_dump *fpemulator_exception_dump (void);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_abort()
 *
 * Description:   Aborts any incomplete floating point processing -
 *                FPEmulator 4.12+
 *
 * Input:         context - value of R0 on entry
 *                r12_value - value of R1 on entry
 *                pc_value - value of R2 on entry
 *
 * Output:        frame - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40487.
 */

extern os_error *xfpemulator_abort (fpemulator_context context,
      int r12_value,
      int pc_value,
      byte **frame);
__swi (0x40487) byte *fpemulator_abort (fpemulator_context context,
      int r12_value,
      int pc_value);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_load_context()
 *
 * Description:   Loads a floating point context - FPEmulator 4.12+
 *
 * Input:         context - value of R0 on entry
 *                register_dump - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40488.
 */

extern os_error *xfpemulator_load_context (fpemulator_context context,
      fpemulator_register_dump const *register_dump);
__swi (0x40488) void fpemulator_load_context (fpemulator_context context,
      fpemulator_register_dump const *register_dump);

/* ------------------------------------------------------------------------
 * Function:      fpemulator_save_context()
 *
 * Description:   Saves the contents of a floating point context -
 *                FPEmulator 4.12+
 *
 * Input:         context - value of R0 on entry
 *                register_dump - value of R1 on entry
 *                pc_value - value of R2 on entry
 *
 * Output:        has_exception - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40489.
 */

extern os_error *xfpemulator_save_context (fpemulator_context context,
      fpemulator_register_dump *register_dump,
      int pc_value,
      osbool *has_exception);
__swi (0x40489) osbool fpemulator_save_context (fpemulator_context context,
      fpemulator_register_dump *register_dump,
      int pc_value);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
