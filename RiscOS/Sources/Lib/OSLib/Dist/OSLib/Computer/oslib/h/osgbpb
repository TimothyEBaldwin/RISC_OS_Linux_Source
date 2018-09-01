#ifndef osgbpb_H
#define osgbpb_H

/* C header file for OSGBPB
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_GBPB
#define OS_GBPB                                 0xC
#undef  XOS_GBPB
#define XOS_GBPB                                0x2000C
#undef  OSGBPB_WriteAt
#define OSGBPB_WriteAt                          0x1
#undef  OSGBPB_WriteAtW
#define OSGBPB_WriteAtW                         0x1
#undef  OSGBPB_Write
#define OSGBPB_Write                            0x2
#undef  OSGBPB_WriteW
#define OSGBPB_WriteW                           0x2
#undef  OSGBPB_ReadAt
#define OSGBPB_ReadAt                           0x3
#undef  OSGBPB_ReadAtW
#define OSGBPB_ReadAtW                          0x3
#undef  OSGBPB_Read
#define OSGBPB_Read                             0x4
#undef  OSGBPB_ReadW
#define OSGBPB_ReadW                            0x4
#undef  OSGBPB_ReadDiscName
#define OSGBPB_ReadDiscName                     0x5
#undef  OSGBPB_ReadCSDName
#define OSGBPB_ReadCSDName                      0x6
#undef  OSGBPB_ReadLibName
#define OSGBPB_ReadLibName                      0x7
#undef  OSGBPB_CSDEntries
#define OSGBPB_CSDEntries                       0x8
#undef  OSGBPB_DirEntries
#define OSGBPB_DirEntries                       0x9
#undef  OSGBPB_DirEntriesInfo
#define OSGBPB_DirEntriesInfo                   0xA
#undef  OSGBPB_DirEntriesSystemInfo
#define OSGBPB_DirEntriesSystemInfo             0xB
#undef  OSGBPB_DirEntriesInfoStamped
#define OSGBPB_DirEntriesInfoStamped            0xC
#undef  GBPBV
#define GBPBV                                   0xC

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct osgbpb_name                      osgbpb_name;
typedef struct osgbpb_name_base                 osgbpb_name_base;
typedef struct osgbpb_disc_name                 osgbpb_disc_name;
typedef struct osgbpb_dir_name                  osgbpb_dir_name;
typedef struct osgbpb_name_list                 osgbpb_name_list;
typedef struct osgbpb_name_list_base            osgbpb_name_list_base;
typedef struct osgbpb_info                      osgbpb_info;
typedef struct osgbpb_info_base                 osgbpb_info_base;
typedef struct osgbpb_system_info               osgbpb_system_info;
typedef struct osgbpb_system_info_base          osgbpb_system_info_base;
typedef struct osgbpb_info_stamped              osgbpb_info_stamped;
typedef struct osgbpb_info_stamped_base         osgbpb_info_stamped_base;
typedef struct osgbpb_string_list               osgbpb_string_list;
typedef struct osgbpb_string_list_base          osgbpb_string_list_base;
typedef struct osgbpb_info_list                 osgbpb_info_list;
typedef struct osgbpb_info_list_base            osgbpb_info_list_base;
typedef struct osgbpb_system_info_list          osgbpb_system_info_list;
typedef struct osgbpb_system_info_list_base     osgbpb_system_info_list_base;
typedef struct osgbpb_info_stamped_list         osgbpb_info_stamped_list;
typedef struct osgbpb_info_stamped_list_base    osgbpb_info_stamped_list_base;

/********************
 * Type definitions *
 ********************/
#define osgbpb_NAME_MEMBERS \
   byte count;

/* Base osgbpb_name structure without variable part */
struct osgbpb_name_base
   {  osgbpb_NAME_MEMBERS
   };

/* legacy structure */
struct osgbpb_name
   {  osgbpb_NAME_MEMBERS
      char c [UNKNOWN];
   };

#define osgbpb_NAME(N) \
   struct \
      {  osgbpb_NAME_MEMBERS \
         char c [N]; \
      }

#define osgbpb_SIZEOF_NAME(N) \
   (offsetof (osgbpb_name, c) + \
         (N)*sizeof ((osgbpb_name *) NULL)->c)

struct osgbpb_disc_name
   {  osgbpb_name name;
   };

struct osgbpb_dir_name
   {  byte reserved;
      osgbpb_name name;
   };

struct osgbpb_name_list
   {  osgbpb_name names [UNKNOWN];
   };

#define osgbpb_INFO_MEMBERS \
   bits load_addr; \
   bits exec_addr; \
   int size; \
   fileswitch_attr attr; \
   fileswitch_object_type obj_type;

/* Base osgbpb_info structure without variable part */
struct osgbpb_info_base
   {  osgbpb_INFO_MEMBERS
   };

/* legacy structure */
struct osgbpb_info
   {  osgbpb_INFO_MEMBERS
      char name [UNKNOWN];
   };

#define osgbpb_INFO(N) \
   struct \
      {  osgbpb_INFO_MEMBERS \
         char name [N]; \
      }

#define osgbpb_SIZEOF_INFO(N) \
   (offsetof (osgbpb_info, name) + \
         (N)*sizeof ((osgbpb_info *) NULL)->name)

#define osgbpb_SYSTEM_INFO_MEMBERS \
   bits load_addr; \
   bits exec_addr; \
   int size; \
   fileswitch_attr attr; \
   fileswitch_object_type obj_type; \
   int sin; \
   os_date_and_time stamp;

/* Base osgbpb_system_info structure without variable part */
struct osgbpb_system_info_base
   {  osgbpb_SYSTEM_INFO_MEMBERS
   };

/* legacy structure */
struct osgbpb_system_info
   {  osgbpb_SYSTEM_INFO_MEMBERS
      char name [UNKNOWN];
   };

#define osgbpb_SYSTEM_INFO(N) \
   struct \
      {  osgbpb_SYSTEM_INFO_MEMBERS \
         char name [N]; \
      }

#define osgbpb_SIZEOF_SYSTEM_INFO(N) \
   (offsetof (osgbpb_system_info, name) + \
         (N)*sizeof ((osgbpb_system_info *) NULL)->name)

#define osgbpb_INFO_STAMPED_MEMBERS \
   bits load_addr; \
   bits exec_addr; \
   int size; \
   fileswitch_attr attr; \
   fileswitch_object_type obj_type; \
   bits file_type;

/* Base osgbpb_info_stamped structure without variable part */
struct osgbpb_info_stamped_base
   {  osgbpb_INFO_STAMPED_MEMBERS
   };

/* legacy structure */
struct osgbpb_info_stamped
   {  osgbpb_INFO_STAMPED_MEMBERS
      char name [UNKNOWN];
   };

#define osgbpb_INFO_STAMPED(N) \
   struct \
      {  osgbpb_INFO_STAMPED_MEMBERS \
         char name [N]; \
      }

#define osgbpb_SIZEOF_INFO_STAMPED(N) \
   (offsetof (osgbpb_info_stamped, name) + \
         (N)*sizeof ((osgbpb_info_stamped *) NULL)->name)

struct osgbpb_string_list
   {  char names [UNKNOWN];
   };

struct osgbpb_info_list
   {  osgbpb_info info [UNKNOWN];
   };

struct osgbpb_system_info_list
   {  osgbpb_system_info info [UNKNOWN];
   };

struct osgbpb_info_stamped_list
   {  osgbpb_info_stamped info [UNKNOWN];
   };

typedef byte osgbpb_privilege;

/************************
 * Constant definitions *
 ************************/
#define osgbpb_PRIVILEGE_OWNER                  ((osgbpb_privilege) 0x0u)
#define osgbpb_PRIVILEGE_PUBLIC                 ((osgbpb_privilege) 0xFFu)
#define osgbpb_NO_MORE                          (-1)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osgbpb_write_at()
 *
 * Description:   Writes bytes to an open file at the specified file
 *                pointer. Prefer OSGBPB_WriteAtW
 *
 * Input:         file - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                ptr - value of R4 on entry
 *
 * Output:        unwritten - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x1.
 */

extern os_error *xosgbpb_write_at (os_f file,
      byte const *data,
      int size,
      int ptr,
      int *unwritten);
extern int osgbpb_write_at (os_f file,
      byte const *data,
      int size,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_write_atw()
 *
 * Description:   Writes bytes to an open file at the specified file
 *                pointer. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                ptr - value of R4 on entry
 *
 * Output:        unwritten - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x1.
 */

extern os_error *xosgbpb_write_atw (os_fw file,
      byte const *data,
      int size,
      int ptr,
      int *unwritten);
extern int osgbpb_write_atw (os_fw file,
      byte const *data,
      int size,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_write()
 *
 * Description:   Writes bytes to an open file. Prefer OSGBPB_WriteW
 *
 * Input:         file - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        unwritten - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x2.
 */

extern os_error *xosgbpb_write (os_f file,
      byte const *data,
      int size,
      int *unwritten);
extern int osgbpb_write (os_f file,
      byte const *data,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_writew()
 *
 * Description:   Writes bytes to an open file. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        unwritten - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x2.
 */

extern os_error *xosgbpb_writew (os_fw file,
      byte const *data,
      int size,
      int *unwritten);
extern int osgbpb_writew (os_fw file,
      byte const *data,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read_at()
 *
 * Description:   Reads bytes from an open file at the specified file
 *                pointer. Prefer OSGBPB_ReadAtW
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                ptr - value of R4 on entry
 *
 * Output:        unread - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x3.
 */

extern os_error *xosgbpb_read_at (os_f file,
      byte *buffer,
      int size,
      int ptr,
      int *unread);
extern int osgbpb_read_at (os_f file,
      byte *buffer,
      int size,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read_atw()
 *
 * Description:   Reads bytes from an open file at the specified file
 *                pointer. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                ptr - value of R4 on entry
 *
 * Output:        unread - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x3.
 */

extern os_error *xosgbpb_read_atw (os_fw file,
      byte *buffer,
      int size,
      int ptr,
      int *unread);
extern int osgbpb_read_atw (os_fw file,
      byte *buffer,
      int size,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read()
 *
 * Description:   Reads bytes from an open file. Prefer OSGBPB_ReadW
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        unread - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x4.
 */

extern os_error *xosgbpb_read (os_f file,
      byte *buffer,
      int size,
      int *unread);
extern int osgbpb_read (os_f file,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_readw()
 *
 * Description:   Reads bytes from an open file. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        unread - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x4.
 */

extern os_error *xosgbpb_readw (os_fw file,
      byte *buffer,
      int size,
      int *unread);
extern int osgbpb_readw (os_fw file,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read_disc_name()
 *
 * Description:   Reads the name and boot option of the disc which contains
 *                the CSD - prefer OSFSControl_CanonicalisePath and/or
 *                OSFSControl_ReadBootOption
 *
 * Input:         disc_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x5.
 */

extern os_error *xosgbpb_read_disc_name (osgbpb_disc_name *disc_name);
extern void osgbpb_read_disc_name (osgbpb_disc_name *disc_name);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read_csd_name()
 *
 * Description:   Reads the name and privilege status of the C S D - prefer
 *                OSFSControl_CanonicalisePath
 *
 * Input:         csd_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x6.
 */

extern os_error *xosgbpb_read_csd_name (osgbpb_dir_name *csd_name);
extern void osgbpb_read_csd_name (osgbpb_dir_name *csd_name);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_read_lib_name()
 *
 * Description:   Reads the name and privilege status of the library -
 *                prefer OSFSControl_CanonicalisePath
 *
 * Input:         lib_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x7.
 */

extern os_error *xosgbpb_read_lib_name (osgbpb_dir_name *lib_name);
extern void osgbpb_read_lib_name (osgbpb_dir_name *lib_name);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_csd_entries()
 *
 * Description:   Reads entries from the C S D - prefer OSGBPB_DirEntries
 *
 * Input:         name_list - value of R2 on entry
 *                count - value of R3 on entry
 *                context - value of R4 on entry
 *
 * Output:        unread - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x8.
 */

extern os_error *xosgbpb_csd_entries (osgbpb_name_list *name_list,
      int count,
      int context,
      int *unread,
      int *context_out);
extern int osgbpb_csd_entries (osgbpb_name_list *name_list,
      int count,
      int context,
      int *unread);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_dir_entries()
 *
 * Description:   Reads entries from a specified directory
 *
 * Input:         dir_name - value of R1 on entry
 *                name_list - value of R2 on entry
 *                count - value of R3 on entry
 *                context - value of R4 on entry
 *                size - value of R5 on entry
 *                entries - value of R6 on entry
 *
 * Output:        read_count - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0x9.
 */

extern os_error *xosgbpb_dir_entries (char const *dir_name,
      osgbpb_string_list *name_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count,
      int *context_out);
extern int osgbpb_dir_entries (char const *dir_name,
      osgbpb_string_list *name_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_dir_entries_info()
 *
 * Description:   Reads entries and file information from a specified
 *                directory
 *
 * Input:         dir_name - value of R1 on entry
 *                info_list - value of R2 on entry
 *                count - value of R3 on entry
 *                context - value of R4 on entry
 *                size - value of R5 on entry
 *                entries - value of R6 on entry
 *
 * Output:        read_count - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0xA.
 */

extern os_error *xosgbpb_dir_entries_info (char const *dir_name,
      osgbpb_info_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count,
      int *context_out);
extern int osgbpb_dir_entries_info (char const *dir_name,
      osgbpb_info_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_dir_entries_system_info()
 *
 * Description:   Reads entries and file information (including SIN) from a
 *                specified directory
 *
 * Input:         dir_name - value of R1 on entry
 *                info_list - value of R2 on entry
 *                count - value of R3 on entry
 *                context - value of R4 on entry
 *                size - value of R5 on entry
 *                entries - value of R6 on entry
 *
 * Output:        read_count - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0xB.
 */

extern os_error *xosgbpb_dir_entries_system_info (char const *dir_name,
      osgbpb_system_info_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count,
      int *context_out);
extern int osgbpb_dir_entries_system_info (char const *dir_name,
      osgbpb_system_info_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count);

/* ------------------------------------------------------------------------
 * Function:      osgbpb_dir_entries_info_stamped()
 *
 * Description:   Reads entries and file information (including file type)
 *                from a specified directory
 *
 * Input:         dir_name - value of R1 on entry
 *                info_list - value of R2 on entry
 *                count - value of R3 on entry
 *                context - value of R4 on entry
 *                size - value of R5 on entry
 *                entries - value of R6 on entry
 *
 * Output:        read_count - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC with R0 = 0xC.
 */

extern os_error *xosgbpb_dir_entries_info_stamped (char const *dir_name,
      osgbpb_info_stamped_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count,
      int *context_out);
extern int osgbpb_dir_entries_info_stamped (char const *dir_name,
      osgbpb_info_stamped_list *info_list,
      int count,
      int context,
      int size,
      char const *entries,
      int *read_count);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef osgbpb32_H
#include "oslib/osgbpb32.h"
#endif

#endif
