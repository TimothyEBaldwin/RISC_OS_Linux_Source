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
/* > c.main
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "maketree.h"
#include "main.h"


int main(int argc, char *argv[])
{
  FILE *infile;
  long int length;
  int n, *frequencies;
  node *tree;

  if (argc != 2) error("Syntax:  *MakeTree <filename>");

  infile = fopen(argv[1], "r");
  if (!infile || ferror(infile)) error("Can't open file");

  fseek(infile, 0, SEEK_END);
  length = ftell(infile);
  fseek(infile, 0, SEEK_SET);

  n = (int)length / sizeof(int);
  frequencies = malloc((int)length);
  if (!frequencies) error("Out of memory");

  if (fread(frequencies, sizeof(int), n, infile) != n) {
    error("Error while reading data");
  }

  fclose(infile);

  tree = maketree(n, frequencies);

  printtree(tree);

  return(0);
}


static int total_weight=0;
static int total_bits=0;

void printtree(node *tree)
{
  total_weight = total_bits = 0;
  dotree(tree, 0, 0);
  printf("\nAverage bits used = %f\n", (float)total_bits / (float)total_weight);
}


void dotree(node *item, int level, int code)
{
  if (!item) error("Null node");

  if (item->value >= 0) {
    total_weight += item->frequency;
    total_bits += level * item->frequency;
    printf("%s  0x%X  %d\n", binary(level, code), item->value, item->frequency);
  } else {
    dotree(item->left, level+1, (code << 1) + 0);
    dotree(item->right,level+1, (code << 1) + 1);
  }
}


#define MAXBITS 16

char * binary(int level, int code)
{
  static char buffer[MAXBITS+1];
  int i;

  if (level > MAXBITS) error("Too many bits in code");

  for (i=0; i<MAXBITS; i++) buffer[i] = ' ';
  for (i=0; i<level; i++) {
    buffer[level-1-i] = code & (1<<i) ? '1' : '0';
  }
  buffer[MAXBITS] = 0;

  return(buffer);
}

