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
/* -> h.DrawAction
 *
 * Miscellaneous actions in Draw
 *
 * Author:  David Elworthy
 * Version: 0.12
 * History: 0.10 - 11 July 1989 - created
 *          0.11 - 13 Aug  1989 - box functions added
 *          0.12 - 26 Aug  1989 - paper functions added
 *
 */

/*------------------- Zooms --------------------*/
extern void draw_action_zoom(void /*zoomchangestr*/ *newzoom);
extern void draw_action_zoom_new(diagrec *diag, captu_str box);
extern void draw_action_zoom_alter(viewrec *vuue, int adjust);
extern void draw_action_zoom_view(viewrec *vuue);

/*---------------- Paper size and options -----------------*/
/* Calculate diagram parameters for given size and options */
extern void draw_action_set_papersize(diagrec *diag, papersize_typ    size,
                                              paperoptions_typ opt);

/* Change size and options which alter size */
extern void draw_action_resize(diagrec *diag, papersize_typ    size,
                                       paperoptions_typ opt);

/* Change options which don't alter size */
extern void draw_action_option(diagrec *diag, paperoptions_typ opt);

/*------------------- Boxes and coords --------------------*/

/* Find a box to test against */
extern void draw_box_get_test_box(draw_objcoord *pt, draw_bboxtyp *box);

/* returns TRUE, if point (x,y) is within box */
extern int draw_box_within(draw_objcoord *pt, draw_bboxtyp *box);

/* returns TRUE, if box1 overlaps box2 */
extern int draw_box_overlap(draw_bboxtyp *box1, draw_bboxtyp *box2);

/* returns TRUE, if box1 is inside box2. JRC 11 Oct 1990 */
extern int draw_box_inside (draw_bboxtyp *box1, draw_bboxtyp *box2);

extern void draw_action_swap_box (draw_bboxtyp *to, draw_bboxtyp *from);
