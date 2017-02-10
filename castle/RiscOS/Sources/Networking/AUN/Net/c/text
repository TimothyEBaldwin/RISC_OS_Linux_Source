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
/* text.c
 *
 * Description
 * ===========
 * Message definitions
 *
 */

#include "Global/NewErrors.h"

#include "sys/types.h"

#include "module.h"
#include "text.h"

const char *message_strs[37] =
{
   "StaAcc",
   "NotAcc",
   "FullAd",
   "Noclck",
   "IfType",
   "Down",
   "StaNum",
   "BrdCst",
   "GlbBct",
   "AccNet",
   "ModSts",
   "TxStat",
   "Data",
   "Immedt",
   "ImmRep",
   "Retry",
   "Error",
   "DtaAck",
   "DtaRej",
   "Local",
   "Global",
   "Dscard",
   "RxStat",
   "InvRep",
   "MNSBan",
   "Gteway",
   "Gtewys",
   "Warn",
   "NoMap",
   "NoRout",
   "GwConf",
   "BadSta",
   "BadDev",
   "BadInt",
   "NtvEco",
   "BadGwy",
   "GtwSta",
};

const struct eblk error_blocks[15] =
{
   { 0,                               0 },
   { ErrorNumber_BadPort,             "BadPort" },
   { ErrorNumber_BadSize,             "TooBig"  },
   { ErrorNumber_PortNotAllocated,    "PtNtAlc" },
   { ErrorNumber_PortAllocated,       "PortAlc" },
   { ErrorNumber_NoMorePorts,         "NoPorts" },
   { ErrorNumber_EconetInternalError, "NoStore" }, /* Global messages */
   { ErrorNumber_ModuleBadSWI,        "BadSWI"  }, /* Global messages */
   { ErrorNumber_BadMask,             "BadMask" },
   { ErrorNumber_NoHardware,          "NoHware" },
   { ErrorNumber_NoNetworkAccess,     "BadInt"  }, /* See above table */
   { ErrorNumber_BadStation,          "BadStn"  }, /* Global messages */
   { ErrorNumber_BadNetwork,          "BadNet"  }, /* Global messages */
   { ErrorNumber_Channel,             "Channel" }, /* Global messages */
   { ErrorNumber_AUNNotConfigured,    "NotConf" },
};

/******************************************************************************/

/* EOF text.c */
