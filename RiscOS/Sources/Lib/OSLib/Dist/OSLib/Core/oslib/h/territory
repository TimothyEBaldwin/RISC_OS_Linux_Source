#ifndef territory_H
#define territory_H

/* C header file for Territory
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 19 May 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Territory_Number
#define Territory_Number                        0x43040
#undef  XTerritory_Number
#define XTerritory_Number                       0x63040
#undef  Territory_Register
#define Territory_Register                      0x43041
#undef  XTerritory_Register
#define XTerritory_Register                     0x63041
#undef  Territory_Deregister
#define Territory_Deregister                    0x43042
#undef  XTerritory_Deregister
#define XTerritory_Deregister                   0x63042
#undef  Territory_NumberToName
#define Territory_NumberToName                  0x43043
#undef  XTerritory_NumberToName
#define XTerritory_NumberToName                 0x63043
#undef  Territory_Exists
#define Territory_Exists                        0x43044
#undef  XTerritory_Exists
#define XTerritory_Exists                       0x63044
#undef  Territory_AlphabetNumberToName
#define Territory_AlphabetNumberToName          0x43045
#undef  XTerritory_AlphabetNumberToName
#define XTerritory_AlphabetNumberToName         0x63045
#undef  Territory_SelectAlphabet
#define Territory_SelectAlphabet                0x43046
#undef  XTerritory_SelectAlphabet
#define XTerritory_SelectAlphabet               0x63046
#undef  Territory_SetTime
#define Territory_SetTime                       0x43047
#undef  XTerritory_SetTime
#define XTerritory_SetTime                      0x63047
#undef  Territory_ReadCurrentTimeZone
#define Territory_ReadCurrentTimeZone           0x43048
#undef  XTerritory_ReadCurrentTimeZone
#define XTerritory_ReadCurrentTimeZone          0x63048
#undef  Territory_ConvertTimeToUTCOrdinals
#define Territory_ConvertTimeToUTCOrdinals      0x43049
#undef  XTerritory_ConvertTimeToUTCOrdinals
#define XTerritory_ConvertTimeToUTCOrdinals     0x63049
#undef  Territory_ConvertTextToString
#define Territory_ConvertTextToString           0x43075
#undef  XTerritory_ConvertTextToString
#define XTerritory_ConvertTextToString          0x63075
#undef  Territory_ReadTimeZones
#define Territory_ReadTimeZones                 0x4304A
#undef  XTerritory_ReadTimeZones
#define XTerritory_ReadTimeZones                0x6304A
#undef  Territory_ConvertDateAndTime
#define Territory_ConvertDateAndTime            0x4304B
#undef  XTerritory_ConvertDateAndTime
#define XTerritory_ConvertDateAndTime           0x6304B
#undef  Territory_ConvertStandardDateAndTime
#define Territory_ConvertStandardDateAndTime    0x4304C
#undef  XTerritory_ConvertStandardDateAndTime
#define XTerritory_ConvertStandardDateAndTime   0x6304C
#undef  Territory_ConvertStandardDate
#define Territory_ConvertStandardDate           0x4304D
#undef  XTerritory_ConvertStandardDate
#define XTerritory_ConvertStandardDate          0x6304D
#undef  Territory_ConvertStandardTime
#define Territory_ConvertStandardTime           0x4304E
#undef  XTerritory_ConvertStandardTime
#define XTerritory_ConvertStandardTime          0x6304E
#undef  Territory_ConvertTimeToOrdinals
#define Territory_ConvertTimeToOrdinals         0x4304F
#undef  XTerritory_ConvertTimeToOrdinals
#define XTerritory_ConvertTimeToOrdinals        0x6304F
#undef  Territory_ConvertTimeStringToOrdinals
#define Territory_ConvertTimeStringToOrdinals   0x43050
#undef  XTerritory_ConvertTimeStringToOrdinals
#define XTerritory_ConvertTimeStringToOrdinals  0x63050
#undef  Territory_ConvertOrdinalsToTime
#define Territory_ConvertOrdinalsToTime         0x43051
#undef  XTerritory_ConvertOrdinalsToTime
#define XTerritory_ConvertOrdinalsToTime        0x63051
#undef  Territory_Alphabet
#define Territory_Alphabet                      0x43052
#undef  XTerritory_Alphabet
#define XTerritory_Alphabet                     0x63052
#undef  Territory_AlphabetIdentifier
#define Territory_AlphabetIdentifier            0x43053
#undef  XTerritory_AlphabetIdentifier
#define XTerritory_AlphabetIdentifier           0x63053
#undef  Territory_SelectKeyboardHandler
#define Territory_SelectKeyboardHandler         0x43054
#undef  XTerritory_SelectKeyboardHandler
#define XTerritory_SelectKeyboardHandler        0x63054
#undef  Territory_WriteDirection
#define Territory_WriteDirection                0x43055
#undef  XTerritory_WriteDirection
#define XTerritory_WriteDirection               0x63055
#undef  Territory_CharacterPropertyTable
#define Territory_CharacterPropertyTable        0x43056
#undef  XTerritory_CharacterPropertyTable
#define XTerritory_CharacterPropertyTable       0x63056
#undef  Territory_LowerCaseTable
#define Territory_LowerCaseTable                0x43057
#undef  XTerritory_LowerCaseTable
#define XTerritory_LowerCaseTable               0x63057
#undef  Territory_UpperCaseTable
#define Territory_UpperCaseTable                0x43058
#undef  XTerritory_UpperCaseTable
#define XTerritory_UpperCaseTable               0x63058
#undef  Territory_ControlTable
#define Territory_ControlTable                  0x43059
#undef  XTerritory_ControlTable
#define XTerritory_ControlTable                 0x63059
#undef  Territory_PlainTable
#define Territory_PlainTable                    0x4305A
#undef  XTerritory_PlainTable
#define XTerritory_PlainTable                   0x6305A
#undef  Territory_ValueTable
#define Territory_ValueTable                    0x4305B
#undef  XTerritory_ValueTable
#define XTerritory_ValueTable                   0x6305B
#undef  Territory_RepresentationTable
#define Territory_RepresentationTable           0x4305C
#undef  XTerritory_RepresentationTable
#define XTerritory_RepresentationTable          0x6305C
#undef  Territory_Collate
#define Territory_Collate                       0x4305D
#undef  XTerritory_Collate
#define XTerritory_Collate                      0x6305D
#undef  Territory_ReadSymbols
#define Territory_ReadSymbols                   0x4305E
#undef  XTerritory_ReadSymbols
#define XTerritory_ReadSymbols                  0x6305E
#undef  Territory_ReadBooleanSymbols
#define Territory_ReadBooleanSymbols            0x4305E
#undef  XTerritory_ReadBooleanSymbols
#define XTerritory_ReadBooleanSymbols           0x6305E
#undef  Territory_ReadIntegerSymbols
#define Territory_ReadIntegerSymbols            0x4305E
#undef  XTerritory_ReadIntegerSymbols
#define XTerritory_ReadIntegerSymbols           0x6305E
#undef  Territory_ReadStringSymbols
#define Territory_ReadStringSymbols             0x4305E
#undef  XTerritory_ReadStringSymbols
#define XTerritory_ReadStringSymbols            0x6305E
#undef  Territory_ReadCalendarInformation
#define Territory_ReadCalendarInformation       0x4305F
#undef  XTerritory_ReadCalendarInformation
#define XTerritory_ReadCalendarInformation      0x6305F
#undef  Territory_NameToNumber
#define Territory_NameToNumber                  0x43060
#undef  XTerritory_NameToNumber
#define XTerritory_NameToNumber                 0x63060
#undef  Territory_TransformString
#define Territory_TransformString               0x43061
#undef  XTerritory_TransformString
#define XTerritory_TransformString              0x63061
#undef  Service_TerritoryManagerLoaded
#define Service_TerritoryManagerLoaded          0x64
#undef  Service_TerritoryStarted
#define Service_TerritoryStarted                0x75

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct territory_data                   territory_data;
typedef struct territory_ordinals               territory_ordinals;
typedef struct territory_property_table         territory_property_table;
typedef struct territory_calendar               territory_calendar;

/********************
 * Type definitions *
 ********************/
typedef int territory_t;

typedef bits territory_collate_flags;

typedef int territory_alphabet_number;

struct territory_data
   {  void *e [43];
   };

struct territory_ordinals
   {  int centisecond;
      int second;
      int minute;
      int hour;
      int date;
      int month;
      int year;
      int weekday;
      int yearday;
   };

struct territory_property_table
   {  bits p [8];
   };

struct territory_calendar
   {  int first_working_day;
      int last_working_day;
      int month_count;
      int day_count;
      int pm_limit;
      int we_limit;
      int w3_limit;
      int dy_limit;
      int st_limit;
      int mo_limit;
      int m3_limit;
      int tz_limit;
   };

typedef bits territory_time_string_flags;

typedef bits territory_write_flags;

typedef int territory_character_property;

typedef int territory_symbol_no;

typedef int territory_symbol_currency_no;

/************************
 * Constant definitions *
 ************************/
#define territory_CURRENT                       ((territory_t) 0xFFFFFFFFu)
#define territory_UK                            ((territory_t) 0x1u)
#define territory_MASTER                        ((territory_t) 0x2u)
#define territory_COMPACT                       ((territory_t) 0x3u)
#define territory_ITALY                         ((territory_t) 0x4u)
#define territory_SPAIN                         ((territory_t) 0x5u)
#define territory_FRANCE                        ((territory_t) 0x6u)
#define territory_GERMANY                       ((territory_t) 0x7u)
#define territory_PORTUGAL                      ((territory_t) 0x8u)
#define territory_ESPERANTO                     ((territory_t) 0x9u)
#define territory_GREECE                        ((territory_t) 0xAu)
#define territory_SWEDEN                        ((territory_t) 0xBu)
#define territory_FINLAND                       ((territory_t) 0xCu)
#define territory_DENMARK                       ((territory_t) 0xEu)
#define territory_NORWAY                        ((territory_t) 0xFu)
#define territory_ICELAND                       ((territory_t) 0x10u)
#define territory_CANADA1                       ((territory_t) 0x11u)
#define territory_CANADA2                       ((territory_t) 0x12u)
#define territory_CANADA                        ((territory_t) 0x13u)
#define territory_TURKEY                        ((territory_t) 0x14u)
#define territory_ARABIC                        ((territory_t) 0x15u)
#define territory_IRELAND                       ((territory_t) 0x16u)
#define territory_HONG_KONG                     ((territory_t) 0x17u)
#define territory_RUSSIA                        ((territory_t) 0x18u)
#define territory_RUSSIA2                       ((territory_t) 0x19u)
#define territory_ISRAEL                        ((territory_t) 0x1Au)
#define territory_MEXICO                        ((territory_t) 0x1Bu)
#define territory_LATIM_AM                      ((territory_t) 0x1Cu)
#define territory_USA                           ((territory_t) 0x30u)
#define territory_IGNORE_CASE                   ((territory_collate_flags) 0x1u)
#define territory_IGNORE_ACCENT                 ((territory_collate_flags) 0x2u)
#define territory_ALPHABET_BFONT                ((territory_alphabet_number) 0x64u)
#define territory_ALPHABET_LATIN1               ((territory_alphabet_number) 0x65u)
#define territory_ALPHABET_LATIN2               ((territory_alphabet_number) 0x66u)
#define territory_ALPHABET_LATIN3               ((territory_alphabet_number) 0x67u)
#define territory_ALPHABET_LATIN4               ((territory_alphabet_number) 0x68u)
#define territory_ALPHABET_CYRILLIC             ((territory_alphabet_number) 0x69u)
#define territory_ALPHABET_ARABIC               ((territory_alphabet_number) 0x6Au)
#define territory_ALPHABET_GREEK                ((territory_alphabet_number) 0x6Bu)
#define territory_ALPHABET_HEBREW               ((territory_alphabet_number) 0x6Cu)
#define territory_ALPHABET_LATIN5               ((territory_alphabet_number) 0x6Du)
#define territory_ALPHABET_WELSH                ((territory_alphabet_number) 0x6Eu)
#define territory_ALPHABET_LATIN9               ((territory_alphabet_number) 0x70u)
#define territory_ALPHABET_LATIN6               ((territory_alphabet_number) 0x71u)
#define territory_ALPHABET_CYRILLIC2            ((territory_alphabet_number) 0x78u)
#define error_TERRITORY_BAD_SWI                 0x43062u
#define error_TERRITORY_UNKNOWN                 0x190u
#define error_TERRITORY_UNKNOWN_ALPHABET        0x191u
#define error_NO_TERRITORY                      0x192u
#define territory_GIVEN_TIME                    ((territory_time_string_flags) 0x1u)
#define territory_GIVEN_DATE                    ((territory_time_string_flags) 0x2u)
#define territory_GIVEN_DATE_AND_TIME           ((territory_time_string_flags) 0x3u)
#define territory_WRITE_RIGHT_TO_LEFT           ((territory_write_flags) 0x1u)
#define territory_WRITE_BOTTOM_TO_TOP           ((territory_write_flags) 0x2u)
#define territory_WRITE_VERTICAL                ((territory_write_flags) 0x4u)
#define territory_PROPERTY_CONTROL              ((territory_character_property) 0x0u)
#define territory_PROPERTY_UPPERCASE            ((territory_character_property) 0x1u)
#define territory_PROPERTY_LOWERCASE            ((territory_character_property) 0x2u)
#define territory_PROPERTY_ALPHABETIC           ((territory_character_property) 0x3u)
#define territory_PROPERTY_PUNCTUATION          ((territory_character_property) 0x4u)
#define territory_PROPERTY_WHITESPACE           ((territory_character_property) 0x5u)
#define territory_PROPERTY_DIGIT                ((territory_character_property) 0x6u)
#define territory_PROPERTY_HEX_DIGIT            ((territory_character_property) 0x7u)
#define territory_PROPERTY_ACCENTED             ((territory_character_property) 0x8u)
#define territory_PROPERTY_FORWARD              ((territory_character_property) 0x9u)
#define territory_PROPERTY_REVERSE              ((territory_character_property) 0xAu)
#define territory_SYMBOL_DECIMAL_POINT          ((territory_symbol_no) 0x0u)
#define territory_SYMBOL_GROUP_SEPARATOR        ((territory_symbol_no) 0x1u)
#define territory_SYMBOL_GROUPING_LIST          ((territory_symbol_no) 0x2u)
#define territory_SYMBOL_INTERNATIONAL_CURRENCY_SYMBOL ((territory_symbol_no) 0x3u)
#define territory_SYMBOL_CURRENCY_SYMBOL        ((territory_symbol_no) 0x4u)
#define territory_SYMBOL_CURRENCY_POINT         ((territory_symbol_no) 0x5u)
#define territory_SYMBOL_CURRENCY_GROUP_SEPARATOR ((territory_symbol_no) 0x6u)
#define territory_SYMBOL_CURRENCY_GROUP_LIST    ((territory_symbol_no) 0x7u)
#define territory_SYMBOL_CURRENCY_PLUS_SIGN     ((territory_symbol_no) 0x8u)
#define territory_SYMBOL_CURRENCY_MINUS_SIGN    ((territory_symbol_no) 0x9u)
#define territory_SYMBOL_INTERNATIONAL_CURRENCY_PRECISION ((territory_symbol_no) 0xAu)
#define territory_SYMBOL_CURRENCY_PRECISION     ((territory_symbol_no) 0xBu)
#define territory_SYMBOL_CURRENCY_SYMBOL_PRECEDES_NON_NEGATIVE_VALUE ((territory_symbol_no) 0xCu)
#define territory_SYMBOL_CURRENCY_SYMBOL_SEPARATED_FROM_NON_NEGATIVE_VALUE ((territory_symbol_no) 0xDu)
#define territory_SYMBOL_CURRENCY_SYMBOL_PRECEDES_NEGATIVE_VALUE ((territory_symbol_no) 0xEu)
#define territory_SYMBOL_CURRENCY_SYMBOL_SEPARATED_FROM_NEGATIVE_VALUE ((territory_symbol_no) 0xFu)
#define territory_SYMBOL_CURRENCY_NON_NEGATIVE_FORMAT ((territory_symbol_no) 0x10u)
#define territory_SYMBOL_CURRENCY_NEGATIVE_FORMAT ((territory_symbol_no) 0x11u)
#define territory_SYMBOL_LIST_SEPARATOR         ((territory_symbol_no) 0x12u)
#define territory_SYMBOL_PARENTHESISED          ((territory_symbol_currency_no) 0x0u)
#define territory_SYMBOL_SIGN_PRECEDES          ((territory_symbol_currency_no) 0x1u)
#define territory_SYMBOL_SIGN_SUCCEEDS          ((territory_symbol_currency_no) 0x2u)
#define territory_SYMBOL_SIGN_IMMEDIATELY_PRECEDES ((territory_symbol_currency_no) 0x3u)
#define territory_SYMBOL_SIGN_IMMEDIATELY_SUCCEEDS ((territory_symbol_currency_no) 0x4u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      territory_number()
 *
 * Description:   Returns the territory number of the current territory
 *
 * Output:        territory - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43040.
 */

extern os_error *xterritory_number (territory_t *territory);
__swi (0x43040) territory_t territory_number (void);

/* ------------------------------------------------------------------------
 * Function:      territory_register()
 *
 * Description:   Adds the given territory to the list of active
 *                territories
 *
 * Input:         territory - value of R0 on entry
 *                entries - value of R1 on entry
 *                workspace - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x43041.
 */

extern os_error *xterritory_register (territory_t territory,
      territory_data const *entries,
      void *workspace);
__swi (0x43041) void territory_register (territory_t territory,
      territory_data const *entries,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      territory_deregister()
 *
 * Description:   Removes the given territory from the list of active
 *                territories
 *
 * Input:         territory - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x43042.
 */

extern os_error *xterritory_deregister (territory_t territory);
__swi (0x43042) void territory_deregister (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_number_to_name()
 *
 * Description:   Returns the name of a given territory
 *
 * Input:         territory - value of R0 on entry
 *                name - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x43043.
 */

extern os_error *xterritory_number_to_name (territory_t territory,
      char *name,
      int size);
__swi (0x43043) void territory_number_to_name (territory_t territory,
      char *name,
      int size);

/* ------------------------------------------------------------------------
 * Function:      territory_exists()
 *
 * Description:   Checks if the given territory is currently present in the
 *                machine
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x43044.
 */

extern os_error *xterritory_exists (territory_t territory,
      bits *psr);
extern bits territory_exists (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_alphabet_number_to_name()
 *
 * Description:   Returns the name of the given alphabet
 *
 * Input:         alphabet - value of R0 on entry
 *                name - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x43045.
 */

extern os_error *xterritory_alphabet_number_to_name (territory_alphabet_number alphabet,
      char *name,
      int size);
__swi (0x43045) void territory_alphabet_number_to_name (territory_alphabet_number alphabet,
      char *name,
      int size);

/* ------------------------------------------------------------------------
 * Function:      territory_select_alphabet()
 *
 * Description:   Selects the correct alphabet for the given territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x43046.
 */

extern os_error *xterritory_select_alphabet (territory_t territory);
__swi (0x43046) void territory_select_alphabet (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_set_time()
 *
 * Description:   Sets the clock to a given 5-byte UTC time
 *
 * Input:         date_and_time - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x43047.
 */

extern os_error *xterritory_set_time (os_date_and_time const *date_and_time);
__swi (0x43047) void territory_set_time (os_date_and_time const *date_and_time);

/* ------------------------------------------------------------------------
 * Function:      territory_read_current_time_zone()
 *
 * Description:   Returns information on the current time zone
 *
 * Output:        timezone - value of R0 on exit
 *                offset - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x43048.
 */

extern os_error *xterritory_read_current_time_zone (char **timezone,
      int *offset);
extern void territory_read_current_time_zone (char **timezone,
      int *offset);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_time_to_utc_ordinals()
 *
 * Description:   Converts a 5-byte UTC time to UTC time ordinals
 *
 * Input:         date_and_time - value of R1 on entry
 *                ordinals - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x43049.
 */

extern os_error *xterritory_convert_time_to_utc_ordinals (os_date_and_time const *date_and_time,
      territory_ordinals *ordinals);
extern void territory_convert_time_to_utc_ordinals (os_date_and_time const *date_and_time,
      territory_ordinals *ordinals);

/* ------------------------------------------------------------------------
 * Function:      territory_read_time_zones()
 *
 * Description:   Returns information on the time zones for the given
 *                territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        timezone - value of R0 on exit
 *                dst_timezone - value of R1 on exit
 *                offset - value of R2 on exit
 *                dst_offset - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x4304A.
 */

extern os_error *xterritory_read_time_zones (territory_t territory,
      char **timezone,
      char **dst_timezone,
      int *offset,
      int *dst_offset);
extern void territory_read_time_zones (territory_t territory,
      char **timezone,
      char **dst_timezone,
      int *offset,
      int *dst_offset);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_date_and_time()
 *
 * Description:   Converts a 5-byte UTC time into a string giving the date
 *                and time using a supplied format string
 *
 * Input:         territory - value of R0 on entry
 *                date_and_time - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                format - value of R4 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4304B.
 */

extern os_error *xterritory_convert_date_and_time (territory_t territory,
      os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char const *format,
      char **end);
extern char *territory_convert_date_and_time (territory_t territory,
      os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char const *format);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_standard_date_and_time()
 *
 * Description:   Converts a 5-byte UTC time into a string giving the date
 *                and time
 *
 * Input:         territory - value of R0 on entry
 *                date_and_time - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4304C.
 */

extern os_error *xterritory_convert_standard_date_and_time (territory_t territory,
      os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char **end);
extern char *territory_convert_standard_date_and_time (territory_t territory,
      os_date_and_time const *date_and_time,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_standard_date()
 *
 * Description:   Converts a 5-byte UTC time into a string giving the date
 *                only
 *
 * Input:         territory - value of R0 on entry
 *                date - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4304D.
 */

extern os_error *xterritory_convert_standard_date (territory_t territory,
      os_date_and_time const *date,
      char *buffer,
      int size,
      char **end);
extern char *territory_convert_standard_date (territory_t territory,
      os_date_and_time const *date,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_standard_time()
 *
 * Description:   Converts a 5-byte UTC time into a string giving the time
 *                only
 *
 * Input:         territory - value of R0 on entry
 *                time - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4304E.
 */

extern os_error *xterritory_convert_standard_time (territory_t territory,
      os_date_and_time const *time,
      char *buffer,
      int size,
      char **end);
extern char *territory_convert_standard_time (territory_t territory,
      os_date_and_time const *time,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_time_to_ordinals()
 *
 * Description:   Converts a 5-byte UTC time to local time ordinals for the
 *                given territory
 *
 * Input:         territory - value of R0 on entry
 *                date_and_time - value of R1 on entry
 *                ordinals - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4304F.
 */

extern os_error *xterritory_convert_time_to_ordinals (territory_t territory,
      os_date_and_time const *date_and_time,
      territory_ordinals *ordinals);
__swi (0x4304F) void territory_convert_time_to_ordinals (territory_t territory,
      os_date_and_time const *date_and_time,
      territory_ordinals *ordinals);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_time_string_to_ordinals()
 *
 * Description:   Converts a time string to time ordinals
 *
 * Input:         territory - value of R0 on entry
 *                format - value of R1 on entry
 *                t - value of R2 on entry
 *                ordinals - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x43050.
 */

extern os_error *xterritory_convert_time_string_to_ordinals (territory_t territory,
      territory_time_string_flags format,
      char const *t,
      territory_ordinals *ordinals);
__swi (0x43050) void territory_convert_time_string_to_ordinals (territory_t territory,
      territory_time_string_flags format,
      char const *t,
      territory_ordinals *ordinals);

/* ------------------------------------------------------------------------
 * Function:      territory_convert_ordinals_to_time()
 *
 * Description:   Converts local time ordinals for the given territory to a
 *                5-byte UTC time
 *
 * Input:         territory - value of R0 on entry
 *                buffer - value of R1 on entry
 *                ordinals - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x43051.
 */

extern os_error *xterritory_convert_ordinals_to_time (territory_t territory,
      os_date_and_time *buffer,
      territory_ordinals const *ordinals);
__swi (0x43051) void territory_convert_ordinals_to_time (territory_t territory,
      os_date_and_time *buffer,
      territory_ordinals const *ordinals);

/* ------------------------------------------------------------------------
 * Function:      territory_alphabet()
 *
 * Description:   Returns the alphabet number that should be selected for
 *                the given territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        alphabet - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43052.
 */

extern os_error *xterritory_alphabet (territory_t territory,
      territory_alphabet_number *alphabet);
__swi (0x43052) territory_alphabet_number territory_alphabet (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_alphabet_identifier()
 *
 * Description:   Returns an identifier string for the alphabet that should
 *                be used for the given territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        alphabet_name - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43053.
 */

extern os_error *xterritory_alphabet_identifier (territory_t territory,
      char **alphabet_name);
__swi (0x43053) char *territory_alphabet_identifier (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_select_keyboard_handler()
 *
 * Description:   Selects the keyboard handler for the given territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x43054.
 */

extern os_error *xterritory_select_keyboard_handler (territory_t territory);
__swi (0x43054) void territory_select_keyboard_handler (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_write_direction()
 *
 * Description:   Returns the direction of writing in the given territory
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43055.
 */

extern os_error *xterritory_write_direction (territory_t territory,
      territory_write_flags *flags);
__swi (0x43055) territory_write_flags territory_write_direction (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_character_property_table()
 *
 * Description:   Returns a pointer to a character property table
 *
 * Input:         territory - value of R0 on entry
 *                property - value of R1 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43056.
 */

extern os_error *xterritory_character_property_table (territory_t territory,
      territory_character_property property,
      territory_property_table **table);
__swi (0x43056) territory_property_table *territory_character_property_table (territory_t territory,
      territory_character_property property);

/* ------------------------------------------------------------------------
 * Function:      territory_lower_case_table()
 *
 * Description:   Returns a pointer to a lower case table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43057.
 */

extern os_error *xterritory_lower_case_table (territory_t territory,
      char **table);
__swi (0x43057) char *territory_lower_case_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_upper_case_table()
 *
 * Description:   Returns a pointer to an upper case table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43058.
 */

extern os_error *xterritory_upper_case_table (territory_t territory,
      char **table);
__swi (0x43058) char *territory_upper_case_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_control_table()
 *
 * Description:   Returns a pointer to a control character table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43059.
 */

extern os_error *xterritory_control_table (territory_t territory,
      char **table);
__swi (0x43059) char *territory_control_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_plain_table()
 *
 * Description:   Returns a pointer to a an unaccented character table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305A.
 */

extern os_error *xterritory_plain_table (territory_t territory,
      char **table);
__swi (0x4305A) char *territory_plain_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_value_table()
 *
 * Description:   Returns a pointer to a numeric value table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305B.
 */

extern os_error *xterritory_value_table (territory_t territory,
      char **table);
__swi (0x4305B) char *territory_value_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_representation_table()
 *
 * Description:   Returns a pointer to a numeric representation table
 *
 * Input:         territory - value of R0 on entry
 *
 * Output:        table - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305C.
 */

extern os_error *xterritory_representation_table (territory_t territory,
      char **table);
__swi (0x4305C) char *territory_representation_table (territory_t territory);

/* ------------------------------------------------------------------------
 * Function:      territory_collate()
 *
 * Description:   Compares two strings in the given territory's alphabet
 *
 * Input:         territory - value of R0 on entry
 *                s1 - value of R1 on entry
 *                s2 - value of R2 on entry
 *                flags - value of R3 on entry
 *
 * Output:        collate - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305D.
 */

extern os_error *xterritory_collate (territory_t territory,
      char const *s1,
      char const *s2,
      territory_collate_flags flags,
      int *collate);
__swi (0x4305D) int territory_collate (territory_t territory,
      char const *s1,
      char const *s2,
      territory_collate_flags flags);

/* ------------------------------------------------------------------------
 * Function:      territory_read_boolean_symbols()
 *
 * Description:   Returns various boolean information telling you how to
 *                format numbers
 *
 * Input:         territory - value of R0 on entry
 *                symbol_no - value of R1 on entry
 *
 * Output:        symbol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305E.
 */

extern os_error *xterritory_read_boolean_symbols (territory_t territory,
      territory_symbol_no symbol_no,
      osbool *symbol);
__swi (0x4305E) osbool territory_read_boolean_symbols (territory_t territory,
      territory_symbol_no symbol_no);

/* ------------------------------------------------------------------------
 * Function:      territory_read_integer_symbols()
 *
 * Description:   Returns various integer information telling you how to
 *                format numbers
 *
 * Input:         territory - value of R0 on entry
 *                symbol_no - value of R1 on entry
 *
 * Output:        symbol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305E.
 */

extern os_error *xterritory_read_integer_symbols (territory_t territory,
      territory_symbol_no symbol_no,
      int *symbol);
__swi (0x4305E) int territory_read_integer_symbols (territory_t territory,
      territory_symbol_no symbol_no);

/* ------------------------------------------------------------------------
 * Function:      territory_read_string_symbols()
 *
 * Description:   Returns various string information telling you how to
 *                format numbers
 *
 * Input:         territory - value of R0 on entry
 *                symbol_no - value of R1 on entry
 *
 * Output:        symbol - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4305E.
 */

extern os_error *xterritory_read_string_symbols (territory_t territory,
      territory_symbol_no symbol_no,
      char **symbol);
__swi (0x4305E) char *territory_read_string_symbols (territory_t territory,
      territory_symbol_no symbol_no);

/* ------------------------------------------------------------------------
 * Function:      territory_read_calendar_information()
 *
 * Description:   Returns various information about the given territory's
 *                calendar
 *
 * Input:         territory - value of R0 on entry
 *                date_and_time - value of R1 on entry
 *                calendar - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4305F.
 */

extern os_error *xterritory_read_calendar_information (territory_t territory,
      os_date_and_time const *date_and_time,
      territory_calendar *calendar);
__swi (0x4305F) void territory_read_calendar_information (territory_t territory,
      os_date_and_time const *date_and_time,
      territory_calendar *calendar);

/* ------------------------------------------------------------------------
 * Function:      territory_name_to_number()
 *
 * Description:   Returns the number of the given territory
 *
 * Input:         territory - value of R0 on entry
 *                name - value of R1 on entry
 *
 * Output:        territory_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43060.
 */

extern os_error *xterritory_name_to_number (territory_t territory,
      char const *name,
      territory_t *territory_out);
__swi (0x43060) territory_t territory_name_to_number (territory_t territory,
      char const *name);

/* ------------------------------------------------------------------------
 * Function:      territory_transform_string()
 *
 * Description:   Transforms a string to allow direct territory-independent
 *                string comparison
 *
 * Input:         territory - value of R0 on entry
 *                buffer - value of R1 on entry
 *                s - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43061.
 */

extern os_error *xterritory_transform_string (territory_t territory,
      char *buffer,
      char const *s,
      int size,
      int *used);
__swi (0x43061) int territory_transform_string (territory_t territory,
      char *buffer,
      char const *s,
      int size);

/* ------------------------------------------------------------------------
 * Function:      service_territory_manager_loaded()
 *
 * Description:   Tells territory modules to register themselves
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x64.
 */

extern os_error *xservice_territory_manager_loaded (void);
extern void service_territory_manager_loaded (void);

/* ------------------------------------------------------------------------
 * Function:      service_territory_started()
 *
 * Description:   New territory starting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x75.
 */

extern os_error *xservice_territory_started (void);
extern void service_territory_started (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
