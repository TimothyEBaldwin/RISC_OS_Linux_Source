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
 * Opens a template file, reads the first window definition and
 * dumps prototype gadget headers to a file based on icon definitions
 * found.
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"
#include "swis.h"



#include "<Toolbox$Common>.const.h"
#include "<Toolbox$Common>.macros.h"
#include "<Toolbox$Common>.services.h"
#include "<Toolbox$Common>.debug.h"
#include "<Toolbox$Common>.mem.h"
#include "<Toolbox$Common>.wimp.h"

/*
 * Fixed size buffers, yeah we love 'em!
 */

int window_definition[4096] ; /* That's 16k, sports fans! */
int tmpbuf[4096] ;
int indirect_workspace[1024] ;

int main (int argc, char **argv)
{
  FILE *out ;
  int loop ;
  _kernel_swi_regs regs ;
  _kernel_oserror *e ;
  int window_handle ;

  wimp_Window *window = (wimp_Window *) window_definition ;
  wimp_Icon   *icon ;

  if (argc != 3)
  {
    fprintf (stderr, "Usage: %s infile outfile\n", argv[0]) ;
    exit (EXIT_FAILURE) ;
  }

  regs.r[1] = (int) argv[1] ;
  if ((e = _kernel_swi (Wimp_OpenTemplate, &regs, &regs)) != NULL)
    _kernel_raise_error (e) ;

  regs.r[1] = (int) window_definition ;
  regs.r[2] = (int) indirect_workspace ;
  regs.r[3] = ((int) indirect_workspace) + 1024 ;
  regs.r[4] = -1 ;
  regs.r[5] = (int) "*\0\0\0\0\0\0\0\0\0\0\0" ; /* Bodge! */
  regs.r[6] = 0 ;
  if ((e = _kernel_swi (Wimp_LoadTemplate, &regs, &regs)) != NULL)
    _kernel_raise_error (e) ;

  if (regs.r[6] == 0)
  {
    fprintf (stderr, "No templates found in file\n") ;
    exit (EXIT_FAILURE) ;
  }

  if ((e = _kernel_swi (Wimp_CloseTemplate, &regs, &regs)) != NULL)
    _kernel_raise_error (e) ;

  regs.r[1] = (int) window_definition ;
  if ((e = _kernel_swi (Wimp_CreateWindow, &regs, &regs)) != NULL)
    _kernel_raise_error (e) ;
  window_handle = regs.r[0] ;

  tmpbuf[0] = window_handle ;
  regs.r[1] = (int) tmpbuf ;
  if ((e = _kernel_swi (Wimp_GetWindowInfo, &regs, &regs)) != NULL)
    _kernel_raise_error (e) ;

  /*
   * The (int) cast is important, prevents pointer arithmetic
   */
  icon = (wimp_Icon *) ((int) tmpbuf + sizeof (wimp_Window) + 4) ;

  out = fopen (argv[2], "w") ;
  if (out == NULL)
  {
    fprintf (stderr, "%s: Cannot open output file %s\n", argv[0], argv[2]) ;
    exit (EXIT_FAILURE) ;
  }

  for (loop = 0; loop < window->nicons; loop++)
  {
    fprintf (out, "  {\n    f,\n    t,\n    sizeof (GadgetHeader) + sizeof (x),\n    %d, %d, %d, %d,\n    %d,\n    \"Thing\",\n    sizeof \"Thing\" + 1\n  }\n", (icon+loop)->bbox.xmin, (icon+loop)->bbox.ymin,
       (icon+loop)->bbox.xmax, (icon+loop)->bbox.ymax, loop ) ;
  }

  fclose (out) ;

  exit (EXIT_SUCCESS) ;
}
