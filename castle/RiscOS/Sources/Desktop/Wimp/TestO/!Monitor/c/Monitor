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

/* Monitor messages comming in */

#include <string.h>

#include "wimp.h"
#include "wimpt.h"
#include "event.h"
#include "win.h"
#include "template.h"
#include "dbox.h"
#include "alarm.h"
#include "res.h"
#include "akbd.h"
#include "kernel.h"
#include "swis.h"


int start_time =0;
int messages =0;
int my_task;

BOOL unknown_event(wimp_eventstr *e, void *handle)
{
 dbox d = (dbox) handle;
 int av=alarm_timedifference(start_time,alarm_timenow());
 static int ov=0;
 
 if (ov==0) ov=av-101;

 if ( (e->e==wimp_ENULL) && akbd_pollsh() )  /* Shift pressed on a null event */
 {
  _kernel_swi_regs r;

  r.r[0]=my_task;
  wimpt_noerror( (os_error *) _kernel_swi(XOS_Bit | 0x816c1 ,&r,&r); /* Get character at pointer */
 }

 if (e->e==wimp_ESEND)
 {            

  if (e->data.msg.action == 0x816c0)
  {
   werr(0,"Character found %c (%i)",e->data.msg.data.words[0],e->data.msg.data.words[0]);
   wimp_processkey(e->data.msg.data.words[0]);
  }


  char   strbuf [100];
  sprintf(strbuf,"%x",e->data.msg.hdr.action);
  dbox_setfield(d,3,strbuf);
  dbox_setnumeric(d,5,++messages);
 }
 
 if (av-ov >= 100)
 {
  ov=av;
  if (av >= 6000) av = messages / (av / 6000);
     else av=messages;

  dbox_setnumeric(d,1,av);
 }
 
 return TRUE;
}

int main()
{
 dbox d;

 /* Start a wimp task */
                       
 wimpt_wimpversion(275);
 my_task=wimpt_init("Monitor");
 res_init("Monitor");
 template_init();
 dbox_init();
 alarm_init();
 start_time=alarm_timenow();

 d=dbox_new("Monitor");
 dbox_showstatic(d);

 win_add_unknown_event_processor(unknown_event,d) ;

 event_setmask(0);

 while (1) 
 {
  event_process();
  if (wimpt_last_event()->e==wimp_ECLOSE) exit(0);
 }

 return 0;

}
