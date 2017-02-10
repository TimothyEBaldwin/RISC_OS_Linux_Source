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
*  RPC.H -- Header for C.RPC functions
*
*  Versions
*  02-02-95 INH Original
*
*/

extern err_t RPC_EnumerateShares ( char *server );
extern err_t RPC_EnumerateServers ( char *workgroup );
extern char *RPC_GetDomainController ( char *domain );
extern err_t RPC_LogonUser ( char *server, char *user, char *password,
                              char **pHomeDir );


extern err_t RPC_NameOp ( int reason, char *name_in, char *name_out );
#define NAMEOP_GETLOCAL   0
#define NAMEOP_GETWG      1
#define NAMEOP_GETBROWSER 2
#define NAMEOP_GETDC      3

extern err_t RPC_Transact ( char *servername, char *share_name,
                                    void *Transaction_Params );

extern char  RPC_DebugMsg[];
extern int   RPC_ErrorCount;
extern bool  RPC_Init( void );

