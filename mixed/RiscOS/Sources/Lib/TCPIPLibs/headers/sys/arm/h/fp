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
 * Copyright (c) 1988 Acorn Computers Ltd., Cambridge, England
 *
 */

#ifndef	__arm_fp_h
#define	__arm_fp_h
#define	__machine_fp_h		"arm"

/* This structure contains the per-user floating point registers
 * it is saved on the stack during a signal delivery, or saved
 * into the u area as the FP resource is switched between processes.
 */
struct fp_regs {
	int	fp_status;
	struct	fp_reg {
		int first, second, third;
	} fp_reg[8];
};

/*
 * defines for various SYSID bytes
 */
#define SYSIDFPE	0x00			/* software emulator */
#define SYSIDFPPC	0x80			/* FPPC/WE32206 */
#define SYSIDFPA10	0x81			/* FPA10 */

#endif/*__arm_fp_h*/

/* EOF fp.h */
