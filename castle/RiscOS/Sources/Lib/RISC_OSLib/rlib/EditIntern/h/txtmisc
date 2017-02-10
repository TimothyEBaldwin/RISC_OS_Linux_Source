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
/* -> h.txtmisc
 * Title: txtmisc.h
 * Purpose: Various facilities.
 * Author: AFP
 * Status: system-independent
 * Requires:
 *   h.txt
 * History:
 *   16 Jul 87 -- started
 *   18 Dec 87: AFP: converted into C.
 *   17 Mar 88: IGJ: txtmisc_formattxt added
 *    9 Jan 89: WRS: wordwrap in block ops.
 *    1 Jun 90: NDR: txtmisc_paraend, parastart, bop, eop, normalisepara
 */

#define WORDWRAP 1
/* 16-Dec-88 WRS: late experiment, not for release. */
/*  1-Jun-90 NDR: moved here from c.txtedit */

int txtmisc_alphach(char c);
/* a..z, A..Z or 192..255 (high ANSI chars) */

txt_index txtmisc_bow(txt t, txt_index i); /* beginning of word containing */
txt_index txtmisc_eow(txt t, txt_index i);
/* A word is a sequence of AlphaChs, followed by a sequence of non-AlphaChs.
EOW gets to the start of the next word. */

txt_index txtmisc_bol(txt t, txt_index i); /* beginning of line containing */
txt_index txtmisc_eol(txt t, txt_index i); /* end of line containing */

int txtmisc_bof(txt t); /* are we at beginning of file? */
int txtmisc_eof(txt t); /* are we at end of file? */

unsigned txtmisc_currentlinenumber(txt t);
void txtmisc_gotoline(txt t, unsigned l);
/* Line numbers start at 1, only NewLineCh separates lines. */

void txtmisc_tab(txt t);
/* A Twin-like Tab operation. The caret is moved horizontally, based
on the words in the line above. */

void txtmisc_tabcol(txt t);
/* Tab to next multiple of 8 columns by inserting spaces, except
that if at the end of a line, do it using txt_movehorizontal. */

void txtmisc_expandtabs(txt t);
/* Any literal tab characters in the Text are expanded to the right number of
spaces (assuming fixed font display). If the object was not already updated
then it is still marked as not updated */

void txtmisc_indentregion(txt t, txt_index from, txt_index to, int by,
                          char *with);

/* If by > 0 Inserts the first Min(by, Length(with)) chars of "with".
If by<0 then "with" is ignored, and that many chars are deleted. Blank
lines are not affected. "with" should not contain NewLineChs. */

void txtmisc_exchangecrlf(txt t);
/* Implemented by writing directly on the text object, so TextUndo.PreventUndo
is called at the end. */

void txtmisc_formattext(txt t, int width);
/* format text a la Twin - if a line is longer than 'width' characters split it
at word boundries by newlines, removing spaces, to give several lines of
'width' or less cols */

txt_index txtmisc_furthestaway(txt t, txt_index from, txt_index a1,
                                    txt_index a2);

/* one of a1 and a2, which "from" is furthest away from. */

void txtmisc_selectpointandword(txt t, txt_index point, txt_index word);
/* Set the selection to contain "point", and the word containing "word". */

void txtmisc_selectpointandline(txt t, txt_index point, txt_index line);
/* Set the selection to contain "point", and the line containing "line". */

void txtmisc_select3(txt t, txt_index a1, txt_index a2, txt_index a3);
/* Set the selection to contain all of a1-a3. */

/* --------- Wordwrap ------------------------ */

#if WORDWRAP
BOOL txtmisc_paraend(txt t, txt_index i);
BOOL txtmisc_parastart(txt t, txt_index i);
txt_index txtmisc_bop(txt t, txt_index i);
txt_index txtmisc_eop(txt t, txt_index i);
void txtmisc_normalisepara(txt t, int parawidth);
#endif
