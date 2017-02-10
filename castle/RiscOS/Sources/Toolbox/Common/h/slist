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
typedef struct _SLIST {
  struct _SLIST *next;
  int    members[255];
} SList;

void *slist_add_new(void **_head,int size,char *tag);


void slist_delete_member(void **_head,void *member);


void *slist_find_member(void **_head,int field, int value);


void *slist_find_matched_member(void **_head,int (*func)(void *list,int value), int value);

void slist_delete_and_call(void **_head,void (*func)(void *value));
