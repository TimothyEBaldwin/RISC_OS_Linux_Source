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
/* io.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for I/O routines
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
 * 12-Jan-95  11:20  JPD  Version 1.00
 * Created.
 *
 *
 **End of change record*
 */

/******************************************************************************/

extern int local_net(void);

/******************************************************************************/

extern void process_data_input(int a, int b, char *ack_src, int ack_unit,
                                                      int ack_swi, int ack_buf);

/******************************************************************************/

extern int msg_transmit(u_long host, u_char control, u_char status, u_int port,
                                   char *data, int len, int type, u_int handle);

/******************************************************************************/

/* EOF io.h */
