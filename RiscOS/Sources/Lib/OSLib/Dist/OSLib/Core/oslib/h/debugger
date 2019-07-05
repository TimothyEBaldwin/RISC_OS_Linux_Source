#ifndef debugger_H
#define debugger_H

/* C header file for Debugger
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:27 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Debugger_Disassemble
#define Debugger_Disassemble                    0x40380
#undef  XDebugger_Disassemble
#define XDebugger_Disassemble                   0x60380
#undef  Debugger_DisassembleThumb
#define Debugger_DisassembleThumb               0x40381
#undef  XDebugger_DisassembleThumb
#define XDebugger_DisassembleThumb              0x60381

/************************
 * Constant definitions *
 ************************/
#define error_DEBUG_BREAK_NOT_FOUND             0x800u
      /*Breakpoint not found*/
#define error_DEBUG_INVALID_VALUE               0x801u
      /*Invalid value*/
#define error_DEBUG_RESETTING                   0x802u
      /*Resetting breakpoint*/
#define error_DEBUG_NO_ROOM                     0x803u
      /*No room in breakpoint table*/
#define error_DEBUG_NO_BREAKPOINTS              0x804u
      /*No breakpoints set*/
#define error_DEBUG_BAD_BREAKPOINT              0x805u
      /*Bad breakpoint*/
#define error_DEBUG_UNDEFINED                   0x806u
      /*Undefined breakpoint*/
#define error_DEBUG_NON_ALIGNED                 0x807u
      /*Unaligned address*/
#define error_DEBUG_NO_WORKSPACE                0x808u
      /*No room for debug module workspace*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      debugger_disassemble()
 *
 * Description:   Disassembles an instruction
 *
 * Input:         instruction - value of R0 on entry
 *                address - value of R1 on entry
 *
 * Output:        disassembly - value of R1 on exit
 *                used - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40380.
 */

extern os_error *xdebugger_disassemble (int instruction,
      int *address,
      char **disassembly,
      int *used);
extern void debugger_disassemble (int instruction,
      int *address,
      char **disassembly,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      debugger_disassemble_thumb()
 *
 * Description:   Disassembles a thumb instruction - RISC O S 4+
 *
 * Input:         instruction - value of R0 on entry
 *                address - value of R1 on entry
 *
 * Output:        disassembly - value of R1 on exit
 *                used - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40381.
 */

extern os_error *xdebugger_disassemble_thumb (int instruction,
      int *address,
      char **disassembly,
      int *used);
extern void debugger_disassemble_thumb (int instruction,
      int *address,
      char **disassembly,
      int *used);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
