/* @(#)clnt_udp.c       2.2 88/08/01 4.0 RPCSRC */
/*
 * Sun RPC is a product of Sun Microsystems, Inc. and is provided for
 * unrestricted use provided that this legend is included on all tape
 * media and as a part of the software program in whole or part.  Users
 * may copy or modify Sun RPC without charge, but are not authorized
 * to license or distribute it to anyone else except as part of a product or
 * program developed by the user.
 *
 * SUN RPC IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING THE
 * WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
 *
 * Sun RPC is provided with no support and without any obligation on the
 * part of Sun Microsystems, Inc. to assist in its use, correction,
 * modification or enhancement.
 *
 * SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
 * INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY SUN RPC
 * OR ANY PART THEREOF.
 *
 * In no event will Sun Microsystems, Inc. be liable for any lost revenue
 * or profits or other special, indirect and consequential damages, even if
 * Sun has been advised of the possibility of such damages.
 *
 * Sun Microsystems, Inc.
 * 2550 Garcia Avenue
 * Mountain View, California  94043
 */
#if !defined(lint) && defined(SCCSIDS)
static char sccsid[] = "@(#)clnt_udp.c 1.39 87/08/11 Copyr 1984 Sun Micro";
#endif

/*
 * clnt_udp.c, Implements a UDP/IP based, client side RPC.
 *
 * Copyright (C) 1984, Sun Microsystems, Inc.
 */

/* Acorn modification history:

Date	    Who		Comments
------------------------------------------------------------------------------
04-Mar-97   jmf		Treat ENOBUFS from sendto() as transient (like EIO).

*/

#include <stdio.h>
#include <rpc/rpc.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netdb.h>
#ifdef RISCOS
#include <sys/errno.h>
#else
#include <errno.h>
#endif
#include <rpc/pmap_clnt.h>
#include "AsmUtils/callbacks.h"

extern int errno;

/*
 * UDP bases client side rpc operations
 */
static enum clnt_stat   clntudp_call();
static void             clntudp_abort();
static void             clntudp_geterr();
static bool_t           clntudp_freeres();
static bool_t           clntudp_control();
static void             clntudp_destroy();

static struct clnt_ops udp_ops = {
        clntudp_call,
        clntudp_abort,
        clntudp_geterr,
        clntudp_freeres,
        clntudp_destroy,
        clntudp_control
};

/*
 * Private data kept per client handle
 */
struct cu_data {
        int                cu_sock;
        bool_t             cu_closeit;
        struct sockaddr_in cu_raddr;
        int                cu_rlen;
        struct timeval     cu_wait;
        struct timeval     cu_total;
        struct rpc_err     cu_error;
        XDR                cu_outxdrs;
        u_int              cu_xdrpos;
        u_int              cu_sendsz;
        char               *cu_outbuf;
        u_int              cu_recvsz;
        char               cu_inbuf[1];
};

/*
 * Create a UDP based client handle.
 * If *sockp<0, *sockp is set to a newly created UPD socket.
 * If raddr->sin_port is 0 a binder on the remote machine
 * is consulted for the correct port number.
 * NB: It is the clients responsibility to close *sockp.
 * NB: The rpch->cl_auth is initialized to null authentication.
 *     Caller may wish to set this something more useful.
 *
 * wait is the amount of time used between retransmitting a call if
 * no response has been heard;  retransmition occurs until the actual
 * rpc call times out.
 *
 * sendsz and recvsz are the maximum allowable packet sizes that can be
 * sent and received.
 */
CLIENT *
clntudp_bufcreate(raddr, program, version, wait, sockp, sendsz, recvsz)
        struct sockaddr_in *raddr;
        u_long program;
        u_long version;
        struct timeval wait;
        register int *sockp;
        u_int sendsz;
        u_int recvsz;
{
        CLIENT *cl;
        register struct cu_data *cu;
        struct timeval now;
        struct rpc_msg call_msg;

        cl = (CLIENT *)mem_alloc(sizeof(CLIENT));
        if (cl == NULL) {
#ifndef RISCOS
                (void) fprintf(stderr, "clntudp_create: out of memory\n");
#endif
                rpc_createerr.cf_stat = RPC_SYSTEMERROR;
                rpc_createerr.cf_error.re_errno = errno;
                goto fooy;
        }
        sendsz = ((sendsz + 3) / 4) * 4;
        recvsz = ((recvsz + 3) / 4) * 4;
        cu = (struct cu_data *)mem_alloc(sizeof(*cu) + sendsz + recvsz);
        if (cu == NULL) {
#ifndef RISCOS
                (void) fprintf(stderr, "clntudp_create: out of memory\n");
#endif
                rpc_createerr.cf_stat = RPC_SYSTEMERROR;
                rpc_createerr.cf_error.re_errno = errno;
                goto fooy;
        }
        cu->cu_outbuf = &cu->cu_inbuf[recvsz];

        (void)gettimeofday(&now, (struct timezone *)0);
        if (raddr->sin_port == 0) {
                u_short port;
                if ((port =
                    pmap_getport(raddr, program, version, IPPROTO_UDP)) == 0) {
                        goto fooy;
                }
                raddr->sin_port = htons(port);
        }
        cl->cl_ops = &udp_ops;
        cl->cl_private = (caddr_t)cu;
        cu->cu_raddr = *raddr;
        cu->cu_rlen = sizeof (cu->cu_raddr);
        cu->cu_wait = wait;
        cu->cu_total.tv_sec = -1;
        cu->cu_total.tv_usec = -1;
        cu->cu_sendsz = sendsz;
        cu->cu_recvsz = recvsz;
        call_msg.rm_xid = getpid() ^ now.tv_sec ^ now.tv_usec;
        call_msg.rm_direction = CALL;
        call_msg.rm_call.cb_rpcvers = RPC_MSG_VERSION;
        call_msg.rm_call.cb_prog = program;
        call_msg.rm_call.cb_vers = version;
        xdrmem_create(&(cu->cu_outxdrs), cu->cu_outbuf,
            sendsz, XDR_ENCODE);
        if (! xdr_callhdr(&(cu->cu_outxdrs), &call_msg)) {
                goto fooy;
        }
        cu->cu_xdrpos = XDR_GETPOS(&(cu->cu_outxdrs));
        if (*sockp < 0) {
                int dontblock = 1;

                *sockp = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
                if (*sockp < 0) {
                        rpc_createerr.cf_stat = RPC_SYSTEMERROR;
                        rpc_createerr.cf_error.re_errno = errno;
                        goto fooy;
                }
                /* attempt to bind to prov port */
                (void)bindresvport(*sockp, (struct sockaddr_in *)0);
                /* the sockets rpc controls are non-blocking */
                (void)ioctl(*sockp, FIONBIO, (char *) &dontblock);
                cu->cu_closeit = TRUE;
        } else {
                cu->cu_closeit = FALSE;
        }
        cu->cu_sock = *sockp;
        cl->cl_auth = authnone_create();
        return (cl);
fooy:
        if (cu)
                mem_free((caddr_t)cu, sizeof(*cu) + sendsz + recvsz);
        if (cl)
                mem_free((caddr_t)cl, sizeof(CLIENT));
        return ((CLIENT *)NULL);
}

static void addtime( res, src1, src2 )
        struct timeval *res;
        struct timeval *src1;
        struct timeval *src2;
{
        res->tv_sec = src1->tv_sec + src2->tv_sec;
        res->tv_usec = src1->tv_usec + src2->tv_usec;
        while ( res->tv_usec >= 1000000 )
        {
                res->tv_sec++;
                res->tv_usec -= 1000000;
        }
}

static void subtime( res, src1, src2 )
        struct timeval *res;
        struct timeval *src1;
        struct timeval *src2;
{
        res->tv_sec = src1->tv_sec - src2->tv_sec;
        res->tv_usec = src1->tv_usec - src2->tv_usec;
        while ( res->tv_usec < 0 )
        {
                res->tv_sec--;
                res->tv_usec += 1000000;
        }
}

CLIENT *
clntudp_create(raddr, program, version, wait, sockp)
        struct sockaddr_in *raddr;
        u_long program;
        u_long version;
        struct timeval wait;
        register int *sockp;
{

        return(clntudp_bufcreate(raddr, program, version, wait, sockp,
            UDPMSGSIZE, UDPMSGSIZE));
}

static enum clnt_stat
clntudp_call(cl, proc, xargs, argsp, xresults, resultsp, utimeout)
        register CLIENT *cl;            /* client handle */
        u_long          proc;           /* procedure number */
        xdrproc_t       xargs;          /* xdr routine for args */
        caddr_t         argsp;          /* pointer to args */
        xdrproc_t       xresults;       /* xdr routine for results */
        caddr_t         resultsp;       /* pointer to results */
        struct timeval  utimeout;       /* seconds to wait before giving up */
{
        struct cu_data *cu = (struct cu_data *)cl->cl_private;
        XDR *xdrs;
        int outlen;
        int inlen;
        int fromlen;
#ifdef FD_SETSIZE
        fd_set readfds;
        fd_set mask;
#else
        int readfds;
        register int mask;
#endif /* def FD_SETSIZE */
        struct sockaddr_in from;
        struct rpc_msg reply_msg;
        XDR reply_xdrs;
        bool_t ok;
        int nrefreshes = 2;     /* number of times to refresh cred */
        struct timeval timenow;
        struct timeval timeretry;
        struct timeval timeout;

        if (cu->cu_total.tv_usec == -1)
        {
                timeout = utimeout;     /* use supplied timeout */
        }
        else
        {
                timeout = cu->cu_total; /* use default timeout */
        }

        gettimeofday( &timenow, NULL );
        addtime( &timeout, &timenow, &timeout );

call_again:
        xdrs = &(cu->cu_outxdrs);
        xdrs->x_op = XDR_ENCODE;
        XDR_SETPOS(xdrs, cu->cu_xdrpos);
        /*
                the transaction is the first thing in the out buffer
        */
        (*(u_short *)(cu->cu_outbuf))++;
        if ((! XDR_PUTLONG(xdrs, (long *)&proc)) ||
            (! AUTH_MARSHALL(cl->cl_auth, xdrs)) ||
            (! (*xargs)(xdrs, argsp)))
        {
                return (cu->cu_error.re_status = RPC_CANTENCODEARGS);
        }
        outlen = (int)XDR_GETPOS(xdrs);

send_again:
        if (sendto(cu->cu_sock, cu->cu_outbuf, outlen, 0,
            (struct sockaddr *)&(cu->cu_raddr), cu->cu_rlen)
            != outlen && errno != EIO && errno != ENOBUFS)
        {
                cu->cu_error.re_errno = errno;
                return (cu->cu_error.re_status = RPC_CANTSEND);
        }

        /*
         * Hack to provide rpc-based message passing
         */
        if (timeout.tv_sec == 0 && timeout.tv_usec == 0)
        {
                return (cu->cu_error.re_status = RPC_TIMEDOUT);
        }
        /*
         * sub-optimal code appears here because we have
         * some clock time to spare while the packets are in flight.
         * (We assume that this is actually only executed once.)
         */
        reply_msg.acpted_rply.ar_verf = _null_auth;
        reply_msg.acpted_rply.ar_results.where = resultsp;
        reply_msg.acpted_rply.ar_results.proc = xresults;
#ifdef FD_SETSIZE
        FD_ZERO(&mask);
        FD_SET(cu->cu_sock, &mask);
#else
        mask = 1 << cu->cu_sock;
#endif /* def FD_SETSIZE */

        gettimeofday( &timenow, NULL );
        addtime( &timeretry, &timenow, &cu->cu_wait );

        for (;;)
        {
                readfds = mask;
                gettimeofday( &timenow, NULL );
                subtime( &timenow, &timeretry, &timenow );
                if ( timenow.tv_sec < 0 )
                {
                        timenow.tv_sec = 0;
                        timenow.tv_usec = 0;
                }

                switch (select(_rpc_dtablesize(), &readfds, (int *)NULL,
                               (int *)NULL, &timenow))
                {
                case 0:
                        gettimeofday( &timenow, NULL );
                        if ( timercmp( &timenow, &timeretry, < ) )
                                continue;
                        else if ( timercmp( &timenow, &timeout, < ) )
                                goto send_again;
                        else
                                return (cu->cu_error.re_status = RPC_TIMEDOUT);

                case -1:
#ifndef RISCOS
                        if (errno == EINTR)
                                continue;
#endif
                        cu->cu_error.re_errno = errno;
                        return (cu->cu_error.re_status = RPC_CANTRECV);
                }
                do {
                        fromlen = sizeof(struct sockaddr);
                        inlen = recvfrom(cu->cu_sock, cu->cu_inbuf,
                                (int) cu->cu_recvsz, 0,
                                (struct sockaddr *)&from, &fromlen);
                } while
#ifdef RISCOS
          /* RISC OS uses EINTR to mean escape was pressed - so DO NOT simply retry! */
                    (0);
#else
                    (data->inlen < 0 && errno == EINTR);
#endif
                if (inlen < 0)
                {
                        if (errno == EWOULDBLOCK)
                                continue;
                        cu->cu_error.re_errno = errno;
                        return (cu->cu_error.re_status = RPC_CANTRECV);
                }
                if (inlen < sizeof(u_long))
                        continue;
                /*
                        see if reply transaction id matches sent id
                */
                if (*((u_long *)(cu->cu_inbuf)) != *((u_long *)(cu->cu_outbuf)))
                        continue;
                /*
                        we now assume we have the proper reply
                */
                break;
        }

        /*
                now decode and validate the response
        */
        xdrmem_create(&reply_xdrs, cu->cu_inbuf, (u_int)inlen, XDR_DECODE);
        ok = xdr_replymsg(&reply_xdrs, &reply_msg);
        /* XDR_DESTROY(&reply_xdrs);  save a few cycles on noop destroy */
        if (ok)
        {
                _seterr_reply(&reply_msg, &(cu->cu_error));
                if (cu->cu_error.re_status == RPC_SUCCESS)
                {
                        if (! AUTH_VALIDATE(cl->cl_auth,
                                &reply_msg.acpted_rply.ar_verf))
                        {
                                cu->cu_error.re_status = RPC_AUTHERROR;
                                cu->cu_error.re_why = AUTH_INVALIDRESP;
                        }
                        if (reply_msg.acpted_rply.ar_verf.oa_base != NULL)
                        {
                                xdrs->x_op = XDR_FREE;
                                (void)xdr_opaque_auth(xdrs,
                                    &(reply_msg.acpted_rply.ar_verf));
                        }
                }  /* end successful completion */
                else
                {
                        /* maybe our credentials need to be refreshed ... */
                        if (nrefreshes > 0 && AUTH_REFRESH(cl->cl_auth))
                        {
                                nrefreshes--;
                                goto call_again;
                        }
                }  /* end of unsuccessful completion */
        }  /* end of valid reply message */
        else
        {
                cu->cu_error.re_status = RPC_CANTDECODERES;
        }

        return (cu->cu_error.re_status);
}

static void
clntudp_geterr(cl, errp)
        CLIENT *cl;
        struct rpc_err *errp;
{
        register struct cu_data *cu = (struct cu_data *)cl->cl_private;

        *errp = cu->cu_error;
}


static bool_t
clntudp_freeres(cl, xdr_res, res_ptr)
        CLIENT *cl;
        xdrproc_t xdr_res;
        caddr_t res_ptr;
{
        register struct cu_data *cu = (struct cu_data *)cl->cl_private;
        register XDR *xdrs = &(cu->cu_outxdrs);

        xdrs->x_op = XDR_FREE;
        return ((*xdr_res)(xdrs, res_ptr));
}

static void
clntudp_abort(/*h*/)
        /*CLIENT *h;*/
{
}

static bool_t
clntudp_control(cl, request, info)
        CLIENT *cl;
        int request;
        char *info;
{
        register struct cu_data *cu = (struct cu_data *)cl->cl_private;

        switch (request) {
        case CLSET_TIMEOUT:
                cu->cu_total = *(struct timeval *)info;
                break;
        case CLGET_TIMEOUT:
                *(struct timeval *)info = cu->cu_total;
                break;
        case CLSET_RETRY_TIMEOUT:
                cu->cu_wait = *(struct timeval *)info;
                break;
        case CLGET_RETRY_TIMEOUT:
                *(struct timeval *)info = cu->cu_wait;
                break;
        case CLGET_SERVER_ADDR:
                *(struct sockaddr_in *)info = cu->cu_raddr;
                break;
        default:
                return (FALSE);
        }
        return (TRUE);
}

static void
clntudp_destroy(cl)
        CLIENT *cl;
{
        register struct cu_data *cu = (struct cu_data *)cl->cl_private;

        if (cu->cu_closeit) {
                (void)close(cu->cu_sock);
        }
        XDR_DESTROY(&(cu->cu_outxdrs));
        mem_free((caddr_t)cu, (sizeof(*cu) + cu->cu_sendsz + cu->cu_recvsz));
        mem_free((caddr_t)cl, sizeof(CLIENT));
}

/* #include <time.h> */

#define dbtime(t) /* these were used for timing */
#define starttime(t)
#define endtime(t)
#define db(arg)

typedef enum { op_callagain, op_sendagain, op_wait, op_processpacket, op_complete, op_error } co_op;

/* arguments and other private data for coroutines */
struct clntudp_codata {
        CLIENT          *cl;            /* client handle */
        u_long          proc;           /* procedure number */
        xdrproc_t       xargs;          /* xdr routine for args */
        caddr_t         argsp;          /* pointer to args */
        xdrproc_t       xresults;       /* xdr routine for results */
        caddr_t         resultsp;       /* pointer to results */
        struct timeval  utimeout;       /* seconds to wait before giving up */
        int outlen;
        int inlen;
        int fromlen;
#ifdef FD_SETSIZE
        fd_set readfds;
        fd_set mask;
#else
        int readfds;
        register int mask;
#endif /* def FD_SETSIZE */
        struct sockaddr_in from;
        struct rpc_msg reply_msg;
        int nrefreshes;     /* number of times to refresh cred */
        struct timeval timenow;
        struct timeval timeretry;
        struct timeval timeout;
        co_op  next_op;                 /* the next operation to call for this coroutine */
        };

static enum clnt_stat cocallsetup(cl, proc, xargs, argsp, xresults, resultsp, utimeout,
                                  data)
        CLIENT          *cl;            /* client handle */
        u_long          proc;           /* procedure number */
        xdrproc_t       xargs;          /* xdr routine for args */
        caddr_t         argsp;          /* pointer to args */
        xdrproc_t       xresults;       /* xdr routine for results */
        caddr_t         resultsp;       /* pointer to results */
        struct timeval  utimeout;       /* seconds to wait before giving up */
        clntudp_codatap   *data;
/* setup arguments and data for a coroutine */
{
        struct cu_data *cu = (struct cu_data *)cl->cl_private;
starttime(t);
        *data = (clntudp_codatap)malloc(sizeof(struct clntudp_codata));
db(("cocallsetup "));
        if ((*data) == NULL)
        {
                return (cu->cu_error.re_status = RPC_SYSTEMERROR);
        }
        (*data)->cl = cl;
        (*data)->proc = proc;           /* procedure number */
        (*data)->xargs = xargs;          /* xdr routine for args */
        (*data)->argsp = argsp;          /* pointer to args */
        (*data)->xresults = xresults;       /* xdr routine for results */
        (*data)->resultsp = resultsp;       /* pointer to results */
        (*data)->utimeout = utimeout;
        (*data)->nrefreshes = 2;

        if (cu->cu_total.tv_usec == -1)
        {
                (*data)->timeout = utimeout;     /* use supplied timeout */
        }
        else
        {
                (*data)->timeout = cu->cu_total; /* use default timeout */
        }
        (*data)->nrefreshes = 2;
        gettimeofday(&(*data)->timenow, NULL);
        addtime( &((*data)->timeout), &((*data)->timenow), &((*data)->timeout) );
        (*data)->next_op = op_callagain;
endtime(t);
        return (cu->cu_error.re_status = RPC_SUCCESS);
}

static enum clnt_stat
co_callagain(data)
        clntudp_codatap    data;
{
        struct cu_data *cu = (struct cu_data *)data->cl->cl_private;
        XDR *xdrs = &(cu->cu_outxdrs);
starttime(t);
db(("co_callagain "));
        xdrs->x_op = XDR_ENCODE;
        XDR_SETPOS(xdrs, cu->cu_xdrpos);
        /*
                the transaction is the first thing in the out buffer
        */
        (*(u_short *)(cu->cu_outbuf))++;
        if ((! XDR_PUTLONG(xdrs, (long *)&data->proc)) ||
            (! AUTH_MARSHALL(data->cl->cl_auth, xdrs)) ||
            (! (*data->xargs)(xdrs, data->argsp)))
        {
                data->next_op = op_error;
                return (cu->cu_error.re_status = RPC_CANTENCODEARGS);
        }
        data->outlen = (int)XDR_GETPOS(xdrs);
        data->next_op = op_sendagain;
endtime(t);
        return (cu->cu_error.re_status);
}

static enum clnt_stat
co_sendagain(data)
        clntudp_codatap    data;
{
        struct cu_data *cu = (struct cu_data *)data->cl->cl_private;
starttime(t);
db(("co_sendagain "));

        if (sendto(cu->cu_sock, cu->cu_outbuf, data->outlen, 0,
            (struct sockaddr *)&(cu->cu_raddr), cu->cu_rlen)
            != data->outlen && errno != EIO && errno != ENOBUFS)
        {
                data->next_op = op_error;
                cu->cu_error.re_errno = errno;
                return (cu->cu_error.re_status = RPC_CANTSEND);
        }

        /*
         * sub-optimal code appears here because we have
         * some clock time to spare while the packets are in flight.
         * (We assume that this is actually only executed once.)
         */
        data->reply_msg.acpted_rply.ar_verf = _null_auth;
        data->reply_msg.acpted_rply.ar_results.where = data->resultsp;
        data->reply_msg.acpted_rply.ar_results.proc = data->xresults;
#ifdef FD_SETSIZE
        FD_ZERO(&data->mask);
        FD_SET(cu->cu_sock, &data->mask);
#else
        data->mask = 1 << cu->cu_sock;
#endif /* def FD_SETSIZE */
        gettimeofday(&data->timenow, NULL);
        addtime( &data->timeretry, &data->timenow, &cu->cu_wait );
        data->next_op = op_wait;
endtime(t);
        return (cu->cu_error.re_status);
}

static enum clnt_stat
co_wait(data)
        clntudp_codatap    data;
/* look for arrived packet */
{
        struct timeval timeout;
        struct cu_data *cu = (struct cu_data *)data->cl->cl_private;
starttime(t);
db(("co_wait "));

        data->readfds = data->mask;
        /* set zero timeout for a simple poll */
        timeout.tv_sec = 0;
        timeout.tv_usec = 0;
        usermode_donothing();  /* bodge to ensure that the callback happens; else I never see the data */

        switch (select(_rpc_dtablesize(), &data->readfds, (int *)NULL,
                       (int *)NULL, &timeout))
        {
        case 0:
                gettimeofday( &data->timenow, NULL);
                if ( timercmp( &data->timenow, &data->timeretry, < ) )
                {
                        data->next_op = op_wait;  /* call this function again */
endtime(t);
                        return (cu->cu_error.re_status);
                }
                else if ( timercmp( &data->timenow, &data->timeout, < ) )
                {
                        data->next_op = op_sendagain;
endtime(t);
                        return (cu->cu_error.re_status);
                }
                else
                {
                        data->next_op = op_error;
endtime(t);
                        return (cu->cu_error.re_status = RPC_TIMEDOUT);
                }

        case -1:
                if (errno == EINTR)
                {
#ifdef RISCOS
                        data->next_op = op_error;
endtime(t);
                        return (cu->cu_error.re_status = RPC_SYSTEMERROR);
#else
                        data->next_op = op_wait;  /* call this function again */
#endif
endtime(t);
                        return (cu->cu_error.re_status);
                }
                data->next_op = op_error;
                cu->cu_error.re_errno = errno;
endtime(t);
                return (cu->cu_error.re_status = RPC_CANTRECV);
        }
        do {
                data->fromlen = sizeof(struct sockaddr);
                data->inlen = recvfrom(cu->cu_sock, cu->cu_inbuf,
                        (int) cu->cu_recvsz, 0,
                        (struct sockaddr *)&data->from, &data->fromlen);
        } while
#ifdef RISCOS
          /* RISC OS uses EINTR to mean escape was pressed - so DO NOT simply retry! */
          (0);
#else
          (data->inlen < 0 && errno == EINTR);
#endif
        if (data->inlen < 0)
        {
                if (errno == EWOULDBLOCK)
                {
                        data->next_op = op_wait;  /* call this function again */
endtime(t);
                        return (cu->cu_error.re_status);
                }
                data->next_op = op_error;
                cu->cu_error.re_errno = errno;
endtime(t);
                return (cu->cu_error.re_status = RPC_CANTRECV);
        }
        if (data->inlen < sizeof(u_long))
        {
                data->next_op = op_wait;  /* call this function again */
endtime(t);
                return (cu->cu_error.re_status);
        }
        /*
                see if reply transaction id matches sent id
        */
        if (*((u_long *)(cu->cu_inbuf)) != *((u_long *)(cu->cu_outbuf)))
        {
                data->next_op = op_wait;  /* call this function again */
endtime(t);
                return (cu->cu_error.re_status);
        }
        /*
                we now assume we have the proper reply
        */
        data->next_op = op_processpacket;
endtime(t);
        return (cu->cu_error.re_status);
}

static enum clnt_stat
co_processpacket(data)
        clntudp_codatap    data;
{ /* process a returned packet */

        struct cu_data *cu = (struct cu_data *)data->cl->cl_private;
        XDR reply_xdrs;
        XDR *xdrs = &(cu->cu_outxdrs);
        bool_t ok;
starttime(t);
db(("co_processpacket "));
        /*
                now decode and validate the response
        */
        xdrmem_create(&reply_xdrs, cu->cu_inbuf, (u_int)data->inlen, XDR_DECODE);
        ok = xdr_replymsg(&reply_xdrs, &data->reply_msg);
        /* XDR_DESTROY(&reply_xdrs);  save a few cycles on noop destroy */
        if (ok)
        {
                _seterr_reply(&data->reply_msg, &(cu->cu_error));
                if (cu->cu_error.re_status == RPC_SUCCESS)
                {
                        if (! AUTH_VALIDATE(data->cl->cl_auth,
                                &data->reply_msg.acpted_rply.ar_verf))
                        {
                                cu->cu_error.re_status = RPC_AUTHERROR;
                                cu->cu_error.re_why = AUTH_INVALIDRESP;
                        }
                        if (data->reply_msg.acpted_rply.ar_verf.oa_base != NULL)
                        {
                                xdrs->x_op = XDR_FREE;
                                (void)xdr_opaque_auth(xdrs,
                                    &(data->reply_msg.acpted_rply.ar_verf));
                        }
                }  /* end successful completion */
                else
                {
                        /* maybe our credentials need to be refreshed ... */
                        if (data->nrefreshes > 0 && AUTH_REFRESH(data->cl->cl_auth))
                        {
                                data->nrefreshes--;
                                data->next_op = op_callagain;
endtime(t);
                                return (cu->cu_error.re_status);
                        }
                }  /* end of unsuccessful completion */
        }  /* end of valid reply message */
        else
        {
                cu->cu_error.re_status = RPC_CANTDECODERES;
        }

        data->next_op = op_complete;
endtime(t);
        return (cu->cu_error.re_status);
}

static void
co_cleanup(data)
        clntudp_codatap *data;
/* clean up the data */
{
        if (*data != NULL)
        {
                free(*data);
                *data = NULL;
        }
}

static enum clnt_stat schedule(data)
clntudp_codatap data;
{
db(("schedule %d\n", data->next_op));
        switch (data->next_op)
        {
                case op_callagain:      return co_callagain(data); break;

                case op_sendagain:      return co_sendagain(data); break;

                case op_wait:           return co_wait(data);  break;

                case op_processpacket:  return co_processpacket(data); break;

                case op_complete:       return RPC_SUCCESS; break;

                default: break; /* should never arrive here since errors are handled by the caller */
        }
        return RPC_SUCCESS;
}

/*
        Initiate a udp packet transfer, return RPC_BUSY when it is stalled
        awaiting a reply.
        On exit [*data] is set to point to the private data for this
        transfer.
*/
enum clnt_stat clntudp_starttransfer(cl, proc, xargs, argsp, xresults, resultsp, utimeout,
                                     data)
        CLIENT          *cl;            /* client handle */
        u_long          proc;           /* procedure number */
        xdrproc_t       xargs;          /* xdr routine for args */
        caddr_t         argsp;          /* pointer to args */
        xdrproc_t       xresults;       /* xdr routine for results */
        caddr_t         resultsp;       /* pointer to results */
        struct timeval  utimeout;       /* seconds to wait before giving up */
        clntudp_codatap   *data;
{
        enum clnt_stat res;
db(("clntudp_starttransfer\n"));
        res = cocallsetup(cl, proc, xargs, argsp, xresults, resultsp, utimeout,
                          data);
        if ( res != RPC_SUCCESS ) /* only possible error from this is failure to allocate space for data */
                return res;

        /* assert(data != NULL); */

        while ((*data)->next_op != op_wait)
        {
                res = schedule(*data);
db(("next op = %d (=%d?), res = %d\n", (*data)->next_op, op_wait, res));
                if (res != RPC_SUCCESS)
                        return res;
        }

        /* assert(*data->next_op == op_wait); */

        return RPC_BUSY; /* special return value to indicate we are awaiting a reply from the server */
}

/*
        Get the status of the pending transfer. Return RPC_SUCCESS when it is
        finished, or RPC_BUSY when it is stalled awaiting a reply.
        [data] points to the data returned from clntudp_starttransfer().
        It is deallocated when RPC_SUCCESS or an error is returned.
*/
enum clnt_stat clntudp_polltransfer(data)
clntudp_codatap data;
{
        enum clnt_stat res;
db(("clntudp_polltransfer\n"));

        for ( ; ; )
        {  /* schedule until error or busy or complete */
                res = schedule(data);
                if (res != RPC_SUCCESS)
                        return res;      /* return error */
                else if (data->next_op == op_wait)
                        return RPC_BUSY; /* special return value to indicate we are awaiting a reply from the server */

                else if (data->next_op == op_complete)
                {
                        co_cleanup(&data);
                        return RPC_SUCCESS;
                }
        }
        /* assert(false); */
        return res;
}
