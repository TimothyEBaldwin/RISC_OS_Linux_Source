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
/*> h.Ops <*/
/*-------------------------------------------------------------------------*/
/* Fileswitch interface operations              Copyright (c) 1990 JGSmith */
/*-------------------------------------------------------------------------*/

#ifndef __h_Ops
#define __h_Ops

/* From OpsGetPut */
int DOSFS_get_bytes(FILEhand *fhand, char *ma, word bytes, word foff);
int DOSFS_put_bytes(FILEhand *fhand, char *ma, word bytes, word foff);

/* From OpsFind */
FS_open_block *DOSFS_open_file(word op,char *fname,DOSdisc *ihand);
int DOSFS_close_file(FILEhand *fhand,word loadaddr,word execaddr);

/* From OpsFile */
char *DOSFS_save_file(char *fn,word ld,word ex,char *bs,char *end,DOSdisc *ih);
FS_cat_entry *DOSFS_read_cat(char *fname,DOSdisc *ihand);
int DOSFS_write_cat(char *fname,word ld,word ex,word attr,DOSdisc *ihand);
FS_cat_entry *DOSFS_delete(char *fname,DOSdisc *ihand);
int DOSFS_create(char *fname,word ld,word ex,char *base,char *end,DOSdisc *ihand);
int DOSFS_create_dir(char *fname,word ld,word ex,word size,DOSdisc *ihand);
word DOSFS_read_block_size(char *fname,DOSdisc *ihand);

/* From OpsArgs */
int DOSFS_write_extent(FILEhand *fhand,word fext);
word DOSFS_alloc(FILEhand *fhand);
FS_datestamp *DOSFS_flush(FILEhand *fhand);
word DOSFS_ensure(FILEhand *fhand,word ensure);
int DOSFS_write_zeros(FILEhand *fhand,word foff,word bytes);
FS_datestamp *DOSFS_read_datestamp(FILEhand *fhand);

/* From OpsFunc */
int DOSFS_rename(char *oldname,char *newname,DOSdisc *ihand);
FS_dir_block *DOSFS_read_dir(char *fname,void *dest,word num,word off,word blen,DOSdisc *ihand);
FS_dir_block *DOSFS_read_dir_info(char *fname,void *dest,word num,word off,word blen,DOSdisc *ihand);
DOSdisc *DOSFS_image_open(word fshand,word buffsize);
int DOSFS_image_close(DOSdisc *ihand);
int DOSFS_defect_list(char *fname,word *buffer,word blen,DOSdisc *ihand);
int DOSFS_add_defect(char *fname,word offset,DOSdisc *ihand);
word DOSFS_read_boot_option(char *fname,DOSdisc *ihand);
int DOSFS_write_boot_option(char *fname,word newoption,DOSdisc *ihand);
int DOSFS_used_space_map(char *buffer,word blen,DOSdisc *ihand);
FS_free_space *DOSFS_read_free_space(DOSdisc *ihand);
int DOSFS_namedisc(char *newname,DOSdisc *ihand);
int DOSFS_stampimage(int type,DOSdisc *ihand);
int DOSFS_objectatoffset(int offset,char *buffer,int blen,DOSdisc *ihand);

#endif
