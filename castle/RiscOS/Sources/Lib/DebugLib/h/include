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
/**************************************************************************/
/* File:    include.h                                                     */
/* Purpose: General header file for DebugLib.                             */
/*                                                                        */
/* Copyright [1999-2001] Pace Micro Technology PLC.  All rights reserved. */
/*                                                                        */
/* The copyright in this material is owned by Pace Micro Technology PLC   */
/* ("Pace").  This material is regarded as a highly confidential trade    */
/* secret of Pace.  It may not be reproduced, used, sold or in any        */
/* other way exploited or transferred to any third party without the      */
/* prior written permission of Pace.                                      */
/**************************************************************************/

#ifndef __include_h
#define __include_h

/* -------------------------------------- LIBRARY IMPORTS --------------------------------------- */
/* ANSI Libraries */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* CLib 5 Libraries */
#include "kernel.h"
#include "swis.h"

/* Turn on the PDebug code */
#ifndef PDebug_DEBUG
#define PDebug_DEBUG 1
#endif

/* Turn on the RemoteDB code */
#ifndef REMOTE_DEBUG
#define REMOTE_DEBUG 1
#endif

/* Turn on the trace code */
#ifndef Trace_TRACE
#define Trace_TRACE  1
#endif

#include <stdbool.h>

/* Include the exported header */
#define DEBUGLIB
#include "DebugLib.h"

/* "Unused" macro */
#define IGNORE(a) a=a

/* DebugLib debugging macro */
#ifdef DEBUG
  #define internal_dprintf(a) _dprintf a
#else
  #define internal_dprintf(a)
#endif

#endif

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ END +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
