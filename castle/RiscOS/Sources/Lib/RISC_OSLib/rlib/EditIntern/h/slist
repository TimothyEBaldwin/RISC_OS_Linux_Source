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
/* -> h.Slist
 * Title:       Slist - singly-linked lists
 * Author:      JGT (converted from MJJ)
 *              Copyright (C) 1988 Acorn Computers Limited
 */

#ifndef _Slist_h
#define _Slist_h

/* This is a generic package for handling singly-linked lists. The critical
 assumption is that the first item of a record to be added to the list is used
 as the link field. e.g.

 TYPE
   ListPtr = POINTER TO ListRec;
   ListRec = RECORD
     next: ListPtr;    (* 'Slist' can be used to chain 'ListRec' items *)
     ...blah blah...   (* on their 'next' field because it is the first *)
   END;                (* field in the record *)
  
*/

extern void * Slist_Add(void * listhead, void * newelement);
/* Adds 'newelement' to the front of the list whose head is 'listhead'
   Returns new value of listhead. */

extern void * Slist_AddE(void * listhead, void * newelement);
/* Adds 'newelement' to the end of the list whose head is 'listhead'.
   The link field of 'newelement' is set to NIL
   Returns new value of listhead. */

extern void * Slist_Remove(void * listhead, void * element);
/* Removes 'element' from the list whose head is 'listhead'
   Returns new value of listhead. */

extern void * Slist_JoinE(void * listhead, void * newlist);
/* Adds the list headed by 'newlist' to the end of 'listhead'
   Returns new value of listhead. */

#endif

/* End Slist.h */
