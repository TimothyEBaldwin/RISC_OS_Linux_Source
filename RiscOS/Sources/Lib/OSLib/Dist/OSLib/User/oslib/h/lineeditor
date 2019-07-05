#ifndef lineeditor_H
#define lineeditor_H

/* C header file for LineEditor
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Christian Ludlam, <chris@recoil.org> 13-Feb-02 13:26
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  LineEditor_SetOptions
#define LineEditor_SetOptions                   0x83880
#undef  XLineEditor_SetOptions
#define XLineEditor_SetOptions                  0xA3880
#undef  LineEditor_GetOptions
#define LineEditor_GetOptions                   0x83881
#undef  XLineEditor_GetOptions
#define XLineEditor_GetOptions                  0xA3881
#undef  LineEditor_CreateBuffer
#define LineEditor_CreateBuffer                 0x83882
#undef  XLineEditor_CreateBuffer
#define XLineEditor_CreateBuffer                0xA3882
#undef  LineEditor_DeleteBuffer
#define LineEditor_DeleteBuffer                 0x83883
#undef  XLineEditor_DeleteBuffer
#define XLineEditor_DeleteBuffer                0xA3883
#undef  LineEditor_SetPos
#define LineEditor_SetPos                       0x83884
#undef  XLineEditor_SetPos
#define XLineEditor_SetPos                      0xA3884
#undef  LineEditor_GetPos
#define LineEditor_GetPos                       0x83885
#undef  XLineEditor_GetPos
#define XLineEditor_GetPos                      0xA3885
#undef  LineEditor_GetLine
#define LineEditor_GetLine                      0x83886
#undef  XLineEditor_GetLine
#define XLineEditor_GetLine                     0xA3886
#undef  LineEditor_AppendLine
#define LineEditor_AppendLine                   0x83887
#undef  XLineEditor_AppendLine
#define XLineEditor_AppendLine                  0xA3887
#undef  LineEditor_DeleteLine
#define LineEditor_DeleteLine                   0x83888
#undef  XLineEditor_DeleteLine
#define XLineEditor_DeleteLine                  0xA3888
#undef  LineEditor_ReadInfo
#define LineEditor_ReadInfo                     0x83889
#undef  XLineEditor_ReadInfo
#define XLineEditor_ReadInfo                    0xA3889
#undef  LineEditor_ReadLine
#define LineEditor_ReadLine                     0x8388A
#undef  XLineEditor_ReadLine
#define XLineEditor_ReadLine                    0xA388A
#undef  LineEditor_ReadLineGivenEcho
#define LineEditor_ReadLineGivenEcho            0x8388A
#undef  XLineEditor_ReadLineGivenEcho
#define XLineEditor_ReadLineGivenEcho           0xA388A
#undef  LineEditor_ReadLineSuppressInvalid
#define LineEditor_ReadLineSuppressInvalid      0x8388A
#undef  XLineEditor_ReadLineSuppressInvalid
#define XLineEditor_ReadLineSuppressInvalid     0xA388A
#undef  LineEditor_ReadLineGivenEchoSuppressInvalid
#define LineEditor_ReadLineGivenEchoSuppressInvalid 0x8388A
#undef  XLineEditor_ReadLineGivenEchoSuppressInvalid
#define XLineEditor_ReadLineGivenEchoSuppressInvalid 0xA388A

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct lineeditor_h_                    *lineeditor_h;

/********************
 * Type definitions *
 ********************/
typedef int lineeditor_length;

typedef int lineeditor_pos;

typedef int lineeditor_cursors;

typedef bits lineeditorsetoptions_flags;

/************************
 * Constant definitions *
 ************************/
#define lineeditor_UNKNOWN                      ((lineeditor_length) 0xFFFFFFFEu)
#define lineeditor_NO_EDIT                      ((lineeditor_length) 0xFFFFFFFFu)
#define lineeditor_END                          ((lineeditor_pos) 0x7FFFFFFFu)
#define lineeditor_PREVIOUS_WRAP                ((lineeditor_pos) 0x80000000u)
#define lineeditor_PREVIOUS_NO_WRAP             ((lineeditor_pos) 0x80000001u)
#define lineeditor_NEXT_NO_WRAP                 ((lineeditor_pos) 0x80000003u)
#define lineeditor_NEXT_WRAP                    ((lineeditor_pos) 0x80000002u)
#define lineeditor_BLOCK                        ((lineeditorcursors) 0x0u)
#define lineeditor_UNDERLINE                    ((lineeditorcursors) 0x1u)
#define lineeditor_STEADY                       ((lineeditorcursors) 0x0u)
#define lineeditor_FLASHING                     ((lineeditorcursors) 0x2u)
#define lineeditor_NORMAL_SHIFT                 0
#define lineeditor_OVERTYPE_SHIFT               8
#define lineeditor_LOCAL_TASKWINDOWS            ((lineeditorsetoptions_flags) 0x1u)
#define lineeditor_LOCAL_APPEND_DOTS            ((lineeditorsetoptions_flags) 0x2u)
#define lineeditor_LOCAL_OVERTYPE               ((lineeditorsetoptions_flags) 0x4u)
#define lineeditor_LOCAL_KEEP_DUPLICATES        ((lineeditorsetoptions_flags) 0x8u)
#define lineeditor_LOCAL_NO_TILDE               ((lineeditorsetoptions_flags) 0x10u)
#define lineeditor_LOCAL_NO_EVENTS              ((lineeditorsetoptions_flags) 0x20u)
#define lineeditor_LOCAL_NO_CIRCUMFLEX          ((lineeditorsetoptions_flags) 0x40u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      lineeditor_set_options()
 *
 * Description:   Sets the options used by LineEditoritor
 *
 * Input:         size - value of R0 on entry
 *                flags - value of R1 on entry
 *                min - value of R2 on entry
 *                max - value of R3 on entry
 *                cursors - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x83880.
 */

extern os_error *xlineeditor_set_options (int size,
      lineeditorsetoptions_flags flags,
      int min,
      int max,
      lineeditor_cursors cursors);
extern void lineeditor_set_options (int size,
      lineeditorsetoptions_flags flags,
      int min,
      int max,
      lineeditor_cursors cursors);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_get_options()
 *
 * Description:   Reads the options used by LineEditoritor
 *
 * Output:        size - value of R0 on exit
 *                flags - value of R1 on exit
 *                min - value of R2 on exit
 *                max - value of R3 on exit
 *                cursors - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x83881.
 */

extern os_error *xlineeditor_get_options (int *size,
      lineeditorsetoptions_flags *flags,
      int *min,
      int *max,
      lineeditor_cursors *cursors);
extern void lineeditor_get_options (int *size,
      lineeditorsetoptions_flags *flags,
      int *min,
      int *max,
      lineeditor_cursors *cursors);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_create_buffer()
 *
 * Description:   Creates a new private history buffer
 *
 * Input:         size - value of R0 on entry
 *                task - value of R1 on entry
 *                expansion - value of R2 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83882.
 */

extern os_error *xlineeditor_create_buffer (int size,
      wimp_t task,
      bits expansion,
      lineeditor_h *handle);
__swi (0x83882) lineeditor_h lineeditor_create_buffer (int size,
      wimp_t task,
      bits expansion);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_delete_buffer()
 *
 * Description:   Releases a private history buffer
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x83883.
 */

extern os_error *xlineeditor_delete_buffer (lineeditor_h handle);
__swi (0x83883) void lineeditor_delete_buffer (lineeditor_h handle);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_set_pos()
 *
 * Description:   Sets the position in the private history buffer
 *
 * Input:         handle - value of R0 on entry
 *                position - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x83884.
 */

extern os_error *xlineeditor_set_pos (lineeditor_h handle,
      lineeditor_pos position);
__swi (0x83884) void lineeditor_set_pos (lineeditor_h handle,
      lineeditor_pos position);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_get_pos()
 *
 * Description:   Reads the current position in the history buffer
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        position - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83885.
 */

extern os_error *xlineeditor_get_pos (lineeditor_h handle,
      lineeditor_pos *position);
__swi (0x83885) lineeditor_pos lineeditor_get_pos (lineeditor_h handle);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_get_line()
 *
 * Description:   Reads a line from the history buffer
 *
 * Input:         handle - value of R0 on entry
 *                buffer - value of R1 on entry
 *                length - value of R2 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83886.
 */

extern os_error *xlineeditor_get_line (lineeditor_h handle,
      char *buffer,
      int length,
      int *used);
extern int lineeditor_get_line (lineeditor_h handle,
      char *buffer,
      int length);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_append_line()
 *
 * Description:   Adds a line to the history buffer
 *
 * Input:         handle - value of R0 on entry
 *                line - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x83887.
 */

extern os_error *xlineeditor_append_line (lineeditor_h handle,
      char const *line);
__swi (0x83887) void lineeditor_append_line (lineeditor_h handle,
      char const *line);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_delete_line()
 *
 * Description:   Removes the last line from the history buffer
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x83888.
 */

extern os_error *xlineeditor_delete_line (lineeditor_h handle);
__swi (0x83888) void lineeditor_delete_line (lineeditor_h handle);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_read_info()
 *
 * Description:   Reads information about current LineEditoritor edits
 *
 * Input:         task_handle - value of R0 on entry
 *
 * Output:        length - value of R0 on exit
 *                pos - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83889.
 */

extern os_error *xlineeditor_read_info (wimp_t task_handle,
      lineeditor_length *length,
      int *pos);
extern int lineeditor_read_info (wimp_t task_handle,
      lineeditor_length *length);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_read_line()
 *
 * Description:   Reads a line of input with history
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                handle - value of R6 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x8388A with R5 = 0x0.
 */

extern os_error *xlineeditor_read_line (char *buffer,
      int size,
      char min_char,
      char max_char,
      lineeditor_h handle,
      int *used,
      bits *psr);
extern bits lineeditor_read_line (char *buffer,
      int size,
      char min_char,
      char max_char,
      lineeditor_h handle,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_read_line_given_echo()
 *
 * Description:   Reads a line of input with history, using the given echo
 *                character
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                echo - value of R4 on entry
 *                handle - value of R6 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x8388A with R5 = 0x1.
 */

extern os_error *xlineeditor_read_line_given_echo (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      lineeditor_h handle,
      int *used,
      bits *psr);
extern bits lineeditor_read_line_given_echo (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      lineeditor_h handle,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_read_line_suppress_invalid()
 *
 * Description:   Reads a line of input with history, not echoing invalid
 *                characters
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                handle - value of R6 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x8388A with R5 = 0x2.
 */

extern os_error *xlineeditor_read_line_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      lineeditor_h handle,
      int *used,
      bits *psr);
extern bits lineeditor_read_line_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      lineeditor_h handle,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      lineeditor_read_line_given_echo_suppress_invalid()
 *
 * Description:   Reads a line of input with history, using the given echo
 *                character and not echoing invalid characters
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                echo - value of R4 on entry
 *                handle - value of R6 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x8388A with R5 = 0x3.
 */

extern os_error *xlineeditor_read_line_given_echo_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      lineeditor_h handle,
      int *used,
      bits *psr);
extern bits lineeditor_read_line_given_echo_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      lineeditor_h handle,
      int *used);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
