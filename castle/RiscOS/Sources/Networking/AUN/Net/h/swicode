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
/* swicode.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for code handling SWIs issued to the Net module
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
 * 21-Dec-94  15:15  JPD  Version 1.00
 * Created.
 *
 * 11-Jan-95  16:25  JPD  Version 1.01
 * Continued changes towards using -fah compilation option.
 *
 * 24-Jan-95  16:53  JPD  Version 1.02
 * Added NetworkParameters().
 *
 **End of change record*
 */

/******************************************************************************/

extern _kernel_oserror *init_msgs(const char *filename, int *fd);

/*
 * Open MessageTrans message file
 *
 * Parameters:
 *    filename : pointer to the filename
 *    fd       : pointer to where to return the MessageTrans file descriptor
 *
 * Returns:
 *     0 : => success
 *    !0 : => error (pointer to standard RISC OS error block)
 */

/******************************************************************************/

extern void release_msgs(int *fd);

/*
 * Close MessageTrans message file
 *
 * Parameters:
 *    fd       : pointer to the MessageTrans file descriptor
 *
 * Returns:
 *    None
 */

/******************************************************************************/

extern _kernel_oserror *call_econet(int swinum, _kernel_swi_regs *r);

/* Issue a SWI call to the real Econet module (X-form of the SWI)
 *
 * Parameters:
 *    swinum : the SWI number
 *    r      : pointer to the registers block
 *
 * Returns:
 *    the value of R0
 */

/******************************************************************************/

extern _kernel_oserror *init_econet(void);

/* When the Net module is initialised, it replaces the Econet module as the
 * module that handles the "Econet" SWI chunk, i.e. Econet SWIs are now
 * handed to us. In order to hand SWIs on to the real Econet module we must
 * find the real Econet module and take note of its entries, so that we can
 * call it directly.
 *
 * Parameters:
 *    None
 *
 * Returns:
 *     0 : => success
 *    !0 : => error (pointer to standard RISC OS error block)
 */

/******************************************************************************/

extern _kernel_oserror *CreateReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ExamineReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *AbandonReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *WaitForReception(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *EnumerateReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *StartTransmit(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *PollTransmit(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *AbandonTransmit(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *DoTransmit(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadLocalStationAndNet(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ConvertStatusToString(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ConvertStatusToError(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *AbandonAndReadReceive(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadProtection(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *SetProtection(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadStationNumber(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *PrintBanner(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReleasePort(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *AllocatePort(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *DeAllocatePort(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ClaimPort(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *StartImmediate(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *DoImmediate(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadTransportType(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *Version(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *NetworkState(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *PacketSize(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *ReadTransportName(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *InetRxDirect(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *EnumerateMap(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *EnumerateTransmit(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *HardwareAddresses(_kernel_swi_regs *r);

/******************************************************************************/

extern _kernel_oserror *NetworkParameters(_kernel_swi_regs *r);

/******************************************************************************/

extern void check_rxcbs(void);

/******************************************************************************/

extern void check_txcbs(void);

/******************************************************************************/

extern void retry_tx(struct txcb *tx);

/******************************************************************************/

/* EOF swicode.h */
