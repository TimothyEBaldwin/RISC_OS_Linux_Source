#ifndef colourmap_H
#define colourmap_H

/* C header file for ColourMap
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:27 2007
 * Tom Hughes, tom@compton.nu, 29 June 2003
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ColourMap_Start
#define ColourMap_Start                         0x567C0
#undef  XColourMap_Start
#define XColourMap_Start                        0x767C0
#undef  ColourMap_ApplyMapping
#define ColourMap_ApplyMapping                  0x567C1
#undef  XColourMap_ApplyMapping
#define XColourMap_ApplyMapping                 0x767C1
#undef  ColourMapApplyMapping_User
#define ColourMapApplyMapping_User              0x0
#undef  ColourMapApplyMapping_Identity
#define ColourMapApplyMapping_Identity          0x1
#undef  ColourMapApplyMapping_Invert
#define ColourMapApplyMapping_Invert            0x2
#undef  ColourMapApplyMapping_Monochrome
#define ColourMapApplyMapping_Monochrome        0x3
#undef  ColourMapApplyMapping_MonochromeAndScale
#define ColourMapApplyMapping_MonochromeAndScale 0x4
#undef  ColourMapApplyMapping_Gamma
#define ColourMapApplyMapping_Gamma             0x5
#undef  ColourMapApplyMapping_Contrast
#define ColourMapApplyMapping_Contrast          0x6
#undef  ColourMapApplyMapping_Brightness
#define ColourMapApplyMapping_Brightness        0x7
#undef  ColourMapApplyMapping_Blend
#define ColourMapApplyMapping_Blend             0x8
#undef  ColourMap_End
#define ColourMap_End                           0x567C2
#undef  XColourMap_End
#define XColourMap_End                          0x767C2

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      colourmap_start()
 *
 * Description:   Initialise a block of memory for use as a ColourMap
 *                workspace - RISC O S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        size_used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C0.
 */

extern os_error *xcolourmap_start (bits flags,
      byte *workspace,
      int size,
      int *size_used);
extern int colourmap_start (bits flags,
      byte *workspace,
      int size);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_user()
 *
 * Description:   Apply a user colour mapping to a workspace - RISC O S
 *                4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                mapping - value of R3 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x0.
 */

extern os_error *xcolourmapapplymapping_user (bits flags,
      byte *workspace,
      int size,
      osspriteop_colour_mapping const *mapping,
      int *size_required);
extern int colourmapapplymapping_user (bits flags,
      byte *workspace,
      int size,
      osspriteop_colour_mapping const *mapping);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_identity()
 *
 * Description:   Apply an identity colour mapping to a workspace - RISC O
 *                S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x1.
 */

extern os_error *xcolourmapapplymapping_identity (bits flags,
      byte *workspace,
      int size,
      int *size_required);
extern int colourmapapplymapping_identity (bits flags,
      byte *workspace,
      int size);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_invert()
 *
 * Description:   Apply an inversion colour mapping to a workspace - RISC O
 *                S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x2.
 */

extern os_error *xcolourmapapplymapping_invert (bits flags,
      byte *workspace,
      int size,
      int *size_required);
extern int colourmapapplymapping_invert (bits flags,
      byte *workspace,
      int size);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_monochrome()
 *
 * Description:   Apply grey scale colour mapping to a workspace - RISC O S
 *                4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x3.
 */

extern os_error *xcolourmapapplymapping_monochrome (bits flags,
      byte *workspace,
      int size,
      int *size_required);
extern int colourmapapplymapping_monochrome (bits flags,
      byte *workspace,
      int size);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_monochrome_and_scale()
 *
 * Description:   Apply grey scale colour mapping to a workspace - RISC O S
 *                4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                black - value of R3 on entry
 *                white - value of R4 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x4.
 */

extern os_error *xcolourmapapplymapping_monochrome_and_scale (bits flags,
      byte *workspace,
      int size,
      os_colour black,
      os_colour white,
      int *size_required);
extern int colourmapapplymapping_monochrome_and_scale (bits flags,
      byte *workspace,
      int size,
      os_colour black,
      os_colour white);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_gamma()
 *
 * Description:   Apply gamma correction colour mapping to a workspace -
 *                RISC O S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                gamma_level - value of R3 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x5.
 */

extern os_error *xcolourmapapplymapping_gamma (bits flags,
      byte *workspace,
      int size,
      int gamma_level,
      int *size_required);
extern int colourmapapplymapping_gamma (bits flags,
      byte *workspace,
      int size,
      int gamma_level);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_contrast()
 *
 * Description:   Apply contrast adjustment colour mapping to a workspace -
 *                RISC O S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                factor - value of R3 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x6.
 */

extern os_error *xcolourmapapplymapping_contrast (bits flags,
      byte *workspace,
      int size,
      int factor,
      int *size_required);
extern int colourmapapplymapping_contrast (bits flags,
      byte *workspace,
      int size,
      int factor);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_brightness()
 *
 * Description:   Apply brightness adjustment colour mapping to a workspace
 *                - RISC O S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                offset - value of R3 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x7.
 */

extern os_error *xcolourmapapplymapping_brightness (bits flags,
      byte *workspace,
      int size,
      int offset,
      int *size_required);
extern int colourmapapplymapping_brightness (bits flags,
      byte *workspace,
      int size,
      int offset);

/* ------------------------------------------------------------------------
 * Function:      colourmapapplymapping_blend()
 *
 * Description:   Apply colour blend colour mapping to a workspace - RISC O
 *                S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *                colour - value of R3 on entry
 *                factor - value of R4 on entry
 *
 * Output:        size_required - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C1 with R0 |= 0x8.
 */

extern os_error *xcolourmapapplymapping_blend (bits flags,
      byte *workspace,
      int size,
      os_colour colour,
      int factor,
      int *size_required);
extern int colourmapapplymapping_blend (bits flags,
      byte *workspace,
      int size,
      os_colour colour,
      int factor);

/* ------------------------------------------------------------------------
 * Function:      colourmap_end()
 *
 * Description:   Build a colour mapping descriptor from a workspace - RISC
 *                O S 4.36+
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        mapping - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x567C2.
 */

extern os_error *xcolourmap_end (bits flags,
      byte *workspace,
      int size,
      osspriteop_colour_mapping **mapping);
__swi (0x567C2) osspriteop_colour_mapping *colourmap_end (bits flags,
      byte *workspace,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
