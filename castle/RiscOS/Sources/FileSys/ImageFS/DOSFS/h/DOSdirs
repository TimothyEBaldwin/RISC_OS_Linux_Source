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
/*> h.DOSdirs <*/
/*-------------------------------------------------------------------------*/
/* Directory operations                        Copyright (c) 1990, JGSmith */
/*-------------------------------------------------------------------------*/

#ifndef __h_DOSdirs
#define __h_DOSdirs

/* Flags for write_dirinfo() */
typedef enum {
              wdi_NONE,    /* should never be used */
              wdi_LOAD,    /* update the load exec with the value given */
              wdi_EXEC,    /* update the exec address with the value given */
              wdi_ATTR,    /* update the attributes with the value given */
              wdi_FLEN,    /* update the filelength with the value given */
              wdi_SCLUSTER /* start CLUSTER of the file image */
             } wdi_flags ;

/* compute details needed for a given dirinfo for directory of 'size' bytes*/
#define DI_Size(size)   (                                        \
                          sizeof(DIR_info)                       \
                          + (((size/sizeof(DOS_direntry))-1)*    \
                           (sizeof(DOS_direntry)                 \
                            + sizeof(char*)))                    \
                        )
/* compute offset of dirstruct->dir_entries[0] from its 'starting' point */
#define DI_Offset(size) (((size/sizeof(DOS_direntry))-1) * sizeof(char*))
/* compute offset of dirstruct->dir_entries[0] from its 'starting' point */
#define DI_Base(p)      (((int)(&((p)->dir_entries[0])) + ((p)->dir_entryoffset)))

DOS_direntry *getnextDIRentry(DOS_direntry *directory,int dir_size,int *index);
DOS_direntry *findemptyDIRentry(DOS_direntry *directory,int dir_size);
DOS_direntry *findDIRentry(char *wcname,DIR_info *cdir,int dir_size,int *index);
DIR_info *loadDIR(char *dirpathname,DOSdisc *ihand);
DOS_direntry *findDIRtype(byte mask,byte ftype,DOS_direntry *directory,int dir_size,int *index);
void flush_dir_cache(DOSdisc *ihand);
void free_dir_cache(char *dirname, DOSdisc *ihand);
char *restorePATH(char *pname, char *lname);
FS_dir_block *read_dir(int rtype,char *fname,void *dest,word num,word off,word blen,DOSdisc *ihand);
int ensure_directory(DIR_info *dir);
int resolvePATH(char *pname,DIR_info **ndir,char **lname,DOSdisc *ihand);
int get_dir_entry_array(DOS_direntry *lfn[], DOSdisc *ihand, int numreq, DIR_info **cdir, DIR_info **pdir, DOS_direntry ** preserve);
int write_dirinfo(char *fname,word bitmap,word loadaddr,word execaddr,word attr,word filelen,int startCLUSTER,DOSdisc *ihand);

#endif
