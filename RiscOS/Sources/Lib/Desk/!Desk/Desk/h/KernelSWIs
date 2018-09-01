#ifndef __Desk_KernelSWIs_h
#define __Desk_KernelSWIs_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
typedef enum
{
Desk_osbyte_DISPLAYOSVERSION = 0,
Desk_osbyte_SPECIFYINPUT = 2,
Desk_osbyte_SPECIFYOUTPUT,
Desk_osbyte_CURSORKEYSTATUS,
Desk_osbyte_WRITEPRINTERDRIVERTYPE,
Desk_osbyte_WRITEPRINTERIGNORECHAR,
Desk_osbyte_WRITERS423RXRATE,
Desk_osbyte_WRITERS423TXRATE,
Desk_osbyte_WRITEDURATION1STFLASHCOLOUR,
Desk_osbyte_WRITEDURATION2NDFLASHCOLOUR,
Desk_osbyte_WRITEKEYREPEATDELAY,
Desk_osbyte_WRITEKEYREPEATRATE,
Desk_osbyte_DISABLEEVENT,
Desk_osbyte_ENABLEEVENT,
Desk_osbyte_FLUSHBUFFER,
Desk_osbyte_RESETFUNCTIONKEYS = 18,
Desk_osbyte_WAITFORVSYNC,
Desk_osbyte_RESETFONTDEFINITIONS,
Desk_osbyte_FLUSHSELECTEDBUFFER,
Desk_osbyte_RESETGROUPOFFONTDEFINITIONS = 25,
Desk_osbyte_RW_COUNTRYNUMBER = 70,
Desk_osbyte_RW_ALPHABET = 71,
Desk_osbyte_RW_KEYBOARD = 71,
Desk_osbyte_SELECTPOINTER = 106,
Desk_osbyte_ACTIVATEMOUSE = 106,
Desk_osbyte_WRITEVDUDRIVERBANK = 112,
Desk_osbyte_WRITEDISPLAYHARDWAREBANK,
Desk_osbyte_WRITESHADOWSTATE,
Desk_osbyte_READVDUSTATUS = 117,
Desk_osbyte_REFLECTKEYBOARDSTATUSINLEDS,
Desk_osbyte_KEYBOARDSCAN = 121,
Desk_osbyte_KEYBOARDSCANNOSHIFT,
Desk_osbyte_CLEARESCAPECONDITION = 124,
Desk_osbyte_SETESCAPECONDITION,
Desk_osbyte_ACKNOWLEDGEESCAPECONDITION,
Desk_osbyte_CHECKFOREOF,
Desk_osbyte_GETBUFFERORMOUSESTATUS,
Desk_osbyte_SCANFORKEY = 129,
Desk_osbyte_READOSIDENTIFIER = 129,
Desk_osbyte_READTEXTCURSORPOSITION = 134,
Desk_osbyte_READCHARACTERATTEXTCURSOR = 135,
Desk_osbyte_READSCREENMODE = 135,
Desk_osbyte_INSERTCHARACTERCODEINTOBUFFER = 138,
Desk_osbyte_WRITEFSOPTIONS,
Desk_osbyte_ISSUEMODULESERVICECALL = 143,
Desk_osbyte_SETTVCHARACTERISTICS,
Desk_osbyte_GETCHARACTERFROMBUFFER,
Desk_osbyte_EXAMINEBUFFERSTATUS = 152,
Desk_osbyte_INSERTCHARACTERINTOBUFFER,
Desk_osbyte_RW_ASYNCCOMMSSTATE = 156,
Desk_osbyte_READVDUVARIABLE = 160,
Desk_osbyte_READCMOSRAM,
Desk_osbyte_WRITECMOSRAM,
Desk_osbyte_RW_GENERALGRAPHICSINFO,
Desk_osbyte_READOUTPUTCURSORPOSITION = 165,
Desk_osbyte_RW_50HZCOUNTER = 176,
Desk_osbyte_READINPUTSOURCE,
Desk_osbyte_RW_RS423INPUTINTERPTRETATION = 181,
Desk_osbyte_RW_NOIGNORESTATE,
Desk_osbyte_RW_RS423BUSYFLAG = 191,
Desk_osbyte_READRS423CONTROLBYTE,
Desk_osbyte_RW_FLASHCOUNTER,
Desk_osbyte_READDURATION2NDFLASHCOLOUR,
Desk_osbyte_READDURATION1STFLASHCOLOUR,
Desk_osbyte_RW_KEYREPEATDELAY,
Desk_osbyte_RW_KEYREPEATRATE,
Desk_osbyte_RW_EXECFILEHANDLE,
Desk_osbyte_RW_SPOOLFILEHANDLE,
Desk_osbyte_RW_BREAKESCAPEEFFECT,
Desk_osbyte_RW_KEYBOARDDISABLEFLAG,
Desk_osbyte_RW_KEYBOARDSTATUSBYTE,
Desk_osbyte_RW_RS423INPUTBUFFERMINSPACE,
Desk_osbyte_RW_RS423IGNOREFLAG,
Desk_osbyte_RW_BELLCHANNEL = 211,
Desk_osbyte_RW_BELLVOLUME,
Desk_osbyte_RW_BELLFREQUENCY,
Desk_osbyte_RW_BELLDURATION,
Desk_osbyte_RW_FUNCTIONKEYSTRINGLENGTH = 216,
Desk_osbyte_RW_PAGEDMODELINECOUNT,
Desk_osbyte_RW_BYTESINVDUQUEUE,
Desk_osbyte_RW_TABKEYCODE,
Desk_osbyte_RW_ESCAPECHARACTER,
Desk_osbyte_RW_INTERPRETATIONOFBUFFERCODES_C0_CF,
Desk_osbyte_RW_INTERPRETATIONOFBUFFERCODES_D0_DF,
Desk_osbyte_RW_INTERPRETATIONOFBUFFERCODES_E0_EF,
Desk_osbyte_RW_INTERPRETATIONOFBUFFERCODES_F0_FF,
Desk_osbyte_RW_FUNCTIONKEYINTERPRETATION,
Desk_osbyte_RW_SHIFTFUNCTIONKEYINTERPRETATION,
Desk_osbyte_RW_CTRLFUNCTIONKEYINTERPRETATION,
Desk_osbyte_RW_CTRLSHIFTFUNCTIONKEYINTERPRETATION,
Desk_osbyte_RW_ESCAPEKEYSTATUS,
Desk_osbyte_RW_ESCAPEEFFECTS,
Desk_osbyte_RW_CHARACTERDESTINATIONSTATUS = 236,
Desk_osbyte_RW_CURSORKEYSTATUS,
Desk_osbyte_RW_NUMERICKEYPADINTERPRETATION,
Desk_osbyte_READCOUNTRYFLAG = 240,
Desk_osbyte_READRS423BAUDRATES = 242,
Desk_osbyte_READTIMERSWITCHSTATE,
Desk_osbyte_READPRINTERDRIVERTYPE = 245,
Desk_osbyte_RW_PRINTERIGNORECHARACTER,
Desk_osbyte_RW_BREAKKEYACTIONS,
Desk_osbyte_READVDUDRIVERSCREENBANK = 250,
Desk_osbyte_READDISPLAYSCREENBANK,
Desk_osbyte_READLASTBREAKTYPE = 253,
Desk_osbyte_RW_EFFECTOFSHIFTCTRLONNUMERICKEYPAD,
Desk_osbyte_RW_BOOTOPTION
} Desk_osbyte_number;
void Desk_OS_Byte(Desk_osbyte_number reason, int r1in, int r2in,
int *r1out, int *r2out);
typedef enum
{
Desk_osword_READLINE = 0,
Desk_osword_READSYSCLOCK,
Desk_osword_WRITESYSCLOCK,
Desk_osword_READINTERVALTIMER,
Desk_osword_WRITEINTERVALTIMER,
Desk_osword_READPIXELCOLOUR = 9,
Desk_osword_READCHARACTERDEFN,
Desk_osword_READPALETTE,
Desk_osword_WRITEPALETTE,
Desk_osword_READGFXCURSORS,
Desk_osword_READCMOSCLOCK,
Desk_osword_WRITECMOSCLOCK,
Desk_osword_DEFINEPOINTERANDMOUSE = 21,
Desk_osword_WRITESCREENBASE
} Desk_osword_number;
void Desk_OS_Word(Desk_osword_number reason, void *Desk_param_block);
extern Desk_bool Desk_OS_ReadVarVal(const char *varname, char *buf, int bufsize);
extern int	Desk_OS_ReadVarVal_GetLength( const char *varname);
extern int Desk_OS_ReadVarVal_GetLength_Raw( const char *varname);
extern int Desk_OS_ReadVarVal_ReadIntoBuffer( char *buffer, const char *varname, int bufflen);
extern char *Desk_OS_ReadVarVal_AutoAlloc( const char *varname);
typedef enum
{
  Desk_modevar_MODEFLAGS = 0,
  Desk_modevar_RIGHTCOLUMN,
  Desk_modevar_BOTTOMROW,
  Desk_modevar_NCOLOUR,
  Desk_modevar_XEIGFACTOR,
  Desk_modevar_YEIGFACTOR,
  Desk_modevar_LINELENGTH,
  Desk_modevar_SCREENSIZE,
  Desk_modevar_YSHIFTFACTOR,
  Desk_modevar_LOG2BPP,
  Desk_modevar_LOG2BPC,
  Desk_modevar_XWINDOWLIMIT,
  Desk_modevar_YWINDOWLIMIT
} Desk_mode_variable;
extern void	Desk_OS_ReadModeVariable(int mode, Desk_mode_variable variable,
                                     int *value);
void	Desk_OS_SWINumberToString( int number, char *buffer, int size);
void	Desk_OS_SWINumberFromString( const char *string, int *number);
void	Desk_OS_GSTrans(const char *string, char *buffer, int size, char **end);
void	Desk_OS_CLI(const char *cmd);
int	Desk_OS_Byte_ReadCMOS( int location);
void	Desk_OS_Byte_WriteCMOS( int location, int value);
void	Desk_OS_Byte_WriteCMOSMask( int location, int mask, int value);
#ifdef __cplusplus
}
#endif
#endif
