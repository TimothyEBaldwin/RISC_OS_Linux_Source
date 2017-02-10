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
/* -> h.DrawTextC
 *
 * Header for text column/area functions in Draw
 *
 * Author:  David Elworthy
 * Version: 0.65
 * History: 0.62 - 12 June 1989 - header added. Old code weeded.
 *          0.64 - 20 June 1989 - new version of file loading
 *          0.65 - 23 June 1989 - name changes, functions moved
 *
 */

/* Current version of text columns */
#define draw_text_VERSION 1

extern char *draw_text_header; /* Standard header */

/* Header for text column objects */
void draw_text_bound_objtextcol(draw_objptr hdrptr);
void draw_text_bound_objtextarea(draw_objptr hdrptr);

os_error *draw_text_do_objtextcol
         (draw_objptr hdrptr, draw_objcoord *org /*, draw_bboxtyp *clip*/);
os_error *draw_text_do_objtextarea
         (draw_objptr hdrptr, draw_objcoord *org /*, draw_bboxtyp *clip*/);

BOOL draw_text_verifyTextArea (char *text, int length, int *areas,
    char *fontusetab);

BOOL draw_text_previous_textcolumn
              (diagrec *diag, int parent, draw_objcoord *pt, int *column_off);

draw_objptr  draw_text_findParent(draw_textcolhdr *from);

/* Test if object has a single column */
#define draw_text_oneColumn(obj)  \
(*(int *)(obj.bytep + sizeof(draw_textareahdr) + sizeof(draw_textcolhdr)) == 0)

void draw_text_rebound(draw_objptr hdrptr);
BOOL draw_text_parentSelected(draw_objptr parent);

draw_textareaend *draw_text_findEnd(draw_objptr hdrptr);

BOOL draw_text_create(diagrec *diag, char **text, int length,
                      int columns, draw_objcoord *mouse);
