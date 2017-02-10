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
/* -> DrawMenu.h
 *
 * Header for menu functions in Draw.
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.10
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.20   22 Nov '89 - draw_current_options maintained here (new
 *                              routine draw_menu_entry_option (newstate,
 *                              curved, closed) added).
 *
 */

#define draw_menu_TEXT_LINE_LIMIT 255

extern menu draw_menu_mainmenu;

extern void draw_menu_toolbox_toggle (viewrec *vuue);

extern void draw_menu_maker(void); /*Construct a static skeleton*/

extern menu draw_menu_filler (void *); /*Tick/shade skeleton*/

extern void draw_menu_proc (void *, char *); /*Process the menu selection*/

extern void draw_menu_infoaboutprogram (void); /*Pop up progInfo template*/

extern int draw_menu_addfonttypeentry (char *name); /*Add name to fontcat*/

extern void draw_menu_kill (wimp_w window);

extern void draw_menu_processkeys (diagrec *diag, viewrec *vuue, int key);

extern void draw_menu_entry_option (draw_state newstate, int curved,
    int closed);
