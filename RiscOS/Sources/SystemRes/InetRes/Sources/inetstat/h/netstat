/*
 * Copyright (c) 1992, 1993
 *	Regents of the University of California.  All rights reserved.
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
 *	@(#)netstat.h	8.2 (Berkeley) 1/4/94
 */

#include <sys/cdefs.h>

#ifndef EXTERN
#define EXTERN extern
#endif
EXTERN int	Aflag;		/* show addresses of protocol control block */
EXTERN int	aflag;		/* show all sockets (including servers) */
EXTERN int	bflag;		/* show i/f total bytes in/out */
EXTERN int	dflag;		/* show i/f dropped packets */
EXTERN int	gflag;		/* show group (multicast) routing or stats */
EXTERN int	iflag;		/* show interfaces */
EXTERN int	mflag;		/* show memory stats */
EXTERN int	nflag;		/* show addresses numerically */
EXTERN int	pflag;		/* show given protocol */
EXTERN int	rflag;		/* show routing tables (or routing stats) */
EXTERN int	sflag;		/* show protocol statistics */
EXTERN int	tflag;		/* show i/f watchdog timers */

EXTERN int	interval;	/* repeat interval for i/f stats */

EXTERN char	*interface;	/* desired i/f for stats, or NULL for all i/fs */
EXTERN int	unit;		/* unit number for above */

EXTERN int	af;		/* address family */

EXTERN char	*prog;		/* program name */


int	kread(u_long addr, char *buf, int size);
char	*plural(int);
char	*plurales(int);

void	protopr(u_long, char *);
void	tcp_stats(u_long, char *);
void	udp_stats(u_long, char *);
void	ip_stats(u_long, char *);
void	icmp_stats(u_long, char *);
void	igmp_stats(u_long, char *);
void	protopr(u_long, char *);

void	mbpr(u_long);

void	hostpr(u_long, u_long);
void	impstats(u_long, u_long);

void	intpr(int, u_long);

void	pr_rthdr();
void	pr_family(int);
void	rt_stats(u_long);
char	*ns_phost(struct sockaddr *);
void	upHex(char *);

char	*routename(u_long);
char	*netname(u_long, u_long);
char	*ns_print(struct sockaddr *);
void	routepr(u_long);

void	nsprotopr(u_long, char *);
void	spp_stats(u_long, char *);
void	idp_stats(u_long, char *);
void	nserr_stats(u_long, char *);

void	intpr(int, u_long);

void	unixpr(u_long);

void	esis_stats(u_long, char *);
void	clnp_stats(u_long, char *);
void	cltp_stats(u_long, char *);
void	iso_protopr(u_long, char *);
void	iso_protopr1(u_long, int);
void	tp_protopr(u_long, char *);
void	tp_inproto(u_long);
void	tp_stats(caddr_t, caddr_t);

void	mroutepr(u_long, u_long, u_long);
void	mrt_stats(u_long, u_long);
