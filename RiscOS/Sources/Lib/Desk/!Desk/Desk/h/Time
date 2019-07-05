#ifndef __Desk_Time_h
#define __Desk_Time_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
extern int Desk_Time_Monotonic(void);
extern void Desk_Time_ConvertDateAndTime(const char *fivebyteblock, char *buffer,
int bufflen, const char *format);
#define Desk_Time_CTIME "%W3 %M3 %DY %z24:%MI:%SE %CE%YR"
#define Desk_Time_STANDARD "%24:%mi:%se %dy-%m3-%ce%yr"
#define Desk_Time_FANCYDATE "%WE, %zDY%ST of %MO, %CE%YR"
#define Desk_Time_SHORTTIME "%z12:%MI%pm"
#define Desk_Time_LONGTIME "%z12:%MI:%SE%pm"
#define Desk_Time_EUROTIME "%z24:%MI:%SE"
extern void Desk_Time_ConvertStandardDateAndTime(const char *fivebyteblock,
char *buffer, int bufflen);
#ifdef __cplusplus
}
#endif
#endif
