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
*  Lan Manager client
*
*  Logon.H -- Header for Logon.C exports
*
*  Versions
*  29-05-96 INH Original
*
*/

extern err_t Lgn_Init ( void );
extern err_t Lgn_Logon ( char *workgroup, char *userid, char *password );
extern err_t Lgn_Logoff ( void );

extern _kernel_oserror *Lgn_LogonOp_SWI ( _kernel_swi_regs *R );

extern void Lgn_Register(void);

extern char Lgn_PrimaryDCName[];
extern char Lgn_HomeDirName[];
extern char Lgn_HomeServerName[];
extern char Lgn_HomeShareName[];
