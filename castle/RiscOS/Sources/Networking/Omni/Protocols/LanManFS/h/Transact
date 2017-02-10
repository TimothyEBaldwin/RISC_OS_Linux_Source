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
*
*  Transact.h  -- SMB Transact and Transact2 related support routines
*
*  08-12-98 sbrodie  Original
*
*/

typedef struct ActiveShare  *hSHARE;

#define SEARCH_ST_SIZE  21
typedef struct {
  /* Common state */
  hSHARE search_drive;
  struct TransactParms tp;
  char   dir_path[DOS_NAME_LEN];
  DWORD  resume_key;
  DWORD  resume_fake;
  bool   resume_key_stuck;
  bool   resume_key_encountered;
  WORD   dir_handle;
  bool   dir_handle_valid;
  DWORD  actual_resume_key;
  char   resume_file_name[DOS_NAME_LEN];
  /* Cached state for short names */
  BYTE   resume_state[SEARCH_ST_SIZE];
} Transact_SearchContext;

extern void Transact_addword(struct TransactParms *TP, int value);
extern void Transact_addlong(struct TransactParms *TP, long value);
extern void Transact_addstring(struct TransactParms *TP, const char *str);

extern WORD Transact_getword(BYTE *p);
extern DWORD Transact_getlong(BYTE *p);
extern BYTE *Transact_getpointer(struct TransactParms *TP, BYTE *p);

extern void Transact_addsetupword(struct TransactParms *TP, int value);

/* The following function is used only by TRANSACT2_FSCTL - beware of
 * the length limit on path - see define for MAX_SETUPWORDS in SMB.h */
extern void Transact_addroutepath(struct TransactParms *TP, const char *path);

extern void Transact_init(struct TransactParms *TP, int ret_param_len);
