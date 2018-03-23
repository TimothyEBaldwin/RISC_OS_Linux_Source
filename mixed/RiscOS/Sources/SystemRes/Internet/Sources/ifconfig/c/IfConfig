/*
 * Copyright (c) 1983, 1993
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
 */

#ifndef lint
static char copyright[] =
"@(#) Copyright (c) 1983, 1993\n\
	The Regents of the University of California.  All rights reserved.\n";
#endif /* not lint */

#ifndef lint
static char sccsid[] = "@(#)ifconfig.c	8.2 (Berkeley) 2/16/94";
#endif /* not lint */

#include <sys/param.h>
#include <sys/socket.h>
#include <sys/ioctl.h>

#include <net/if.h>
#include <net/if_var.h>
#include <net/if_dl.h>
#include <netinet/in.h>
#include <netinet/in_var.h>
#include <arpa/inet.h>

#define	NSIP
#include <netns/ns.h>
#include <netns/ns_if.h>
#include <netdb.h>

#define EON
#include <netiso/iso.h>
#include <netiso/iso_var.h>
#include <sys/protosw.h>

#include <ctype.h>
#include <err.h>
#include <sys/errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <nlist.h>
#include <kvm.h>
#ifdef __riscos
#include <sys/fcntl.h>
#include <riscos.h>
#include "swis.h"
#include "socklib.h"
#include "unixlib.h"
const char *__progname = "ifconfig";
#else
#include <fcntl.h>
#endif

struct	ifreq		ifr, ridreq;
struct	ifaliasreq	addreq;
struct	iso_ifreq	iso_ridreq;
struct	iso_aliasreq	iso_addreq;
struct	sockaddr_in	netmask;

char	name[30];
int	flags;
int	metric;
int	mtu;
int	nsellength = 1;
int	setaddr;
int	setipdst;
int	doalias;
int	clearaddr;
int	newaddr = 1;
int	s = -1;
kvm_t	*kvmd;
extern	int errno;
int	errvarflag;

void	setifflags();
void    setifaddr();
void    setifdstaddr();
void    setifnetmask();
void	setifmetric();
void    setifmtu();
void    setifbroadaddr();
void    setifipdst();
void	notealias();
void    setsnpaoffset();
void    setnsellength();
void Perror(char *cmd);
void status(void);
void adjust_nsellength(void);
void printb(char *s, register unsigned short v, register char *bits);
#ifdef __riscos
char   *gstrans(const char *s);
#endif

#define	NEXTARG		0xffffff

struct	cmd {
	char	*c_name;
	int	c_parameter;		/* NEXTARG means next argv */
	void	(*c_func)();
} cmds[] = {
	{ "up",		IFF_UP,		setifflags } ,
	{ "down",	-IFF_UP,	setifflags },
	{ "arp",	-IFF_NOARP,	setifflags },
	{ "-arp",	IFF_NOARP,	setifflags },
	{ "debug",	IFF_DEBUG,	setifflags },
	{ "-debug",	-IFF_DEBUG,	setifflags },
	{ "alias",	IFF_UP,		notealias },
	{ "-alias",	-IFF_UP,	notealias },
	{ "delete",	-IFF_UP,	notealias },
#ifdef notdef
#define	EN_SWABIPS	0x1000
	{ "swabips",	EN_SWABIPS,	setifflags },
	{ "-swabips",	-EN_SWABIPS,	setifflags },
#endif
	{ "netmask",	NEXTARG,	setifnetmask },
	{ "metric",	NEXTARG,	setifmetric },
	{ "broadcast",	NEXTARG,	setifbroadaddr },
	{ "ipdst",	NEXTARG,	setifipdst },
	{ "snpaoffset",	NEXTARG,	setsnpaoffset },
	{ "nsellength",	NEXTARG,	setnsellength },
	{ "link0",	IFF_LINK0,	setifflags },
	{ "-link0",	-IFF_LINK0,	setifflags },
	{ "link1",	IFF_LINK1,	setifflags },
	{ "-link1",	-IFF_LINK1,	setifflags },
	{ "link2",	IFF_LINK2,	setifflags },
	{ "-link2",	-IFF_LINK2,	setifflags },
	{ "normal",	-IFF_LINK0,	setifflags },
	{ "compress",	IFF_LINK0,	setifflags },
	{ "noicmp",	IFF_LINK1,	setifflags },
	{ "mtu",	NEXTARG,	setifmtu },
	{ 0,		0,		setifaddr },
	{ 0,		0,		setifdstaddr },
};

/*
 * XNS support liberally adapted from code written at the University of
 * Maryland principally by James O'Toole and Chris Torek.
 */
void	in_status();
void	in_getaddr();
void	xns_status();
void	xns_getaddr();
void	iso_status();
void	iso_getaddr();
void	ether_status();

/* Known address families */
struct afswtch {
	char *af_name;
	short af_af;
	void (*af_status)();
	void (*af_getaddr)();
	int af_difaddr;
	int af_aifaddr;
	caddr_t af_ridreq;
	caddr_t af_addreq;
} afs[] = {
#define C(x) ((caddr_t) &x)
	{ "inet", AF_INET, in_status, in_getaddr,
	     SIOCDIFADDR, SIOCAIFADDR, C(ridreq), C(addreq) },
	{ "ns", AF_NS, xns_status, xns_getaddr,
	     SIOCDIFADDR, SIOCAIFADDR, C(ridreq), C(addreq) },
	{ "iso", AF_ISO, iso_status, iso_getaddr,
	     SIOCDIFADDR_ISO, SIOCAIFADDR_ISO, C(iso_ridreq), C(iso_addreq) },
	{ "ether", AF_INET, ether_status, NULL },
	{ 0,	0,	    0,		0 }
};

struct afswtch *afp;	/*the address family being set or asked about*/

int ifconfig(int argc, char *argv[], int af, struct afswtch *rafp, int flag);

#ifdef __riscos
static void
sock_close(void)
{
	if (s >= 0)
		socketclose(s);
	s = -1;
}
#endif

static void
printhelp(void)
{
	printf("Usage:   ifconfig [-ea] <interface> [address [dest_addr]] [parameters]\n");
	printf("         configures network interface parameters\n");
	printf("Options: -e  write any errors to Inet$Error\n");
	printf("         -a  list all present interfaces.\n");
	printf("Parameters:\n");
    	printf("up               Mark an interface up\n");
   	printf("down             Mark an interface down\n");
    	printf("arp              Enable the use of ARP\n");
    	printf("-arp             Disable the use of ARP\n");
    	printf("metric <n>       Set the routing metric to n (default 0)\n");
    	printf("netmask <mask>   Set the interface netmask to mask\n");
    	printf("broadcast <addr> Set the network broadcast to addr\n");
    	printf("alias <addr>     Set an additional interface address\n");
    	printf("delete <addr>    Remove an interface address\n");
    	printf("mtu <n>          Set the interface maximum transmission unit to n\n");
}


int main(int argc, char *argv[])
{
	int af = AF_INET;
	register struct afswtch *rafp;

#ifdef __riscos
	atexit(sock_close);
#endif
	if (argc > 1 && (strcmp(argv[1], "-help") == 0 || strcmp(argv[1], "-h") == 0)) {
		printhelp();
		exit(0);
	}
	argc--, argv++;
	if (argc > 0 && strcmp(*argv, "-e") == 0) {
		errvarflag = 1;
		argc--; argv++;
	}
	if (argc < 1) {
		printhelp();
		exit(1);
	}
#ifdef __riscos
	strncpy(name, gstrans(*argv), sizeof(name));
#else
	strncpy(name, *argv, sizeof(name));
#endif
	strncpy(ifr.ifr_name, name, sizeof(ifr.ifr_name));
	argc--, argv++;
	if (argc > 0) {
		for (afp = rafp = afs; rafp->af_name; rafp++)
			if (strcmp(rafp->af_name, *argv) == 0) {
				afp = rafp; argc--; argv++;
				break;
			}
		rafp = afp;
		af = ifr.ifr_addr.sa_family = rafp->af_af;
	}
	s = socket(af, SOCK_DGRAM, 0);
	if (s < 0) {
		Perror("ifconfig: socket");
	}
	if (strstr(name, "-a")) {
		struct ifconf ifc;
#define MAX_INTERFACES 50	/* Yeah right. */
		char buffer[MAX_INTERFACES * sizeof(struct ifreq)];
		struct ifreq *ifptr, *end;
		int ifflags, selectflag = -1;

		if (strstr(name, "-au"))
			selectflag = 1;
		if (strstr(name, "-ad"))
			selectflag = 0;
		ifc.ifc_len = sizeof(buffer);
		ifc.ifc_buf = buffer;
		if (ioctl(s, SIOCGIFCONF, (char *) &ifc) < 0) {
			Perror("SIOCGIFCONF");
		}
		ifflags = ifc.ifc_req->ifr_flags;
		end = (struct ifreq *) (ifc.ifc_buf + ifc.ifc_len);
		ifptr = ifc.ifc_req;
		while (ifptr < end) {
			sprintf(ifr.ifr_name,"%s",ifptr->ifr_name);
			sprintf(name,"%s",ifptr->ifr_name);
			close(s);
			if ((s = socket(af, SOCK_DGRAM, 0)) < 0) {
				Perror("socket");
			}
			if (ifptr->ifr_flags == ifflags)
				ifconfig(argc,argv,af,rafp,selectflag);
			if(ifptr->ifr_addr.sa_len)	/* Dohw! */
				ifptr = (struct ifreq *) ((caddr_t) ifptr +
				ifptr->ifr_addr.sa_len -
				sizeof(struct sockaddr));
			ifptr++;
		}
	} else
		ifconfig(argc,argv,af,rafp, -1);

	exit (0);
}



int ifconfig(int argc, char *argv[], int af, struct afswtch *rafp,
         int flag)
{
	if (ioctl(s, SIOCGIFFLAGS, (caddr_t)&ifr) < 0) {
		Perror("ioctl (SIOCGIFFLAGS)");
		exit(1);
	}

	switch(flag) {
	case 0:
		if (ifr.ifr_flags & IFF_UP)
			return(0);
		break;
	case 1:
		if (!(ifr.ifr_flags & IFF_UP))
			return(0);
		break;
	case -1:
	default:
		break;
	}

	strncpy(ifr.ifr_name, name, sizeof ifr.ifr_name);
	flags = ifr.ifr_flags;
	if (ioctl(s, SIOCGIFMETRIC, (caddr_t)&ifr) < 0)
		Perror("ioctl (SIOCGIFMETRIC)");
	else
		metric = ifr.ifr_metric;
	if (ioctl(s, SIOCGIFMTU, (caddr_t)&ifr) < 0)
		Perror("ioctl (SIOCGIFMTU)");
	else
		mtu = ifr.ifr_mtu;
	if (argc == 0) {
		status();
		return(0);
	}
	while (argc > 0) {
		register struct cmd *p;

		for (p = cmds; p->c_name; p++)
			if (strcmp(*argv, p->c_name) == 0)
				break;
		if (p->c_name == 0 && setaddr)
			p++;	/* got src, do dst */
		if (p->c_func) {
			if (p->c_parameter == NEXTARG) {
				if (argv[1] == NULL)
					errx(1, "'%s' requires argument",
					    p->c_name);
				(*p->c_func)(argv[1]);
				argc--, argv++;
			} else
				(*p->c_func)(*argv, p->c_parameter);
		}
		argc--, argv++;
	}
	if (af == AF_ISO)
		adjust_nsellength();
	if (setipdst && af==AF_NS) {
		struct nsip_req rq;
		int size = sizeof(rq);

		rq.rq_ns = addreq.ifra_addr;
		rq.rq_ip = addreq.ifra_dstaddr;

		if (setsockopt(s, 0, SO_NSIP_ROUTE, &rq, size) < 0)
			Perror("Encapsulation Routing");
	}
	if (clearaddr) {
		int ret;
		strncpy(rafp->af_ridreq, name, sizeof ifr.ifr_name);
		if ((ret = ioctl(s, rafp->af_difaddr, rafp->af_ridreq)) < 0) {
			if (errno == EADDRNOTAVAIL && (doalias >= 0)) {
				/* means no previous address for interface */
			} else
				Perror("ioctl (SIOCDIFADDR)");
		}
	}
	if (newaddr) {
		strncpy(rafp->af_addreq, name, sizeof ifr.ifr_name);
		if (ioctl(s, rafp->af_aifaddr, rafp->af_addreq) < 0)
			Perror("ioctl (SIOCAIFADDR)");
	}
	return(0);
}
#define RIDADDR 0
#define ADDR	1
#define MASK	2
#define DSTADDR	3

/*ARGSUSED*/
void setifaddr(char *addr, int param)
{
	/*
	 * Delay the ioctl to set the interface addr until flags are all set.
	 * The address interpretation may depend on the flags,
	 * and the flags may change when the address is set.
	 */
	setaddr++;
	if (doalias == 0)
		clearaddr = 1;
	(*afp->af_getaddr)(addr, (doalias >= 0 ? ADDR : RIDADDR));
}

void setifnetmask(char *addr)
{
	/*
	 * 950504 KWelton
	 *
	 * allow a special netmask of "default", which lets the Internet module
	 * set a default netmask as if this cmd line option was never supplied
	 */
#ifdef __riscos
	/*
	 * gstrans() copies data into a static area - use our
	 * own buffer to avoid problems when gstrans() is
	 * called from in_getaddr()
	 */
	char addrbuf[16];

	addr = strncpy(addrbuf, gstrans(addr), sizeof(addrbuf) - 1);
	if (strcasecmp(addr, "default"))
#endif
	(*afp->af_getaddr)(addr, MASK);
}

void setifbroadaddr(char *addr)
{
	(*afp->af_getaddr)(addr, DSTADDR);
}

void setifipdst(char *addr)
{
	in_getaddr(addr, DSTADDR);
	setipdst++;
	clearaddr = 0;
	newaddr = 0;
}
#define rqtosa(x) (&(((struct ifreq *)(afp->x))->ifr_addr))
/*ARGSUSED*/
void notealias(char *addr, int param)
{
	if (setaddr && doalias == 0 && param < 0)
		bcopy((caddr_t)rqtosa(af_addreq),
		      (caddr_t)rqtosa(af_ridreq),
		      rqtosa(af_addreq)->sa_len);
	doalias = param;
	if (param < 0) {
		clearaddr = 1;
		newaddr = 0;
	} else
		clearaddr = 0;
}

/*ARGSUSED*/
void setifdstaddr(char *addr, int param)
{
	(*afp->af_getaddr)(addr, DSTADDR);
}

void setifflags(char *vname, int value)
{
	value = (short) value;
	if (ioctl(s, SIOCGIFFLAGS, (caddr_t)&ifr) < 0) {
		Perror("ioctl (SIOCGIFFLAGS)");
		exit(1);
	}
	strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
	flags = ifr.ifr_flags;

	if (value < 0) {
		value = -value;
		flags &= ~value;
	} else
		flags |= value;
	ifr.ifr_flags = flags;
	if (ioctl(s, SIOCSIFFLAGS, (caddr_t)&ifr) < 0)
		Perror(vname);
}

void setifmetric(char *val)
{
	strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
	ifr.ifr_metric = atoi(val);
	if (ioctl(s, SIOCSIFMETRIC, (caddr_t)&ifr) < 0)
		Perror("ioctl (set metric)");
}

void setifmtu(char *val)
{
	strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
	ifr.ifr_mtu = atoi(val);
	if (ioctl(s, SIOCSIFMTU, (caddr_t)&ifr) < 0)
		Perror("ioctl (set mtu)");
}

void setsnpaoffset(char *val)
{
	iso_addreq.ifra_snpaoffset = atoi(val);
}

#define	IFFBITS \
"\020\1UP\2BROADCAST\3DEBUG\4LOOPBACK\5POINTOPOINT\6SMART\7RUNNING"\
"\10NOARP\11PROMISC\12ALLMULTI\13OACTIVE\14SIMPLEX\15LINK0\16LINK1\17LINK2"\
"\20MULTICAST"

/*
 * Print the status of the interface.  If an address family was
 * specified, show it and it only; otherwise, show them all.
 */
void status(void)
{
	register struct afswtch *p = afp;
	short af = ifr.ifr_addr.sa_family;

	printf("%s: ", name);
	printb("flags", flags, IFFBITS);
	if (metric)
		printf(" metric %d", metric);
	if (mtu)
		printf(" mtu %d", mtu);
	putchar('\n');
	if ((p = afp) != NULL) {
		(*p->af_status)(1);
	} else for (p = afs; p->af_name; p++) {
		ifr.ifr_addr.sa_family = p->af_af;
		(*p->af_status)(0);
	}
}

void in_status(int force)
{
	struct sockaddr_in *sin;
	char *inet_ntoa();

	strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
	if (ioctl(s, SIOCGIFADDR, (caddr_t)&ifr) < 0) {
		if (errno == EADDRNOTAVAIL || errno == EAFNOSUPPORT) {
			if (!force)
				return;
			bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
		} else
			Perror("ioctl (SIOCGIFADDR)");
	}
	sin = (struct sockaddr_in *)&ifr.ifr_addr;
	printf("        inet %s ", inet_ntoa(sin->sin_addr));
	strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
	if (ioctl(s, SIOCGIFNETMASK, (caddr_t)&ifr) < 0) {
		if (errno != EADDRNOTAVAIL)
			Perror("ioctl (SIOCGIFNETMASK)");
		bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
	} else
		netmask.sin_addr =
		    ((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr;
	if (flags & IFF_POINTOPOINT) {
		if (ioctl(s, SIOCGIFDSTADDR, (caddr_t)&ifr) < 0) {
			if (errno == EADDRNOTAVAIL)
			    bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
			else
			    Perror("ioctl (SIOCGIFDSTADDR)");
		}
		strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
		sin = (struct sockaddr_in *)&ifr.ifr_dstaddr;
		printf("--> %s ", inet_ntoa(sin->sin_addr));
	}
	printf("netmask 0x%x ", ntohl(netmask.sin_addr.s_addr));
	if (flags & IFF_BROADCAST) {
		if (ioctl(s, SIOCGIFBRDADDR, (caddr_t)&ifr) < 0) {
			if (errno == EADDRNOTAVAIL)
			    bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
			else
			    Perror("ioctl (SIOCGIFADDR)");
		}
		strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
		sin = (struct sockaddr_in *)&ifr.ifr_addr;
		if (sin->sin_addr.s_addr != 0)
			printf("broadcast %s", inet_ntoa(sin->sin_addr));
	}
	putchar('\n');
}


void xns_status(int force)
{
	struct sockaddr_ns *sns;

	close(s);
	s = socket(AF_NS, SOCK_DGRAM, 0);
	if (s < 0) {
		if (errno == EPROTONOSUPPORT)
			return;
		Perror("socket");
	}
	if (ioctl(s, SIOCGIFADDR, (caddr_t)&ifr) < 0) {
		if (errno == EADDRNOTAVAIL || errno == EAFNOSUPPORT) {
			if (!force)
				return;
			bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
		} else
			Perror("ioctl (SIOCGIFADDR)");
	}
	strncpy(ifr.ifr_name, name, sizeof ifr.ifr_name);
	sns = (struct sockaddr_ns *)&ifr.ifr_addr;
	printf("        ns %s ", ns_ntoa(sns->sns_addr));
	if (flags & IFF_POINTOPOINT) { /* by W. Nesheim@Cornell */
		if (ioctl(s, SIOCGIFDSTADDR, (caddr_t)&ifr) < 0) {
			if (errno == EADDRNOTAVAIL)
			    bzero((char *)&ifr.ifr_addr, sizeof(ifr.ifr_addr));
			else
			    Perror("ioctl (SIOCGIFDSTADDR)");
		}
		strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
		sns = (struct sockaddr_ns *)&ifr.ifr_dstaddr;
		printf("--> %s ", ns_ntoa(sns->sns_addr));
	}
	putchar('\n');
}

void iso_status(int force)
{
	struct sockaddr_iso *siso;
	struct iso_ifreq ifr;

	close(s);
	s = socket(AF_ISO, SOCK_DGRAM, 0);
	if (s < 0) {
		if (errno == EPROTONOSUPPORT)
			return;
		Perror("socket");
	}
	bzero((caddr_t)&ifr, sizeof(ifr));
	strncpy(ifr.ifr_name, name, sizeof(ifr.ifr_name));
	if (ioctl(s, SIOCGIFADDR_ISO, (caddr_t)&ifr) < 0) {
		if (errno == EADDRNOTAVAIL || errno == EAFNOSUPPORT) {
			if (!force)
				return;
			bzero((char *)&ifr.ifr_Addr, sizeof(ifr.ifr_Addr));
		} else {
			Perror("ioctl (SIOCGIFADDR_ISO)");
		}
	}
	strncpy(ifr.ifr_name, name, sizeof ifr.ifr_name);
	siso = &ifr.ifr_Addr;
	printf("        iso %s ", iso_ntoa(&siso->siso_addr));
	if (ioctl(s, SIOCGIFNETMASK_ISO, (caddr_t)&ifr) < 0) {
		if (errno != EADDRNOTAVAIL)
			Perror("ioctl (SIOCGIFNETMASK_ISO)");
	} else {
		printf(" netmask %s ", iso_ntoa(&siso->siso_addr));
	}
	if (flags & IFF_POINTOPOINT) {
		if (ioctl(s, SIOCGIFDSTADDR_ISO, (caddr_t)&ifr) < 0) {
			if (errno == EADDRNOTAVAIL)
			    bzero((char *)&ifr.ifr_Addr, sizeof(ifr.ifr_Addr));
			else
			    Perror("ioctl (SIOCGIFDSTADDR_ISO)");
		}
		strncpy(ifr.ifr_name, name, sizeof (ifr.ifr_name));
		siso = &ifr.ifr_Addr;
		printf("--> %s ", iso_ntoa(&siso->siso_addr));
	}
	putchar('\n');
}

int kread(u_long addr, char *buf, int size)
{

        if (kvm_read(kvmd, addr, buf, size) != size)
                return (-1);
        return (0);
}

/* Unashamedly stolen from netstat -- maybe someday we can us sysctl() */
void ether_status(void)
{
	struct nlist nl[] = { { "_ifnet" } , "" };
	u_long addr, addr2;
	struct ifnet ifnet;
	union {
		struct ifaddr ifa;
		struct in_ifaddr in;
		struct ns_ifaddr ns;
		struct iso_ifaddr iso;
	} ifaddr;
	char *cp;
	struct sockaddr *sa;
	struct sockaddr_dl *sdl;
	int n;
	char ifacename[IFNAMSIZ];

	/*
	 * If we fail here it probably means we don't have permission to
	 * read /dev/kmem. Best to just silently bail out. If we have
	 * an error *after* we succeed in opening /dev/kmem, then we
	 * should report it.
	 */
	if ((kvmd = kvm_open(NULL,NULL,NULL,O_RDONLY,NULL)) == NULL)
		return;
	if (kvm_nlist(kvmd, nl) < 0 || nl[0].n_type == 0) {
		Perror("ifconfig: kvm_nlist()");
		return;
	}
	if (kread(nl[0].n_value, (char *)&addr, sizeof(addr))) {
		Perror("_ifnet");
		return;
	}
	addr2 = 0;
	while (addr || addr2) {
		if (addr2 == 0) {
                        if (kread(addr, (char *)&ifnet, sizeof ifnet) ||
                           kread((u_long)ifnet.if_name, ifacename, IFNAMSIZ)){
					Perror("ifconfig: kvm_read()");
					return;
			}
			addr = (u_long)ifnet.if_next;
			addr2 = (u_long)ifnet.if_addrlist;
		}
		if (kread(addr2, (char *)&ifaddr, sizeof ifaddr)) {
			addr2 = 0;
                        continue;
                }
		sprintf(ifacename,"%s%d",ifacename, ifnet.if_unit);
		if (!strncmp(name, ifacename, strlen(name))) {
#define CP(x) ((char *)(x))
			cp = (CP(ifaddr.ifa.ifa_addr) - CP(addr2)) +
				CP(&ifaddr); sa = (struct sockaddr *)cp;
			if (sa->sa_family == AF_LINK) {
				sdl = (struct sockaddr_dl *)sa;
				cp = (char *)LLADDR(sdl);
				if ((n = sdl->sdl_alen) > 0) {
					printf ("        ether ");
                               		while (--n >= 0)
						printf("%02x%c",
							*cp++ & 0xff,
							n > 0 ? ':' : ' ');
					putchar('\n');
				}
				break;
			}
		}
		addr2 = (u_long)ifaddr.ifa.ifa_next;
	}
	kvm_close(kvmd);
}

void Perror(char *cmd)
{
	extern int errno;
	const char *errmess;
	char errtext[128];

	switch (errno) {

	case ENXIO:
		errmess = "no such interface";
		break;

	case EPERM:
		errmess = "permission denied";
		break;

	default:
		errmess = _inet_error.errmess;
	}
	if (!errvarflag)
		fprintf(stderr, "%s: %s: %s\n", __progname, cmd, errmess);
	else
	{
		sprintf(errtext, "%s: %s: %s", __progname, cmd, errmess);
		_kernel_setenv("Inet$Error", errtext);
	}
	exit(1);
}

struct	in_addr inet_makeaddr();

#define SIN(x) ((struct sockaddr_in *) &(x))
struct sockaddr_in *sintab[] = {
SIN(ridreq.ifr_addr), SIN(addreq.ifra_addr),
SIN(addreq.ifra_mask), SIN(addreq.ifra_broadaddr)};

void in_getaddr(char *s, int which)
{
	register struct sockaddr_in *sin = sintab[which];
	struct hostent *hp;
	struct netent *np;
	int val;

#ifdef __riscos
	s = gstrans(s);
#endif
	sin->sin_len = sizeof(*sin);
	if (which != MASK)
		sin->sin_family = AF_INET;

	if (inet_aton(s, &sin->sin_addr))
		;
	else if (hp = gethostbyname(s))
		bcopy(hp->h_addr, (char *)&sin->sin_addr, hp->h_length);
	else if (np = getnetbyname(s))
		sin->sin_addr = inet_makeaddr(np->n_net, INADDR_ANY);
	else
		errx(1, "%s: bad value", s);
}

/*
 * Print a value a la the %b format of the kernel's printf
 */
void printb(char *s, register unsigned short v, register char *bits)
{
	register int i, any = 0;
	register char c;

	if (bits && *bits == 8)
		printf("%s=%o", s, v);
	else
		printf("%s=%x", s, v);
	bits++;
	if (bits) {
		putchar('<');
		while (i = *bits++) {
			if (v & (1 << (i-1))) {
				if (any)
					putchar(',');
				any = 1;
				for (; (c = *bits) > 32; bits++)
					putchar(c);
			} else
				for (; *bits > 32; bits++)
					;
		}
		putchar('>');
	}
}

#define SNS(x) ((struct sockaddr_ns *) &(x))
struct sockaddr_ns *snstab[] = {
SNS(ridreq.ifr_addr), SNS(addreq.ifra_addr),
SNS(addreq.ifra_mask), SNS(addreq.ifra_broadaddr)};

void xns_getaddr(char *addr, int which)
{
	struct sockaddr_ns *sns = snstab[which];
	struct ns_addr ns_addr();

	sns->sns_family = AF_NS;
	sns->sns_len = sizeof(*sns);
	sns->sns_addr = ns_addr(addr);
	if (which == MASK)
		printf("Attempt to set XNS netmask will be ineffectual\n");
}

#define SISO(x) ((struct sockaddr_iso *) &(x))
struct sockaddr_iso *sisotab[] = {
SISO(iso_ridreq.ifr_Addr), SISO(iso_addreq.ifra_addr),
SISO(iso_addreq.ifra_mask), SISO(iso_addreq.ifra_dstaddr)};

void iso_getaddr(char *addr, int which)
{
	register struct sockaddr_iso *siso = sisotab[which];
	struct iso_addr *iso_addr();
	siso->siso_addr = *iso_addr(addr);

	if (which == MASK) {
		siso->siso_len = TSEL(siso) - (caddr_t)(siso);
		siso->siso_nlen = 0;
	} else {
		siso->siso_len = sizeof(*siso);
		siso->siso_family = AF_ISO;
	}
}

void setnsellength(char *val)
{
	nsellength = atoi(val);
	if (nsellength < 0)
		errx(1, "Negative NSEL length is absurd");
	if (afp == 0 || afp->af_af != AF_ISO)
		errx(1, "Setting NSEL length valid only for iso");
}

void fixnsel(register struct sockaddr_iso *s)
{
	if (s->siso_family == 0)
		return;
	s->siso_tlen = nsellength;
}

void adjust_nsellength(void)
{
	fixnsel(sisotab[RIDADDR]);
	fixnsel(sisotab[ADDR]);
	fixnsel(sisotab[DSTADDR]);
}

#ifdef __riscos
char *
gstrans(const char *s)
{
	static char gstbuf[256];
	int len;

	gstbuf[0] = 0;
	_swix(OS_GSTrans, _INR(0,2)|_OUT(2), s, gstbuf, sizeof(gstbuf), &len);
	gstbuf[len] = 0;
	return (gstbuf);
}
#endif
