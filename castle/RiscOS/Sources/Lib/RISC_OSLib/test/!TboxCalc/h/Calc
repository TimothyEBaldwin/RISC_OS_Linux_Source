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
 * Calculator specific code
 * created 01-Aug-1994
 */
#ifndef __calc_h
#define __calc_h

#ifndef __main_h
#include "main.h"
#endif

#define CALC_MAX_LEN 9

extern char operand_1[10];
extern char operand_2[10];
extern int  oper;
extern int  op1_len;
extern int  op2_len;
extern int  op;
extern int  op_flag;

extern void do_calculation(int operator, char *result);

extern int  calc_construct_operand_1(int event_code);

extern int  calc_construct_operand_2(int event_code);

extern void calc_reinit(void);

extern void calc_initialisation(void);

#endif

