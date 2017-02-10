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
 *  DHCP (interfaces.h)
 *
 * Copyright (C) Element 14 Ltd. 1999
 *
 */
#ifndef dhcpinterfaces_h_included
#define dhcpinterfaces_h_included

#ifdef __cplusplus
extern "C" {
#endif

typedef time_t dhcp_time;
enum {
        dhcp_immediate_action = 0,
        dhcp_infinite_lease = -1,
        dhcp_maximum_lease = -2,
        dhcp_any_lease = -3,

        /* Assert a minimum lease request duration */
        dhcp_minimum_lease_request = 100 * 60 * 5
};

enum {
        blacklist_MAX = 8
};

typedef struct {
        struct in_addr	server[blacklist_MAX];
} dhcp_blacklist;

typedef union {
        struct ifdhcpreq ifd;		/* For DHCP ioctl call */
        struct ifreq ifr;		/* For general interface ioctl calls */
        struct {
                char name[IFNAMSIZ];	/* Interface name */
                struct sockaddr_in sin;	/* an Internet socket address */
        } ifr_in;			/* To avoid casting to sockaddr_in */
} di_ifdhcpreq;

struct dhcp_interface {
        dhcp_interface	*next;		/* Link to next dhcp_interface object */
        dhcp_state	state;		/* current state of the interface */
	Dib		*dib;           /* DIB for which this interface is */
	dhcp_time	request_lease;  /* Lease length to request from server */
	dhcp_time       first_send;     /* Time at which first attempt sent */
	dhcp_time       interval;       /* Current retry interval */
	dhcp_time       t1;             /* Initialisation of re-acquisition */
	dhcp_time       t2;             /* Minor panic - re-acquire from anywhere */
	dhcp_time       kill_if;        /* Time at which to kill the interface */
	dhcp_time	orig_t1;	/* Actual lease renew date */
	dhcp_time	orig_t2;	/* Actual lease rebind date */
	struct in_addr	preferred_ip;	/* The preferred IP address */
	di_ifdhcpreq	req;		/* Interface name and current DHCP buffer */
        DHCP		binding;	/* last DHCPACK message received */
        DHCP 		temp;           /* Temporary buffer to hold a packet */
        DHCP		offer;		/* Best offer so far */
        dhcp_blacklist	blacklist;	/* Nasty servers we don't like */
#define di_dhcp 	req.ifd.packet  /* last packet used by this interface */
#define di_name         req.ifr.ifr_name/* the interface name */
#define di_ifr		req.ifr         /* direct access to ifreq structure */

        /* Added by R Griffin 16 Jul 2012	*/
        unsigned int	flags;
};


extern void interfaces_init(void);
extern void interfaces_discard(void);
extern dhcp_interface *interfaces_find(const char *);
extern dhcp_interface *interfaces_find_by_xid(u_long);
extern dhcp_interface *interfaces_create(const dhcp_start_params *);
extern void interfaces_forget(dhcp_interface *);
extern void interfaces_print_information(const dhcp_interface *);
extern void interfaces_timer_fired(void *);
extern void interfaces_reschedule(void *);
extern int interfaces_current_time(void);
extern dhcp_time interfaces_random_delay(int);
extern void interfaces_address_changed(void);
extern int interfaces_address_clash(Dib *, u_long);

/* This routine is exported for the use of trace builds only */
extern const char *dhcp_state_name(const dhcp_interface *);

#ifdef __cplusplus
}
#endif

#endif
