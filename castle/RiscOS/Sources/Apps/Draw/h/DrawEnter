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
/* -> h.DrawEnter
 *
 * Header for object entry functions in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.11
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.11 - 23 June 1989 - name changed
 *
 */

typedef struct
{ diagrec *diag;
  viewrec *vuue;
  int      hand;
} null_owner_str;

extern null_owner_str draw_enter_null_owner;

typedef struct
{ diagrec *diag;
  viewrec *vuue;
  int      hand;
} focus_owner_str;

extern focus_owner_str draw_enter_focus_owner;

/* ------------------------------------------------------------------------- */

os_error *draw_enter_select(diagrec *diag,viewrec *vuue, draw_objcoord *pt);
os_error *draw_enter_doubleselect(diagrec *diag);
os_error *draw_enter_adjust(diagrec *diag, draw_objcoord *pt);
os_error *draw_enter_complete(diagrec *diag);
os_error *draw_enter_movepending(diagrec *diag);    /* Move within a path */
void     draw_enter_delete(diagrec *diag);

os_error *draw_enter_state_changelinecurve(diagrec *diag,
                                           drawmod_path_tagtype tag);
os_error *draw_enter_changelinecurve(diagrec *diag, int prevele_off,
                                    int currele_off, drawmod_path_tagtype tag);
os_error *draw_enter_changeToMove(diagrec *diag, int firstele_off,
                                  int currele_off);
void      draw_enter_straightcurve(diagrec *diag, int a_off,int b_off);

void      draw_enter_claim_nulls(diagrec *diag, viewrec *vuue);
void      draw_enter_release_nulls(diagrec *diag);

void      draw_enter_claim_focus(diagrec *diag, viewrec *vuue);
void      draw_enter_release_focus(void);

/* Claim both nulls and focus */
void      draw_enter_claim(diagrec *diag, viewrec *vuue);

void      draw_enter_fit_corner(diagrec *diag, int, int, int);

void draw_enter_fit_curvecurve(drawmod_pathelemptr a_p,
                               drawmod_pathelemptr b_p,
                               drawmod_pathelemptr c_p,
                               draw_objcoord *result);
