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
/* title: calc.c
 *
 * Purpose: To provide Calculator specific code split neatly from the user
 * interface code.
 *
 * Created 01-Aug-1994
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calc.h"

char operand_1[10];
char operand_2[10];
int  oper = 0;
int  op1_len;
int  op2_len;
int  op;
int  op_flag = 1;

void do_calculation(int operator, char *result)
{
  switch(operator)
  {
    case pressed_add:
    {
      sprintf(result,"%g\n",(atof(operand_1)) + (atof(operand_2)));
      break;
    }
    case pressed_minus:
    {
      sprintf(result,"%g\n",(atof(operand_1)) - (atof(operand_2)));
      break;
    }
    case pressed_mult:
    {
      sprintf(result,"%g\n",(atof(operand_1)) * (atof(operand_2)));
      break;
    }
    case pressed_divide:
    {
      if(atof(operand_2)==0)
      {
        sprintf(result,"Error\n");
      }
      else
      {
        sprintf(result,"%g\n",(atof(operand_1)) / (atof(operand_2)));
      }
      break;
    }
  }
}

int calc_construct_operand_1(int event_code)
{
  int i;

  if(event_code == pressed_0 && op1_len == 0)
    {
      return 0;
    }
    if(event_code <= pressed_9)
    {
      operand_1[op1_len] = (char) (event_code - 0x100)+48;
    }
    else
    {
      for(i=0;i<=op1_len;i++)
      {
        if(operand_1[i] == '.')
          return 1;
      }
      operand_1[op1_len] = (char) 46;
    }

    op1_len++;
    operand_1[op1_len] = '\0';
    return 1;
}

int calc_construct_operand_2(int event_code)
{
  int i;

  if(event_code == pressed_0 && op2_len == 0)
    {
      return 0;
    }
    if(event_code <= pressed_9)
    {
      operand_2[op2_len] = (char) (event_code - 0x100)+48;
    }
    else
    {
      for(i=0;i<=op2_len;i++)
      {
        if(operand_2[i] == '.')
          return 1;
      }
      operand_2[op2_len] = (char) 46;
    }

    op2_len++;
    operand_2[op2_len] = '\0';
    return 1;
}
void calc_reinit(void)
{
  op1_len = 0;
  op2_len = 0;
  operand_1[op1_len] = '\0';
  operand_2[op2_len] = '\0';
  op_flag = 1;
}

void calc_initialisation(void)
{
  op1_len = 0;
  op2_len = 0;
  operand_1[op1_len] = '\0';
  operand_2[op2_len] = '\0';
}
