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
*     LLC.H - Header for LLC Related exports
*
*     05-02-92 INH    Original
*
*/

/* Connection handle */

typedef int HCONN;


/* Physical network address */

typedef struct
{
  BYTE b[6];
}
  NETADDR;

/* Received Packet processing functions ***************** */

/* Receive functions are expected to dispose of the mbuf chains
   they are handed. Beware! The source address for a UI_RCV_PROC is
   a transient value only!
*/

typedef void (*UI_RCV_PROC) ( NETADDR *src, BUFCHAIN data, void *private );
typedef void (*LLC_RCV_PROC) ( HCONN hc, BUFCHAIN data, void *private );


/* Connection for LLC-level streams ******************** */

extern bool  LLC_Init ( void );
extern err_t LLC_AttachDriver ( char *drivername, const NETADDR *multi_hw );
extern void  LLC_Shutdown ( void );

/* UI (Datagram) service */

extern err_t UI_SetReceiver ( int SAP, UI_RCV_PROC RcvFn, void *private );
extern err_t UI_SendData ( NETADDR *dst, int SAP, BUFCHAIN pB );

/* LLC (Logical Link) service */

extern err_t LLC_SendData ( HCONN hc, BUFCHAIN data );

extern err_t LLC_OpenLink ( NETADDR *dst, int DSAP, LLC_RCV_PROC RcvFn,
            void *Private, HCONN *pHandleOut );

extern err_t LLC_CloseLink ( HCONN hc );

extern bool LLC_LinkOK ( HCONN hc );

extern int  LLC_GetMTU (void);

/* General */

extern void          LLC_BackgroundProcess(void);
extern NETADDR       LLC_MachineAddress;
extern volatile int  LLC_TickerTime;
/*extern int LLC_CallbackFn_handler(void);*/

/* Timers ------------- */

/* We implement a general-purpose timer library, which
   provides a 'safe' callback when a given timer has
   expired.
*/

typedef void (*pfnExpire) ( void *prvdata );

struct Timer
{
  struct Timer *next, *prev;
  int           status;
#define TMR_INACTIVE 0
#define TMR_ACTIVE   1
  int           expiretime;


  pfnExpire     expirefn;
  void *        prvdata;
};

extern void TimerInit
       ( struct Timer *pT, pfnExpire expire_fn, void *prvdata );

extern void TimerStart
       ( struct Timer *pT, int timeout );

extern void TimerClear
       ( struct Timer *pT );

#define TimerRunning(p) ((p)->status == TMR_ACTIVE)


/* Exports used by CMHG veneers */

/*
extern int CallbackFn_handler(void);
extern int TickerFn_handler ( _kernel_swi_regs *R, int pw );
extern int ReceiveFn_handler ( _kernel_swi_regs *R, int pw );












*/
