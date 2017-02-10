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
/* af.c
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * af.c routines
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
 * 05-Oct-95  12:47  JPD  Version 1.00
 * First version with change record.
 *
 *
 **End of change record*
 */


#ifdef OldCode
#include "defs.h"
#else

#include "sys/types.h"
#include "sys/socket.h"
#include "netinet/in.h"
#include "net/route.h"
#include "protocols/routed.h"

#include "module.h"
#include "socklib.h"

#include "inetcode.h"
#include "table.h"
#include "data.h"
#include "af.h"
#endif

/******************************************************************************/

void inet_hash(register struct sockaddr_in *sin, struct afhash *hp)
{
   register u_long n;

   n = inet_rnetof(sin->sin_addr);

   if (n)
      while ((n & 0xff) == 0)
         n >>= 8;
   hp->afh_nethash = n;
   hp->afh_hosthash = ntohl(sin->sin_addr.s_addr);
   hp->afh_hosthash &= 0x7fffffff;

   return;

} /* inet_hash() */

/******************************************************************************/

int inet_netmatch(struct sockaddr_in *sin1, struct sockaddr_in *sin2)
{
   return (inet_rnetof(sin1->sin_addr) == inet_rnetof(sin2->sin_addr));

} /* inet_netmatch() */

/******************************************************************************/

void inet_output(int s, int flags, struct sockaddr_in *sin, int size)
{
/*
 * Internet output routine.
 */

   sin->sin_port = htons((u_short)ROUTEDPORT);
   (void) sendto(s, packet, size, flags, (struct sockaddr *)sin,
                                                   sizeof (struct sockaddr_in));
   return;

} /* inet_output() */

/******************************************************************************/

/* EOF af.c */
