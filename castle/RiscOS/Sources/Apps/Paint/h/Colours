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
#ifndef colours_H
#define colours_H

/* > colours.h
 */

extern void colours_delete_window (main_sprite *);

extern void colours_create_window (main_sprite *);

extern void colours_set_gcol (int, int, int);

extern void colours_set_sprite_gcol (main_colour, main_sprite *, int);

extern int colours_count (main_sprite *);

extern void colours_event_handler (wimp_eventstr *, void *);

extern void colours_set_extent (main_sprite *);

extern char colours_gcol_ttab [];

extern int colours_entry (int mode, int colour);

extern int colours_pack_alpha(main_sprite *spr, main_colour col);

extern sprite_colour colours_pack_colour(main_sprite *sprite, main_colour gcol);

extern main_colour colours_unpack_colour(main_sprite *spr, sprite_colour col);

extern sprite_maskstate colours_pack_mask(main_sprite *sprite, main_colour gcol);

extern main_colour colours_unpack_colour2(main_sprite *spr, sprite_colour col, sprite_maskstate mask);

#define colours_SIZE (3*main_FILER_TextWidth)

#endif
