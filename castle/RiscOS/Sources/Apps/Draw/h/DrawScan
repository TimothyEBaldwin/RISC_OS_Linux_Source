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
/* -> h.DrawScan
 *
 * Header for object traversal functions in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.14
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.11 - 23 June 1989 - name changes
 *          0.12 - 11 July 1989 - extra handle added
 *          0.13 - 13 July 1989 - extra parameters
 *          0.14 - 11 Aug  1989 - undo parameter added
 *
 */

/* Despatch functions take an object pointer and a handle */
/* NULL means do nothing for this object type, except for groups, where it
   means recurse on the contents of the group. To do something to the group
   as well as recursing, specify your function and within that call
   draw_scan_traverse (for example)
   Despatch functions are passed a draw_objptr and a handle
 */
typedef void (*despatch_fn)();
typedef despatch_fn despatch_tab [draw_TAG_LIMIT];

/* Traverse function take either start and end object pointers:
  start  end
  NULL   NULL    iterate over selection
  NULL   !NULL   apply to the object at end only
  !NULL  NULL    iterate over the objects in the group at start
  !NULL  !NULL   iterate over start (inclusive) to end (exclusive)

  Redraw functions force the redraw in the specified diagram, or none, if
  NULL is given.
*/

void draw_scan_traverse(char *start, char *end,
                        despatch_tab arrayp, void *handle);

/* The undo parameter in the following two indicates that undo information is
to be written for the areas redrawn */

void draw_scan_traverse_withredraw(char *start, char *end, diagrec *diag,
                                   despatch_tab arrayp,void *handle,
                                   BOOL undo);
void draw_scan_traverse_splitredraw(char *start, char *end, diagrec *diag,
                                    despatch_tab arrayp, void *handle,
                                    BOOL undo);

/* Alternative way for a single object */
void draw_scan_traverse_object(draw_objptr hdrptr,
                               despatch_tab arrayp, void *handle);
