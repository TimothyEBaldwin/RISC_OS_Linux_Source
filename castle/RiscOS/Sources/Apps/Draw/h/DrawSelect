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
/* -> h.DrawSelect
 *
 * Header for select functions in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.13
 * History: 0.11 - 12 June 1989 - header added. Old code weeded.
 *          0.12 - 23 June 1989 - name changes, functions moved
 *          0.13 - 13 July 1989 - functions moved to drawtrans
 *          0.14 - 13 Nov '89 J R C added draw_select_convert_to_paths
 *
 */

typedef struct
{ diagrec *owner;    /* current owner of selection (diag) */
  int indx;
  int limit;
  int array[default_SELECTIONSIZE];
} selection_str;

extern selection_str *draw_selection;

/* mouse buttons */
extern os_error *draw_select_select (diagrec *diag, draw_objcoord *pt);
extern void      draw_select_doubleselect (diagrec *diag, draw_objcoord *pt);
extern void      draw_select_longselect (diagrec *diag, viewrec *vuue,
                     draw_objcoord *pt, BOOL shifted);
extern os_error *draw_select_adjust (diagrec *diag, draw_objcoord *pt);
extern void      draw_select_longadjust (diagrec *diag, viewrec *vuue,
                     draw_objcoord *pt, BOOL shifted);
extern os_error *draw_select_object (diagrec *diag, int obj_off);
extern void      draw_deselect_object (diagrec *diag, int obj_off);

extern os_error *draw_select_selectall (diagrec *diag);
extern void      draw_select_clearall (diagrec *diag);
extern os_error *draw_select_action_ungroup (void);

extern os_error *draw_select_delete (diagrec *src);
extern os_error *draw_select_front (diagrec *src);
extern os_error *draw_select_back (diagrec *src);
extern os_error *draw_select_copy (diagrec *src, diagrec *dest,
                     trans_str *trans);
extern os_error *draw_select_group (diagrec *src);

extern void      draw_select_copydown (diagrec *diag, int from_off,
                     int to_off, int size);
extern void      draw_select_copyup  (diagrec *diag, int from_off,
                     int to_off, int size);

typedef enum
{ restyle_LINEWIDTH,
  restyle_LINECOLOUR,
  restyle_FILLCOLOUR,
  restyle_LINEPATTERN,
  restyle_LINEJOIN,
  restyle_LINESTARTCAP,
  restyle_LINEENDCAP,
  restyle_LINETRICAPWID,
  restyle_LINETRICAPHEI,
  restyle_LINEWINDING,
  restyle_TEXT,
  restyle_FONTFACE,
  restyle_FONTSIZE,       /* Changes both x and y */
  restyle_FONTSIZEY,      /* Changes y only */
  restyle_FONTCOLOUR,
  restyle_FONTBACKGROUND
} restyle_action;

extern void draw_select_restyle_selection (restyle_action, int);
extern void draw_select_restyle_object (draw_objptr, restyle_action, int);

extern void draw_select_selection_text (char *text);

extern void draw_select_justify_selection (int horz, int vert);
extern void draw_select_repattern_selection (draw_dashstr *pattern);
/* extern void draw_select_scalelinewidth_selection (double factor); */

extern BOOL draw_select_deselect_type (diagrec *diag, draw_tagtyp type);

extern void draw_select_interpolate (diagrec *diag, int levels, BOOL doughnut);
extern BOOL draw_select_may_grade (draw_objptr object);

extern void draw_select_claim_selection (diagrec *diag);
extern void draw_select_release_selection (diagrec *diag);

extern os_error *draw_select_capture_area (diagrec *diag, int toggle,
  captu_str box, BOOL overlap /*JRC 11 Oct 1990*/);

extern os_error *draw_select_checkspace (void);

/* Set selection diagram and clear indx without touching anything else */
extern void      draw_select_set (diagrec *diag);

/* Allocate initial selection array */
extern BOOL      draw_select_alloc (void);

/* Return TRUE if given diagram owns selection. */
extern BOOL      draw_select_owns (diagrec *diag);

/* Return a pointer to the ith selected object, NULL if none */
extern draw_objptr draw_select_find (int i);

/* Special functions used in undo */
extern os_error *draw_select_mark (int offset, BOOL select);
extern void      draw_select_marked (diagrec *diag, BOOL select);

extern void      draw_select_put_array (diagrec *diag, BOOL redraw);

extern void      draw_select_convert_to_paths (diagrec *);

extern os_error *draw_select_make_rotatable (diagrec *);

extern BOOL      draw_select_rotatable (diagrec *diag);
