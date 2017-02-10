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
/*> h.DOSnaming <*/
/*---------------------------------------------------------------------------*/
/* MSDOS to RISCOS name conversion                Copyright (c) 1989 JGSmith */
/*---------------------------------------------------------------------------*/

#ifndef _h_DOSnaming
#define _h_DOSnaming

/*---------------------------------------------------------------------------*/

#define MaxString (256)    /* maximum length of internal string */
#define DOSwcmult  ('*')   /* "zero or more" wildcard character */
#define ROwcmult   ('*')
#define DOSwcsing  ('?')   /* "one" wildcard character */
#define ROwcsing   ('#')

typedef enum {noName,noTrans,extTrans} transinfo ;

/*---------------------------------------------------------------------------*/

int validchar(char *string,char init) ;
char *before(char *newptr,char *text,char marker,int npad) ;
char *after(char *newptr,char *text,char marker,int npad) ;
int namematch(char *wcname,char *fname) ;
char *convertRISCOStoDOS(char *source,char *dest) ;
char *convertRISCOStoLFN(char *source,char *dest) ;
char *convertDOStoRISCOS(char *source,char *dest) ;
char mapchar(char cchr,char *fromlist,char *tolist) ;
int shorten_lfn(char * longfname, char * shortname, DIR_info * cdir);
void MakeLFNEntries(DOS_direntry * lfn[],int numreq,char* leafname,char* shortname);
byte lfnchecksum(const char *filename);
char *buildFILEname(DOS_direntry * dentry,char *name);

/*---------------------------------------------------------------------------*/

typedef struct {
                char name[DOSnamesize] ;
                word flags ;               /* cache entry description flags */
                /* the above flag field ensures the structure end is aligned */
               } name_cache ;

typedef struct {
                char        name[MaxString] ; /* pathname */
                name_cache *ncache ;          /* and the attached name cache */
               } dirname_cache ;

/*---------------------------------------------------------------------------*/

extern name_cache *create_cache(int number_of_entries) ;
extern int         add_to_cache(name_cache *namecache,char *DOSextension) ;
extern int         check_cache(name_cache *namecache,char *DOSextension) ;

/*---------------------------------------------------------------------------*/

#endif /* _h_DOSnaming */

/*---------------------------------------------------------------------------*/
/*> EOF h.DOSnaming <*/
