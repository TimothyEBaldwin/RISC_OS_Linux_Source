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
/*trfm.c - trfm stuff*/

#include <limits.h>

#include "macros.h"
#include "os.h"

#include "muldiv.h"
#include "jc_trace.h"
#include "trfm.h"

void trfm_mul (os_trfm *r, os_trfm *m1, os_trfm *m2)

   /*r = m1 * m2*/

{  int i, j, k;

   tracef ("trfm_mul\n");

   for (j = 0; j < 2; j++)
   {  for (i = 0; i < 3; i++)
      {  r->entries [i] [j] = 0;

         for (k = 0; k < 2; k++)
            r->entries [i] [j] += muldiv (m1->entries [k] [j],
                  m2->entries [i] [k], 1 << 16);
      }

      r->entries [2] [j] += m1->entries [2] [j];
}  }
/*------------------------------------------------------------------------*/
void trfm_point (os_coord *r, os_trfm *m, os_coord *r1)

   /*r = m * r1, where |r1| is representing a point*/

{  tracef ("trfm_point\n");

   r->x = muldiv (m->entries [0] [0], r1->x, 1 << 16) +
         muldiv (m->entries [1] [0], r1->y, 1 << 16) +
         m->entries [2] [0];

   r->y = muldiv (m->entries [0] [1], r1->x, 1 << 16) +
         muldiv (m->entries [1] [1], r1->y, 1 << 16) +
         m->entries [2] [1];
}
/*------------------------------------------------------------------------*/
void trfm_dir (os_coord *r, os_trfm *m, os_coord *r1)

   /*r = m * r1, where |r1| is representing a direction*/

{  tracef ("trfm_dir\n");

   r->x = muldiv (m->entries [0] [0], r1->x, 1 << 16) +
         muldiv (m->entries [1] [0], r1->y, 1 << 16);

   r->y = muldiv (m->entries [0] [1], r1->x, 1 << 16) +
         muldiv (m->entries [1] [1], r1->y, 1 << 16);
}
/*------------------------------------------------------------------------*/
void trfm_inv (os_trfm *m, os_trfm *m1)

   /*m = m1^-1. Don't try to invert a singular matrix.*/

{  int det, alpha, beta, gamma, delta;

   tracef ("trfm_inv\n");

   det = trfm_det (m1);

   alpha = muldiv (m1->entries [0] [0], 1 << 16, det);
   beta =  muldiv (m1->entries [0] [1], 1 << 16, det);
   gamma = muldiv (m1->entries [1] [0], 1 << 16, det);
   delta = muldiv (m1->entries [1] [1], 1 << 16, det);

   m->entries [0] [0] = delta;
   m->entries [0] [1] = -beta;
   m->entries [1] [0] = -gamma;
   m->entries [1] [1] = alpha;
   m->entries [2] [0] = muldiv (gamma, m1->entries [2] [1], 1 << 16) -
         muldiv (delta, m1->entries [2] [0], 1 << 16);
   m->entries [2] [1] = -muldiv (alpha, m1->entries [2] [1], 1 << 16) +
         muldiv (beta, m1->entries [2] [0], 1 << 16);
}
/*------------------------------------------------------------------------*/
int trfm_det (os_trfm *m)

   /*det m*/

{  tracef ("trfm_det\n");

   return muldiv (m->entries [0] [0], m->entries [1] [1], 1 << 16) -
         muldiv (m->entries [0] [1], m->entries [1] [0], 1 << 16);
}
/*------------------------------------------------------------------------*/
void trfm_box (os_box *b, os_trfm *m, os_box *b1)

   /*set |b| to the bbox of |b1| after transformation by |m|.*/

{  os_coord c [4], c1 [4];
   int i;

   tracef ("trfm_box\n");

   /*Get the four corners of |b1|.*/
   c1 [0].x = b1->x0, c1 [0].y = b1->y0;
   c1 [1].x = b1->x1, c1 [1].y = b1->y0;
   c1 [2].x = b1->x1, c1 [2].y = b1->y1;
   c1 [3].x = b1->x0, c1 [3].y = b1->y1;

   /*Transform them all.*/
   for (i = 0; i < 4; i++)
      trfm_point (&c [i], m, &c1 [i]);

   /*Bound the four new points.*/
   b->x0 = b->y0 = INT_MAX;
   b->x1 = b->y1 =-INT_MAX;

   for (i = 0; i < 4; i++)
   {  (void) MINAB (b->x0, c [i].x);
      (void) MINAB (b->y0, c [i].y);
      (void) MAXAB (b->x1, c [i].x);
      (void) MAXAB (b->y1, c [i].y);
}  }
