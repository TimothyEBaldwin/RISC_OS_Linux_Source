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
/*> h.Helpers <*/
/*---------------------------------------------------------------------------*/
/* Module support functions                      Copyright (c) 1990, JGSmith */
/*---------------------------------------------------------------------------*/

#ifndef __h_Helpers
#define __h_Helpers

/* Macros for less painful reading of 16/32bit values that have been split into individual bytes */
#define READ_LOHI(VAR) ((word) (VAR | (VAR##HI << 8)))
#define READ_0123(VAR) ((word) (VAR##0 | (VAR##1 << 8) | (VAR##2 << 16) | (VAR##3 << 24)))

/* Unaligned word access */
extern void writeWORD(void *address,word datavalue) ;
extern word loadWORD(const void *address) ;

/* These are only exported to provide function addresses */
extern void DOSFS_Open(void);
extern void DOSFS_GetBytes(void);
extern void DOSFS_PutBytes(void);
extern void DOSFS_Args(void);
extern void DOSFS_Close(void);
extern void DOSFS_File(void);
extern void DOSFS_Func(void);

/* Helper functions */
int checknotwildcarded(char *name, char wcmult, char wcsing);
int find_open_file(char *fname, DOS_direntry *dentry, DOSdisc *ihand);
int update_imageID(DOSdisc *ihand);
void read_loadexec(DOS_direntry *dentry,char *dosext,time5byte *le);
void update_loadexec(DOS_direntry *dentry,word ld,word ex);
unsigned char RISCOStoDOSattributes(word ROSattr);
word DOStoRISCOSattributes(DOS_direntry *dentry);
int wild_card_compare(char *fptr, char *gptr, char wcmult, char wcsing);
void map_FILE_ROStype(DOS_direntry *dentry,char* dosext,time5byte *le);

#endif
