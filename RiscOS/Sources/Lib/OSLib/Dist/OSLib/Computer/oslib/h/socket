#ifndef socket_H
#define socket_H

/* C header file for Socket
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:54 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 22 Aug 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Socket_Creat
#define Socket_Creat                            0x41200
#undef  XSocket_Creat
#define XSocket_Creat                           0x61200
#undef  Socket_Bind
#define Socket_Bind                             0x41201
#undef  XSocket_Bind
#define XSocket_Bind                            0x61201
#undef  Socket_Listen
#define Socket_Listen                           0x41202
#undef  XSocket_Listen
#define XSocket_Listen                          0x61202
#undef  Socket_Accept
#define Socket_Accept                           0x41203
#undef  XSocket_Accept
#define XSocket_Accept                          0x61203
#undef  Socket_Connect
#define Socket_Connect                          0x41204
#undef  XSocket_Connect
#define XSocket_Connect                         0x61204
#undef  Socket_Recv
#define Socket_Recv                             0x41205
#undef  XSocket_Recv
#define XSocket_Recv                            0x61205
#undef  Socket_Recvfrom
#define Socket_Recvfrom                         0x41206
#undef  XSocket_Recvfrom
#define XSocket_Recvfrom                        0x61206
#undef  Socket_Recvmsg
#define Socket_Recvmsg                          0x41207
#undef  XSocket_Recvmsg
#define XSocket_Recvmsg                         0x61207
#undef  Socket_Send
#define Socket_Send                             0x41208
#undef  XSocket_Send
#define XSocket_Send                            0x61208
#undef  Socket_Sendto
#define Socket_Sendto                           0x41209
#undef  XSocket_Sendto
#define XSocket_Sendto                          0x61209
#undef  Socket_Sendmsg
#define Socket_Sendmsg                          0x4120A
#undef  XSocket_Sendmsg
#define XSocket_Sendmsg                         0x6120A
#undef  Socket_Shutdown
#define Socket_Shutdown                         0x4120B
#undef  XSocket_Shutdown
#define XSocket_Shutdown                        0x6120B
#undef  Socket_Setsockopt
#define Socket_Setsockopt                       0x4120C
#undef  XSocket_Setsockopt
#define XSocket_Setsockopt                      0x6120C
#undef  Socket_Getsockopt
#define Socket_Getsockopt                       0x4120D
#undef  XSocket_Getsockopt
#define XSocket_Getsockopt                      0x6120D
#undef  Socket_Getpeername
#define Socket_Getpeername                      0x4120E
#undef  XSocket_Getpeername
#define XSocket_Getpeername                     0x6120E
#undef  Socket_Getsockname
#define Socket_Getsockname                      0x4120F
#undef  XSocket_Getsockname
#define XSocket_Getsockname                     0x6120F
#undef  Socket_Close
#define Socket_Close                            0x41210
#undef  XSocket_Close
#define XSocket_Close                           0x61210
#undef  Socket_Select
#define Socket_Select                           0x41211
#undef  XSocket_Select
#define XSocket_Select                          0x61211
#undef  Socket_Ioctl
#define Socket_Ioctl                            0x41212
#undef  XSocket_Ioctl
#define XSocket_Ioctl                           0x61212
#undef  Socket_Read
#define Socket_Read                             0x41213
#undef  XSocket_Read
#define XSocket_Read                            0x61213
#undef  Socket_Write
#define Socket_Write                            0x41214
#undef  XSocket_Write
#define XSocket_Write                           0x61214
#undef  Socket_Stat
#define Socket_Stat                             0x41215
#undef  XSocket_Stat
#define XSocket_Stat                            0x61215
#undef  Socket_Readv
#define Socket_Readv                            0x41216
#undef  XSocket_Readv
#define XSocket_Readv                           0x61216
#undef  Socket_Writev
#define Socket_Writev                           0x41217
#undef  XSocket_Writev
#define XSocket_Writev                          0x61217
#undef  Socket_Gettsize
#define Socket_Gettsize                         0x41218
#undef  XSocket_Gettsize
#define XSocket_Gettsize                        0x61218
#undef  Socket_Sendtosm
#define Socket_Sendtosm                         0x41219
#undef  XSocket_Sendtosm
#define XSocket_Sendtosm                        0x61219
#undef  Socket_Sysctl
#define Socket_Sysctl                           0x4121A
#undef  XSocket_Sysctl
#define XSocket_Sysctl                          0x6121A
#undef  Socket_Accept_1
#define Socket_Accept_1                         0x4121B
#undef  XSocket_Accept_1
#define XSocket_Accept_1                        0x6121B
#undef  Socket_Recvfrom_1
#define Socket_Recvfrom_1                       0x4121C
#undef  XSocket_Recvfrom_1
#define XSocket_Recvfrom_1                      0x6121C
#undef  Socket_Recvmsg_1
#define Socket_Recvmsg_1                        0x4121D
#undef  XSocket_Recvmsg_1
#define XSocket_Recvmsg_1                       0x6121D
#undef  Socket_Sendmsg_1
#define Socket_Sendmsg_1                        0x4121E
#undef  XSocket_Sendmsg_1
#define XSocket_Sendmsg_1                       0x6121E
#undef  Socket_Getpeername_1
#define Socket_Getpeername_1                    0x4121F
#undef  XSocket_Getpeername_1
#define XSocket_Getpeername_1                   0x6121F
#undef  Socket_Getsockname_1
#define Socket_Getsockname_1                    0x41220
#undef  XSocket_Getsockname_1
#define XSocket_Getsockname_1                   0x61220
#undef  Socket_InternalLookup
#define Socket_InternalLookup                   0x41221
#undef  XSocket_InternalLookup
#define XSocket_InternalLookup                  0x61221
#undef  Socket_Version
#define Socket_Version                          0x41222
#undef  XSocket_Version
#define XSocket_Version                         0x61222
#undef  Event_Internet
#define Event_Internet                          0x13
#undef  EventInternet_Async
#define EventInternet_Async                     0x1
#undef  EventInternet_Urgent
#define EventInternet_Urgent                    0x2
#undef  EventInternet_Broken
#define EventInternet_Broken                    0x3
#undef  EventInternet_RARPReply
#define EventInternet_RARPReply                 0x4

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct socket_sockaddr_in               socket_sockaddr_in;
typedef union  socket_sockaddr                  socket_sockaddr;
typedef struct socket_linger                    socket_linger;
typedef struct socket_timeval                   socket_timeval;
typedef struct socket_ifreq                     socket_ifreq;
typedef struct socket_ifconf                    socket_ifconf;
typedef struct socket_pwstruct                  socket_pwstruct;
typedef struct socket_s_                        *socket_s;
typedef struct socket_iovec                     socket_iovec;
typedef struct socket_msghdr                    socket_msghdr;

/********************
 * Type definitions *
 ********************/
typedef short socket_af;

typedef int socket_sock;

typedef int socket_ipproto;

typedef int socket_level;

struct socket_sockaddr_in
   {  socket_af af;
      short port;
      bits addr;
      byte data [8];
   };

union socket_sockaddr
   {  struct
      {  socket_af af;
         byte data [14];
      }
      sockaddr;
      socket_sockaddr_in sockaddr_in;
   };

struct socket_linger
   {  int onoff;
      int linger;
   };

struct socket_timeval
   {  int sec;
      int usec;
   };

typedef int socket_so;

typedef short socket_if_flags;

struct socket_ifreq
   {  char name [16];
      union
      {  socket_sockaddr sockaddr;
         socket_sockaddr broadaddr;
         socket_if_flags flags;
         int metric;
         byte *data;
         byte reserved [16];
      }
      u;
   };

struct socket_ifconf
   {  int len;
      union
      {  byte *buf;
         socket_ifreq *req;
      }
      u;
   };

struct socket_pwstruct
   {  bits *pollword;
      int bit_number;
   };

typedef bits socket_ioctl_no;
      /*Bits 0, ..., 7: operation; 8, ..., 15: s/i/f; 16, ..., 23: size; 24, ..., 31: calling convention*/

typedef bits socket_msg_flags;

struct socket_iovec
   {  byte *base;
      int len;
   };

struct socket_msghdr
   {  byte *name;
      int namelen;
      socket_iovec *iov;
      int iov_count;
      byte *accrights;
      int accrightslen;
   };

typedef int socket_shutdown_type;

typedef byte socket_fdset;

typedef int socket_event_type;

/************************
 * Constant definitions *
 ************************/
#define socket_AF_INET                          ((socket_af) 0x2u)
#define socket_SOCK_STREAM                      ((socket_sock) 0x1u)
      /*T C P*/
#define socket_SOCK_DGRAM                       ((socket_sock) 0x2u)
      /*U D P*/
#define socket_SOCK_RAW                         ((socket_sock) 0x3u)
      /*I P*/
#define socket_IPPROTO_IP                       ((socket_ipproto) 0x0u)
      /*Dummy for internet protocol*/
#define socket_IPPROTO_ICMP                     ((socket_ipproto) 0x1u)
      /*Control message protocol*/
#define socket_IPPROTO_TCP                      ((socket_ipproto) 0x6u)
      /*Transmission control protocol*/
#define socket_IPPROTO_UDP                      ((socket_ipproto) 0x11u)
      /*User datagram protocol*/
#define socket_IPPROTO_RAW                      ((socket_ipproto) 0xFFu)
      /*Raw internet protocol packet*/
#define socket_SOL_SOCKET                       ((socket_level) 0xFFFFu)
#define socket_EBADF                            0x9u
      /*Bad descriptor*/
#define socket_EAGAIN                           0xBu
      /*No more ports*/
#define socket_EFAULT                           0xEu
      /*Bad address*/
#define socket_EINVAL                           0x16u
      /*Invalid argument*/
#define socket_EWOULDBLOCK                      0x23u
      /*Operation would block*/
#define socket_EINPROGRESS                      0x24u
      /*Operation now in progress*/
#define socket_EALREADY                         0x25u
      /*Operation already in progress*/
#define socket_ENOTSOCK                         0x26u
      /*Socket operation on non-socket*/
#define socket_EDESTADDRREQ                     0x27u
      /*Destination address required*/
#define socket_EMSGSIZE                         0x28u
      /*Message too long*/
#define socket_EPROTOTYPE                       0x29u
      /*Protocol wrong type for socket*/
#define socket_ENOPROTOOPT                      0x2Au
      /*Protocol not available*/
#define socket_EPROTONOSUPPORT                  0x2Bu
      /*Protocol not supported*/
#define socket_ESOCKTNOSUPPORT                  0x2Cu
      /*Socket type not supported*/
#define socket_EOPNOTSUPP                       0x2Du
      /*Operation not supported on socket*/
#define socket_EPFNOSUPPORT                     0x2Eu
      /*Protocol family not supported*/
#define socket_EAFNOSUPPORT                     0x2Fu
      /*Address family not supported by protocol family*/
#define socket_EADDRINUSE                       0x30u
      /*Address already in use*/
#define socket_EADDRNOTAVAIL                    0x31u
      /*Can't assign requested address*/
#define socket_ENETDOWN                         0x32u
      /*Network is down*/
#define socket_ENETUNREACH                      0x33u
      /*Network is unreachable*/
#define socket_ENETRESET                        0x34u
      /*Network dropped connection on reset*/
#define socket_ECONNABORTED                     0x35u
      /*Software caused connection abort*/
#define socket_ECONNRESET                       0x36u
      /*Connection reset by peer*/
#define socket_ENOBUFS                          0x37u
      /*No buffer space available*/
#define socket_EISCONN                          0x38u
      /*Socket is already connected*/
#define socket_ENOTCONN                         0x39u
      /*Socket is not connected*/
#define socket_ESHUTDOWN                        0x3Au
      /*Can't send after socket shutdown*/
#define socket_ETOOMANYREFS                     0x3Bu
      /*Too many references: can't splice*/
#define socket_ETIMEDOUT                        0x3Cu
      /*Connection timed out*/
#define socket_ECONNREFUSED                     0x3Du
      /*Connection refused*/
#define socket_EHOSTDOWN                        0x40u
      /*Host is down*/
#define socket_EHOSTUNREACH                     0x41u
      /*No route to host*/
#define socket_SO_ACCEPTCONN                    ((socket_so) 0x2u)
#define socket_SO_REUSEADDR                     ((socket_so) 0x4u)
#define socket_SO_KEEPALIVE                     ((socket_so) 0x8u)
#define socket_SO_DONTROUTE                     ((socket_so) 0x10u)
#define socket_SO_BROADCAST                     ((socket_so) 0x20u)
#define socket_SO_USELOOPBACK                   ((socket_so) 0x40u)
#define socket_SO_LINGER                        ((socket_so) 0x80u)
#define socket_SO_OOBINLINE                     ((socket_so) 0x100u)
#define socket_SO_SNDBUF                        ((socket_so) 0x1001u)
#define socket_SO_RCVBUF                        ((socket_so) 0x1002u)
#define socket_SO_SNDLOWAT                      ((socket_so) 0x1003u)
#define socket_SO_RCVLOWAT                      ((socket_so) 0x1004u)
#define socket_SO_SNDTIMEO                      ((socket_so) 0x1005u)
#define socket_SO_RCVTIMEO                      ((socket_so) 0x1006u)
#define socket_SO_ERROR                         ((socket_so) 0x1007u)
#define socket_SO_TYPE                          ((socket_so) 0x1008u)
#define socket_IF_NAME_LIMIT                    16
#define socket_IF_UP                            ((socket_if_flags) 0x1u)
      /*Interface is up*/
#define socket_IF_BROADCAST                     ((socket_if_flags) 0x2u)
      /*Broadcast address valid*/
#define socket_IF_DEBUG                         ((socket_if_flags) 0x4u)
      /*Turn on debugging*/
#define socket_IF_LOOPBACK                      ((socket_if_flags) 0x8u)
      /*Is a loopback net*/
#define socket_IF_POINT_TO_POINT                ((socket_if_flags) 0x10u)
      /*Interface is point-to-point link*/
#define socket_IF_NO_TRAILERS                   ((socket_if_flags) 0x20u)
      /*Avoid use of trailers*/
#define socket_IF_RUNNING                       ((socket_if_flags) 0x40u)
      /*Resources allocated*/
#define socket_IF_NO_ARP                        ((socket_if_flags) 0x80u)
      /*No address resolution protocol*/
#define socket_SIOCSHIWAT                       ((socket_ioctl_no) 0x80047300u)
      /*set high watermark (Int)*/
#define socket_SIOCGHIWAT                       ((socket_ioctl_no) 0x40047301u)
      /*get high watermark (Int)*/
#define socket_SIOCSLOWAT                       ((socket_ioctl_no) 0x80047302u)
      /*set low watermark (Int)*/
#define socket_SIOCGLOWAT                       ((socket_ioctl_no) 0x40047303u)
      /*get low watermark (Int)*/
#define socket_SIOCATMARK                       ((socket_ioctl_no) 0x40047307u)
      /*at oob mark? (Int)*/
#define socket_SIOCSIFADDR                      ((socket_ioctl_no) 0x8020690Cu)
      /*set ifnet address (Socket_Ifreq)*/
#define socket_SIOCGIFADDR                      ((socket_ioctl_no) 0xC020690Du)
      /*get ifnet address (Socket_Ifreq)*/
#define socket_SIOCSIFDSTADDR                   ((socket_ioctl_no) 0x8020690Eu)
      /*set p-p address (Socket_Ifreq)*/
#define socket_SIOCGIFDSTADDR                   ((socket_ioctl_no) 0xC020690Fu)
      /*get p-p address (Socket_Ifreq)*/
#define socket_SIOCSIFFLAGS                     ((socket_ioctl_no) 0x80206910u)
      /*set ifnet flags (Socket_Ifreq)*/
#define socket_SIOCGIFFLAGS                     ((socket_ioctl_no) 0xC0206911u)
      /*get ifnet flags (Socket_Ifreq)*/
#define socket_SIOCGIFBRDADDR                   ((socket_ioctl_no) 0xC0206912u)
      /*get broadcast addr (Socket_Ifreq)*/
#define socket_SIOCSIFBRDADDR                   ((socket_ioctl_no) 0x80206913u)
      /*set broadcast addr (Socket_Ifreq)*/
#define socket_SIOCGIFCONF                      ((socket_ioctl_no) 0xC0086914u)
      /*get ifnet list (Socket_Ifconf)*/
#define socket_SIOCGIFNETMASK                   ((socket_ioctl_no) 0xC0206915u)
      /*get net addr mask (Socket_Ifreq)*/
#define socket_SIOCSIFNETMASK                   ((socket_ioctl_no) 0x80206916u)
      /*set net addr mask (Socket_Ifreq)*/
#define socket_SIOCGIFMETRIC                    ((socket_ioctl_no) 0xC0206917u)
      /*get IF metric (Socket_Ifreq)*/
#define socket_SIOCSIFMETRIC                    ((socket_ioctl_no) 0x80206918u)
      /*set IF metric (Socket_Ifreq)*/
#define socket_FIOSLEEPTW                       ((socket_ioctl_no) 0x80046679u)
      /*set/clear taskwindow sleep support (Int)*/
#define socket_FIONREAD                         ((socket_ioctl_no) 0x4004667Fu)
      /*get number of bytes to read (Int)*/
#define socket_FIONBIO                          ((socket_ioctl_no) 0x8004667Eu)
      /*set/clear non-blocking i/o (Int)*/
#define socket_FIOASYNC                         ((socket_ioctl_no) 0x8004667Du)
      /*set/clear async i/o (Int)*/
#define socket_FIOPOLLWORD                      ((socket_ioctl_no) 0x80086678u)
      /*set/clear pollword (Socket_Pwstruct) - RISC O S 4.32+*/
#define socket_MSG_OOB                          ((socket_msg_flags) 0x1u)
#define socket_MSG_PEEK                         ((socket_msg_flags) 0x2u)
#define socket_MSG_DONTROUTE                    ((socket_msg_flags) 0x4u)
#define socket_SHUTDOWN_RECV                    ((socket_shutdown_type) 0x0u)
#define socket_SHUTDOWN_SEND                    ((socket_shutdown_type) 0x1u)
#define socket_SHUTDOWN_ALL                     ((socket_shutdown_type) 0x2u)
#define socket_ASYNC_EVENT                      ((socket_event_type) 0x1u)
#define socket_URGENT_EVENT                     ((socket_event_type) 0x2u)
#define socket_BROKEN_EVENT                     ((socket_event_type) 0x3u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      socket_creat()
 *
 * Description:   Creates an endpoint for communication
 *
 * Input:         af - value of R0 on entry
 *                sock - value of R1 on entry
 *                proto - value of R2 on entry
 *
 * Output:        s - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41200.
 */

extern os_error *xsocket_creat (socket_af af,
      socket_sock sock,
      socket_ipproto proto,
      socket_s *s);
__swi (0x41200) socket_s socket_creat (socket_af af,
      socket_sock sock,
      socket_ipproto proto);

/* ------------------------------------------------------------------------
 * Function:      socket_bind()
 *
 * Description:   Binds a name to a socket
 *
 * Input:         s - value of R0 on entry
 *                sockaddr - value of R1 on entry
 *                namelen - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41201.
 */

extern os_error *xsocket_bind (socket_s s,
      socket_sockaddr const *sockaddr,
      int namelen);
__swi (0x41201) void socket_bind (socket_s s,
      socket_sockaddr const *sockaddr,
      int namelen);

/* ------------------------------------------------------------------------
 * Function:      socket_listen()
 *
 * Description:   Listens for connections on a socket
 *
 * Input:         s - value of R0 on entry
 *                backlog - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x41202.
 */

extern os_error *xsocket_listen (socket_s s,
      int backlog);
__swi (0x41202) void socket_listen (socket_s s,
      int backlog);

/* ------------------------------------------------------------------------
 * Function:      socket_accept()
 *
 * Description:   Accepts a connection on a socket
 *
 * Input:         s - value of R0 on entry
 *                sockaddr - value of R1 on entry
 *                addrlen - value of R2 on entry
 *
 * Output:        ns - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41203.
 */

extern os_error *xsocket_accept (socket_s s,
      socket_sockaddr *sockaddr,
      int *addrlen,
      socket_s *ns);
__swi (0x41203) socket_s socket_accept (socket_s s,
      socket_sockaddr *sockaddr,
      int *addrlen);

/* ------------------------------------------------------------------------
 * Function:      socket_connect()
 *
 * Description:   Initiates a connection on a socket
 *
 * Input:         s - value of R0 on entry
 *                sockaddr - value of R1 on entry
 *                namelen - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41204.
 */

extern os_error *xsocket_connect (socket_s s,
      socket_sockaddr *sockaddr,
      int namelen);
__swi (0x41204) void socket_connect (socket_s s,
      socket_sockaddr *sockaddr,
      int namelen);

/* ------------------------------------------------------------------------
 * Function:      socket_recv()
 *
 * Description:   Receives data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                buf - value of R1 on entry
 *                len - value of R2 on entry
 *                flags - value of R3 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41205.
 */

extern os_error *xsocket_recv (socket_s s,
      byte *buf,
      int len,
      socket_msg_flags flags,
      int *cc);
__swi (0x41205) int socket_recv (socket_s s,
      byte *buf,
      int len,
      socket_msg_flags flags);

/* ------------------------------------------------------------------------
 * Function:      socket_recvfrom()
 *
 * Description:   Receives data from a socket
 *
 * Input:         s - value of R0 on entry
 *                buf - value of R1 on entry
 *                len - value of R2 on entry
 *                flags - value of R3 on entry
 *                from - value of R4 on entry
 *                fromlen - value of R5 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41206.
 */

extern os_error *xsocket_recvfrom (socket_s s,
      byte *buf,
      int len,
      socket_msg_flags flags,
      socket_sockaddr *from,
      int *fromlen,
      int *cc);
extern int socket_recvfrom (socket_s s,
      byte *buf,
      int len,
      socket_msg_flags flags,
      socket_sockaddr *from,
      int *fromlen);

/* ------------------------------------------------------------------------
 * Function:      socket_recvmsg()
 *
 * Description:   Receives a message from a socket
 *
 * Input:         s - value of R0 on entry
 *                msg - value of R1 on entry
 *                flags - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41207.
 */

extern os_error *xsocket_recvmsg (socket_s s,
      socket_msghdr *msg,
      socket_msg_flags flags,
      int *cc);
__swi (0x41207) int socket_recvmsg (socket_s s,
      socket_msghdr *msg,
      socket_msg_flags flags);

/* ------------------------------------------------------------------------
 * Function:      socket_send()
 *
 * Description:   Sends data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                msg - value of R1 on entry
 *                len - value of R2 on entry
 *                flags - value of R3 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41208.
 */

extern os_error *xsocket_send (socket_s s,
      byte const *msg,
      int len,
      socket_msg_flags flags,
      int *cc);
__swi (0x41208) int socket_send (socket_s s,
      byte const *msg,
      int len,
      socket_msg_flags flags);

/* ------------------------------------------------------------------------
 * Function:      socket_sendto()
 *
 * Description:   Sends data from a socket
 *
 * Input:         s - value of R0 on entry
 *                msg - value of R1 on entry
 *                len - value of R2 on entry
 *                flags - value of R3 on entry
 *                to - value of R4 on entry
 *                tolen - value of R5 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41209.
 */

extern os_error *xsocket_sendto (socket_s s,
      byte const *msg,
      int len,
      socket_msg_flags flags,
      socket_sockaddr const *to,
      int tolen,
      int *cc);
extern int socket_sendto (socket_s s,
      byte const *msg,
      int len,
      socket_msg_flags flags,
      socket_sockaddr const *to,
      int tolen);

/* ------------------------------------------------------------------------
 * Function:      socket_sendmsg()
 *
 * Description:   Sends a message from a socket
 *
 * Input:         s - value of R0 on entry
 *                msg - value of R1 on entry
 *                flags - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4120A.
 */

extern os_error *xsocket_sendmsg (socket_s s,
      socket_msghdr const *msg,
      socket_msg_flags flags,
      int *cc);
__swi (0x4120A) int socket_sendmsg (socket_s s,
      socket_msghdr const *msg,
      socket_msg_flags flags);

/* ------------------------------------------------------------------------
 * Function:      socket_shutdown()
 *
 * Description:   Shuts down part of a full-duplex connection
 *
 * Input:         s - value of R0 on entry
 *                type - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4120B.
 */

extern os_error *xsocket_shutdown (socket_s s,
      socket_shutdown_type type);
__swi (0x4120B) void socket_shutdown (socket_s s,
      socket_shutdown_type type);

/* ------------------------------------------------------------------------
 * Function:      socket_setsockopt()
 *
 * Description:   Set options on sockets
 *
 * Input:         s - value of R0 on entry
 *                level - value of R1 on entry
 *                optname - value of R2 on entry
 *                optval - value of R3 on entry
 *                optlen - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4120C.
 */

extern os_error *xsocket_setsockopt (socket_s s,
      socket_level level,
      socket_so optname,
      byte const *optval,
      int optlen);
extern void socket_setsockopt (socket_s s,
      socket_level level,
      socket_so optname,
      byte const *optval,
      int optlen);

/* ------------------------------------------------------------------------
 * Function:      socket_getsockopt()
 *
 * Description:   Get options on sockets
 *
 * Input:         s - value of R0 on entry
 *                level - value of R1 on entry
 *                optname - value of R2 on entry
 *                optval - value of R3 on entry
 *                optlen - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4120D.
 */

extern os_error *xsocket_getsockopt (socket_s s,
      socket_level level,
      socket_so optname,
      byte *optval,
      int *optlen);
extern void socket_getsockopt (socket_s s,
      socket_level level,
      socket_so optname,
      byte *optval,
      int *optlen);

/* ------------------------------------------------------------------------
 * Function:      socket_getpeername()
 *
 * Description:   Gets name of connected peer
 *
 * Input:         s - value of R0 on entry
 *                sockaddr - value of R1 on entry
 *                namelen - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4120E.
 */

extern os_error *xsocket_getpeername (socket_s s,
      socket_sockaddr *sockaddr,
      int *namelen);
__swi (0x4120E) void socket_getpeername (socket_s s,
      socket_sockaddr *sockaddr,
      int *namelen);

/* ------------------------------------------------------------------------
 * Function:      socket_getsockname()
 *
 * Description:   Gets socket name
 *
 * Input:         s - value of R0 on entry
 *                sockaddr - value of R1 on entry
 *                namelen - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4120F.
 */

extern os_error *xsocket_getsockname (socket_s s,
      socket_sockaddr *sockaddr,
      int *namelen);
__swi (0x4120F) void socket_getsockname (socket_s s,
      socket_sockaddr *sockaddr,
      int *namelen);

/* ------------------------------------------------------------------------
 * Function:      socket_close()
 *
 * Description:   Closes an open socket
 *
 * Input:         s - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x41210.
 */

extern os_error *xsocket_close (socket_s s);
__swi (0x41210) void socket_close (socket_s s);

/* ------------------------------------------------------------------------
 * Function:      socket_select()
 *
 * Description:   Synchronous socket i/o multiplexing
 *
 * Input:         nfds - value of R0 on entry
 *                readfds - value of R1 on entry
 *                writefds - value of R2 on entry
 *                exceptfds - value of R3 on entry
 *                timeout - value of R4 on entry
 *
 * Output:        nfound - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41211.
 */

extern os_error *xsocket_select (int nfds,
      socket_fdset const *readfds,
      socket_fdset const *writefds,
      socket_fdset const *exceptfds,
      socket_timeval const *timeout,
      int *nfound);
extern int socket_select (int nfds,
      socket_fdset const *readfds,
      socket_fdset const *writefds,
      socket_fdset const *exceptfds,
      socket_timeval const *timeout);

/* ------------------------------------------------------------------------
 * Function:      socket_ioctl()
 *
 * Description:   Controls an open socket
 *
 * Input:         s - value of R0 on entry
 *                flags - value of R1 on entry
 *                argp - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41212.
 */

extern os_error *xsocket_ioctl (socket_s s,
      socket_ioctl_no flags,
      byte *argp);
__swi (0x41212) void socket_ioctl (socket_s s,
      socket_ioctl_no flags,
      byte *argp);

/* ------------------------------------------------------------------------
 * Function:      socket_read()
 *
 * Description:   Receives data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                buf - value of R1 on entry
 *                len - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41213.
 */

extern os_error *xsocket_read (socket_s s,
      byte *buf,
      int len,
      int *cc);
__swi (0x41213) int socket_read (socket_s s,
      byte *buf,
      int len);

/* ------------------------------------------------------------------------
 * Function:      socket_write()
 *
 * Description:   Sends data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                msg - value of R1 on entry
 *                len - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41214.
 */

extern os_error *xsocket_write (socket_s s,
      byte const *msg,
      int len,
      int *cc);
__swi (0x41214) int socket_write (socket_s s,
      byte const *msg,
      int len);

/* ------------------------------------------------------------------------
 * Function:      socket_readv()
 *
 * Description:   Receives data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                iov - value of R1 on entry
 *                iov_count - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41216.
 */

extern os_error *xsocket_readv (socket_s s,
      socket_iovec *iov,
      int iov_count,
      int *cc);
__swi (0x41216) int socket_readv (socket_s s,
      socket_iovec *iov,
      int iov_count);

/* ------------------------------------------------------------------------
 * Function:      socket_writev()
 *
 * Description:   Sends data from a connected socket
 *
 * Input:         s - value of R0 on entry
 *                iov - value of R1 on entry
 *                iov_count - value of R2 on entry
 *
 * Output:        cc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41217.
 */

extern os_error *xsocket_writev (socket_s s,
      socket_iovec const *iov,
      int iov_count,
      int *cc);
__swi (0x41217) int socket_writev (socket_s s,
      socket_iovec const *iov,
      int iov_count);

/* ------------------------------------------------------------------------
 * Function:      socket_gettsize()
 *
 * Description:   Gets the size of the socket table
 *
 * Output:        size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41218.
 */

extern os_error *xsocket_gettsize (int *size);
__swi (0x41218) int socket_gettsize (void);

/* ------------------------------------------------------------------------
 * Function:      socket_version()
 *
 * Description:   Reads the version of Internet that is present
 *
 * Output:        n - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41222.
 */

extern os_error *xsocket_version (int *n);
__swi (0x41222) int socket_version (void);

/* ------------------------------------------------------------------------
 * Function:      event_internet()
 *
 * Description:   Internet event
 *
 * Input:         event_type - value of R1 on entry
 *                s - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x13.
 */

extern os_error *xevent_internet (socket_event_type event_type,
      socket_s s);
extern void event_internet (socket_event_type event_type,
      socket_s s);

/* ------------------------------------------------------------------------
 * Function:      eventinternet_async()
 *
 * Description:   A socket has input waiting to be read
 *
 * Input:         s - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x13, R1 = 0x1.
 */

extern os_error *xeventinternet_async (socket_s s);
extern void eventinternet_async (socket_s s);

/* ------------------------------------------------------------------------
 * Function:      eventinternet_urgent()
 *
 * Description:   An urgent event has occurred
 *
 * Input:         s - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x13, R1 = 0x2.
 */

extern os_error *xeventinternet_urgent (socket_s s);
extern void eventinternet_urgent (socket_s s);

/* ------------------------------------------------------------------------
 * Function:      eventinternet_broken()
 *
 * Description:   A socket connection is broken
 *
 * Input:         s - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x13, R1 = 0x3.
 */

extern os_error *xeventinternet_broken (socket_s s);
extern void eventinternet_broken (socket_s s);

/* ------------------------------------------------------------------------
 * Function:      eventinternet_rarp_reply()
 *
 * Description:   A RevARP server has replied to a RevARP request (PRM
 *                5a-341)
 *
 * Input:         addr - IP address of replying server
 *                req_addr - IP address of requesting station
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x13, R1 = 0x4.
 */

extern os_error *xeventinternet_rarp_reply (bits addr,
      bits req_addr);
extern void eventinternet_rarp_reply (bits addr,
      bits req_addr);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
