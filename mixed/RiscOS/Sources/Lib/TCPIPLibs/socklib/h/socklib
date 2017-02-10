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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the Internet library for writing network applications in C. It may be    *
 * used freely in the creation of programs for Archimedes or Risc PC. It    *
 * should be used with Acorn's C Compiler Release 5 or later.               *
 *                                                                          *
 *                                                                          *
 * Copyright © Acorn Computers Ltd, 1996                                    *
 *                                                                          *
 ***************************************************************************/

/*
 * File:    socklib.h
 * Purpose: Socket library calls
 * Author:  K Bracey
 * History: 26-Nov-96: KJB: Internet 5 release
 */

#include "sys/types.h"
#include "sys/socket.h"
#include "sys/stat.h"
#include "sys/time.h"
#include "sys/uio.h"

#include "kernel.h"

/*
 * variable declarations
 */
#ifndef errno
#define errno __errno
extern int errno;
#endif
extern _kernel_oserror _inet_error;

struct sockaddr_in;
struct nlist;

#ifndef kvm_t
#define kvm_t void
#endif

/*
 * function prototypes
 */
extern int accept(int s, struct sockaddr *addr, int *addrlen);

extern int bind(int s, const struct sockaddr *name, int namelen);

extern int connect(int s, const struct sockaddr *name, int namelen);

extern int getpeername(int s, struct sockaddr *name, int *namelen);
extern int getsockname(int s, struct sockaddr *name, int *namelen);
extern int getsockopt(int s, int level, int optname,
		      void *optval, int *optlen);
extern int getstablesize(void);

extern int kvm_nlist(kvm_t *kd, struct nlist *nl);

extern int listen(int s, int backlog);

extern int recv(int s, void *buf, size_t len, int flags);
extern int recvfrom(int s, void *buf, size_t len, int flags,
		    struct sockaddr *from, int *fromlenaddr);
extern int recvmsg(int s, struct msghdr *msg, int flags);

extern int select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds,
		  struct timeval *tv);
extern int send(int s, const void *msg, size_t len, int flags);
extern int sendmsg(int s, const struct msghdr *msg, int flags);
extern int sendto(int s, const void *msg, size_t len, int flags,
		  const struct sockaddr *to, int tolen);
extern int setsockopt(int s, int level, int optname, const void *optval, int optlen);
extern int shutdown(int s, int how);
extern int socketclose(int d);
extern int socket(int domain, int type, int protocol);
extern int socketstat(int s, struct stat *buf);
extern int socketioctl(int s, unsigned long cmd, ...);
extern int socketread(int s, void *buf, unsigned int len);
extern int socketreadv(int s, const struct iovec *iov, int iovcnt);
extern int socketwrite(int s, const void *buf, unsigned int len);
extern int socketwritev(int s, const struct iovec *iov, int iovcnt);
extern int socketversion(void);
extern int sysctl(int *name, unsigned int namelen, void *oldp, size_t *oldlenp,
                  void *newp, size_t newlen);

#ifdef COMPAT_INET4
extern int naccept(int s, struct nsockaddr *addr, int *addrlen);
extern int ngetpeername(int s, struct nsockaddr *name, int *namelen);
extern int ngetsockname(int s, struct nsockaddr *name, int *namelen);
extern int nrecvfrom(int s, void *buf, size_t len, int flags,
                     struct nsockaddr *from, int *fromlenaddr);
extern int nrecvmsg(int s, struct nmsghdr *msg, int flags);
extern int nsendmsg(int s, struct nmsghdr *msg, int flags);
extern int sendtosm(int s, const void *buf, size_t len,
                    const void *buf1, size_t len1, struct sockaddr_in *to);
#else
extern int oaccept(int s, struct osockaddr *addr, int *addrlen);
extern int ogetpeername(int s, struct osockaddr *name, int *namelen);
extern int ogetsockname(int s, struct osockaddr *name, int *namelen);
extern int orecvfrom(int s, void *buf, size_t len, int flags,
                     struct osockaddr *from, int *fromlenaddr);
extern int orecvmsg(int s, struct omsghdr *msg, int flags);
extern int osendmsg(int s, struct omsghdr *msg, int flags);
extern int sendtosm(int s, const void *buf, size_t len,
                    const void *buf1, size_t len1, struct osockaddr_in *to);
#endif

/*
 * auxiliary functions
 */
extern int _copyerror(_kernel_oserror *e);
extern char *_inet_err(void);
extern int _makecall(int swinum, _kernel_swi_regs *in, _kernel_swi_regs *out);

/* EOF socklib.h */
