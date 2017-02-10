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
/* interface.h
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * Header file for interface definitions.
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.02 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 17-Oct-95  10:06  JPD  Version 1.00
 * First version with change log.
 *
 *
 **End of change record*
 */

/******************************************************************************/

#ifdef OldCode
struct interface {
        struct  interface *int_next;
        struct  sockaddr int_addr;
        union {
                struct  sockaddr intu_broadaddr;
                struct  sockaddr intu_dstaddr;
        } int_intu;
#define int_broadaddr   int_intu.intu_broadaddr
#define int_dstaddr     int_intu.intu_dstaddr
        int     int_metric;
        int     int_flags;
        u_long  int_net;
        u_long  int_netmask;
        u_long  int_subnet;
        u_long  int_subnetmask;
        int     int_ipackets;
        int     int_opackets;
        char    *int_name;
        u_short int_transitions;
};
#else
struct interface
{
   struct interface *int_next;
   struct sockaddr int_addr;
   union
   {
      struct sockaddr intu_broadaddr;
      struct sockaddr intu_dstaddr;
   } int_intu;

#define int_broadaddr int_intu.intu_broadaddr
#define int_dstaddr   int_intu.intu_dstaddr

   int     int_metric;
   int     int_flags;
   u_long  int_net;
   u_long  int_netmask;
   u_long  int_subnet;
   u_long  int_subnetmask;
   int     int_ipackets;
   int     int_opackets;
   char    *int_name;
   u_short int_transitions;
};
#endif

#ifdef OldCode
/* These are same as those defined in net/if.h */

#define IFF_UP          0x1             /* interface is up */
#define IFF_BROADCAST   0x2             /* broadcast address valid */
#define IFF_DEBUG       0x4             /* turn on debugging */
#define IFF_LOOPBACK    0x8             /* is a loopback net */
#define IFF_POINTOPOINT 0x10            /* interface is point-to-point link */

#endif


/* These conflict with those defind in net/if.h. I am unable to determine
 * whether this is a problem or not - JPD
 */

#define IFF_SUBNET      0x1000
#ifdef OldCode
#define IFF_PASSIVE     0x2000         /* appears unused? */
#endif
#define IFF_INTERFACE   0x4000
#define IFF_REMOTE      0x8000

#ifdef OldCode
struct interface *if_ifwithaddr();
struct interface *if_ifwithdstaddr();
struct interface *if_ifwithnet();
struct interface *if_iflookup();

#else

extern struct interface *if_ifwithaddr(struct sockaddr *addr);
/* Find the interface with address addr */

extern struct interface *if_ifwithdstaddr(struct sockaddr *addr);
/* Find the point-to-point interface with destination address addr */

extern struct interface *if_ifwithnet(struct sockaddr *addr);
/* Find the interface on the network of the specified address */

extern struct interface *if_iflookup(struct sockaddr *addr);
/* Find an interface from which the specified address should have come from */

#endif

/******************************************************************************/

/* EOF interface.h */
