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
/* netasm.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for assembler routines
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.02 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 11-Jan-95  15:25  JPD  Version 1.00
 * Created.
 *
 * 24-Jan-95  17:06  JPD  Version 1.01
 * Updated comments.
 *
 * 22-Feb-95  16:11  JPD  Version 1.02
 * Corrected comment for do_econet().
 *
 *
 **End of change record*
 */

#include "AsmUtils/callbacks.h"
#include "AsmUtils/irqs.h"

/******************************************************************************/

extern int escape_seen(void);

/* This routine returns 1 if escape condition set, else 0
 */

/******************************************************************************/

extern _kernel_oserror *do_econet(int swinum, _kernel_swi_regs *regsin,
                             _kernel_swi_regs *regsout, int *swicode, int *pwp);

/* Issue SWI to the real Econet module
 *
 * Parameters:
 *     swinum  : the SWI offset to call, only range 0 to &3F significant
 *     regsin  : a pointer to an array of registers to pass in (R0-R9)
 *     regsout : a pointer to an array of registers to return (R0-R9)
 *     swicode : the address of the routine to call
 *     pwp     : the value to pass as the workspace (pointed to by R12)
 *
 * Returns:
 *    0 => no error, else pointer to error as usual
 */

/******************************************************************************/

extern _kernel_oserror *do_ConvertStatusToError(_kernel_swi_regs *regs,
                                                                     int *mbp);

/* Perform Op similar to action of this Econet SWI
 *
 * Parameters:
 *    regs : Pointer to register block for input and output
 *    mbp  : Pointer to the message block for Econet.Messages
 *           Structure of the register block:
 *           R0 ==> Status number
 *           R1 ==> Pointer to core if required (or used)
 *           R2 ==> Maximum buffer size
 *           R3 ==> Station number
 *           R4 ==> Network number
 *           R0 <== Pointer to an error block as usual (maybe R1,
 *                  maybe ROM (or RMA allocated buffer))
 * Returns:
 *    0 => no error, else pointer to error as usual
 */

/******************************************************************************/

extern _kernel_oserror *do_ConvertStatusToString(_kernel_swi_regs *regs,
                                                                     int *mbp);

/* Perform Op similar to action of this Econet SWI
 *
 * Parameters:
 *    regs : Pointer to register block for input and output
 *    mbp  : Pointer to the message block for Econet.Messages
 *           Structure of the register block:
 *           R0 ==> Status number
 *           R1 ==> Destination core
 *           R2 ==> Number of bytes remaining in the buffer
 *           R3 ==> Station number
 *           R4 ==> Network number
 *           R0 <== Input value of R1, else pointer to error as usual
 *           R1 <== Updated pointer
 *           R2 <== Bytes remaining, updated
 * Returns:
 *    0 => no error, else pointer to error as usual
 */

/******************************************************************************/

extern _kernel_oserror *do_ReadStationNumber(_kernel_swi_regs *regs, int *mpb);

/* Perform Op similar to action of this Econet SWI
 *
 * Parameters:
 *    regs : Pointer to register block for input and output
 *    mbp  : Pointer to the message block for Econet.Messages
 *           Structure of the register block:
 *           R1 ==> Address of number string
 *           R0 <== Preserved if no error, else pointer to error as usual
 *           R1 <== Updated
 *           R2 <== Station number (-1 for not found)
 *           R3 <== Network number (-1 for not found)
 * Returns:
 *    0 => no error, else pointer to error as usual
 */

/******************************************************************************/

/* EOF netasm.h */
