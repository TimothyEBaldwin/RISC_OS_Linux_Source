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
 *  AsmUtils (irqs.h)
 *
 * Copyright (C) Pace Micro Technology plc. 2000
 *
 */
#ifndef asmutils_escape_h_inluded
#define asmutils_escape_h_inluded

#ifdef __cplusplus
extern "C" {
#endif

/* Support for ESCAPE condition detection, clearing & acknowledging */

/* Bit 0 of the return value is set if an escape condition existed
 * Bits 1-31 are indeterminate
 */
extern unsigned int escape_check(void);
extern unsigned int escape_check_ack(void);
extern unsigned int escape_check_clear(void);

#ifdef __cplusplus
}
#endif

#endif
