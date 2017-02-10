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
#ifndef GLOBAL_HALDEVICE_H

#include <stdbool.h>
#include <stdint.h>

struct device
{
  uint16_t type;
  uint16_t id;
  uint32_t location;
  uint32_t version;
  const char *description;
  void *address;
  uint32_t reserved1[3];
  bool (*Activate)(struct device *);
  void (*Deactivate)(struct device *);
  void (*Reset)(struct device *);
  int32_t (*Sleep)(struct device *, int32_t state);
  int32_t devicenumber;
  bool (*TestIRQ)(struct device *);
  void (*ClearIRQ)(struct device *);
  uint32_t reserved2[1];
};

#endif
/* In the exported copy of this file, the Hdr2H translation of hdr.HALDevice will follow. */
