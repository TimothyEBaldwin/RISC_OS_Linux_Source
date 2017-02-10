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
/* -> h.txtfile
 * Title: txtfile.h
 * Purpose: Search text for string.
 * Author: AFP
 * Status: system-independent
 * Requires:
 *   h.txt
 *   h.txtdat
 * History:
 *   16 July 87 -- started
 *   17 December 87: AFP: converted into C.
 */

void txtfile_buildnewtimestamp(typdat oldty, typdat *newty);
/* build a stamp with the current time/date and old type */

BOOL txtfile_insert(txt t, char *filename, int length, typdat *ty /*out*/);
/* Insert the contents of the named file, returning TRUE if successful. If
you know the length of the file then pass it in length, else set length to
-1. The type/date words will be written to *ty, if successful. */

int txtfile_saverange(txt t, char *filename, typdat ty, txt_index from, txt_index to);
/* Save the given range of text, using the given type/date stamp. */

#if BASIC
BOOL txtfile_basicimport(txtedit_state *s, BOOL insrep, int detokenise, BOOL strip);
/* import some BASIC into the txt. */

BOOL txtfile_basicinsert(txt t, char *filename, int l, typdat *ty, int detokenise, BOOL strip);
/* insert a BASIC file into the txt. */

BOOL txtfile_basicsenderproc(txt t, int *maxbuf, txt_index from, txt_index to, int tokenise, int increment);
/* export some BASIC from the txt. */

BOOL txtfile_savebasicrange(txt t, char *filename, typdat ty, txt_index from, txt_index to, int tokenise, int increment);
/* export to a BASIC file from the txt. */
#endif
