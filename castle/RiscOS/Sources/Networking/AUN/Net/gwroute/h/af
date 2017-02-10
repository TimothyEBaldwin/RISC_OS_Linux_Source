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
/* af.h
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * Header file for af.c routines
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
 * 13-Oct-95  15:34  JPD  Version 1.00
 * First version with change record.
 *
 *
 **End of change record*
 */

/******************************************************************************/

#ifdef OldCode
struct afswitch {
        int     (*af_hash)();
        int     (*af_netmatch)();
        int     (*af_output)();
        int     (*af_portmatch)();
        int     (*af_portcheck)();
        int     (*af_checkhost)();
        int     (*af_rtflags)();
        int     (*af_sendroute)();
        int     (*af_canon)();
        char    *(*af_format)();
};

struct afhash {
        u_int   afh_hosthash;
        u_int   afh_nethash;
};

extern struct  afswitch afswitch[];
extern int     af_max;

#else

struct afswitch
{
   int  (*af_hash)();
   int  (*af_netmatch)();
   int  (*af_output)();
   int  (*af_portmatch)();
   int  (*af_portcheck)();
   int  (*af_checkhost)();
   int  (*af_rtflags)();
   int  (*af_sendroute)();
   int  (*af_canon)();
   char *(*af_format)();
};

struct afhash
{
   u_int afh_hosthash;
   u_int afh_nethash;
};

extern struct afswitch afswitch[];
extern int    af_max;

extern void inet_hash(register struct sockaddr_in *sin, struct afhash *hp);
extern int inet_netmatch(struct sockaddr_in *sin1, struct sockaddr_in *sin2);
extern void inet_output(int s, int flags, struct sockaddr_in *sin, int size);

#endif

/******************************************************************************/

/* af.h */
