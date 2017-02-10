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
 * File   : fpsr.h
 * Purpose: Manipulate the floating point status register
 *          (C interface)
 * Authors: KJB, ADH
 * History: 20-Apr-98: Created
 *          10-Feb-00: Imported to AsmUtils
 */

#define fspr_id_MASK       0xff000000
#define fpsr_id_SHIFT      24
#define fpsr_id_FPE2       0x00
#define fpsr_id_FPE4       0x01
#define fpsr_id_FPPC       0x80
#define fpsr_id_FPA        0x81
#define fpsr_id_FAST       0x80000000

#define fpsr_trap_INX      0x00100000
#define fpsr_trap_UFL      0x00080000
#define fpsr_trap_OFL      0x00040000
#define fpsr_trap_DVZ      0x00020000
#define fpsr_trap_IVO      0x00010000

#define fpsr_control_AC    0x00001000
#define fpsr_control_EP    0x00000800
#define fpsr_control_SO    0x00000400
#define fpsr_control_NE    0x00000200
#define fpsr_control_ND    0x00000100

#define fpsr_exception_INX 0x00000010
#define fpsr_exception_UFL 0x00000008
#define fpsr_exception_OFL 0x00000004
#define fpsr_exception_DVZ 0x00000002
#define fpsr_exception_IVO 0x00000001

#define fpsr_all_DEFAULT   (fpsr_trap_OFL | fpsr_trap_DVZ | fpsr_trap_IVO)

unsigned int fpsr_manipulate(unsigned int eor, unsigned int mask);
