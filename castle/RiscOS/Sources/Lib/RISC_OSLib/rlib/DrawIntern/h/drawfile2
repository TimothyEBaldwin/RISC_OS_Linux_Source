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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the "DrawFile" library for rendering RISCOS Draw files from applications *
 * in C. It may be used freely in the creation of programs for Archimedes.  *
 * It should be used with Acorn's C Compiler Release 2 or later.            *
 *                                                                          *
 * No support can be given to programmers using this code and, while we     *
 * believe that it is correct, no correspondence can be entered into        *
 * concerning behaviour or bugs.                                            *
 *                                                                          *
 * Upgrades of this code may or may not appear, and while every effort will *
 * be made to keep such upgrades upwards compatible, no guarantees can be   *
 * given.                                                                   *
 ***************************************************************************/

/* -> h.DrawFile2 : general internal header for DrawFile module
 *
 * History:
 * Version 0.0: 22 Nov 88, DAHE: created
 * Version 0.1: 23 Nov 88, DAHE: first working version
 * Version 0.2: 15 Feb 89, DAHE: merged with stubs of other Draw headers
 * Version 0.3: 29 Apr 89, DAHE: unknown handle added
 *
 * Intended only to be included by the DrawFile code itself, not by clients
 * of the module.
 *
 * Header containing references based on definitions in DrawLevel0 and
 * DrawLevel1
 */

/*============================= Global data ==================================*/
extern draw_allocate Draw_allocator;
extern draw_extend   Draw_extender;
extern draw_free     Draw_freer;
extern draw_unknown_object_handler dr_unknown_handler;
extern void          *dr_unknown_handle;

/*============================ Private functions ============================*/

/* Functions defined in c.drawLevel0 or c.drawLevel1 */
BOOL dr_findFontTable(draw_diag *diag, draw_objptr *hdrptr);
BOOL dr_mergeFontTables(draw_diag *diag1, draw_objptr fontTable1,
                        draw_diag  *diag2, draw_objptr fontTable2,
                        int *table, draw_error *error);

/* Function defined in c.drawFiles */
BOOL  do_objects(draw_objptr hdrptr,draw_objptr limit, int orgx,int orgy,
                 int clip_x0,int clip_y0,int clip_x1,int clip_y1,
                 draw_error *err);
