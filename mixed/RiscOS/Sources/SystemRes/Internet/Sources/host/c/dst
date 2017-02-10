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
/* DST functions */

#include "sys/types.h"

#define NOTUSED(k) k=k;

typedef struct dst_key {
        char    *dk_key_name;   /* name of the key */
        int     dk_key_size;    /* this is the size of the key in bits */
        int     dk_proto;       /* what protocols this key can be used for */
        int     dk_alg;         /* algorithm number from key record */
        u_int32_t dk_flags;     /* and the flags of the public key */
        u_int16_t dk_id;        /* identifier of the key */
} DST_KEY;

extern DST_KEY *dst_dnskey_to_key(const char *in_name, /* KEY record name */
                                  const u_char *key,   /* KEY RDATA */
                                  const int len);      /* size of input buffer*/
extern void dst_init(void);
extern int dst_verify_data(const int mode,       /* specifies INIT/UPDATE/FINAL/ALL */
                    DST_KEY *in_key,     /* the key to use */
                    void **context,      /* pointer to state structure */
                    const u_char *data,  /* data to be verified */
                    const int len,       /* length of input data */
                    const u_char *signature,/* buffer containing signature */
                    const int sig_len);  /* length of signature */
extern DST_KEY *dst_free_key(DST_KEY *f_key);
extern int getaddrinfo(char *,int *,void *,void *);
extern void freeaddrinfo(void *);
extern int __dn_skipname (const u_char *a, const u_char *b);
extern int __dn_expand (const u_char *a, const u_char *b, const u_char *c,
                               char *d, int e);

DST_KEY *dst_dnskey_to_key(const char *in_name, /* KEY record name */
                           const u_char *key,   /* KEY RDATA */
                           const int len)       /* size of input buffer*/
{
(void)len;
(void)in_name;
(void)key;

return 0;
}

void dst_init()
{
}

int dst_verify_data(const int mode,       /* specifies INIT/UPDATE/FINAL/ALL */
                    DST_KEY *in_key,     /* the key to use */
                    void **context,      /* pointer to state structure */
                    const u_char *data,  /* data to be verified */
                    const int len,       /* length of input data */
                    const u_char *signature,/* buffer containing signature */
                    const int sig_len)
{
return 0;
}

DST_KEY *dst_free_key(DST_KEY *f_key)
{
return 0;
}

int getaddrinfo(char *a,int *b,void *c,void *d)
{
return 0;
}

void freeaddrinfo(void *a)
{
}

int __dn_skipname (const u_char *a, const u_char *b)
{
return 0;
}

int __dn_expand (const u_char *a, const u_char *b, const u_char *c,
                               char *d, int e)
{
return 0;
}
