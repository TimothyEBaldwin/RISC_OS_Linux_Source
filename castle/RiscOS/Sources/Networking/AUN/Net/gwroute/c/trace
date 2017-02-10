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
/* trace.c
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * Routines to trace actions of NetG module
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
 * 13-Oct-95  15:44  JPD  Version 1.00
 * First version with change record. Fixed fault leading to loss of logging
 * of NetTrace information.
 *
 * 14-Nov-95  17:08  JPD  Version 1.01
 * After discussion with MNevilleSmith, turned traceon() into a dummy
 * routine: the effects of doing fprintf I/O from within a RISC OS event
 * routine are too horrific to contemplate.
 *
 **End of change record*
 */

#ifdef OldCode
#define RIPCMDS
#include "defs.h"
#include "../module.h"

#else

#undef RIPCMDS

#include <stdio.h>
#include <string.h>

#include "kernel.h"

#include "sys/types.h"
#include "sys/socket.h"
#include "sys/time.h"

/* appear unable to include both time.h files */
extern char *ctime(const time_t *timer);

#include "net/route.h"
#include "netinet/in.h"
#include "protocols/routed.h"

#include "module.h"
#include "inetfn.h"
#include "showrt.h"
#include "mns.h"
#include "mnscommon.h"
#include "debug.h"
#include "table.h"
#include "data.h"
#include "trace.h"
#include "startup.h"
#endif

#ifdef OldCode
char *inet_ntoa(), *sprintnet(), *sprintroute(), *sprintdest(), *mns_str();
#endif

#define TRACE_FILE "<Gateway$Dir>.Trace"

#ifdef OldCode
char *trace_file = 0;
#else
static char *trace_file = 0;
#endif

/******************************************************************************/

void traceon(char *file)
{
   trace_file = file ? file : TRACE_FILE;
   traceactions = 1;

   return;

} /* traceon() */

/******************************************************************************/

void traceoff(void)
{
   traceactions = 0;

   return;

} /* traceoff() */

/******************************************************************************/

#if 0
void traceaction(char *action, struct rt_entry *rt)
{
   UNUSED(action);
   UNUSED(rt);

   return;

} /* traceaction() */
#endif

/******************************************************************************/

#if 0
void tracenewmetric(struct rt_entry *rt, int newmetric)
{
   UNUSED(rt);
   UNUSED(newmetric);

   return;

} /* tracenewmetric() */
#endif

/******************************************************************************/

#ifdef OldCode
dumppacket(dir, who, cp, size, stamp)
        struct sockaddr_in *who;
        char *dir, *cp;
        register int size;
        struct timeval *stamp;
{
        FILE *fd = NULL;
        struct rip *msg = (struct rip *)cp;
        struct netinfo *n;
        int from = strcmp(dir, "to");

        if (msg->rip_cmd != RIPCMD_REQUEST && msg->rip_cmd != RIPCMD_RESPONSE)
            return;
        (void) gettimeofday(&now, (struct timezone *)NULL);
        size -= 4 * sizeof (char);
        n = msg->rip_nets;
        for (; size > 0; n++, size -= sizeof (struct netinfo)) {
            if (size < sizeof (struct netinfo))
                break;
            if (msg->rip_cmd == RIPCMD_REQUEST &&
                ntohl(n->rip_metric) == (u_long)HOPCNT_INFINITY)
                continue;
            if (fd == NULL) {
                fd = fopen(trace_file, "a");
                if (fd == NULL)
                    return;
                fprintf(fd, "%.19s:", ctime((time_t *)&stamp->tv_sec));
                fprintf(fd, "  %s %s\n", from ? "<==" : "==>", sprintdest(who->sin_addr));
            }
#define satosin(sa)     ((struct sockaddr_in *)&sa)
            fprintf(fd, "%-4s%-16s", " ", sprintnet(&n->rip_dst));
            if (ntohl(n->rip_metric) == 1)
                fprintf(fd, "%s\n", mns_str(Str_Local));
            else
                fprintf(fd, "%s=%d\n", mns_str(Str_Gtewys), ntohl(n->rip_metric) - 1);
        }
        fflush(fd);
        if (ferror(fd))
                traceoff(0);
        fclose(fd);
}
/******************************************************************************/

#else
void dumppacket(char *dir, struct sockaddr_in *who, char *cp,
                                      register int size, struct timeval * stamp)
{
   FILE *fd = NULL;
   struct rip *msg = (struct rip *)cp;
   struct netinfo *n;
   int from = strcmp(dir, "to");

   DEBUGP5("#dumppacket(): dir %s, who %08X, cp %s, size %d\n\r",
                                           dir, who->sin_addr.s_addr, cp, size);

   if (msg->rip_cmd != RIPCMD_REQUEST && msg->rip_cmd != RIPCMD_RESPONSE)
   {
      DEBUGP1("#dumppacket(): neither REQUEST nor RESPONSE\n\r");
      return;
   }

   (void) gettimeofday(&now, (struct timezone *)NULL);
   size -= 4 * sizeof(char);
   n = msg->rip_nets;

   DEBUGP2("#dumppacket(): size = %d\n\r", size);

   for (; size > 0; n++, size -= sizeof(struct netinfo))
   {
      if (size < sizeof(struct netinfo))
      {
         DEBUGP1("#dumppacket(): size too small\n\r");
         break;
      }
      if (msg->rip_cmd == RIPCMD_REQUEST &&
                                ntohl(n->rip_metric) == (u_long)HOPCNT_INFINITY)
      {
         DEBUGP1("#dumppacket(): hop count infinity\n\r");
         continue;
      }
      if (fd == NULL)
      {
         fd = fopen(trace_file, "a");
         if (fd == NULL)
         {
            DEBUGP2("#dumppacket(): cannot open file: '%s'\n\r", trace_file);
            return;
         }
         fprintf(fd, "%.19s:", ctime((time_t *)&stamp->tv_sec));
         fprintf(fd, "  %s %s\n", from ? "<==" : "==>",
                                              sprintdest(who->sin_addr.s_addr));
      }

      fprintf(fd, "%-4s%-16s", " ", sprintnet(&n->rip_dst));
      if (ntohl(n->rip_metric) == 1)
         fprintf(fd, "%s\n", mns_str(Str_Local));
      else
         fprintf(fd, "%s=%ld\n", mns_str(Str_Gtewys), ntohl(n->rip_metric) - 1);
   }

   if (fd != NULL)
   {
      fflush(fd);
      if (ferror(fd))
         traceoff();
      fclose(fd);
   }
}

#endif

/******************************************************************************/

#ifdef OldCode
char *
sprintdest(saddr)
u_long saddr;
{
    static char line[32];

    saddr = ntohl(saddr);
#define C(x)    ((x) & 0xff)
    if (C(saddr >> 8) == 0xff && C(saddr) == 0xff) {
        if (!mns_addrtoname(line, saddr))
            (void) sprintf(line, "%lu.%lu", C(saddr >> 24), C(saddr >> 16));
        strcat(line, " (broadcast)");
    }
    else
        (void) sprintf(line, "%lu.%lu", C(saddr >> 8), C(saddr));
    return (line);
}

/******************************************************************************/

#else
char *sprintdest(u_long saddr)
{
   static char line[32];

   saddr = ntohl(saddr);

#define C(x)    ((x) & 0xff)

   if (C(saddr >> 8) == 0xff && C(saddr) == 0xff)
   {
      if (!mns_addrtoname(line, saddr))
         (void) sprintf(line, "%lu.%lu", C(saddr >> 24), C(saddr >> 16));
      strcat(line, " (broadcast)");
   }
   else
      (void) sprintf(line, "%lu.%lu", C(saddr >> 8), C(saddr));

   return line;

} /* sprintdest() */

#endif

/******************************************************************************/

/* EOF trace.c */
