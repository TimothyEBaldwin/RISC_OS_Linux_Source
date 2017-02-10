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
 *  DHCP (sockets.h)
 *
 * Copyright (C) Pace Micro Technology plc. 1999, 2000
 *
 */
#ifndef dhcpsockets_h_included
#define dhcpsockets_h_included

#ifdef __cplusplus
extern "C" {
#endif

extern void sockets_init(void);
extern void sockets_ensure_init(void);
extern void sockets_discard(void);
extern int  sockets_init_ok(void);

extern int sockets_inform(DHCP *, struct in_addr, char */*actual_interface*/);

extern int sockets_kill_interface(dhcp_interface *);
extern void sockets_trigger_internet_dhcp(const char *);

extern int sockets_data_arrived(int ns, void *);
extern void sockets_transmit(dhcp_interface *, int /*ioctl_flag*/);
extern void sockets_direct_transmit(ifdhcpreq *, int /*ioctl_flags*/);
extern int sockets_unicast_transmit(DHCP *, struct in_addr);

extern void sockets_set_preferred_ip_address(dhcp_interface *, u_long);
extern int sockets_verify_address(dhcp_interface *);

extern int sockets_delete_address(Dib *dib, struct in_addr *addr);
extern int sockets_set_if_address(char *ifname, struct in_addr *addr, struct in_addr *broad, struct in_addr *mask);

/* This is a bitfield.  Bit meaning if set:
 *
 * bit 0:  Release frames if the Internet module claimed them
 * bit 1:  Don't transmit the supplied packet
 * bit 2:  Parse packet as if it were a BOOTP resonse
 *
 */
enum ioctl_flags_for_sockets_transmit_BITFIELD {
        st_RETAIN_FRAMES,
        st_RELEASE_FRAMES,
        st_DONT_TRANSMIT,
        st_NAK_AND_RELEASE, /* bitfield combination */
        st_ACK_RECEIVED,
        st_ACK_AND_RELEASE, /* probably don't want to use this ever! */
        st_ACK_RETAIN_NO_XMIT, /* parse a BOOTP response to DHCP request */
        st_ACK_INFORM = (256 | st_ACK_RECEIVED)
};

#ifdef __cplusplus
}
#endif

#endif
