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
*   LMVARS.H - LanMan variables
*
*   Versions
*
*   06-02-94 INH Original
*
*
*/

struct LMvars
{
  char machinename[NAME_LIMIT];  /* Machine name */
  char drivername[NAME_LIMIT];   /* Name of DCI4 driver to which attached */
  char workgroup[NAME_LIMIT];    /* Workgroup to browse */
  char username[NAME_LIMIT];     /* Default user e.g. 'guest' */
  int  namemode;
  bool logged_on;
  char *password_ptr;            /* Default password e.g. none */
  int  initialised;              /* Initialisation state */
  int  default_type;             /* Type for which no ",xxx" suffix will be added */
  int  untyped_address;          /* Base of the OS ROM */
};

extern struct LMvars LM_Vars;
