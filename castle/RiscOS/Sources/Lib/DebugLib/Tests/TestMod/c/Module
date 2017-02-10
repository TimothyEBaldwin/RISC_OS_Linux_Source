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
/* module.c - RISC OS module related code. */

/* ANSI Includes */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Risc OS Includes */
#include "kernel.h"
#include "swis.h"
#include "wimp.h"
#include "wimplib.h"

/* Other libraries */
#include "Debuglib/Debuglib.h"

#ifdef MEMCHECK
  #include "MemCheck:MemCheck.h"
#endif

/* Local Includes */
#include "module.h"
#include "error.h"

ERROR_STRUCT (BADSWI, "BadSWI");
#define TaskModule_SendMessage 0x4D300


/*------------------------------------------------------------------------------
 * module_initialise
 *
 *      Module initialisation entry point.
 */
_kernel_oserror *module_initialise (char *cmd_tail, int podule_base, void *pw)
{
  _kernel_oserror *er = NULL;

#ifdef MEMCHECK
  MemCheck_Init();
  MemCheck_InterceptSCLStringFunctions();
  MemCheck_SetStoreMallocFunctions(1);
  MemCheck_RedirectToFilename ("RAM::0.$.tm_memch");
  atexit (MemCheck_OutputBlocksInfo);
  MemCheck_SetReadChecking (0);
#endif

  debug_initialise ("TestMod", "ram::0.$.out", "");
  debug_initialise_trace (DEBUGIT_OUTPUT, "");
  debug_set_device (FILE_OUTPUT);
  /* debug_set_device (SOCKET_OUTPUT); */
  /* debug_set_device (PRINTF_OUTPUT); */
  /* debug_set_device (DEBUGIT_OUTPUT); */
  /* debug_set_device (TRACKER_OUTPUT); */
  /* debug_set_device (OSFILE_OUTPUT); */
  /* debug_set_device (PDEBUG_OUTPUT); */

  return er;

  NOT_USED (cmd_tail);
  NOT_USED (podule_base);
  NOT_USED (pw);
}


/*------------------------------------------------------------------------------
 * module_finalise
 *
 *      Module exit handler.
 */
_kernel_oserror *module_finalise (int fatal, int podule, void *pw)
{
  return NULL;
  NOT_USED (fatal);
  NOT_USED (podule);
  NOT_USED (pw);
}


static void send_message(const char *url, int ordered)
{
  _kernel_oserror *er;
#if 0
  WimpMessage message;
  strncpy (message.data.bytes, url, 235);
  message.data.bytes[235] = '\0';

  message.hdr.size = 256;           /* its not really but it works */
  message.hdr.sender = 0;           /* my task handle */
  message.hdr.my_ref = 0;           /* no ref */
  message.hdr.your_ref = 0;         /* no ref */
  message.hdr.action_code = 307072; /* the (ANT) URL action code */

  /* Send the global message */
  /*wimp_send_message (Wimp_EUserMessageRecorded, &message, 0, 0, &th);*/

  er = _swix (TaskModule_SendMessage, _INR(0,4), 0u, &message, 0, 0, 0);
#else
  char message[256];
  int n;
  _kernel_swi_regs r;

  n = strlen(url);
  n = n>236?236:n;

  memset(message, 0, 256);

//    *(int *)msg_block = n + 20;
    *(int *)message = 256;
    *(int *)(message + 16) = 0x4af80; /* Message_URL */
    strncpy(message + 20, url, n);

    r.r[0] = ordered ? 2u : 0u;
    r.r[1] = (int)message;
    r.r[2] = 0;
    r.r[3] = 0;
    r.r[4] = 0;
    r.r[5] = 0;

    er = _kernel_swi(TaskModule_SendMessage, &r, &r);
#endif
  dprintf (("", "er = \"%s\"\n", er ? er->errmess : "<none>"));
}


/*------------------------------------------------------------------------------
 * module_swi
 *
 *      Module SWI handler.
 */
_kernel_oserror *module_swi (int swi_no, _kernel_swi_regs *r, void *pw)
{
  _kernel_oserror *er =  NULL;

  switch (swi_no)
  {
    case 0:
      dprintf (("", "Changing output device to: %d\n", r->r[0]));
      debug_set_device ((debug_device)r->r[0]);
      break;

    case 1:
    /*  dprintf (((char *) r->r[0], (char *) r->r[1])); */
      dprintf (("", "Some text\n"));
      break;

    case 2:
      send_message("http://url1", 0);
      send_message("http://url2", 0);
      break;

    case 3:
      send_message("http://url1", 1);
      send_message("http://url2", 1);
      send_message("http://url3", 1);
      break;

    /* Unknown SWI */
    default:
      er = _swix (MessageTrans_ErrorLookup,
                  _INR(0,4), ERROR (BADSWI), 0, 0, 0, MODULE_NAME);
  }

  return er;
  NOT_USED (pw);
}
