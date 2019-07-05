#ifndef serviceinternational_H
#define serviceinternational_H

/* C header file for ServiceInternational
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 Jun 1995
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

#ifndef territory_H
#include "oslib/territory.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Service_International
#define Service_International                   0x43
#undef  ServiceInternational_CountryNameToCountryNumber
#define ServiceInternational_CountryNameToCountryNumber 0x0
#undef  ServiceInternational_AlphabetNameToAlphabetNumber
#define ServiceInternational_AlphabetNameToAlphabetNumber 0x1
#undef  ServiceInternational_CountryNumberToCountryName
#define ServiceInternational_CountryNumberToCountryName 0x2
#undef  ServiceInternational_AlphabetNumberToAlphabetName
#define ServiceInternational_AlphabetNumberToAlphabetName 0x3
#undef  ServiceInternational_CountryNumberToAlphabetNumber
#define ServiceInternational_CountryNumberToAlphabetNumber 0x4
#undef  ServiceInternational_DefineChars
#define ServiceInternational_DefineChars        0x5
#undef  ServiceInternational_NewKeyboard
#define ServiceInternational_NewKeyboard        0x6
#undef  ServiceInternational_DefineUCSCharacter
#define ServiceInternational_DefineUCSCharacter 0x7
#undef  ServiceInternational_GetUCSConversionTable
#define ServiceInternational_GetUCSConversionTable 0x8

/************************
 * Constant definitions *
 ************************/
#define error_UNKNOWN_ALPHABET                  0x640u
      /*Unknown alphabet*/
#define error_UNKNOWN_COUNTRY                   0x641u
      /*Unknown country*/
#define error_UNKNOWN_KEYBOARD                  0x642u
      /*Unknown keyboard*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_country_name_to_country_number()
 *
 * Description:   Converts country name to country number
 *
 * Input:         country_name - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                country_no - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x0.
 */

extern os_error *xserviceinternational_country_name_to_country_number (char const *country_name,
      osbool *unclaimed,
      territory_t *country_no);
extern osbool serviceinternational_country_name_to_country_number (char const *country_name,
      territory_t *country_no);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_alphabet_name_to_alphabet_number()
 *
 * Description:   Converts alphabet name to alphabet number
 *
 * Input:         alphabet_name - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                alphabet_no - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x1.
 */

extern os_error *xserviceinternational_alphabet_name_to_alphabet_number (char const *alphabet_name,
      osbool *unclaimed,
      territory_alphabet_number *alphabet_no);
extern osbool serviceinternational_alphabet_name_to_alphabet_number (char const *alphabet_name,
      territory_alphabet_number *alphabet_no);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_country_number_to_country_name()
 *
 * Description:   Converts country number to country name
 *
 * Input:         country_no - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                used - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x2.
 */

extern os_error *xserviceinternational_country_number_to_country_name (territory_t country_no,
      char *buffer,
      int size,
      osbool *unclaimed,
      int *used);
extern osbool serviceinternational_country_number_to_country_name (territory_t country_no,
      char *buffer,
      int size,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_alphabet_number_to_alphabet_name()
 *
 * Description:   Converts alphabet number to alphabet name
 *
 * Input:         alphabet_no - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                used - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x3.
 */

extern os_error *xserviceinternational_alphabet_number_to_alphabet_name (territory_alphabet_number alphabet_no,
      char *buffer,
      int size,
      osbool *unclaimed,
      int *used);
extern osbool serviceinternational_alphabet_number_to_alphabet_name (territory_alphabet_number alphabet_no,
      char *buffer,
      int size,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_country_number_to_alphabet_number()
 *
 * Description:   Converts country number to alphabet number
 *
 * Input:         country_no - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                alphabet_no - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x4.
 */

extern os_error *xserviceinternational_country_number_to_alphabet_number (territory_t country_no,
      osbool *unclaimed,
      territory_alphabet_number *alphabet_no);
extern osbool serviceinternational_country_number_to_alphabet_number (territory_t country_no,
      territory_alphabet_number *alphabet_no);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_define_chars()
 *
 * Description:   Defines a range of characters from a given alphabet
 *                number
 *
 * Input:         alphabet_no - value of R3 on entry
 *                first - value of R4 on entry
 *                last - value of R5 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x5.
 */

extern os_error *xserviceinternational_define_chars (territory_alphabet_number alphabet_no,
      byte first,
      byte last,
      osbool *unclaimed);
extern osbool serviceinternational_define_chars (territory_alphabet_number alphabet_no,
      byte first,
      byte last);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_new_keyboard()
 *
 * Description:   Notification of a new keyboard selection
 *
 * Input:         keyboard_no - value of R3 on entry
 *                alphabet_no - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x6.
 */

extern os_error *xserviceinternational_new_keyboard (int keyboard_no,
      territory_alphabet_number alphabet_no);
extern void serviceinternational_new_keyboard (int keyboard_no,
      territory_alphabet_number alphabet_no);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_define_ucs_character()
 *
 * Description:   Defines a UCS character - RISC OS 5+
 *
 * Input:         char_index - value of R3 on entry
 *                ucs_charcode - value of R4 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x7.
 */

extern os_error *xserviceinternational_define_ucs_character (int char_index,
      int ucs_charcode,
      osbool *unclaimed);
extern osbool serviceinternational_define_ucs_character (int char_index,
      int ucs_charcode);

/* ------------------------------------------------------------------------
 * Function:      serviceinternational_get_ucs_conversion_table()
 *
 * Description:   Read UCS conversion table for given alphabet - RISC OS 5+
 *
 * Input:         alphabet_no - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                char_table - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x43, R2 = 0x8.
 */

extern os_error *xserviceinternational_get_ucs_conversion_table (int alphabet_no,
      osbool *unclaimed,
      void **char_table);
extern osbool serviceinternational_get_ucs_conversion_table (int alphabet_no,
      void **char_table);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
