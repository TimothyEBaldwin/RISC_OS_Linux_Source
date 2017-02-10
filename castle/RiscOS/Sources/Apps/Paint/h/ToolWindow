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
#ifndef toolwindow_H
#define toolwindow_H

/* > h.ToolWindow
 */

typedef
  /*procedures to call to work a "tool" that operates on a sprite */
  struct toolwindow_block
  { void (*click_action)  (main_window *, wimp_mousestr *);
    void (*null_action)   (main_window *, wimp_mousestr *);
    void (*redraw_action) (main_window *, int, int);
    void (*stop_action)   (main_sprite *);
    char *description;
  }
  toolwindow_block;

extern toolwindow_block *toolwindow_current_tool;

extern int toolwindow_current_mode;

extern wimp_w toolwindow_handle;

extern void toolwindow_display (int);

extern void toolwindow_init (void);

extern void toolwindow_stop_all_tools (void);

extern void toolwindow_close (void);

#endif
