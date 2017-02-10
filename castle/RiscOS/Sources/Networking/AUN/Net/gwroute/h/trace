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
/* trace.h
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * Header file for routines to trace actions of NetG module
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
 * 05-Oct-95  17:28  JPD  Version 1.00
 * First version with change record.
 *
 *
 **End of change record*
 */

/******************************************************************************/

extern void traceon(char *file);

/******************************************************************************/

extern void traceoff(void);

/******************************************************************************/

extern void dumppacket(char *dir, struct sockaddr_in *who, char *cp,
                                      register int size,struct timeval * stamp);

/******************************************************************************/

extern char *sprintdest(u_long saddr);

/******************************************************************************/

#ifdef OldCode
/*
 * Packet tracing
 */
extern int     traceactions;           /* on/off */

#define TRACE_ACTION(action, route) { \
          if (traceactions) \
                traceaction(action, route); \
        }
#define TRACE_NEWMETRIC(route, newmetric) { \
          if (traceactions) \
                tracenewmetric(route, newmetric); \
        }
#define TRACE_INPUT(ifp, src, pack, size) { \
          if (traceactions) \
                dumppacket("from", src, pack, size, &now); \
        }
#define TRACE_OUTPUT(ifp, dst, size) { \
          if (traceactions) \
                dumppacket("to", dst, packet, size, &now); \
        }
#else
/*
 * Packet tracing
 */

#if 0
#define TRACE_ACTION(action, route) \
{ \
   if (traceactions) \
      traceaction(action, route); \
}
#else
#define TRACE_ACTION(action, route)
#endif

#if 0
#define TRACE_NEWMETRIC(route, newmetric) \
{ \
   if (traceactions) \
      tracenewmetric(route, newmetric); \
}
#else
#define TRACE_NEWMETRIC(route, newmetric)
#endif

#define TRACE_INPUT(ifp, src, pack, size) \
{ \
   if (traceactions) \
      dumppacket("from", src, pack, size, &now); \
}

#define TRACE_OUTPUT(ifp, dst, size) \
{ \
   if (traceactions) \
      dumppacket("to", dst, packet, size, &now); \
}

#endif

/******************************************************************************/

/* EOF trace.h */
