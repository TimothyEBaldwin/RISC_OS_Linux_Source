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
#ifndef sprwindow_H
#define sprwindow_H

/* > h.SprWindow */
/*
 *  Type declarations for the sprite window handling in the Paint program
 *
 */

extern main_template sprwindow_template;
extern void sprwindow_new (main_sprite *);
extern void sprwindow_delete (main_window *);
extern void sprwindow_set_work_extent(main_window *, BOOL);
extern void sprwindow_scroll (main_window *window, int scrollx, int scrolly);
extern void sprwindow_stop_scroll (void);
extern void sprwindow_swap_output_to_sprite (main_sprite *);
extern void sprwindow_remove_wastage (main_sprite *);
extern int sprwindow_swap_output_to_mask (main_sprite *, int);
extern void sprwindow_swap_output_to_screen (void);
extern void sprwindow_redisplay (main_sprite *, wimp_box *);
extern void sprwindow_invalidate (main_sprite *);
extern void sprwindow_claim_idle_events (main_window *);
extern void sprwindow_release_idle_events (main_sprite *);
extern void sprwindow_event_handler (wimp_eventstr *, void *);
extern void sprwindow_set_window_titles (main_sprite *);

#define sprwindow_MIN_GRID 4

#endif
