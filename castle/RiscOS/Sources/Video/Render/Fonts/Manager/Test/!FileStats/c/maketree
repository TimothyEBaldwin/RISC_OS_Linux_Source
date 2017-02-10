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
/* > c.maketree
 */

#include <stdio.h>
#include <stdlib.h>
#include "maketree.h"


node * maketree(int n, int *frequencies)
{
  node *item1, *item2, *answer;
  int i;
  heapstr myheap;

  initheap(&myheap,n,frequencies);

  sortheap(&myheap);

  for (i=0; i<n-1; i++) {
    item1 = removeheap(&myheap);
    item2 = removeheap(&myheap);
    if (item1->frequency > item2->frequency) error("Incorrect order");

    answer = newnode(-1, item1->frequency+item2->frequency, item1, item2);
    addheap(&myheap,answer);
  }

  answer = removeheap(&myheap);

  freeheap(&myheap);

  return(answer);
}


void initheap(heapstr *heapp, int n, int *frequencies)
{
  int i;
 
  heapp->nitems = n;
  heapp->ptr =
  heapp->array = malloc(n * sizeof(node *));

  if (!heapp->array) error("Not enough memory");

  for (i=0; i<n; i++) {
    heapp->array[i] = newnode(i, frequencies[i], NULL, NULL);
  }
}


void sortheap(heapstr *heapp)
{
  qsort(heapp->ptr, heapp->nitems, sizeof(node *), mycompare);
}


int mycompare(const void *item1, const void *item2)
{
  node *realitem1 = *(node **)item1;
  node *realitem2 = *(node **)item2;

  return(realitem1->frequency > realitem2->frequency);
}


void addheap(heapstr *heapp, node *newitem)
{
  int i;

  for(i=0; i<heapp->nitems; i++) {
    if (heapp->ptr[i]->frequency >= newitem->frequency) break;
    heapp->ptr[i-1] = heapp->ptr[i];
  }
  heapp->ptr[i-1] = newitem;

  heapp->nitems++;
  --heapp->ptr;
}


node * removeheap(heapstr *heapp)
{
  if (heapp->nitems-- == 0) error("No items on heap");

  return(*heapp->ptr++);
}


void freeheap(heapstr *heapp)
{
  free(heapp->array);
}


node * newnode(int value, int frequency, node *left, node *right)
{
  node *fred = malloc(sizeof(node));

  if (!fred) error("Not enough memory");

  fred->value = value;
  fred->frequency = frequency;
  fred->left = left;
  fred->right = right;

  return(fred);
}


void error(char *str)
{
  fprintf(stderr, "%s\n", str);
  exit(1);
}

