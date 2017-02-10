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
/*
 * Purpose: Internal module within Texts module
 *          Window-system-dependent operations
 *          Arthur-specific module within Texts2.
 *          (A Close cover over Texts2, with some extras (e.g. SetOptions))
 * Author: WRS
 * Status: under development
 * Requires:
 *   h.txt
 *   define BOOL int
 * History:
 *   19th July 87 -- started
 *   02-Nov-87 -- changed to class-like form of window implementation
 *   16-Jan-88: WRS: converted to C
 *   14-Mar-88: WRS: font width and height separated.
 *   10-Feb-90: IDJ: added new fields to txtar_options for setting work area size
 */

BOOL txtar_initwindow(txt, char *title);
/* Add a window to the implementation of txt. See txt1 for
explanation of the mechanics of this. Returns FALSE if not enough
space. */

/* -------- Arthur-specific Display Options. -------- */

/* Some of these are not too Arthur-specific. The general format should be
followed by the matching interface for other systems. */

void txtar_clone_current_window(txt t);
/* The current primary window on t is a txtar one. Clone it, using the
txt3 facilities, resulting in two windows. They should divide up between
them the screen space that the old one used to occupy. */

typedef struct {
  BOOL fixfont;
  int forecolour;
  int backcolour;
  char fontname[100];
  int fontwidth; /* in points */
  int fontheight; /* in points */
  int leading; /* in OS-units */
  int margin; /* in OS-units */
  BOOL wraptowindow; /* Alternative is wrap at screen width */
#ifdef SET_MISC_OPTIONS
  int  overwrite;
  int  wordtab;
  int  wordwrap;
  int  undosize;
#endif
#ifdef BIG_WINDOWS
  BOOL big_windows;
  int  big_window_size;
#define BIG_WINDOW_SIZE_LIMIT 480 /* Measured in characters. Mostly arbitrary: the writable icon will
                                  limit you to 3 digits, the 16 bit offsets will limit you to
                                  2^14 (worst case when whole buffer gets expanded to '[hh]'), the
                                  VDU should be good to 2^15/(bbc_GCharSpaceX in EX2) = 8192 */
#endif
} txtar_options;
/* Future fields may be added to this record in the future. So, always
update using a get before a set. */

void txtar_getoptions(txt, txtar_options* /*out*/);
void txtar_setoptions(txt, txtar_options* /*in*/);

/* end */
