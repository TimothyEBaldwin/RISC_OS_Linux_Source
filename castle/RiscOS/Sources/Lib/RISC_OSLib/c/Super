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
/*  > C.Super */
/* Copyright (C) Acorn Computers Ltd., 1988 */

#include "Super.h"
/* 
** Things in the Brazil Supervisor C library.
**
** See also S.SuperAsm for the OS bits 
*/

int bra_osbyte(regs)
bra_reg_set * regs;
{
        return bra_swie(OS_Byte, regs);
}

int bra_osword(action, data)
void * data;
int action;
{
        bra_reg_set a;

        a.r[0] = action;
        a.r[1] = (int)data;

        return bra_swie(OS_Word, &a);
}

int bra_osgbpb(data)
bra_osgbpb_block * data;
{
        return bra_swie(OS_GBPB, (bra_reg_set *)data);
}

int bra_osfile(data)
bra_osfile_block * data;
{
        return bra_swie(OS_File, (bra_reg_set *)data);
}

int bra_osargs(regs)
bra_reg_set * regs;
{
        return bra_swie(OS_Args, regs);
}

int bra_osfind(regs)
bra_reg_set * regs;
{
        return bra_swie(OS_Find, regs);
}

/* in s.SuperAsm ...
**  bra_swi()
**  bra_swie()
*/
