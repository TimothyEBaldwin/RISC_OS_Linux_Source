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
#include <limits.h>

#include "os.h"
#include "osfile.h"

#define RWT (2*2)
#define GWT (4*4)
#define BWT 1

static os_colour Palette [] =
   {  /*00*/ 0xFFFFFF00,
      /*01*/ 0xDDDDDD00,
      /*02*/ 0xBBBBBB00,
      /*03*/ 0x99999900,
      /*04*/ 0x77777700,
      /*05*/ 0x55555500,
      /*06*/ 0x33333300,
      /*07*/ 0x00000000,
      /*08*/ 0x99440000,
      /*09*/ 0x00EEEE00,
      /*10*/ 0x00CC0000,
      /*11*/ 0x0000DD00,
      /*12*/ 0xBBEEEE00,
      /*13*/ 0x00885500,
      /*14*/ 0x00BBFF00,
      /*15*/ 0xFFBB0000
   };

static int sqdist (os_colour c0, os_colour c1)

{  return
      RWT*SQR (((c0 & os_R) >> os_RSHIFT) - ((c1 & os_R) >> os_RSHIFT)) +
      GWT*SQR (((c0 & os_G) >> os_GSHIFT) - ((c1 & os_G) >> os_GSHIFT)) +
      BWT*SQR (((c0 & os_B) >> os_BSHIFT) - ((c1 & os_B) >> os_BSHIFT));
}

int main (void)

{  byte table [32] [32] [32];
   int r, g, b, c, near, best, s;

   for (b = 0; b < 32; b++)
      for (g = 0; g < 32; g++)
         for (r = 0; r < 32; r++)
         {  near = -1; best = INT_MAX;
            for (c = 0; c < COUNT (Palette); c++)
            {  s = sqdist (Palette [c], 255*r/31 << os_RSHIFT |
                     255*g/31 << os_GSHIFT | 255*b/31 << os_BSHIFT);
               if (s < best)
                  near = c, best = s;
            }
            table [b] [g] [r] = near;
         }

   osfile_save_stamped ("4desktop", osfile_TYPE_DATA,
         (byte *) table, (byte *) table + sizeof table);

   return 0;
}
