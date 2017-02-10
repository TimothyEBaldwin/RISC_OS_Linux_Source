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
 * Toolbox common library (objmodule.h)
 *
 * useful utilities for toolbox modules
 *
 */
#ifndef common_objmodule_h
#define common_objmodule_h

/* Register with the Toolbox module as an object module.
 *
 * Bit 30 of the flags is used to signal that failure to register with the toolbox module
 * on the grounds that the SWI call failed with a SWI not known error should be reported.
 * When this bit is not set, such faults will NOT be reported.  This allows object modules
 * to sleep until such time as a Toolbox modules comes along.
 */
enum {
  objmodule_REPORT_BAD_SWI = 1U<<30
};
extern _kernel_oserror *objmodule_register_with_toolbox(int /*flags*/, int /*class*/, int /*swi*/, const char * /*res*/);

extern _kernel_oserror *objmodule_deregister(int /*flags*/, int /*class*/);

/* Resource path initialisation */
extern void objmodule_ensure_path(const char *var, const char *default_setting);

/* ResourceFS registration/deregistration */
extern _kernel_oserror *objmodule_register_resources(int);
extern _kernel_oserror *objmodule_deregister_resources(int);

#endif
