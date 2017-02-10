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
*  Stats.H -- Header for C.Stats functions
*
*  Versions
*  21-08-95 INH Original
*
*/

extern void Stat_Show ( void );
extern bool Stat_Init ( void );
extern int  Stat_ClassMask;
#define SCLASS_GENERAL 1
#define SCLASS_IP      2
#define SCLASS_NETBEUI 4

#define STA_NETTX_PKTS			0
#define STA_NETRX_EVTS   		1
#define STA_NETRX_PKTS  		2
#define STA_NETRX_OWNTX 		3
#define STA_LLCRX_PKTS   		4

#define STA_LLCRX_TOOSHORT		5
#define STA_LLCRX_UIDATA		6
#define STA_LLCRX_UFORMAT		7
#define STA_LLCRX_IFORMAT		8
#define STA_LLCRX_SFORMAT		9

#define STA_LLCRX_CONN			10
#define STA_LLCRX_DISCON		11
#define STA_LLCRX_FRMR			12
#define STA_LLCRX_DISC			13
#define STA_LLCRX_UNKNOWNU		14

#define STA_LLCRX_DATA			15
#define STA_LLCRX_REJDATA		16
#define STA_LLCRX_PKTACKS		17
#define STA_LLCRX_REJECTS               18
#define STA_LLCRX_RESENDS		19

#define STA_LLC_T1EXPIRE		20
#define STA_LLC_T1FAIL			21
#define STA_LLC_TXPACKETS		22
#define STA_LLC_OPENREQ			23
#define STA_LLC_CLOSEREQ		24

#define STA_SERIOUS_BARF                25
#define STA_LLCRX_NOCONN                26

#define STA_IP_EVENTS                   27
#define STA_IP_RXDGRAM                  28
#define STA_MAXSTATS 29

extern int Stat_StatTable [STA_MAXSTATS];

#define STAT(a)  (Stat_StatTable[(a)]++)
#define Stat_IncBy(a,n)  (Stat_StatTable[(a)]+=(n))
