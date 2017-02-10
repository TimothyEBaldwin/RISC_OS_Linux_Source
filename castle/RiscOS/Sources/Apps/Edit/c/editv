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
 * Title: arceditv.c
 * Purpose: version info about ArcEdit.
 * Author: W. Stoye
 * History:
 *   11-Mar-88: started.
 */

#define BOOL int
#define FALSE 0

#include "txt.h"
#include "dbox.h"
#include "help.h"
#include "msgs.h"
#include "editv.h"

#define arceditv_IPOK 0
#define arceditv_IPName 1
#define arceditv_IPPurpose 2
#define arceditv_IPAuthor 3
#define arceditv_IPVersion 4

/* Version history:
  Release 0.33: 14-Apr-88: on Arthur 1.60 Welcome Disc.
  txtar: Removed font ref count bug in font->sys transition
  arcedit/win: drag to icon bar opens window on any file.
  !Run: call !Boot, in case *desktop never used.
  wimp: Wimp_SlotSize interface updated.
  dbox: (fatal) error message improved if template load fails.
  dbox: error that affected caret in find dbox solved.
  event: icon bar menus moved up a bit.
  Release 0.35: on Arthur 1.70 Welcome Disc.
  txtmisc: format paragraph parameterised on width
                            bug re word longer than width removed.
  txtedit: looks for ArcEdit$Options for default text window description.
  txtedit: SH-COPY and CTL-COPY have typahead fix added.
  0.39: converted to Arthur 1.75, using !s, new data transfer.
  0.40: txtar: bug shot in split window >8 -> one window hidden.
  0.41: release for Welcome Disc for 1.78.
  0.43:
*/

/* Note: AMcC 17-Jan-95:
 *
 *   arceditv_infoaboutprogram: displays the info box from the icon bar menu
 *        txt_infoaboutprogram: (in RISC_OSLib:rlic.c.txtedit)
 *                              displays the info box from the edit window menu
 */

void arceditv_infoaboutprogram(void)
{
    dbox d = dbox_new("progInfo");

    if (d) {
        /* Supply raw event handler for help messages */
        dbox_raw_eventhandler(d, help_dboxrawevents, "PROGINFO");

        /* Place the version string in the dialogue box */
        dbox_setfield(d, arceditv_IPVersion, msgs_lookup("_Version"));

        dbox_show(d);
        dbox_fillin(d);
        dbox_dispose(&d);
    }
}

/* end */
