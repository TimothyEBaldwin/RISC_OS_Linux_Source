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
*
*  NETBIOS.H  -- Header for NetBIOS functions
*
*  14-02-94 INH  Original
*  11-10-94      Revamped, new name management
*  18-12-95	 NB_Init now does most network startup.
*  25-04-96	 Now uses function pointers to allow IP/NetBEUI switch
*/

/* Basic types & structures --------------------------- */

typedef void *hNAME;     /* NetBIOS name handle */
typedef void *hSESSION;  /* NetBIOS session handle */

/* ---------- */

typedef enum
{
  ntSERVER   = 0x20,
  ntMACHINE  = 0x00,
  ntUSER     = 0x03,
  ntFORWD    = 0x05,
  ntPRIMARYDC= 0x1B,
  ntMBROWSER = 0x1D,
  ntELECTION = 0x1E
}
  nametype_t;

#define ANY_NAME_TYPE   (-1)

/* ---------- */

typedef union
{
  int   c4 [4];
  BYTE  b[16];
}
  NETNAME;

/* ---------- */

struct FindName_res
{
  NETNAME    name;
  nametype_t type;
  char       flags;
#define FN_GROUPNAME 0x80
};

/* Structure containing all transport type declarations ---------- */

/* We have two transport protocols (IP and NetBEUI) and currently
   we select which one to use by redirecting all the function calls
   via function pointers. It's not the ideal situation, where both
   transports could operate simultaneously, but if I'm going to do
   that, I'm going to do it in C++ */

struct NETBIOS_TRANSPORT
{
  hNAME	hMachineName;
  err_t	(*pfnStartup) (void);
  void	(*pfnShutdown) (void);
  err_t	(*pfnFormatName) ( nametype_t nt, char *name, NETNAME *pnn );
  nametype_t (*pfnDecodeName) ( NETNAME *pnn, char *buf);
  bool  (*pfnMatchName) ( NETNAME *pnn1, NETNAME *pnn2 );
  err_t (*pfnAddLocalName) ( nametype_t nt, char *name, hNAME *phName );
  err_t (*pfnRemoveLocalName) ( hNAME hName );
  err_t (*pfnOpenSession) ( hNAME hLocalName, NETNAME *pnnFarEnd,
                              hSESSION *phSession );
  err_t (*pfnSendData) ( hSESSION hS, BUFCHAIN Data );
  err_t (*pfnSendBlockData) ( hSESSION hS, BYTE *where, uint datalen );
  err_t (*pfnClearRxQueue) ( hSESSION hS );
  err_t (*pfnGetData) ( hSESSION hS, BUFCHAIN *pOutData, int timeout );
  err_t (*pfnGetBlockData) ( hSESSION hS, BYTE *where, uint *len_in_out,
                                                  int timeout );
  bool  (*pfnLinkOK) ( hSESSION hS );
  err_t (*pfnCloseSession) ( hSESSION hS );
  int   (*pfnFindNames) ( NETNAME *pnnFind,
                          nametype_t ntFind,
                          struct FindName_res *pResults,
                          int results_max,
                          int timeout );
  char * (*pfnDescribeLink) ( hSESSION hS );
  void   (*pfnInternetGone) ( void );
  void   (*pfnInternetInit) ( void );
};

/* Definitions for supplied transports ------------------------- */

extern struct NETBIOS_TRANSPORT *NB_ActiveTransport;

/* Call one of these setup functions to point NB_ActiveTransport at the
   correct set of functions */

extern void NB_NetBEUI_Setup(void);
extern void NB_NBIP_Setup(void);


/* Macro definitions ----------------- */

#define NB_MachineName		(NB_ActiveTransport->hMachineName)
#define NB_Startup(a)		(NB_ActiveTransport->pfnStartup(a))
#define NB_Shutdown(a)		(NB_ActiveTransport->pfnShutdown(a))
#define NB_FormatName(a,b,c)	(NB_ActiveTransport->pfnFormatName(a,b,c))
#define NB_DecodeName(a,b)	(NB_ActiveTransport->pfnDecodeName(a,b))

#define NB_MatchName(a,b)	(NB_ActiveTransport->pfnMatchName(a,b))
#define NB_AddLocalName(a,b,c)	(NB_ActiveTransport->pfnAddLocalName(a,b,c))
#define NB_RemoveLocalName(a)	(NB_ActiveTransport->pfnRemoveLocalName(a))
#define NB_OpenSession(a,b,c)	(NB_ActiveTransport->pfnOpenSession(a,b,c))
#define NB_SendData(a,b)	(NB_ActiveTransport->pfnSendData(a,b))

#define NB_SendBlockData(a,b,c) (NB_ActiveTransport->pfnSendBlockData(a,b,c))
#define NB_ClearRxQueue(a)	(NB_ActiveTransport->pfnClearRxQueue(a))
#define NB_GetData(a,b,c)	(NB_ActiveTransport->pfnGetData(a,b,c))
#define NB_GetBlockData(a,b,c,d) (NB_ActiveTransport->pfnGetBlockData(a,b,c,d))
#define NB_LinkOK(a)		(NB_ActiveTransport->pfnLinkOK(a))

#define NB_CloseSession(a)	(NB_ActiveTransport->pfnCloseSession(a))
#define NB_FindNames(a,b,c,d,e)	(NB_ActiveTransport->pfnFindNames(a,b,c,d,e))
#define NB_DescribeLink(a)	(NB_ActiveTransport->pfnDescribeLink(a))

#define NB_InternetGone(a)	(NB_ActiveTransport->pfnInternetGone(a))
#define NB_InternetInit(a)	(NB_ActiveTransport->pfnInternetInit(a))
