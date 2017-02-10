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
/* > h.maketree
 */


typedef struct node
{
  int value, frequency;
  struct node *left, *right;
} node;


typedef struct heapstr
{
  int nitems;
  node **array, **ptr;
} heapstr;


extern node * maketree(int n, int *frequencies);
extern void initheap(heapstr *heapp, int n, int *frequencies);
extern void sortheap(heapstr *heapp);
extern int mycompare(const void *item1, const void *item2);
extern void addheap(heapstr *heapp, node *newitem);
extern node * removeheap(heapstr *heapp);
extern void freeheap(heapstr *heapp);
extern node * newnode(int value, int frequency, node *left, node *right);
extern void error(char *str);

