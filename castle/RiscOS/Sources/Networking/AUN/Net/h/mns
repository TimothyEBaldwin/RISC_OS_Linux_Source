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
/* mns.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for routines defined in main module file
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
 * 16-Dec-94  09:37  JPD  Version 1.00
 * Created.
 *
 * 13-Jan-95  12:13  JPD  Version 1.01
 * Attempt to allow compilation with -fah option.
 *
 * 14-Mar-95  12:57  JPD  Version 1.02
 * Moved some code to mnscommon.c.
 *
 *
 **End of change record*
 */

/******************************************************************************/

extern int do_mns_init(int booting);

/*
 * Perform initialisation
 *
 * Parameters:
 *    booting : !0 => initialisation for first time
 *               0 => reinitialisation as result of service call
 *
 * Returns:
 *    !0 : => successfully initialised
 *     0 : => either a problem, or reinitialised
 */

/******************************************************************************/

extern void free_sockets(void);

/******************************************************************************/

extern int ip_to_mns(u_long addr, int *net, int *station);

/******************************************************************************/

extern int src_is_ok(struct rxcb *rx, int net, int station);

/******************************************************************************/

extern u_long mns_to_ip(int net, int station);

/******************************************************************************/

extern int msg_broadcast(u_char flag, u_char port, char *data, int len,
                                                                     int local);

/******************************************************************************/

extern int in_local_aun_network(int net);

/******************************************************************************/

extern _kernel_oserror *range_check(int port, int station, int net);

/******************************************************************************/

extern int is_wild(int port, int station, int network);

/******************************************************************************/

extern int mns_addrtoname(char *b, u_long i);

/******************************************************************************/

/* EOF mns.h */
