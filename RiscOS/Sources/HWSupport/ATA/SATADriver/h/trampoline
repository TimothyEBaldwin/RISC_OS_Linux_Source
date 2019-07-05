/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "Licence").
 * You may not use this file except in compliance with the Licence.
 *
 * You can obtain a copy of the licence at
 * cddl/RiscOS/Sources/HWSupport/SD/SDIODriver/LICENCE.
 * See the Licence for the specific language governing permissions
 * and limitations under the Licence.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the Licence file. If applicable, add the
 * following below this CDDL HEADER, with the fields enclosed by
 * brackets "[]" replaced with your own identifying information:
 * Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 2012 Ben Avison.  All rights reserved.
 * Use is subject to license terms.
 */

#ifndef TRAMPOLINE_H
#define TRAMPOLINE_H

/** \file trampoline.h
 *  Since the driver module has to support an unknown number of IRQ handlers,
 *  we create them at runtime by copying an assembler stub known as a trampoline.
 *  For speed, the trampoline calls the HAL device TestIRQ entry before the
 *  C runtime is initialised. The various symbols exported by the assembly code
 *  all have to be declared to any interfacing C code as function pointers, to
 *  prevent the compiler from applying the static data base to them.
 */

#include <stddef.h>
#include <stdint.h>

extern void trampoline_unshared(void);
#define trampoline_unshared ((uint32_t *)trampoline_unshared)
extern void trampoline_vectored(void);
#define trampoline_vectored ((uint32_t *)trampoline_vectored)
extern void trampoline_offset_pointer(void);
#define trampoline_offset_pointer ((size_t)trampoline_offset_pointer)
extern void trampoline_offset_privateword(void);
#define trampoline_offset_privateword ((size_t)trampoline_offset_privateword)
extern void trampoline_offset_cmhgveneer(void);
#define trampoline_offset_cmhgveneer ((size_t)trampoline_offset_cmhgveneer)
extern void trampoline_length(void);
#define trampoline_length ((size_t)trampoline_length)

#endif
