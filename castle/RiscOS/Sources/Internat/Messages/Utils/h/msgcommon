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
/* MsgCommon.h: */
       
#include <stdarg.h>

#ifndef MSGCOMMON_H
#define MSGCOMMON_H

typedef enum {
  EWARN = 0, EERR = 1, ESERR = 2, EINFO = 4
} errtype;

extern char *progname;
extern char TERMINATOR;

extern void report(int exitnum,errtype e,char *fmt, ... );
extern void *emalloc(unsigned int size);
extern void efree(void *str);
extern char *xalloc(char *s);
extern char *xnalloc(char *s,int of,int size);
/**/
extern int EOL(char *s1,int idx);
extern int Tstrlen(char *s1);
extern char *Tstrcpy(char *s1, char *s2);
extern char *Tstrncpy(char *s1, char *s2, size_t maxsize);
extern char *Tstrcat(char *s1, char *s2);
extern int Tstrcmp(char *s1, char *s2);
extern int Tstrncmp(char *s1, char *s2, size_t n);
extern char *Tstrchr(char *s1, int ch);
extern void Tfprintf(FILE *fp,char *s,int expand);
extern char *Tfgets(char *s1,int many,FILE *fp);

#endif

/* End of MsgCommon.h */
