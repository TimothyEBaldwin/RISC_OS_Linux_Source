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
/*> h.DOSclusters <*/
/*-------------------------------------------------------------------------*/
/* Cluster operations                          Copyright (c) 1990, JGSmith */
/*-------------------------------------------------------------------------*/

#ifndef __h_DOSclusters
#define __h_DOSclusters

/* Macros used to perform sector-to-CLUSTER mappings */
#define CLUSTERtoSECTOR(c,i) (( ((c) - CLUSTER_first(i)) * secsalloc(i)) + (i)->disc_startsec)
#define SECTORtoCLUSTER(s,i) ((((s) - (i)->disc_startsec) / secsalloc(i)) + CLUSTER_first(i))

int clusterfromoffset(int cluster, word *offset, DOSdisc *ihand);
int findCLUSTERtype(DOSdisc *ihand,int *index,int type);
int findCLUSTER(int offCLUSTER,char *namebuff,int blen,DOSdisc *ihand);
int writenextCLUSTER(int cluster,int nextcluster,DOSdisc *ihand);
int getnextCLUSTER(int cluster,DOSdisc *ihand);
int DOS_FAT_RW(int op, DOSdisc *ihand);
word max_sector(DOS_bootsector *bb);
int ensure_FATs(DOSdisc *ihand);
int countfreeclusters(DOSdisc *ihand);
int freeclusters(int startCLUSTER,DOSdisc *ihand);
int adjustusedchain(int start, int required, DOSdisc *ihand);
int claimfreeclusters(int required, DOSdisc *ihand);
int saveFILE(char *fname,char *leafname,word ld,word ex,char *bs,word len,DIR_info **cdir,DOS_direntry **dentry,int fzero,DOSdisc *ihand);
int ensure_exact(FILEhand *fhand,int ensure);

#define Rdata (1) /* read data */
#define Wdata (2) /* write data */
#define Wzero (4) /* write zeros */

 int DOS_multiple_RW(int op,int cluster,int coff,char *ma,word limit,word *ta,DOSdisc *ihand);
 int DOS_cluster_RW(int op,int cluster,int coff,char *memaddr,word len,DOSdisc *ihand);
 int DOS_bytes_RW(int op, char *memaddr, word bytes, word foff, FILEhand *fhand);
 int DOS_object_RW(int op,int startcluster,char *ma,word bytelength,DOSdisc *ihand);
int DOS_image_RW(int op,word sec,word off,byte *ma,word nbytes,DOSdisc *ihand);

#endif
