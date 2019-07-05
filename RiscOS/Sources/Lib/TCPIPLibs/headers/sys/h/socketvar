/*-
 * Copyright (c) 1982, 1986, 1990, 1993
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
 *	@(#)socketvar.h	8.1 (Berkeley) 6/2/93
 */

#ifndef _SYS_SOCKETVAR_H_
#define _SYS_SOCKETVAR_H_

#include <sys/stat.h>			/* for struct stat */
#ifndef __riscos
#include <sys/filedesc.h>		/* for struct filedesc */
#endif
#include <sys/select.h>			/* for struct selinfo */

/*
 * Kernel structure per socket.
 * Contains send and receive buffer queues,
 * handle on protocol and pointer to protocol
 * private data and error information.
 */
typedef	u_quad_t so_gen_t;

struct socket {
        short   so_type;                /* generic type, see socket.h */
        short   so_options;             /* from socket call, see socket.h */
        short   so_linger;              /* time to linger while closing */
        short   so_state;               /* internal state flags SS_*, below */
        caddr_t so_pcb;                 /* protocol control block */
        struct  protosw *so_proto;      /* protocol handle */
/*
 * Variables for connection queueing.
 * Socket where accepts occur is so_head in all subsidiary sockets.
 * If so_head is 0, socket is not related to an accept.
 * For head socket so_q0 queues partially completed connections,
 * while so_q is a queue of connections ready to be accepted.
 * If a connection is aborted and it has so_head set, then
 * it has to be pulled out of either so_q0 or so_q.
 * We allow connections to queue up based on current queue lengths
 * and limit on number of queued connections for this socket.
 */
        struct  socket *so_head;        /* back pointer to accept socket */
        struct  socket *so_q0;          /* queue of partial connections */
        struct  socket *so_q;           /* queue of incoming connections */
        short   so_q0len;               /* partials on so_q0 */
        short   so_qlen;                /* number of connections on so_q */
        short   so_qlimit;              /* max number queued connections */
        short   so_timeo;               /* connection timeout */
        u_short so_error;               /* error affecting connection */
        pid_t   so_pgid;                /* pgid for signals */
        u_long  so_oobmark;             /* chars to oob mark */
/*
 * Variables for socket buffering.
 */
        struct  sockbuf {
                u_long  sb_cc;          /* actual chars in buffer */
                u_long  sb_hiwat;       /* max actual char count */
                u_long  sb_mbcnt;       /* chars of mbufs used */
                u_long  sb_mbmax;       /* max chars of mbufs to use */
                long    sb_lowat;       /* low water mark */
                struct  mbuf *sb_mb;    /* the mbuf chain */
		struct	selinfo sb_sel;	/* process selecting read/write */
                short   sb_flags;       /* flags, see below */
                short   sb_timeo;       /* timeout for read/write */
        } so_rcv, so_snd;
#define SB_MAX          (256*1024)      /* max chars in sockbuf */
#define SB_LOCK         0x01            /* lock on data queue (so_rcv only) */
#define SB_WANT         0x02            /* someone is waiting to lock */
#define SB_WAIT         0x04            /* someone is waiting for data/space */
#define SB_SEL          0x08            /* buffer is selected */
#define	SB_ASYNC	0x10		/* ASYNC I/O, need signals */
#define	SB_NOTIFY	(SB_WAIT|SB_SEL|SB_ASYNC)
#define	SB_NOINTR	0x40		/* operations not interruptible */

	caddr_t	so_tpcb;		/* Wisc. protocol control block XXX */
	void	(*so_upcall)(struct socket *so, caddr_t arg, int waitf);
	caddr_t	so_upcallarg;		/* Arg for above */
	/* NB: generation count must not be first; easiest to make it last. */
	so_gen_t so_gencnt;		/* generation count */
};

/*
 * Socket state bits.
 */
#define SS_NOFDREF              0x001   /* no file table ref any more */
#define SS_ISCONNECTED          0x002   /* socket connected to a peer */
#define SS_ISCONNECTING         0x004   /* in process of connecting to peer */
#define SS_ISDISCONNECTING      0x008   /* in process of disconnecting */
#define SS_CANTSENDMORE         0x010   /* can't send more data to peer */
#define SS_CANTRCVMORE          0x020   /* can't receive more data from peer */
#define SS_RCVATMARK            0x040   /* at mark on input */

#define SS_PRIV                 0x080   /* privileged for broadcast, raw... */
#define SS_NBIO                 0x100   /* non-blocking ops */
#define SS_ASYNC                0x200   /* async i/o notify */
#define	SS_ISCONFIRMING		0x400	/* deciding to accept connection req */
#ifdef __riscos
#define SS_RXDIRECT             0x800   /* notify user directly of rx input */
#define SS_SLEEPTW              0x1000  /* issue upcall 6 to sleep taskwindows */
#endif

/*
 * Externalized form of struct socket used by the sysctl(3) interface.
 */
struct	xsocket {
	size_t	xso_len;	/* length of this structure */
	struct	socket *xso_so;	/* makes a convenient handle sometimes */
	short	so_type;
	short	so_options;
	short	so_linger;
	short	so_state;
	caddr_t	so_pcb;		/* another convenient handle */
	int	xso_protocol;
	int	xso_family;
	short	so_qlen;
	short	so_incqlen;
	short	so_qlimit;
	short	so_timeo;
	u_short	so_error;
	pid_t	so_pgid;
	u_long	so_oobmark;
	struct	xsockbuf {
		u_long	sb_cc;
		u_long	sb_hiwat;
		u_long	sb_mbcnt;
		u_long	sb_mbmax;
		long	sb_lowat;
		short	sb_flags;
		short	sb_timeo;
	} so_rcv, so_snd;
	uid_t	so_uid;		/* XXX */
};

/*
 * Macros for sockets and socket buffering.
 */

/*
 * How much space is there in a socket buffer (so->so_snd or so->so_rcv)?
 * This is problematical if the fields are unsigned, as the space might
 * still be negative (cc > hiwat or mbcnt > mbmax).  Should detect
 * overflow and return 0.  Should use "lmin" but it doesn't exist now.
 */
#define	sbspace(sb) \
    ((long) imin((int)((sb)->sb_hiwat - (sb)->sb_cc), \
	 (int)((sb)->sb_mbmax - (sb)->sb_mbcnt)))

/* do we have to send all at once on a socket? */
#define sosendallatonce(so) \
    ((so)->so_proto->pr_flags & PR_ATOMIC)

/* can we read something from so? */
#define soreadable(so) \
    ((so)->so_rcv.sb_cc >= (so)->so_rcv.sb_lowat || \
       ((so)->so_state & SS_CANTRCVMORE) || \
        (so)->so_qlen || (so)->so_error)

/* can we write something to so? */
#define sowriteable(so) \
    (sbspace(&(so)->so_snd) >= (so)->so_snd.sb_lowat && \
        (((so)->so_state&SS_ISCONNECTED) || \
          ((so)->so_proto->pr_flags&PR_CONNREQUIRED)==0) || \
     ((so)->so_state & SS_CANTSENDMORE) || \
     (so)->so_error)

/* adjust counters in sb reflecting allocation of m */
#define sballoc(sb, m) { \
        (sb)->sb_cc += (m)->m_len; \
        (sb)->sb_mbcnt += (m)->m_inilen; \
}

/* adjust counters in sb reflecting freeing of m */
#define sbfree(sb, m) { \
        (sb)->sb_cc -= (m)->m_len; \
        (sb)->sb_mbcnt -= (m)->m_inilen; \
}

/*
 * Set lock on sockbuf sb; sleep if lock is already held.
 * Unless SB_NOINTR is set on sockbuf, sleep is interruptible.
 * Returns error without lock if sleep is interrupted.
 */
#define sblock(sb, wf) ((sb)->sb_flags & SB_LOCK ? \
		(((wf) == M_WAITOK) ? sb_lock(sb) : EWOULDBLOCK) : \
		(((sb)->sb_flags |= SB_LOCK), 0))

/* release lock on sockbuf sb */
#define sbunlock(sb) { \
        (sb)->sb_flags &= ~SB_LOCK; \
        if ((sb)->sb_flags & SB_WANT) { \
                (sb)->sb_flags &= ~SB_WANT; \
                wakeup((caddr_t)&(sb)->sb_flags); \
        } \
}

#ifdef __riscos
#define sorwakeup(so)   sowakeup((so), &(so)->so_rcv)
#else
#define	sorwakeup(so)	{ sowakeup((so), &(so)->so_rcv); \
			  if ((so)->so_upcall) \
			    (*((so)->so_upcall))((so), (so)->so_upcallarg, M_DONTWAIT); \
			}
#endif

#define sowwakeup(so)   sowakeup((so), &(so)->so_snd)

#ifdef KERNEL
extern u_long	sb_max;
extern so_gen_t so_gencnt;
/* to catch callers missing new second argument to sonewconn: */
#define	sonewconn(head, connstatus)	sonewconn1((head), (connstatus))
struct	socket *sonewconn1(struct socket *head, int connstatus);

/* strings for sleep message: */
extern	char netio[], netcon[], netcls[];

/*
 * File operations on sockets.
 */
#ifdef __riscos
int	soo_ioctl(struct socket *so, int com, caddr_t data);
#else
int	soo_read(struct file *fp, struct uio *uio, struct ucred *cred);
int	soo_write(struct file *fp, struct uio *uio, struct ucred *cred);
int	soo_ioctl(struct file *fp, int com, caddr_t data, struct proc *p);
int	soo_select(struct file *fp, int which, struct proc *p);
int 	soo_close(struct file *fp, struct proc *p));
int	soo_stat(struct socket *, struct stat *);
#endif

/*
 * From uipc_socket and friends
 */
void    soqinsque(struct socket *, struct socket *, int);
void    sowakeup(struct socket *, struct sockbuf *);
void    socantrcvmore(struct socket *);
void    socantsendmore(struct socket *);
void    sbrelease(struct sockbuf *);
void    sbappend(struct sockbuf *, struct mbuf *);
void    sbappendrecord(struct sockbuf *, struct mbuf *);
int	sbappendcontrol(struct sockbuf *, struct mbuf *, struct mbuf *);
int	sbappendaddr(struct sockbuf *, struct sockaddr *,
			  struct mbuf *, struct mbuf *);
struct mbuf *
	sbcreatecontrol(caddr_t p, int size, int type, int level);
void    sbdroprecord(struct sockbuf *);
void    sbcompress(struct sockbuf *, struct mbuf *, struct mbuf *);
void    sbflush(struct sockbuf *);
void	sbinsertoob(struct sockbuf *, struct mbuf *);
int     sbreserve(struct sockbuf *, u_long);
void	sbtoxsockbuf(struct sockbuf *sb, struct xsockbuf *xsb);
int     soreserve(struct socket *, u_long, u_long);
int     sb_lock(struct sockbuf *);
#ifdef __riscos
int     sbwait(struct sockbuf *, int);
#else
int     sbwait(struct sockbuf *);
#endif
void    sbdrop(struct sockbuf *, int);
void    sofree(struct socket *);
void    sorflush(struct socket *);
int	soqremque(struct socket *,int);
int     soabort(struct socket *);
void    soisdisconnected(struct socket *);
void    soisconnected(struct socket *);
void    soisconnecting(struct socket *);
void    soisdisconnecting(struct socket *);
void    sohasoutofband(struct socket *);
int     sodisconnect(struct socket *);
int	sosend(struct socket *, struct mbuf *, struct uio *,
		    struct mbuf *, struct mbuf *, int);
#ifdef __riscos
int	socreate(int, struct socket **, int, int);
struct socket *getsock(int);
int	sorxdirect(struct socket *, struct mbuf *, struct sockaddr *,
			u_long, char *, int, int);
#else
int	socreate(int, struct socket **, int, int, struct proc *);
int	getsock(struct filedesc *, int, struct file **);
#endif
int	sockargs(struct mbuf **, caddr_t, int, int);
int	sobind(struct socket *, struct mbuf *);
int	solisten(struct socket *, int);
int	soaccept(struct socket *, struct mbuf *);
int	soconnect(struct socket *, struct mbuf *);
int	soconnect2(struct socket *, struct socket *);
int	soclose(struct socket *);
int	soshutdown(struct socket *, int);
int	soreceive(struct socket *, struct mbuf **, struct uio *,
		       struct mbuf **, struct mbuf **, int *);
int	sosetopt(struct socket *, int, int, struct mbuf *);
int	sogetopt(struct socket *, int, int, struct mbuf **);
void	sotoxsocket(struct socket *so, struct xsocket *xso);
#endif

#endif
