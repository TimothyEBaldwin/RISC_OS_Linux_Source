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
#ifndef psprite_H
#define psprite_H

/* > h.PSprite */
/*
 *  Type declarations for the sprite handling in the Paint program
 *
 * Name changed to avoid conflict with RISCOSlib
 */

typedef struct psprite_info
{ int width;
  int height;
  int mask;
  int mode;
  int palette;
  int size;
  char name[13];
  int truepalette;
} psprite_info;    /* N.B. starts with sprite_info */

extern int *psprite_std_palettes [2] [4];

extern int psprite_first (sprite_area **);

extern int psprite_next (sprite_area **, int);

extern main_sprite *psprite_new (int offset, int, main_file *);

extern void psprite_delete (main_window*, main_sprite *);

extern os_error *psprite_set_plot_info (main_file *);

extern os_error *psprite_set_colour_info (main_file *);

extern os_error *psprite_set_colour (main_sprite *);

extern os_error *psprite_set_default_translations (void);

extern os_error *psprite_plot_scaled (int, int, main_sprite *,
    main_scaling_block *, int);

extern os_error *psprite_plot_scaled_m (int, int, main_sprite *,
    main_scaling_block *, int, int maskreally);

extern os_error *psprite_plot_scaled_centred (int, int,
    main_sprite *, main_scaling_block *, int, int);

extern int psprite_read_size (main_sprite *, sprite_info *);

extern void psprite_recalculate_offsets (main_file *);

extern sprite_palflag psprite_haspal (main_sprite *);

extern BOOL psprite_hastruecolpal (main_sprite *);

extern int  psprite_palsize (main_sprite *);

extern BOOL psprite_hasmask (main_sprite *);

extern int psprite_size (int, int, int, BOOL, int);

extern void psprite_read_full_info (main_sprite *, psprite_info *);

extern sprite_header *psprite_address (main_sprite *);

extern void psprite_set_icon_scale (main_sprite *);

extern os_error *psprite_free_brush_blocks (void);

extern os_error *psprite_set_brush_colour_translations (void);

extern os_error *psprite_set_brush_translations (main_file *);

extern os_error *psprite_set_brush_translation (main_sprite *);

extern void psprite_ecf (int);

extern void psprite_setup_ecf (main_sprite *, int, main_sprite *);

extern main_sprite *psprite_find (char *, char *);

extern void psprite_set_ecf (main_sprite *, int, int);

extern os_error *psprite_plot_ecf_sprite (main_sprite *, int, int, int);

extern BOOL psprite_merge_area (main_window *, main_file *, sprite_area **);

extern void psprite_rotate (main_sprite *, int);

extern os_error *psprite_build_palette (main_sprite *, int **);

extern main_ttab *psprite_ttab_for_sprite (main_sprite *,
    int, int *);

extern main_ttab *psprite_ttab_new (main_sprite *,
    int, int *);

extern void psprite_drop_translation (main_ttab **);

extern void psprite_ttab_delete (main_ttab *);

extern void psprite_scale (main_sprite *, double, double);

extern void psprite_shear (main_sprite *, double);

extern void psprite_create_show (main_window *, BOOL, char *);

extern BOOL psprite_close_createbox (wimp_w);

extern char *psprite_get_colours(int mode);

typedef enum
{
  transparency_type_none,
  transparency_type_onoffmask,
  transparency_type_alphamask,
  transparency_type_alphachannel,
} transparency_type;

extern transparency_type psprite_transparency_type(main_sprite *spr);

#endif
