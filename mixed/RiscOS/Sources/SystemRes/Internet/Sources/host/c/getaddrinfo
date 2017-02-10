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
/* Get address info */

#include "sys/types.h"
#include "sys/param.h"
#include "sys/socket.h"

#include "netinet/in.h"
#include "arpa/inet.h"
#include "arpa/nameser.h"

#include "ctype.h"
#include "netdb.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "unistd.h"

#include "memory.h"
#include "sys/errno.h"
#include "sys/stat.h"
#include "dst.h"

#include "resolv.h"

#include "port_after.h"

#define SUCCESS 0

int h_errno;
extern struct hostent *gethostbyname(const char *);

void
freeaddrinfo(ai)
        struct addrinfo *ai;
{
        struct addrinfo *next;

        do {
                next = ai->ai_next;
                if (ai->ai_canonname)
                        free(ai->ai_canonname);
                /* no need to free(ai->ai_addr) */
                free(ai);
                ai = next;
        } while (ai);
}

/* 1 unfinished */

int
getaddrinfo(hostname, servname, hints, res)
        const char *hostname, *servname;
        const struct addrinfo *hints;
        struct addrinfo **res;
{

/* Sweeping assumption: as Host only ever calls this with servname set to
   NULL this might as well be a gethostbyname if we ignore the hints it passes */

   struct hostent  *host;
   struct addrinfo sentinel;


   if (hostname == NULL && servname == NULL)
      return EAI_NONAME;

   host = gethostbyname(hostname);

   if (h_errno != NETDB_SUCCESS)
      {
      /* Unsuccessful */
      if (sentinel.ai_next) freeaddrinfo(sentinel.ai_next);
      *res = NULL;
      return h_errno;
      }
   else
      {
      /* Successful */
      if (sentinel.ai_next) 
         {
         sentinel.ai_flags =  0;
         sentinel.ai_family = 0;
         sentinel.ai_socktype = 0;
         sentinel.ai_protocol = 0;
         sentinel.ai_addrlen = (size_t)host->h_length;
         sentinel.ai_canonname = host->h_name;
         sentinel.ai_addr = 0;
         *res = sentinel.ai_next;
         return SUCCESS;
         }
      else
         {
         /* But no more */
         *res = NULL;
         return EAI_FAIL;
         }
      }

return h_errno;
}


