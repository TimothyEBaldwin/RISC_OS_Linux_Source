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
/* -> h.DrawTrans
 *
 * Header for transformation functions in Draw
 *
 * Author:  David Elworthy
 * Version: 0.11
 * History: 0.10 - 13 July 1989 - created from h.drawselect
 *          0.11 - 25 July 1989 - rehack to allow scale origin to be passed
 *
 */

/* Type used for scaling operation */
typedef struct
{
  double old_Dx, old_Dy;       /* cast versions of scale_str values */
  double new_Dx, new_Dy;
  union
  {
    struct
    {
      unsigned int dolines : 1;    /* 1 = scale line widths by x amount */
      unsigned int dobody  : 1;    /* 1 = scale all of object */
    } flags;
    int i;
  } u;
} draw_trans_scale_str;

typedef struct
{
  double sin_theta, cos_theta;
} draw_trans_rotate_str;

/*
   start and end parameters have the same specification to those used in the
   object traversal functions (see h.drawScan for details), with -1 used in
   place of NULL.
*/
void draw_trans_translate(diagrec *diag, int start, int end,
                          trans_str *trans);
void draw_trans_translate_without_undo(diagrec *diag, int start, int end,
                                       trans_str *trans);
void draw_trans_rotate(diagrec *diag, int start, int end,
                       draw_trans_rotate_str *rotate);
void draw_trans_scale(diagrec *diag, int start, int end,
                      draw_trans_scale_str *scale);

void draw_trans_gridsnap_selection(viewrec *vuue);
