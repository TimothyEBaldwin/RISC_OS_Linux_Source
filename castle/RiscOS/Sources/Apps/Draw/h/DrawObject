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
/* -> h.DrawObject
 *
 * Object handling header for Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.11
 * History: 0.10 - 19 June 1989 - created from h.draw 0.10 (12 June 1989)
 *          0.11 - 23 June 1989 - name changes, functions moved
 *
 */

/*--- General object handling ---*/
os_error *draw_obj_checkspace(diagrec *diag, int needed);
void      draw_obj_fileheader(diagrec *diag);
void      draw_obj_start(diagrec *diag, draw_tagtyp);

#if (0)
/* Not used anywhere */
extern void draw_obj_addcoord(diagrec *diag, coord, coord);
#endif

extern void draw_obj_fin(diagrec *diag);
extern void draw_obj_finish(diagrec *diag);
extern void draw_obj_complete(diagrec *diag);
extern void draw_obj_appendghost(diagrec *diag);
extern void draw_obj_flush(diagrec *diag);

extern int  draw_obj_next(diagrec *diag, int offset);

/*--- General box manipulation ---*/
extern void draw_obj_unify(draw_bboxtyp *to, draw_bboxtyp *from);

/*--- Database manipulation ---*/
extern os_error *draw_obj_makespace(diagrec *diag, int atoff, int size);
extern os_error *draw_obj_insert(diagrec *diag, int atoff, int size);
extern void      draw_obj_losespace(diagrec *diag, int atoff, int size);
extern void      draw_obj_delete(diagrec *diag, int atoff, int size);
extern void      draw_obj_delete_object(diagrec *diag);
extern void      draw_obj_deleteObject(diagrec *diag, int oldOffset, int newOffset);

/*--- Path manipulation ---*/
extern void draw_obj_addpath_move(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_addpath_line(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_addpath_curve(diagrec *diag, draw_objcoord *pt1,
                                           draw_objcoord *pt2,
                                           draw_objcoord *pt3);
extern void                 draw_obj_addpath_close(diagrec *diag);
extern void                 draw_obj_addpath_term(diagrec *diag);
extern drawmod_pathelemptr  draw_obj_pathstart(draw_objptr hdrptr);
extern draw_dashstr        *draw_obj_dashstart(draw_objptr hdrptr);

/*--- Text manipulation ---*/
extern void draw_obj_addstring(diagrec *diag, char *from);
extern void draw_obj_addtext_char(diagrec *diag, char ch);
extern int  draw_obj_findtext_len(diagrec *diag);
extern void draw_obj_addtext_term(diagrec *diag);
extern void draw_obj_deltext_char(diagrec *diag);

/*--- Object attributes ---*/
extern void draw_obj_settext_font(diagrec *diag, int fref, int fsizex, int fsizey);
extern void draw_obj_settext_colour(diagrec *diag, draw_coltyp textcolour,
                                            draw_coltyp background);
extern void draw_obj_setcoord(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_readcoord(diagrec *diag, draw_objcoord *blk);
extern void draw_obj_addfontentry(diagrec *diag, int ref, char *name);
extern void draw_obj_setpath_colours(diagrec *diag, draw_coltyp    fillcolour,
                                             draw_coltyp    linecolour,
                                             draw_pathwidth linewidth);
extern void draw_obj_setpath_style(diagrec *diag, draw_jointyp join,
                                           draw_captyp  startcap,
                                           draw_captyp  endcap,
                                           draw_windtyp windrule,
                                           int          tricapwid,
                                           int          tricaphei);
extern os_error *draw_obj_setpath_dashpattern(diagrec *diag, draw_dashstr *pattern);

/*--- Bounding box calculation ---*/
extern void draw_obj_bound_minmax(int x, int y, draw_bboxtyp *boundp);
extern void draw_obj_bound_minmax2(draw_objptr hdrptr, draw_bboxtyp *boundp);
extern BOOL draw_obj_findTextBox(draw_objptr hdrptr, draw_bboxtyp *box);
extern BOOL draw_obj_bound_object(draw_objptr hdrptr);
extern void draw_obj_bound_objects(diagrec *diag, int from, int to,draw_bboxtyp *box);
extern void draw_obj_bound_selection(draw_bboxtyp *boundp);
extern void draw_obj_bound_all(diagrec *diag, draw_bboxtyp *bboxp);
extern void draw_obj_bound_selection_width (int *widthp);

extern void draw_obj_get_box(draw_bboxtyp *box, draw_bboxtyp *bbox);

/*--- Object location ---*/
extern int  draw_obj_previous_object(diagrec *diag, int, draw_objcoord *pt);
extern void draw_obj_path_move(diagrec *diag, draw_objcoord *pt);
extern int  draw_obj_over_object(diagrec *diag, draw_objcoord *pt, region*, int*);

/*--- Metagraphic handling ---*/
extern void      draw_obj_move_construction(diagrec *diag, draw_objcoord *pt);
extern os_error *draw_obj_drop_construction(diagrec *diag);

/*--- Arcs ---*/
extern void draw_obj_addpath_centred_circle(diagrec *, draw_objcoord, int, int);

extern BOOL draw_obj_rotatable (draw_objptr);
