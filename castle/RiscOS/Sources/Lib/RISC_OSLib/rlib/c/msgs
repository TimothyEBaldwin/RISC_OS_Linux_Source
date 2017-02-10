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
/************************************************************************/
/* © Acorn Computers Ltd, 1992.                                         */
/*                                                                      */
/* This file forms part of an unsupported source release of RISC_OSLib. */
/*                                                                      */
/* It may be freely used to create executable images for saleable       */
/* products but cannot be sold in source form or as an object library   */
/* without the prior written consent of Acorn Computers Ltd.            */
/*                                                                      */
/* If this file is re-distributed (even if modified) it should retain   */
/* this copyright notice.                                               */
/*                                                                      */
/************************************************************************/

/*
 * Title:   msgs.c
 * Purpose: provide support for messages resource file
 *          (Use this to make your applications "internationalisable!")
 * History: IDJ: 06-Feb-92: prepared for source release
 *
 */

#include <stdlib.h>

#include "msgs.h"
#include "swis.h"
#include "msgtrans.h"
#include "res.h"
#include "os.h"
#include "wimpt.h"

typedef struct msgs_block {
    msgtrans_control_block cb;
    char **lines;
    int n;
} msgs_block;

#define DEFAULT_FILE_NAME "RISC_OSLibrary:Messages"

static msgs_block main_msgs_block;
static msgs_block default_msgs_block;

static void __msgs_closefiles(void)
{
    if (main_msgs_block.lines)
        _swix(MessageTrans_CloseFile, _IN(0), &main_msgs_block.cb);
    if (default_msgs_block.lines)
        _swix(MessageTrans_CloseFile, _IN(0), &default_msgs_block.cb);
}

static void __msgs_readfile(char *name, msgs_block *mb)
{
    char *data;
    int n, size;
    char *p, *e;
    int c;
    char **lines;
    os_error *err;

    n = 1;
    size = _swi(MessageTrans_FileInfo, _IN(1)|_RETURN(2), name);
    data = malloc(size);
    if (!data) {
        wimpt_reporterror((os_error *)_swix(MessageTrans_ErrorLookup, _INR(0,2), "\0\0\0\0NoMem", 0, 0), 0);
        exit(1);
    }
    err = _swix(MessageTrans_OpenFile, _INR(0,2), &mb->cb, name, data);
    if (err) {
        wimpt_reporterror(err, 0);
        exit(1);
    }
    p = data + 4;
    e = data + size;
    n = 1;
    do {
        if (*p++ < ' ') {
            *(p-1) = 0;
            n++;
        }
    } while (p < e);
    lines = malloc(n * 4);
    if (!lines) {
        _swix(MessageTrans_CloseFile, _IN(0), &mb->cb);
        wimpt_reporterror((os_error *)_swix(MessageTrans_ErrorLookup, _INR(0,2), "\0\0\0\0NoMem", 0, 0), 0);
        exit(1);
    }
    p = data + 4;
    c = 0;
    n = 0;
    do {
        if (!c) {
            if (*p != '#' && *p > ' ')
                lines[n++] = p++;
        }
        c = *p++;
    } while (p < e);
    mb->lines = lines;
    mb->n = n;
}

static char *__msgs_lookup(char *tag, msgs_block *mb)
{
    int i, n;
    char *s, *t;
    char ct, cs;
    char **lines;

    n = mb->n;
    lines = mb->lines;
    for (i = 0; i < n; i++) {
        s = lines[i];
trynexttag:
        t = tag;
        while (1) {
            if (!(ct = *t++)) ct = ':';
            cs = *s++;
            if ((cs != ct) && (cs != '?')) {
                if (cs == '/') {               /* Could be a match because ':' == '/' */
                    if (ct == ':') {
                        do {
                            cs = *s++;         /* Skip to after ':' and return string */
                        } while (cs != ':');
                        return s;
                    }
                    goto trynexttag;           /* Not a match but try again because of '/' */
                }
                while (cs != ':') {            /* Skip forward as far as ':' searching for '/' */
                    cs = *s++;
                    if (cs == '/')             /* '/' => try next token */
                        goto trynexttag;
                }
                break;
            }
            if (ct == ':')
                return s;
        }
    }
    return 0;
}

msgtrans_control_block *msgs_main_control_block(void)
{
    return &main_msgs_block.cb;
}

msgtrans_control_block *msgs_default_control_block(void)
{
    if (!default_msgs_block.lines) {
        __msgs_readfile(DEFAULT_FILE_NAME, &default_msgs_block);
    }
    return &default_msgs_block.cb;
}

char *msgs_lookup(char *tag /*and default*/)
{
    char *m;

    m = __msgs_lookup(tag, &main_msgs_block);
    if (!m) {
        if (!default_msgs_block.lines) {
            __msgs_readfile(DEFAULT_FILE_NAME, &default_msgs_block);
        }
        m = __msgs_lookup(tag, &default_msgs_block);
        if (!m) {
            m = tag;
            while (*m) {
                if (*m++ == ':')
                    return m;
            }
            return tag;
        }
    }
    return m;
}

void msgs_init(void)
{
    char name[40];   /* Long enough for <Program$Dir>.Messages */

    res_findname("Messages", name);
    __msgs_readfile(name, &main_msgs_block);
    atexit(__msgs_closefiles);
}
