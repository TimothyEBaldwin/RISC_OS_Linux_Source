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
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/in.h>
#include <ifaddrs.h>
#include <stdlib.h>
#include <string.h>
#include "inetlib.h"
#include "unixlib.h"

#define	SA_LEN(sa)	(sa)->sa_len
#define	SALIGN	(sizeof(long) - 1)
#define	SA_RLEN(sa)	((sa)->sa_len ? (((sa)->sa_len + SALIGN) & ~SALIGN) : (SALIGN + 1))

int
my_getifaddrs(struct ifaddrs **pif)
{
	int icnt = 1;
	int dcnt = 0;
	int ncnt = 0;
	char buf[1024];
	int m, sock;
	struct ifconf ifc;
	struct ifreq *ifr;
	struct ifreq *lifr;
	int i;
	size_t len, alen;
	char *data;
	char *names;
	struct ifaddrs *ifa, *ift;

	ifc.ifc_buf = buf;
	ifc.ifc_len = sizeof(buf);

	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
		return (-1);
	i = ioctl(sock, SIOCGIFCONF, (char *)&ifc);
	close(sock);
	if (i < 0)
		return (-1);

	ifr = ifc.ifc_req;
	lifr = (struct ifreq *)&ifc.ifc_buf[ifc.ifc_len];

	while (ifr < lifr) {
		struct sockaddr *sa;

		sa = &ifr->ifr_addr;
		++icnt;
		dcnt += SA_RLEN(sa);
		ncnt += sizeof(ifr->ifr_name) + 1;

		if (SA_LEN(sa) < sizeof(*sa))
			ifr = (struct ifreq *)(((char *)sa) + sizeof(*sa));
		else
			ifr = (struct ifreq *)(((char *)sa) + SA_LEN(sa));
	}

	if (icnt + dcnt + ncnt == 1) {
		*pif = NULL;
		free(buf);
		return (0);
	}
	data = malloc(sizeof(struct ifaddrs) * icnt + dcnt + ncnt);
	if (data == NULL) {
		free(buf);
		return(-1);
	}

	ifa = (struct ifaddrs *)(void *)data;
	data += sizeof(struct ifaddrs) * icnt;
	names = data + dcnt;

	memset(ifa, 0, sizeof(struct ifaddrs) * icnt);
	ift = ifa;

	ifr = ifc.ifc_req;
	lifr = (struct ifreq *)&ifc.ifc_buf[ifc.ifc_len];

	while (ifr < lifr) {
		struct sockaddr *sa;

		ift->ifa_name = names;
		names[sizeof(ifr->ifr_name)] = 0;
		strncpy(names, ifr->ifr_name, sizeof(ifr->ifr_name));
		while (*names++)
			;

		ift->ifa_addr = (struct sockaddr *)data;
		sa = &ifr->ifr_addr;
		memcpy(data, sa, SA_LEN(sa));
		data += SA_RLEN(sa);

		ifr = (struct ifreq *)(((char *)sa) + SA_LEN(sa));
		ift = (ift->ifa_next = ift + 1);
	}
	if (--ift >= ifa) {
		ift->ifa_next = NULL;
		*pif = ifa;
	} else {
		*pif = NULL;
		free(ifa);
	}
	return (0);
}

int main(void)
{
    struct ifaddrs *ifa;

    if (my_getifaddrs(&ifa) < 0)
    {
        xperror("getifaddrs");
        return EXIT_FAILURE;
    }

    for (struct ifaddrs *p = ifa; p; p = p->ifa_next)
    {
        printf("Name=%s %p\n", p->ifa_name, p->ifa_name);
        printf("Flags=%x\n", p->ifa_flags);
        printf("Addr pointer=%p\n", p->ifa_addr);
        printf("Addr family=%d\n", p->ifa_addr->sa_family);
        if (p->ifa_addr->sa_family == AF_INET)
        {   struct sockaddr_in *sin = (struct sockaddr_in *) p->ifa_addr;
            printf("Address = %s\n", inet_ntoa(sin->sin_addr));
        }
    }

    freeifaddrs(ifa);
}
