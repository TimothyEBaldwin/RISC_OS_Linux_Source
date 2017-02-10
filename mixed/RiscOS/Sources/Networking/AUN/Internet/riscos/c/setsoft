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
 * Software Interrupt Setup
 *
 * Copyright (c) 1988 Acorn Computers Ltd., Cambridge, England
 *
 */

#include "kernel.h"
#include "ioc.h"
#include "int_hndlr.h"

#include "sys/param.h"
#include "sys/socket.h"
#include "sys/time.h"

#include "net/netisr.h"

#include "net/if.h"
#include "net/if_arp.h"

#include "netinet/in.h"
#include "netinet/if_ether.h"
#include "netinet/ip_var.h"

#include "module.h"

void softnet(void)
{
	if ((netisr & (1 << NETISR_IP)) != 0) {
		netisr &= ~(1 << NETISR_IP);
		ipintr();
	}

	if ((netisr & (1 << NETISR_ARP)) != 0) {
		netisr &= ~(1 << NETISR_ARP);
		arpintr();
	}

	if ((netisr & (1 << NETISR_REVARP)) != 0) {
		netisr &= ~(1 << NETISR_REVARP);
		revarpintr();
	}

	if ((netisr & (1 << NETISR_CALLO)) != 0) {
		netisr &= ~(1 << NETISR_CALLO);
		callo_handler();
	}
}

extern int callbackflag;
extern int callbackerr;

void setsoftnet(void)
{
    if( callbackflag == 0 )
    {
	int s = splimp();
	callbackflag = 1;
	splx(s);

	if( callback(CALLB_CALLB) != 0 )
	{
	    callbackflag = 0;
	    callbackerr = 1;
	}
    }
}

int callb_handler(int *r)
{
    callback_entered(CALLB_CALLB);

    if( callbackflag != 0 )
    {
	int s = splimp();
	callbackflag = 0;
	splx(s);
	softnet();
    }

#ifdef DELAY_EVENTS
    sendallsignals();
#endif

    return(1);
}

/* EOF setsoft.c */
