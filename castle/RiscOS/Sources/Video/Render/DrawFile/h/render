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
#ifndef render_H
#define render_H

/*render.h - header file for drawfile*/

#ifndef os_H
   #include "os.h"
#endif

#ifndef drawfile_H
   #include "drawfile.h"
#endif

#ifndef callback_H
   #include "callback.h"
#endif

extern osbool render_can_blend;

extern os_error *render (bits, drawfile_diagram *, int, os_trfm *,
      os_box *, int);

extern callback_fn render_font_table;
extern callback_fn render_text;
extern callback_fn render_text_system;
extern callback_fn render_path;
extern callback_fn render_sprite;
extern callback_fn render_group;
extern callback_fn render_tagged;
extern callback_fn render_text_area;
extern callback_fn render_options;
extern callback_fn render_trfm_text;
extern callback_fn render_trfm_text_system;
extern callback_fn render_trfm_sprite;
extern callback_fn render_jpeg;

#endif
