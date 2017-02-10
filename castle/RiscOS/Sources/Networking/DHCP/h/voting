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
 *  DHCP (voting.h)
 *
 * Copyright (C) Element 14 Ltd. 1999
 *
 */
#ifndef dhcpvoting_h_included
#define dhcpvoting_h_included

#ifdef __cplusplus
extern "C" {
#endif

enum {
	vote_REJECT,
	vote_PREFER
};

extern int dhcp_vote(dhcp_interface *, const DHCP */*offer*/);
extern void dhcp_vote_notify_offer_accepted(dhcp_interface *);

extern void dhcp_add_to_blacklist(dhcp_interface *, struct in_addr);
extern void dhcp_empty_blacklist(dhcp_interface *);

#ifdef __cplusplus
}
#endif

#endif
