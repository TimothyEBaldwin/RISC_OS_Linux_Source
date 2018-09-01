/*
 * Copyright (c) 1988 Acorn Computers Ltd., Cambridge, England
 *
 * :RCS Log discontinued:
 * Revision 1.1  95/01/11  10:14:47  kwelton
 * Initial revision
 *
 * Revision 1.3  88/06/17  20:24:57  beta
 * Acorn Unix initial beta version
 *
 */
/* @(#)if_arp.h 1.2 87/06/16 3.2/4.3NFSSRC */
/*
 * Copyright (c) 1986 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 *
 *      @(#)if_arp.h    7.1 (Berkeley) 6/4/86
 */

#ifndef __if_arp_h
#define __if_arp_h

#include "sys/socket.h"

/*
 * Address Resolution Protocol.
 *
 * See RFC 826 for protocol description.  ARP packets are variable
 * in size; the arphdr structure defines the fixed-length portion.
 * Protocol type values are the same as those for 10 Mb/s Ethernet.
 * It is followed by the variable-sized fields ar_sha, arp_spa,
 * arp_tha and arp_tpa in that order, according to the lengths
 * specified.  Field names used correspond to RFC 826.
 */
struct  arphdr {
        u_short ar_hrd;         /* format of hardware address */
#define ARPHRD_ETHER    1       /* ethernet hardware address */
#define ARPHRD_IEEE802  6       /* token-ring hardware format */
#define ARPHRD_FRELAY   15      /* frame relay hardware format */
#define ARPHRD_SERIAL   20      /* serial line hardware format */
        u_short ar_pro;         /* format of protocol address */
        u_char  ar_hln;         /* length of hardware address */
        u_char  ar_pln;         /* length of protocol address */
        u_short ar_op;          /* one of: */
#define ARPOP_REQUEST   1       /* request to resolve address */
#define ARPOP_REPLY     2       /* response to previous request */
#define REVARP_REQUEST  3       /* Reverse ARP request */
#define REVARP_REPLY    4   /* Reverse ARP reply */
/*
 * The remaining fields are variable in size,
 * according to the sizes above.
 */
/*      u_char  ar_sha[];       * sender hardware address */
/*      u_char  ar_spa[];       * sender protocol address */
/*      u_char  ar_tha[];       * target hardware address */
/*      u_char  ar_tpa[];       * target protocol address */
};

/*
 * ARP ioctl request
 */
struct arpreq {
        struct  sockaddr arp_pa;                /* protocol address */
        struct  sockaddr arp_ha;                /* hardware address */
        int     arp_flags;                      /* flags */
};
/*  arp_flags and at_flags field values */
#define ATF_INUSE       0x01    /* entry in use */
#define ATF_COM         0x02    /* completed entry (enaddr valid) */
#define ATF_PERM        0x04    /* permanent entry */
#define ATF_PUBL        0x08    /* publish entry (respond for other host) */
#define ATF_USETRAILERS 0x10    /* has requested trailers */

#ifdef KERNEL
/*
 * Structure shared between the ethernet driver modules and
 * the address resolution code.  For example, each ec_softc or il_softc
 * begins with this structure.
 */
struct	arpcom {
	/*
	 * The ifnet struct _must_ be at the head of this structure.
	 */
	struct 	ifnet ac_if;		/* network-visible interface */
	u_char	ac_enaddr[6];		/* ethernet hardware address */
	int	ac_multicnt;		/* length of ac_multiaddrs list */
};

extern u_char	etherbroadcastaddr[6];
#endif

#endif /* __if_arp_h */

/* EOF if_arp.h */
