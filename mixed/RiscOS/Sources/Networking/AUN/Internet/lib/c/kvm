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
#include <stdlib.h>
#include <string.h>

#include <sys/param.h>
#include <sys/systm.h>
#include <sys/kernel.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/errno.h>
#include <sys/time.h>
#include <sys/sysctl.h>

#include <net/if.h>
#include <net/route.h>

#include <netinet/in.h>
#include <netinet/in_systm.h>
#include <netinet/ip.h>
#include <netinet/ip_var.h>
#include <netinet/ip_icmp.h>
#include <netinet/ip_mroute.h>
#include <netinet/icmp_var.h>
#include <netinet/igmp_var.h>
#include <netinet/udp.h>
#include <netinet/udp_var.h>
#include <netinet/tcp.h>
#include <netinet/tcp_timer.h>
#include <netinet/tcp_var.h>

#include <nlist.h>
#include <kvm.h>

static struct nlist nl[] = {
	{ "_icmpstat", N_ABS },
	{ "_ifnet", N_ABS },
#ifdef MULTICAST
	{ "_ip_mrtproto", N_ABS },
#endif
	{ "_ipstat", N_ABS },
#ifdef MROUTING
	{ "_mfctable", N_ABS },
#endif
#ifdef MULTICAST
	{ "_mrtstat", N_ABS },
#endif
	{ "_rt_tables", N_ABS },
	{ "_rtstat", N_ABS },
	{ "_tcb", N_ABS },
	{ "_tcpstat", N_ABS },
	{ "_udb", N_ABS },
	{ "_udpstat", N_ABS },
#ifdef MROUTING
	{ "_viftable", N_ABS },
#endif
};

extern u_int ip_mrtproto;
extern struct mrtstat mrtstat;
extern struct mbuf *mfctable[];
extern struct vif viftable[];

void
kvm_init()
{
	struct nlist *np = nl;
	(np++)->n_value = (u_long) &icmpstat;
	(np++)->n_value = (u_long) &ifnet;
#ifdef MULTICAST
	(np++)->n_value = (u_long) &ip_mrtproto;
#endif
	(np++)->n_value = (u_long) &ipstat;
#ifdef MROUTING
	(np++)->n_value = (u_long) mfctable;
#endif
#ifdef MULTICAST
	(np++)->n_value = (u_long) &mrtstat;
#endif
	(np++)->n_value = (u_long) rt_tables;
	(np++)->n_value = (u_long) &rtstat;
	(np++)->n_value = (u_long) &tcb;
	(np++)->n_value = (u_long) &tcpstat;
	(np++)->n_value = (u_long) &udb;
	(np++)->n_value = (u_long) &udpstat;
#ifdef MROUTING
	(np++)->n_value = (u_long) viftable;
#endif
}

static int
nlist_compare(a, b)
	const void *a, *b;
{
	return (strcmp(((const struct nlist *)a)->n_name,
	               ((const struct nlist *)b)->n_name));
}

struct kvm_nlist_args {
	kvm_t *kvmd;
	struct nlist *nl;
};
int
_kvm_nlist(uap, retval)
	register struct kvm_nlist_args *uap;
	int *retval;
{
	register struct nlist *key;
	struct nlist *found;
	register int nvalid = 0;

	for (key=uap->nl; key->n_name && key->n_name[0]; ++key) {
		found = (struct nlist *)bsearch(key, nl,
				sizeof(nl)/sizeof(nl[0]), sizeof(nl[0]),
				nlist_compare);
		if (found==0)
			continue;
		++nvalid;
		key->n_type = found->n_type;
		key->n_value = found->n_value;
	}

	*retval = ((key - uap->nl) - nvalid);
	return (0);
}
