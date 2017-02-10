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
/* startup.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for startup.c routines
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
 * 05-Oct-95  17:05  JPD  Version 1.00
 * Created.
 *
 **End of change record*
 */

/******************************************************************************/

extern void startup_routed(void);

extern void do_ripcmd_req(void);

extern void addrouteforif(struct interface *ifp);

struct qelem
{
  struct qelem *q_forw;
  struct qelem *q_back;
  char *q_data;
};

extern void insque(struct qelem *elem, struct qelem *pred);

extern void remque(struct qelem *elem);

extern u_int min(u_int a, u_int b);

/******************************************************************************/

/* EOF startup.h */
