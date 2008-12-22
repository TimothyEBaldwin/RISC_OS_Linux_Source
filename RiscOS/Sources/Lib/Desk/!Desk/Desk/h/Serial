#ifndef __Desk_Serial_h
#define __Desk_Serial_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
typedef enum
{
Desk_serial_9600BAUD = 0,
Desk_serial_75BAUD,
Desk_serial_150BAUD,
Desk_serial_300BAUD,
Desk_serial_1200BAUD,
Desk_serial_2400BAUD,
Desk_serial_4800BAUD,
Desk_serial_19200BAUD = 8,
Desk_serial_50BAUD,
Desk_serial_110BAUD,
Desk_serial_134_5BAUD,
Desk_serial_600BAUD,
Desk_serial_1800BAUD,
Desk_serial_3600BAUD,
Desk_serial_7200BAUD
} Desk_serial_rate;
#define Desk_serial_USEXONXOFF 0x00000001
#define Desk_serial_IGNOREDCDBIT 0x00000002
#define Desk_serial_IGNOREDSRBIT 0x00000004
#define Desk_serial_DTROFF 0x00000008
#define Desk_serial_IGNORECTSBIT 0x00000010
#define Desk_serial_DONTUSERTSFLOWCONTROL 0x00000020
#define Desk_serial_SUPPRESSINPUT 0x00000040
#define Desk_serial_RTSHIGH 0x00000080
#define Desk_serial_XOFFRECEIVED 0x00010000
#define Desk_serial_XOFFSENT 0x00020000
#define Desk_serial_DCDHIGH 0x00040000
#define Desk_serial_NOCARRIER 0x00040000
#define Desk_serial_DSRHIGH 0x00080000
#define Desk_serial_RIHIGH 0x00100000
#define Desk_serial_CTSHIGH 0x00200000
#define Desk_serial_XOFFSENTMANUALLY 0x00400000
#define Desk_serial_SPACEINRECEIVEBUFFER 0x00800000
#define Desk_serial_8BITWORD 0x00000000
#define Desk_serial_7BITWORD 0x00000001
#define Desk_serial_6BITWORD 0x00000002
#define Desk_serial_5BITWORD 0x00000003
#define Desk_serial_1STOPBIT 0x00000000
#define Desk_serial_2STOPBITS 0x00000004
#define Desk_serial_NOPARITY 0x00000000
#define Desk_serial_PARITY 0x00000008
#define Desk_serial_ODDPARITY 0x00000000
#define Desk_serial_EVENPARITY 0x00000010
#define Desk_serial_MARKPARITY 0x00000020
#define Desk_serial_SPACEPARITY 0x00000030
extern void Desk_Serial_Activate(void);
extern void Desk_Serial_Deactivate(void);
extern int Desk_Serial_GetStatus(void);
extern void Desk_Serial_SetStatus(int Desk_eor_mask, int Desk_and_mask);
extern int Desk_Serial_GetFormat(void);
extern void Desk_Serial_SetFormat(int format);
extern Desk_serial_rate Desk_Serial_GetTxRate(void);
extern Desk_serial_rate Desk_Serial_GetRxRate(void);
extern void Desk_Serial_SetTxRate(Desk_serial_rate rate);
extern void Desk_Serial_SetRxRate(Desk_serial_rate rate);
extern int Desk_Serial_GetByte(void);
extern Desk_bool Desk_Serial_PutByte(int c);
extern void Desk_Serial_SendBreak(int length);
extern void Desk_Serial_NonZeroPollWordOnReceive(int Desk_pollword_value,
void *pollword);
#ifdef __cplusplus
}
#endif
#endif
