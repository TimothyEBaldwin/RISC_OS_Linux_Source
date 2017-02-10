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
/* mnscommon.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for routines defined in mnscommon.c file
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.06 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 14-Mar-95  13:21  JPD  Version 1.00
 * Created.
 *
 * 21-Mar-95  11:53  JPD  Version 1.01
 * Added mns_sc_handler() and reset_is_soft().
 *
 *
 **End of change record*
 */

/******************************************************************************/

extern void mns_ping(int argc, char **argv);

/*
 * *NetProbe code: similar function to *Ping, actually does a machine-type peek
 *
 * Parameters:
 *    argc : }
 *    argv : } command line parms
 *
 * Returns:
 *    None
 */

/******************************************************************************/

extern void notify_users(void);

/*
 * Issue Service call ReAllocatePorts so that users of "Econet" will know
 * that "Econet" has effectively been reinitialised.
 *
 * Parameters:
 *    None
 *
 * Returns:
 *    None
 */

/******************************************************************************/

extern int do_getsock(int port, int inputsocket, int direct);

/*
 * Open socket for use by Net module
 *
 * Parameters:
 *    port        : port number on which to open socket
 *    inputsocket : !0 => socket is for input
 *    direct      : !0 => get Internet module to call us directly on Rx by
 *                  issuing the EconetRxDirect SWI to us rather than by
 *                  generating an Internet event
 *
 * Returns:
 *    the socket number opened, or -1 if error
 */

/******************************************************************************/

extern _kernel_oserror *mns_error(int error);

/******************************************************************************/

extern _kernel_oserror *mns_error_parm(int error, void *parmp);

/******************************************************************************/

extern char *mns_str(int strnbr);

/******************************************************************************/

extern void generate_event(int rx, int handle, int status, int port);

/******************************************************************************/

extern void setcallback(void);

/******************************************************************************/

extern void removecallback(void);

/* Remove any added transient callback
 *
 * Parameters:
 *    None
 *
 * Returns:
 *    None
 */

/******************************************************************************/

extern void generate_event_on_callback(struct txcb *tx);

/******************************************************************************/

extern void retransmit_on_callback(struct txcb *tx);

/******************************************************************************/

extern void netmapchanged_on_callback(void);

/******************************************************************************/

extern int addcallback(void (*)(void));

/******************************************************************************/

extern void callb_entry(void);

/******************************************************************************/

extern _kernel_oserror *calleverytick(void (*fun)(void));

/*
 * Install a function on Ticker vector
 *
 * Parameters:
 *    fun : pointer to the function to be installed
 *
 * Returns:
 *     0 : => success
 *    !0 : => error (pointer to standard RISC OS error block)
 */

/******************************************************************************/

extern void removetickerevent(void (*fun)(void));

/*
 * Remove a previously installed ticker handler
 *
 * Parameters:
 *    fun : pointer to ticker handler previously installed
 *
 * Returns:
 *    None
 */

/******************************************************************************/

extern void *Resources(void); /* From ResGen */

/******************************************************************************/

extern int reset_is_soft(void);

/******************************************************************************/

/* EOF mnscommon.h */
