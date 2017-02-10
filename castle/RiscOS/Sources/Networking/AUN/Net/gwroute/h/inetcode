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
/* inetcode.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for inet.c routines
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
 * 13-Oct-95  15:35  JPD  Version 1.00
 * First version with change record.
 *
 *
 **End of change record*
 */

/******************************************************************************/

extern struct in_addr inet_rmakeaddr(u_long net, u_long host);
/* Formulate an Internet address from network + host */

extern u_long inet_rnetof(struct in_addr in);
/* Return the network number from an internet address */

extern u_long inet_rlnaof(struct in_addr in);
/* Return the host portion of an internet address */

extern int inet_rtflags(struct sockaddr_in *sin);
/* Return RTF_HOST if the address is for an Internet host,
 * RTF_SUBNET for a subnet, 0 for a network.
 */

extern int inet_sendroute(struct rt_entry *rt, struct sockaddr_in *dst);
/*
 * Return true if a route to subnet/host of route rt should be sent to dst.
 * Send it only if dst is on the same logical network if not "internal",
 * otherwise only if the route is the "internal" route for the logical net.
 */

extern u_long inet_addr(register char *cp);
/*
 * Internet address interpretation routine. All the network library routines
 * call this routine to interpret entries in the data bases which are
 * expected to be an address. The value returned is in network order.
 */

/******************************************************************************/

/* EOF inetcode.h */
