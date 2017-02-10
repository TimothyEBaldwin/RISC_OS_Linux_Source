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
 *  DHCP (dhcpinform.c)
 *
 * Copyright (C) Pace Micro Technologies plc. 1999
 *
 */
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include "kernel.h"
#include "swis.h"

#include "sys/types.h"
#include "sys/socket.h"
#include "sys/dcistructs.h"
#include "net/if.h"
#include "netinet/in.h"
#include "protocols/dhcp.h"
#include "arpa/inet.h"

#include "dhcpintern.h"
#include "interfaces.h"
#include "sockets.h"
#include "module.h"
#include "packets.h"
#include "dhcpinform.h"

static ifdhcpreq inform;

void dhcpinform_init(void)
{
        /* Yes, I really do want strncpy's semantics */
        strncpy(inform.ifr.ifr_name, "lo0", IFNAMSIZ);
        /* Mark the buffer as invalid */
        inform.packet.op = BOOTREPLY;
}

void dhcpinform_discard(void)
{
        /* Nothing to do */
}

int dhcpinform_deliver_incoming_packet(DHCP *d, void *private_word)
{
        u_char *opt;
        (void) private_word;

        opt = dhcp_find_option(d, OPTION_DHCPMESSAGETYPE);

        if (inform.packet.op != BOOTREQUEST ||
                d->xid != inform.packet.xid ||
                opt == NULL ||
                opt[2] != DHCPACK) {
                trace(("DHCP: inform handler not interested in this\n"));
                return 0;
        }

        /* This was a response to our inform message */
        inform.packet = *d;
        sockets_direct_transmit(&inform, st_ACK_INFORM);
        return 1;
}

int dhcpinform_execute(struct in_addr ia, u_char *req_list, u_char len)
{
	dhcp_init_inform_packet(&inform.packet, NULL, htonl(INADDR_ANY));
	if (req_list != NULL) {
		dhcp_add_option(&inform.packet, OPTION_PARAMETERREQLIST, len, req_list);
	}

	sockets_inform(&inform.packet, ia, inform.ifr.ifr_name);
        return 0;
}
