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
#ifndef menus_H
#define menus_H

/* > h.Menus
 *
 *  ArcPaint: Arthur 2 sprite editor
 *   Menu handling header
 *
 *  Author: A.P. Thompson
 */

#include "menu.h"
#include "print.h"

/*FIX G-RO-7139 JRC 17 Oct '91 New function to do real printing.*/
extern BOOL menus_do_print (main_sprite *);

extern void menus_file_handler (void *, char *);

extern void menus_sprite_handler (void *, char *);

extern menu menus_file_maker (void *);

extern menu menus_sprite_maker (void *);

extern void menus_icon_proc (void *, char *);

extern void menus_init (void);

extern int menus_ensure_size (sprite_area **, int);

extern BOOL menus_save_file (main_window *, int);

extern void menus_restart_tool (void);

extern void menus_insdel_frig (void);

extern void menus_file_has_changed (main_window *);

extern void menus_save_sprite (main_sprite *);

extern void menus_set_palette (main_sprite *, int, int *);

extern int menus_files_modified (void);

extern int menus_quit_okayed (int);

extern void menus_print_sprite (main_sprite *, int);

extern print_positionstr menus_print_where, menus_print_last_where;

extern void menus_hack_palette (main_sprite *);

extern void menus_sprite_new (main_window *, BOOL);

extern int menus_sprite_exists (sprite_area *, char *);

extern void menus_showmag (void *);

#endif
