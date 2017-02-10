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
/*
 * Copyright(c) 1994 Acorn Computers Ltd., Cambridge, England
 *
 */
#include "sys/param.h"
#include "sys/socket.h"
#include "sys/domain.h"
#include "sys/mbuf.h"
#include "sys/kernel.h"

#include "net/route.h"
#include "net/if.h"
#include "net/raw_cb.h"

#include "debug.h"
#include "module.h"


struct	ifnet *ifnet;

struct rawcb rawcb;
struct	rtstat	rtstat;
struct	radix_node_head *rt_tables[AF_MAX+1];
struct  route_cb route_cb;

/* setsoft */
int callbackflag;
int callbackerr;
int netisr;

/* something not relevant here - it's 4.4ish */
int	max_linkhdr;			/* largest link-level header */
int	max_protohdr;			/* largest protocol header */
int	max_hdr;			/* largest link+protocol header */
int	max_datalen;			/* MHLEN - max_hdr */

/* timing variables */
int hz = 100;
int tick = 1000000 / 100;
volatile struct timeval time;

/* only call Portable module SWIs if available */
unsigned int portable_features;

/* debug control */
#ifdef DEBUG
int debugctrl;
#endif

#ifdef __riscos
/* whoami.whoami.c */
/* whether a Net module variant is using us */
int AUN_state = AUN_INACTIVE;

struct callback_record callbacks[NCALLBACKS];
_kernel_oserror errtunnel;
#endif

/* EOF globdata.c */
