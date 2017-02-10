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
 * Names of RR classes and qclasses.  Classes and qclasses are the same, except
 * that C_ANY is a qclass but not a class.  (You can ask for records of class
 * C_ANY, but you can't have any records of that class in the database.)
 */

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

const struct res_sym __p_class_syms[] = {
        {C_IN,          "IN",           (char *)0},
        {C_CHAOS,       "CHAOS",        (char *)0},
        {C_HS,          "HS",           (char *)0},
        {C_HS,          "HESIOD",       (char *)0},
        {C_ANY,         "ANY",          (char *)0},
        {C_NONE,        "NONE",         (char *)0},
        {C_IN,          (char *)0,      (char *)0}
};

/*
 * Names of message sections.
 */
const struct res_sym __p_default_section_syms[] = {
        {ns_s_qd,       "QUERY",        (char *)0},
        {ns_s_an,       "ANSWER",       (char *)0},
        {ns_s_ns,       "AUTHORITY",    (char *)0},
        {ns_s_ar,       "ADDITIONAL",   (char *)0},
        {0,             (char *)0,      (char *)0}
};

const struct res_sym __p_update_section_syms[] = {
        {S_ZONE,        "ZONE",         (char *)0},
        {S_PREREQ,      "PREREQUISITE", (char *)0},
        {S_UPDATE,      "UPDATE",       (char *)0},
        {S_ADDT,        "ADDITIONAL",   (char *)0},
        {0,             (char *)0,      (char *)0}
};

const struct res_sym __p_key_syms[] = {
        {NS_ALG_MD5RSA,         "RSA",          "RSA KEY with MD5 hash"},
        {NS_ALG_DH,             "DH",           "Diffie Hellman"},
        {NS_ALG_DSA,            "DSA",          "Digital Signature Algorithm"},
        {NS_ALG_EXPIRE_ONLY,    "EXPIREONLY",   "No algorithm"},
        {NS_ALG_PRIVATE_OID,    "PRIVATE",      "Algorithm obtained from OID"},
        {0,                     NULL,           NULL}
};

const struct res_sym __p_cert_syms[] = {
        {cert_t_pkix,   "PKIX",         "PKIX (X.509v3) Certificate"},
        {cert_t_spki,   "SPKI",         "SPKI certificate"},
        {cert_t_pgp,    "PGP",          "PGP certificate"},
        {cert_t_url,    "URL",          "URL Private"},
        {cert_t_oid,    "OID",          "OID Private"},
        {0,             NULL,           NULL}
};

/*
 * Names of RR types and qtypes.  Types and qtypes are the same, except
 * that T_ANY is a qtype but not a type.  (You can ask for records of type
 * T_ANY, but you can't have any records of that type in the database.)
 */
const struct res_sym __p_type_syms[] = {
        {ns_t_a,        "A",            "address"},
        {ns_t_ns,       "NS",           "name server"},
        {ns_t_md,       "MD",           "mail destination (deprecated)"},
        {ns_t_mf,       "MF",           "mail forwarder (deprecated)"},
        {ns_t_cname,    "CNAME",        "canonical name"},
        {ns_t_soa,      "SOA",          "start of authority"},
        {ns_t_mb,       "MB",           "mailbox"},
        {ns_t_mg,       "MG",           "mail group member"},
        {ns_t_mr,       "MR",           "mail rename"},
        {ns_t_null,     "NULL",         "null"},
        {ns_t_wks,      "WKS",          "well-known service (deprecated)"},
        {ns_t_ptr,      "PTR",          "domain name pointer"},
        {ns_t_hinfo,    "HINFO",        "host information"},
        {ns_t_minfo,    "MINFO",        "mailbox information"},
        {ns_t_mx,       "MX",           "mail exchanger"},
        {ns_t_txt,      "TXT",          "text"},
        {ns_t_rp,       "RP",           "responsible person"},
        {ns_t_afsdb,    "AFSDB",        "DCE or AFS server"},
        {ns_t_x25,      "X25",          "X25 address"},
        {ns_t_isdn,     "ISDN",         "ISDN address"},
        {ns_t_rt,       "RT",           "router"},
        {ns_t_nsap,     "NSAP",         "nsap address"},
        {ns_t_nsap_ptr, "NSAP_PTR",     "domain name pointer"},
        {ns_t_sig,      "SIG",          "signature"},
        {ns_t_key,      "KEY",          "key"},
        {ns_t_px,       "PX",           "mapping information"},
        {ns_t_gpos,     "GPOS",         "geographical position (withdrawn)"},
        {ns_t_aaaa,     "AAAA",         "IPv6 address"},
        {ns_t_loc,      "LOC",          "location"},
        {ns_t_nxt,      "NXT",          "next valid name (unimplemented)"},
        {ns_t_eid,      "EID",          "endpoint identifier (unimplemented)"},
        {ns_t_nimloc,   "NIMLOC",       "NIMROD locator (unimplemented)"},
        {ns_t_srv,      "SRV",          "server selection"},
        {ns_t_atma,     "ATMA",         "ATM address (unimplemented)"},
        {ns_t_tkey,     "TKEY",         "tkey"},
        {ns_t_tsig,     "TSIG",         "transaction signature"},
        {ns_t_ixfr,     "IXFR",         "incremental zone transfer"},
        {ns_t_axfr,     "AXFR",         "zone transfer"},
        {ns_t_zxfr,     "ZXFR",         "compressed zone transfer"},
        {ns_t_mailb,    "MAILB",        "mailbox-related data (deprecated)"},
        {ns_t_maila,    "MAILA",        "mail agent (deprecated)"},
        {ns_t_naptr,    "NAPTR",        "URN Naming Authority"},
        {ns_t_kx,       "KX",           "Key Exchange"},
        {ns_t_cert,     "CERT",         "Certificate"},
        {ns_t_a6,       "A6",           "IPv6 Address"},
        {ns_t_dname,    "DNAME",        "dname"},
        {ns_t_sink,     "SINK",         "Kitchen Sink (experimental)"},
        {ns_t_opt,      "OPT",          "EDNS Options"},
        {ns_t_any,      "ANY",          "\"any\""},
        {0,             NULL,           NULL}
};

/*
 * Names of DNS rcodes.
 */
const struct res_sym __p_rcode_syms[] = {
        {ns_r_noerror,  "NOERROR",              "no error"},
        {ns_r_formerr,  "FORMERR",              "format error"},
        {ns_r_servfail, "SERVFAIL",             "server failed"},
        {ns_r_nxdomain, "NXDOMAIN",             "no such domain name"},
        {ns_r_notimpl,  "NOTIMP",               "not implemented"},
        {ns_r_refused,  "REFUSED",              "refused"},
        {ns_r_yxdomain, "YXDOMAIN",             "domain name exists"},
        {ns_r_yxrrset,  "YXRRSET",              "rrset exists"},
        {ns_r_nxrrset,  "NXRRSET",              "rrset doesn't exist"},
        {ns_r_notauth,  "NOTAUTH",              "not authoritative"},
        {ns_r_notzone,  "NOTZONE",              "Not in zone"},
        {ns_r_max,      "",                     ""},
        {ns_r_badsig,   "BADSIG",               "bad signature"},
        {ns_r_badkey,   "BADKEY",               "bad key"},
        {ns_r_badtime,  "BADTIME",              "bad time"},
        {0,             NULL,                   NULL}
};

int
sym_ston(const struct res_sym *syms, const char *name, int *success) {
        for ((void)NULL; syms->name != 0; syms++) {
                if (strcasecmp (name, syms->name) == 0) {
                        if (success)
                                *success = 1;
                        return (syms->number);
                }
        }
        if (success)
                *success = 0;
        return (syms->number);          /* The default value. */
}

const char *
sym_ntos(const struct res_sym *syms, int number, int *success) {
        static char unname[20];

        for ((void)NULL; syms->name != 0; syms++) {
                if (number == syms->number) {
                        if (success)
                                *success = 1;
                        return (syms->name);
                }
        }

        sprintf(unname, "%d", number);          /* XXX nonreentrant */
        if (success)
                *success = 0;
        return (unname);
}

const char *
sym_ntop(const struct res_sym *syms, int number, int *success) {
        static char unname[20];

        for ((void)NULL; syms->name != 0; syms++) {
                if (number == syms->number) {
                        if (success)
                                *success = 1;
                        return (syms->humanname);
                }
        }
        sprintf(unname, "%d", number);          /* XXX nonreentrant */
        if (success)
                *success = 0;
        return (unname);
}

/*
 * Return a string for the type.
 */
const char *
p_type(int type) {
        int success;
        const char *result;
        static char typebuf[20];

        result = sym_ntos(__p_type_syms, type, &success);
        if (success)
                return (result);
        if (type < 0 || type > 0xfff)
                return ("BADTYPE");
        sprintf(typebuf, "TYPE%d", type);
        return (typebuf);
}
