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

#include "Desk/OSBuffer.h"
#include "Desk/Debug.h"
#include "Desk/Error2.h"
#include "Desk/Str.h"
#include "Desk/BackTrace.h"
#include "Desk/Jump.h"


static void Usage (void)
{
  printf ( "%s",
          "Usage: PDebugR [-f filename]\n"
          "If -f isn't specified, received data is sent to stdout, with non-ascii\n"
          "characters displayed as <number>.\n"
          "Otherwise, data is sent to the specified file\n"
	 );
}

/*
static Desk_error2_block *ErrorHandler (Desk_error2_block *error)
{
  printf ("An error has occurred:\n");
  Desk_Error2_Describe (stdout, error);
  Desk_BackTrace_OutputToStreamWithPrefix (stdout, "Backtrace: ");
  return Desk_JumpAuto_Error2Handler (error);
}
*/


/*
A very simple program which simply prints out data from the parallel
port. When run from a task window, it unfortunately will slow the system
down even when no data is being received.
 */
int main (int argc, char* argv[])
{
  FILE *inputfile;
  FILE *output = NULL;
  int i;
  Desk_osbuffer_block *volatile inbuffer_v = NULL;

  Desk_Error2_Init_JumpSig ();
  //Desk_Error2_SetHandler (ErrorHandler);

  Desk_Debug_Printf( "");

  Desk_Error2_Try
  {
    Desk_osbuffer_block *inbuffer;

    for (i=1; i<argc; i++)
    {
      if (0 == Desk_stricmp ("-f", argv[i]))
      {
        if (i == argc-1)
          Desk_Error2_HandleText ("Argument needed for -f");
        output = fopen (argv[i+1], "w");
        if (!output)
          Desk_Error2_HandleTextf ("Couldn't open file '%s' for output", argv[i+1]);
        i+=1;
      }
      else if (0 == Desk_strnicmp (argv[i], "-h", 2))
      {
        Usage ();
        Desk_Error2_HandleText ("Finished");
      }
      else
        Desk_Error2_HandleTextf( "Unrecognised option '%s'", argv[i]);
    }

    inputfile = fopen ("devices:$.parallel", "r");
    if (!inputfile)
      Desk_Error2_HandleText( "Couldn't open 'parallel:' for reading");

    inbuffer = Desk_OSBuffer_Init (3);
    inbuffer_v = inbuffer;
    Desk_Debug_Printf (Desk_error_PLACE "osbuffer service routine is 0x%p\n", inbuffer->serviceroutine);

    for(;;)
    {
      char buffer[ 1024];
      int nleft = Desk_OSBuffer_RemoveBlock (inbuffer, buffer, 1024);
      int n = 1024 - nleft;
      int i;

      if (output)
        fwrite (buffer, 1, n, output);
      else
      {
        for (i=0; i<n; i++)
        {
          if (buffer[i] != '\n' && (buffer[i] < 32 || buffer[i] > 127))
            printf ("<%i>", buffer[i]);
          else
            printf ("%c", buffer[i]);
        }
      }
    }
  }

  Desk_Error2_Catch
  {
    printf ("\n");
    Desk_Error2_Describe (stdout, &Desk_Error2_globalblock);
    printf ("\n");
  }

  Desk_Error2_EndCatch

  if (inbuffer_v)
    Desk_OSBuffer_Final((Desk_osbuffer_block*) inbuffer_v);

  // We leave the C runtime to close all open files etc.

  return 0;
}
