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
 * Copyright (C) Pace Micro Technology plc. 1999
 *
 */
#ifndef asmutils_irqs_h_inluded
#define asmutils_irqs_h_inluded

#ifdef __cplusplus
extern "C" {
#endif

/* Support for interrupt status management */

/* Firstly, the Acorn Network Computing way of doing it
 * irqs_off returns a value which is to be passed to irqs_on to restore
 * the state that existed before irqs_off was called.  The value is
 * opaque (and WILL differ depending on the No32bitCode/No26bitCode macros)
 * and may not be inspected - even to determine whether it is zero or not -
 * as it may contain further information.
 */
extern int irqs_off(void);
extern void irqs_on(int);

/* Secondly, the other common method which provides an extra alternative:
 * ensure_irqs_off forces IRQs to be disabled, restore_irqs takes the
 * return value from the former and restores the IRQ state, ensure_irqs_on
 * always enables IRQs and returns a value that can be passed to
 * restore_irqs later to restore the state.
 *
 * As for the ANC veneers, the value returned is opaque and must not be
 * interpreted in any way.
 */
extern int ensure_irqs_off(void);
extern int ensure_irqs_on(void);
extern void restore_irqs(int);

#ifdef __cplusplus
}
#endif

#endif
