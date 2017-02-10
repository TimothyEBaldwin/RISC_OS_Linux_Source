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
/* -> h.DrawDispl
 *
 * Header for object display code in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.12
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.11 - 26 June 1989 - name changes
 *          0.12 - 05 Sept 1989 - do_objects uses offsets (safer than addresses)
 *
 */

extern double draw_displ_scalefactor;

extern os_error *draw_displ_do_printmargin (diagrec *diag, draw_objcoord *org);
extern os_error *draw_displ_show_printmargins (diagrec *diag);

extern os_error *draw_displ_do_objects (diagrec *diag, int offset, int end,
    draw_objcoord *org, draw_bboxtyp *clip);

extern void draw_displ_forceredraw (diagrec *diag);
extern void draw_displ_totalredraw (diagrec *diag);
extern void draw_displ_redrawarea (diagrec *diag, draw_bboxtyp *bboxp);
extern void draw_displ_redrawobject (diagrec *diag, int obj_off);
extern void draw_displ_redraw_one_title (viewrec *vuue);
extern void draw_displ_redrawtitle (diagrec *diag);

extern os_error *draw_displ_eor_skeleton (diagrec *diag);
extern os_error *draw_displ_paint_skeleton (diagrec *diag,
    draw_objcoord *org);

extern os_error *draw_displ_eor_currnext (diagrec *diag);
extern os_error *draw_displ_eor_prevcurr (diagrec *diag);
extern os_error *draw_displ_eor_cons2 (diagrec *diag);
extern os_error *draw_displ_eor_cons3 (diagrec *diag);
extern void draw_displ_eor_bbox (diagrec *diag, int /*obj_off*/);
extern os_error *draw_displ_eor_bboxes (diagrec *diag);
extern os_error *draw_displ_eor_capturebox (diagrec *diag);
extern os_error *draw_displ_eor_transboxes (diagrec *diag);
extern os_error *draw_displ_eor_rotatboxes (diagrec *diag);
extern os_error *draw_displ_eor_scaleboxes (diagrec *diag);
extern os_error *draw_displ_eor_grid (viewrec *vuue);
extern os_error *draw_displ_eor_highlightskeleton (diagrec *diag);
extern os_error *draw_displ_paint_bboxes (diagrec *diag,
    draw_objcoord *org);
extern os_error *draw_displ_paint_grid (viewrec *vuue, draw_objcoord *org,
    draw_bboxtyp clip);

#if 0 /*FIX RP-0161 JRC 21 Oct '91 Not needed*/
extern os_error *draw_displ_settruecolBG (int action, draw_coltyp colour);
    /* bg col */
#endif
extern os_error *draw_displ_setVDU5charsize (int xsize, int ysize, 
    int xspace, int yspace);

extern void draw_displ_unpackpathstyle (draw_objptr hdrptr, 
    drawmod_capjoinspec *jspecp);

extern int  draw_displ_lineheight (diagrec *diag);
extern void draw_displ_showcaret (viewrec *vuue);

extern void draw_displ_showcaret_if_up (diagrec *diag);

#ifndef USETAGBBOX
extern draw_bboxtyp *draw_displ_bbox (draw_objptr hdrptr);
#else
#define draw_displ_bbox(hdrptr) (&hdrptr.objhdrp->bbox)
#endif

#if (0)
  /* Report the scaling box for an object */
  extern void draw_displ_scalebox (draw_objptr hdrptr, scale_str *scale, 
      draw_bboxtyp *box);
#endif
