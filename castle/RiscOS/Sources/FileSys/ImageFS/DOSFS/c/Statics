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
/*> c.Statics <*/
/*-------------------------------------------------------------------------*/
/* This file contains the C links to the static read only arrays which are */
/* defined as functions in s.Statics.  These arrays are never altered and  */
/* therefore it is not necessary for them to be copied into the RMA.       */
/* Defining them as functions and then casting prevents this.  Ignore the  */
/* warning messages about casting functions.                               */
/*-------------------------------------------------------------------------*/

#include "DOSFS.h"
#include "DOSshape.h"
#include "MultiFS.h"
#include "Statics.h"

extern void func_DOS_formatinfo(void);
extern void func_DOS_formats(void);
extern void func_default_dbsector(void);

format_spec *DOS_formatinfo = ((format_spec *)func_DOS_formatinfo);
DOSdiscinfo *DOS_formats = ((DOSdiscinfo *)func_DOS_formats);
DOS_bootsector *default_dbsector = ((DOS_bootsector *)func_default_dbsector);
