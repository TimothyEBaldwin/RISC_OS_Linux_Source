/*-
 * Copyright (c) 1982, 1986, 1990, 1993, 1994
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)sockio.h	8.1 (Berkeley) 3/28/94
 */

/*
 * For backwards compatibility, some of the new 4.4BSD socket ioctls have been
 * renumbered so as not to clash with existing RISC OS-specific ioctls
 */
#ifndef	_SYS_SOCKIO_H_
#define	_SYS_SOCKIO_H_

#include <sys/ioccom.h>

/* Socket ioctl's. */
#define	SIOCSHIWAT	 _IOW('s',  0, int)		/* set high watermark */
#define	SIOCGHIWAT	 _IOR('s',  1, int)		/* get high watermark */
#define	SIOCSLOWAT	 _IOW('s',  2, int)		/* set low watermark */
#define	SIOCGLOWAT	 _IOR('s',  3, int)		/* get low watermark */
#define	SIOCATMARK	 _IOR('s',  7, int)		/* at oob mark? */
#define	SIOCSPGRP	 _IOW('s',  8, int)		/* set process group */
#define	SIOCGPGRP	 _IOR('s',  9, int)		/* get process group */

#define	SIOCADDRT	 _IOW('r', 10, struct ortentry)	/* add route */
#define	SIOCDELRT	 _IOW('r', 11, struct ortentry)	/* delete route */
#define	SIOCSETRTINFO	_IOWR('r', 12, struct fullrtentry) /* change aux info */
#define	SIOCGETRTINFO	_IOWR('r', 13, struct fullrtentry) /* read aux info */
#define	SIOCGETVIFINF	_IOWR('r', 14, struct vif_conf)   /* read m/c vifs  */
#define SIOCGETVIFCNT	_IOWR('r', 15, struct sioc_vif_req)/* get vif pkt cnt */
#define SIOCGETSGCNT	_IOWR('r', 16, struct sioc_sg_req) /* get s,g pkt cnt */

#define	SIOCSIFADDR	 _IOW('i', 12, struct ifreq)	/* set ifnet address */
#ifdef COMPAT_INET4
#define	SIOCGIFADDR	_IOWR('i', 13, struct ifreq)	/* get ifnet address */
#define	NSIOCGIFADDR	_IOWR('i', 99, struct nifreq)	/* get ifnet address */
#else
#define	OSIOCGIFADDR	_IOWR('i', 13, struct oifreq)	/* get ifnet address */
#define	SIOCGIFADDR	_IOWR('i', 99, struct ifreq)	/* get ifnet address */
#endif
#define	SIOCSIFDSTADDR	 _IOW('i', 14, struct ifreq)	/* set p-p address */
#ifdef COMPAT_INET4
#define	SIOCGIFDSTADDR	_IOWR('i', 15, struct ifreq)	/* get p-p address */
#define	NSIOCGIFDSTADDR	_IOWR('i', 98, struct nifreq)	/* get p-p address */
#else
#define	OSIOCGIFDSTADDR	_IOWR('i', 15, struct oifreq)	/* get p-p address */
#define	SIOCGIFDSTADDR	_IOWR('i', 98, struct ifreq)	/* get p-p address */
#endif
#define	SIOCSIFFLAGS	 _IOW('i', 16, struct ifreq)	/* set ifnet flags */
#define	SIOCGIFFLAGS	_IOWR('i', 17, struct ifreq)	/* get ifnet flags */
#ifdef COMPAT_INET4
#define	SIOCGIFBRDADDR	_IOWR('i', 18, struct ifreq)	/* get broadcast addr */
#define	NSIOCGIFBRDADDR	_IOWR('i', 97, struct nifreq)	/* get broadcast addr */
#else
#define	OSIOCGIFBRDADDR	_IOWR('i', 18, struct oifreq)	/* get broadcast addr */
#define	SIOCGIFBRDADDR	_IOWR('i', 97, struct ifreq)	/* get broadcast addr */
#endif
#define	SIOCSIFBRDADDR	 _IOW('i', 19, struct ifreq)	/* set broadcast addr */
#ifdef COMPAT_INET4
#define	SIOCGIFCONF	_IOWR('i', 20, struct ifconf)	/* get ifnet list */
#define	NSIOCGIFCONF	_IOWR('i', 96, struct nifconf)	/* get ifnet list */
#define	SIOCGIFNETMASK	_IOWR('i', 21, struct ifreq)	/* get net addr mask */
#define	NSIOCGIFNETMASK	_IOWR('i', 95, struct nifreq)	/* get net addr mask */
#else
#define	OSIOCGIFCONF	_IOWR('i', 20, struct oifconf)	/* get ifnet list */
#define	SIOCGIFCONF	_IOWR('i', 96, struct ifconf)	/* get ifnet list */
#define	OSIOCGIFNETMASK	_IOWR('i', 21, struct oifreq)	/* get net addr mask */
#define	SIOCGIFNETMASK	_IOWR('i', 95, struct ifreq)	/* get net addr mask */
#endif
#define	SIOCSIFNETMASK	 _IOW('i', 22, struct ifreq)	/* set net addr mask */
#define	SIOCGIFMETRIC	_IOWR('i', 23, struct ifreq)	/* get IF metric */
#define	SIOCSIFMETRIC	 _IOW('i', 24, struct ifreq)	/* set IF metric */
#define	SIOCDIFADDR	 _IOW('i', 94, struct ifreq)	/* delete IF addr */
#define	SIOCAIFADDR	 _IOW('i', 93, struct ifaliasreq)/* add/chg IF alias */

#ifdef __riscos
#define SIOCGWHOIAMR	_IOWR('i', 25, struct ifreq)	/* get IP adr via REVARP */
#define SIOCGWHOIAMB	_IOWR('i', 26, struct ifreq)	/* get IP adr via BOOTP */
#define SIOCGWHOIAMRB	_IOWR('i', 27, struct ifreq)	/* get IP adr via REVARP or BOOTP */
#define SIOCGWHOIAMM	_IOWR('i', 28, struct ifreq)	/* get net addr mask via ICMP */
#define SIOCGWHOIAMMNS	_IOWR('i', 29, struct ifreq)	/* get net addr via MNS Rarp */
#define SIOCSWHOTHEYARE	 _IOW('i', 34, struct ifreq)    /* broadcast MNS Rarp replies */
#define SIOCGTCPIDLE	 _IOR('i', 35, int)		/* get tcp_keepidle */
#define SIOCSTCPIDLE	 _IOW('i', 36, int)		/* set tcp_keepidle */
#define SIOCGTCPCNT	 _IOR('i', 37, int)		/* get tcp_keepcnt */
#define SIOCSTCPCNT	 _IOW('i', 38, int)		/* set tcp_keepcnt */
#define SIOCGWHOIAMD    _IOWR('i', 41, struct ifdhcpreq)/* send DHCP messages */
#endif

#define	SIOCADDMULTI	 _IOW('i', 49, struct ifreq)	/* add m'cast addr */
#define	SIOCDELMULTI	 _IOW('i', 50, struct ifreq)	/* del m'cast addr */
#define SIOCGIFMTU	_IOWR('i', 39, struct ifreq)	/* get IF mtu */
#define SIOCSIFMTU	 _IOW('i', 40, struct ifreq)	/* set IF mtu */
#define SIOCGIFPHYS	_IOWR('i', 53, struct ifreq)	/* get IF wire */
#define SIOCSIFPHYS	 _IOW('i', 54, struct ifreq)	/* set IF wire */

#endif /* !_SYS_SOCKIO_H_ */
