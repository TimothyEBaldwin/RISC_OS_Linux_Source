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
 *  AsmUtils (clz.h)
 *
 * Copyright (C) 2004 Castle Technology Ltd
 *
 * Author: Ben Avison
 *
 */

#ifndef asmuntils_clz_h_included
#define asmuntils_clz_h_included

#ifdef __cplusplus
extern "C" {
#endif

/* These functions are designed for CPUs without the CLZ instruction */

extern unsigned int clz(unsigned int);
  /* Returns the number of leading zero bits in the argument, 0 ... 32 */

extern unsigned int ctz(unsigned int);
  /* Returns the number of trailing zero bits in the argument, 0 ... 32 */

extern unsigned int clo(unsigned int);
  /* Returns the number of leading one bits in the argument, 0 ... 32 */

extern unsigned int cto(unsigned int);
  /* Returns the number of trailing one bits in the argument, 0 ... 32 */

#ifdef __cplusplus
}
#endif

#endif
