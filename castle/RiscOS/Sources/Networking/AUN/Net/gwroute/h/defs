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
/* defs.h
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * Header file for main NetG definitions.
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
 * 13-Oct-95  15:40  JPD  Version 1.00
 * First version with change log.
 *
 *
 **End of change record*
 */

#ifdef OldCode
#include <sys/param.h>
#include <sys/socket.h>
#include <sys/time.h>

#include <net/route.h>
#include <netinet/in.h>
#include <net/routed.h>

#include <stdio.h>
#include <netdb.h>

#include "trace.h"
#include "interface.h"
#include "table.h"
#include "af.h"

extern struct  sockaddr_in addr;

#define ROUTEDPORT 520
extern int     *routedsock;
extern int     *timerp;
extern char    packet[MAXPACKETSIZE+1];
extern struct  rip *msg;
extern struct  timeval now;

struct  in_addr inet_rmakeaddr();
unsigned long     inet_addr();

char    *malloc();
char    *ctime();
int     exit();
int     rsendmsg();
int     supply();
int     timer();
int     cleanup();
#else

#define equal(a1, a2) \
        (memcmp((caddr_t)(a1), (caddr_t)(a2), sizeof (struct sockaddr)) == 0)

#endif

/******************************************************************************/

/* EOF defs.h */
