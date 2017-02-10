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
#include <stdio.h>
#include <time.h>

#include "OSLib/Core/macros.h"
#include "OSLib/Core/types.h"

#include "DebugLib/DebugLib.h"
#ifdef MemCheck_MEMCHECK
  #include "MemCheck:MemCheck.h"
#endif

static void bogus3 (void)
{
  dprintf (("", "bogus3\n"));
}

static void bogus2 (void)
{
  dprintf (("", "bogus2\n"));
  bogus3 ();
}

static void bogus (void)
{
  dprintf (("", "bogus\n"));
  bogus2 ();
}

int main (void)
{
#ifdef MemCheck_MEMCHECK
  MemCheck_Init();
  MemCheck_InterceptSCLStringFunctions();
  MemCheck_SetStoreMallocFunctions(1);
  MemCheck_RedirectToFilename ("RAM::0.$.cli_memch");
  atexit (MemCheck_OutputBlocksInfo);
#endif

  debug_initialise ("CLI_App", "ram::0.$.cli_out", "");

  /* See what happens if you do a dprintf before setting a device */
  dprintf (("", "Test\n"));

  debug_set_device (DEBUGIT_OUTPUT);

  /* Try old-style monolithic set options call */
  debug_set_options (DebugLib_Options_StampDebug_On |
                     DebugLib_Options_TasknamePrefix_On, 1, 9600);

  /* And a new one, odd construct is to test DebugLib.h's handling
     of OSLib boolean type */
  {
    bool testing;

    testing = TRUE;

    /* debug_set_stamp_debug (FALSE); */
    debug_set_area_level_prefix (testing);
  }

#if 0
  debug_output_buffer_on (0, 1024);
#endif

  /* Call it a second time, to check how this behaves */
  debug_set_device (DEBUGIT_OUTPUT);

 /* { clock_t t = clock() + (5 * CLOCKS_PER_SEC); while (clock() < t); }*/

  /* And try using same device for trace and debug output */
  debug_initialise_trace (DEBUGIT_OUTPUT, "");

  dprintf (("", "No level\n"));
  dprintf (("UILib_7", "UILib 7\n"));
  dprintf (("UILib", "UILib\n"));
  dprintf (("UILib_2", "UILib 2\n"));
  dprintf (("UILib_", "UILib\n"));
  dprintf (("UILib_1,Flib_5","UILib_1,Flib_5\n"));


  dprintf (("h", "A little "));
  dprintf (("", "test\noh yes\n"));
  dprintf (("Error", "Is this gonna work?\n"));

  ddumpbuf("test", "012345678901234567", 17, 0);
  debug_set_dump_width(3);
  ddumpbuf("test", "012345678901234567", 17, 0);
  ddumpbuf("test", "012345678901234567", 17, 100);
  debug_set_dump_width(16);
  ddumpbuf("test", "012345678901234567", 16, 100);

  /* Trace testing */
  bogus ();

  /* Area padding tests */
  dprintf (("mmmmThisIs16Long", "16 long exactly\n"));
  dprintf (("mmmmmThisIs17Long", "17 long\n"));
  debug_set_area_pad_limit (6u);
  dprintf (("m6Long", "6 long exactly\n"));
  dprintf (("mm7Long", "7 long\n"));
  dprintf (("5Long", "5 long\n"));
  debug_set_area_pad_limit (0u);
  dprintf (("Short", "No padding\n"));
  dprintf (("LongLongLong", "No padding\n"));

  dprintf (("1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18","blah\n"));

#if 0
  debug_output_buffer_off (1, NULL_OUTPUT);
#endif

  /* Call terminate twice, to see how it behaves. */
  debug_terminate();
  debug_terminate();

  return 1;
}
