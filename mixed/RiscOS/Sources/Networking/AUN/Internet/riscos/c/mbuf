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
 * Copyright(c) 1994 Acorn Computers Ltd., Cambridge, England
 */
#include <string.h>
#include "kernel.h"
#include "swis.h"

#include "sys/param.h"
#include "sys/errno.h"
#include "sys/mbuf.h"
#include "sys/socket.h"

#include "net/if.h"
#include "net/if_arp.h"

#include "netinet/in.h"
#include "netinet/if_ether.h"

#include "swiveneers.h"
#include "module.h"

#ifdef DBGMBUF
static void df(char *s)
{
    _swix(OS_WriteI+4, 0);

    printf(s);
}
#endif


struct mbctl MBCTL =
{
	0,				/* opaque */
	sizeof(struct mbctl),		/* mbcsize */
	MBUF_MANAGER_VERSION,		/* mbcvers */
	0ul,				/* flags */
	MINCONTIG,			/* advminubs */
	ETHERMTU,			/* advmaxubs */
	MINCONTIG,			/* mincontig */
	0ul,				/* spare1 */
	/*
	 * Rest of the structure gets initialised
	 * to zeroes due to the trailing comma
	 */
};

/**********************************************************************/

_kernel_oserror *mb_entryinit(void)
{
    return mbuf_open_session(&MBCTL);
}

/**********************************************************************/

/*
 * mb_present - check whether the mbuf manager is present or not,
 * using the Mbuf_Control SWI to do so.	 returns 1 if manager
 * present, else 0.
 */
int mb_present(void)
{
    /*
     * the control version SWI should *always*
     * succeed if the mbuf manager is loaded.
     */
    return mbufcontrol_version(0) == NULL;
}

/**********************************************************************/

_kernel_oserror *mb_close_session(void)
{
    return mbuf_close_session(&MBCTL);
}

/**********************************************************************/

/*
 * Copy data from a buffer back into the indicated mbuf chain,
 * starting "off" bytes from the beginning, extending the mbuf
 * chain if necessary.
 */
void m_copyback(struct mbuf *m0, register int off, register int len, caddr_t cp)
{
	register int mlen;
	register struct mbuf *m = m0, *n;
	int totlen = 0;

	if (m0 == 0)
		return;
	while (off > (mlen = m->m_len)) {
		off -= mlen;
		totlen += mlen;
		if (m->m_next == 0) {
			n = ALLOC_C(MINCONTIG, NULL);
			if (n == 0)
				goto out;
			n->m_type = m->m_type;
			n->m_len = min(MINCONTIG, len + off);
			m->m_next = n;
		}
		m = m->m_next;
	}
	while (len > 0) {
		mlen = min (m->m_len - off, len);
		memcpy(off + mtod(m, caddr_t), cp, (unsigned)mlen);
		cp += mlen;
		len -= mlen;
		mlen += off;
		off = 0;
		totlen += mlen;
		if (len == 0)
			break;
		if (m->m_next == 0) {
			n = ALLOC_S(MINCONTIG, NULL);
			if (n == 0)
				break;
			n->m_type = m->m_type;
			n->m_len = min(MINCONTIG, len);
			m->m_next = n;
		}
		m = m->m_next;
	}
out:
	if (((m = m0)->m_flags & M_PKTHDR) && (m->m_pkthdr.len < totlen))
		m->m_pkthdr.len = totlen;
}

/* EOF mbuf.c */
