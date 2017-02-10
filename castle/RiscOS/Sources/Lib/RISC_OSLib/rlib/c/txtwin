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
/* ->c.txtwin
 * Purpose: control of multiple windows on Text objects.
 * Author: W. Stoye.
 * Status:
 *   system-independent
 *   experimental
 * History:
 *   03-Nov-87: started
 *   11-Jan-88: AFP: converted to C.
 *   02-Mar-88: WRS: use of BOOL
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include "trace.h"
#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "win.h"

#include "txt.h"
#include "EditIntern/txtundo.h"
#include "EditIntern/txt1.h"
#include "EditIntern/txt3.h"
#include "EditIntern/txtar.h"
#include "txtwin.h"

void txtwin_new(txt t)
{
  txtar_clone_current_window(t);
}

int txtwin_number(txt t)
{
  return t->nwindows;
}

void txtwin_dispose(txt t)
{
  if (t->nwindows > 1) {
    txt3_disposewindow(t, 1);
  };
}

void txtwin_setcurrentwindow(txt t)
/* This is not nice. Menu events are passed to txtedit without txtar
getting a look-in, so we have no chance to ensure that the correct
window is current. What is more, the data (which window was hit) has
been lost by the time all of this matters. Only c.win knows the mapping
from windows to objects. Thus the following kludge. */
{
  wimp_eventstr *e = wimpt_last_event();
  t=t;
  tracef0("set current window.\n");
  /* Called to ensure that a menu'd window is indeed the current one. */
  if (e->e == wimp_EBUT) {
    wimp_wstate s;
    wimp_eventstr oe;
    tracef0("we have to fake an open event!\n");
    wimp_get_wind_state(e->data.but.m.w, &s);
    oe.e = wimp_EOPEN;
    oe.data.o = s.o;
    win_processevent(&oe);
    /* This will cause the text to make that window the primary one
    for this text object. */
  };
}

/* end */
