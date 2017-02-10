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
/* -> h.DrawEdit
 *
 * Header for object edit functions in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.12
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.11 - 26 June 1989 - name changes
 *          0.12 -  7 July 1989 - path snap added.
 *
 */

typedef enum
{ class_TEXT   = 0x001,
  class_PATH   = 0x002,
  class_SPRITE = 0x004,

  class_GROUP  = 0x100
} class;

/* Routines to process mouse button clicks */
extern void draw_edit_select (diagrec *diag);

extern void draw_edit_adjust (diagrec *diag, draw_objcoord *pt);

extern void draw_edit_longadjust (diagrec *diag,viewrec *vuue,
    draw_objcoord *pt);

extern void draw_edit_long_shift_adjust (diagrec *diag,viewrec *vuue,
    draw_objcoord *pt);

extern void draw_edit_doubleadjust (diagrec *diag,draw_objcoord *pt);

extern void draw_edit_editobject (diagrec *diag,int obj_off); /*edit given
    path */

extern int draw_edit_got_pathelement (diagrec *diag); /*with path element
    highlighted*/

extern BOOL draw_edit_findsubpathend (diagrec *diag, int *lastele_offp,
    int *close_offp);

/* Called by drawMenu in response to menu entry clicks */
extern os_error *draw_edit_changelinecurve (diagrec *diag,
    drawmod_path_tagtype tag);

extern os_error *draw_edit_addpoint (diagrec *diag);

extern os_error *draw_edit_deletesegment (diagrec *diag);

extern os_error *draw_edit_flatten_join (diagrec *diag);

extern os_error *draw_edit_openpath (diagrec *diag,viewrec *vuue);

extern os_error *draw_edit_closepath (diagrec *diag);

extern os_error *draw_edit_adjustpoint (diagrec *diag);

extern os_error *draw_edit_snappath (diagrec *diag, viewrec *vuue);

extern void draw_edit_claim_edit (diagrec *diag);

extern void draw_edit_release_edit (diagrec *diag);

extern void draw_edit_text (diagrec *diag, int obj_off);
