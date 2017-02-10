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
 *  DHCP (dhcp.h)
 *
 * Copyright (C) Element 14 Ltd. 1999
 *
 */
#ifndef dhcpexternaldecls_h_included
#define dhcpexternaldecls_h_included

#ifdef __cplusplus
extern "C" {
#endif

/* These constants are exported to enable clients to test the states
 * returned by various DHCP SWIs.
 */

/* All the states through which an interface binding can pass, from machine
 * initialisation onwards.  Lots of the timer related states won't ever be
 * entered in our infinite-lease-duration world, though.
 */
typedef enum {
        dhcpstate_INIT,
        dhcpstate_SELECTING,
        dhcpstate_REQUESTING,
        dhcpstate_BOUND,
        dhcpstate_RENEWING,
        dhcpstate_REBINDING,
        dhcpstate_INITREBOOT,
        dhcpstate_REBOOTING,
        dhcpstate_ABANDON
} dhcp_state;


#ifdef __cplusplus
}
#endif

#endif

/* DHCP SWI numbers will be appended here in exported version of this file */
