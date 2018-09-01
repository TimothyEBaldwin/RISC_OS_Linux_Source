/*
 * Copyright (c) 1983, 1986 Regents of the University of California.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms are permitted
 * provided that the above copyright notice and this paragraph are
 * duplicated in all such forms and that any documentation,
 * advertising materials, and other materials related to such
 * distribution and use acknowledge that the software was developed
 * by the University of California, Berkeley.  The name of the
 * University may not be used to endorse or promote products derived
 * from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */
#include "sys/param.h"
#include "sys/types.h"
#include "sys/mbuf.h"

#include "netinet/in.h"
#include "netinet/in_systm.h"

/*
 * Checksum routine for Internet Protocol family headers.
 *
 * This routine is very heavily used in the network
 * code and should be modified for each CPU to be as fast as possible.
 */

/*
 * There is a high-speed assembler simple-case IP header checksum
 * routine, in_cksum_hdr(), in poduleirq.s.
 *
 * Also, in_cksum() has been replaced with a much swifter assembler
 * routine, also in poduleirq.s.
 */

#if 0
/* C version - Problems caused because the ARM cannot read a word
 * from an 8bit boundary the way other machines can.
 * Version #3:
 * The internet header checksum is the 16 bit one's complement of the one's
 * complement sum of all 16 bit words in the header
 * Here we compute this as the sum of all the bit0-7 and all the bits8-15 in
 * two separate registers, then combine them at the end.
 */

int
in_cksum(m, len)
	register struct mbuf *m;
	int len;
{
	register int mlen = 0;
	register unsigned lo = 0, hi = 0;
	register u_char *lobp = mtod(m, u_char *);
	register u_char *hibp = lobp + 1;
	unsigned sum;

	for (;;) {
		/*
		 * Each trip around loop adds in
		 * word from one mbuf segment.
		 */
		mlen = m->m_len;
		m = m->m_next;
		if (len < mlen)
			mlen = len;
		len -= mlen;
		while ((mlen -= 2) >= 0) {
			lo += *lobp;
			hi += *hibp;
			lobp += 2;
			hibp += 2;
		}
		if (mlen & 1) {
			if (lobp < hibp)
				lo += *lobp;
			else {
				hi += *hibp;
			}
		}
		if (len == 0)
			break;
		for (;;) {
			if (m == 0) { /* out of data */
				goto done;
			}
			if (m->m_len)
				break;
			m = m->m_next;
		}
/* Now we have to decide the lo/hi sequence for this next packet
**							    oddlen   H/L   new
** a)  ...] [L H ... L H]     was Lo/Hi, even => [L H ...      F      F	    L/H
** b)  ...] [H L ... H L]     was Hi/Lo, even => [H L ...      F      T	    H/L
** c)  ...] [L H ... L H L]   was Lo/Hi, odd  => [H L ...      T      F	    H/L
** d)  ...] [H L ... H L H]   was Hi/Lo, odd  => [L H ...      T      T	    L/H
**
*/
		if (mlen & 1 ? lobp < hibp : hibp < lobp) {
			/* Then the first byte of next mbuf is for the
			 **   high half of the checksum.
			 */
			hibp = mtod(m, u_char *);
			lobp = hibp + 1;
		} else {
			lobp = mtod(m, u_char *);
			hibp = lobp + 1;
		}

	}
	/*
	 * Add together high and low parts of sum
	 */
done:
	sum = (hi << 8) + lo;
	while (sum >= 0x10000)
		sum = (sum >> 16) + (sum & 0xffff);
	/* one's complement of sum */
	sum ^= 0xffff;
	return (sum);
}
#endif
