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
/************************************************************************/
/* File:                                                                */
/* Purpose:                                                             */
/*                                                                      */
/* Author:  Neil Bingham <mailto:nbingham@acorn.com>                    */
/* History: 0.01  d                                                     */
/*                Created.                                              */
/************************************************************************/


/* -------------------------------------- LIBRARY IMPORTS --------------------------------------- */
#include "main.h"
#include "GadgetDefs.h"
#include "Outputer.h"

/* ---------------------------------- PRE-PROCESSOR DIRECTIVES ---------------------------------- */

#define Text_Length		30
#define Level_Length		10

static char text[Text_Length];
static char level[Level_Length];

/* -------------------------------------- GLOBAL VARIABLES -------------------------------------- */


/* ----------------------------------------- FUNCTIONS ------------------------------------------ */

void setup_output_win(int dev)
{
  _kernel_oserror	*er;

  switch(dev)
  {
    case(FILE_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "File");
      break;
    }
    case(SOCKET_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "Sockets");
      break;
    }
    case(PDEBUG_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "Parallel");
      break;
    }
    case(PRINTF_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "printf (stdout)");
      break;
    }
    case(DEBUGIT_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "DebugIt (!ListDebug)");
      break;
    }
    case(TML_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "TML Podule");
      break;
    }
    case(TRACKER_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "!Tracker");
      break;
    }
    case(SERIAL_OUTPUT):
    {
      displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "Serial");
      break;
    }
    case(BRAINLINK_OUTPUT):
    {
       displayfield_set_value(0, Output_WindowHandle, OutputWin_Device, "Serial");
       break;
    }
  }
  er = gadget_set_flags(0, Output_WindowHandle, OutputWin_Send_Dprintf_Data, 0);
  error_check(er);
  er = gadget_set_flags(0, Output_WindowHandle, OutputWin_Send_Dfprintf_Data, 0);
  error_check(er);
  er = gadget_set_flags(0, Output_WindowHandle, OutputWin_Send_All_Data, 0);
  error_check(er);
}


/************************************************************************/
/* send_dprintf_data                                                    */
/*                                                                      */
/* Function reads the data from the supplied ComponentIds and then      */
/* outputs with, or without, levelling enabled.                         */
/*                                                                      */
/* Parameters:                                                          */
/*                                                                      */
/* Returns:                                                             */
/*                                                                      */
/************************************************************************/
void send_dprintf_data(ComponentId text_cid, ComponentId level_option, ComponentId level_cid)
{
  _kernel_oserror	*er;
  int			 state;

  er = writablefield_get_value(0, Output_WindowHandle, text_cid, text, Text_Length, 0);
  error_check(er);
  strcat(text, "\n");
  er = optionbutton_get_state(0, Output_WindowHandle, level_option, &state);
  error_check(er);

  if (state == 0)
  {
    dprintf(("", text));
  }
  else
  {
    er =writablefield_get_value(0, Output_WindowHandle,level_cid, level, Level_Length, 0);
    error_check(er);
    dprintf((level, text));
  }
}


/************************************************************************/
/* send_dprintf_output                                                  */
/*                                                                      */
/* Function is called when the dprintf() output is to be sent.          */
/*                                                                      */
/* Parameters:                                                          */
/*                                                                      */
/* Returns:                                                             */
/*                                                                      */
/************************************************************************/
void send_dprintf_output(void)
{
  send_dprintf_data(OutputWin_Test1_Text, OutputWin_Test1_Level_Option, OutputWin_Test1_Level);
  send_dprintf_data(OutputWin_Test2_Text, OutputWin_Test2_Level_Option, OutputWin_Test2_Level);
  send_dprintf_data(OutputWin_Test3_Text, OutputWin_Test3_Level_Option, OutputWin_Test3_Level);
  send_dprintf_data(OutputWin_Test4_Text, OutputWin_Test4_Level_Option, OutputWin_Test4_Level);
  send_dprintf_data(OutputWin_Test5_Text, OutputWin_Test5_Level_Option, OutputWin_Test5_Level);
}


/************************************************************************/
/* send_dfprintf_output                                                 */
/*                                                                      */
/* Function output data from dprintf section of Output window.          */
/*                                                                      */
/* Parameters:                                                          */
/*                                                                      */
/* Returns:                                                             */
/*                                                                      */
/************************************************************************/
void send_dfprintf_output(void)
{
  _kernel_oserror	*er;
  _kernel_swi_regs	 regs;
  int			 state;

  /* Get Stream */
  regs.r[0] = 1;
  regs.r[1] = Output_WindowHandle;
  regs.r[2] = 899;
  regs.r[3] = OutputWin_Dfprintf_Device;
  regs.r[4] = 0;
  regs.r[5] = 0;
  er = _kernel_swi(Toolbox_ObjectMiscOp, &regs, &regs);

  /* Get Data */

  er = writablefield_get_value(0, Output_WindowHandle,OutputWin_Dfprintf_Text,text,Text_Length, 0);
  error_check(er);
  strcat(text, "\n");

  er = optionbutton_get_state(0, Output_WindowHandle, OutputWin_Dfprintf_Level_Option, &state);
  error_check(er);

  if (state == 0)
  {
    dfprintf(("", (debug_device)regs.r[0], text));
  }
  else
  {
    er=writablefield_get_value(0,Output_WindowHandle,OutputWin_Dfprintf_Level,level,Level_Length,0);
    error_check(er);
    dfprintf((level, (debug_device)(regs.r[0]+1), text));
  }

}
