#ifndef __Desk_MsgTrans_h
#define __Desk_MsgTrans_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdarg.h>
#ifndef __Desk_DeskMem_h
#include "Desk.DeskMem.h"
#endif
typedef struct {
int data[4];
} Desk_msgtrans_filedesc;
extern void Desk_MessageTrans_FileInfo( const char *filename, int *flags, int *size);
extern void Desk_MessageTrans_OpenFile(Desk_msgtrans_filedesc *filedesc,
const char *filename, char *buffer);
extern void Desk_MessageTrans_Lookup(Desk_msgtrans_filedesc *filedesc, const char *token,
char **buffer, int *size,
const char *p0, const char *p1, const char *p2, const char *p3);
extern void Desk_MessageTrans_CloseFile(Desk_msgtrans_filedesc *filedesc);
extern void Desk_MsgTrans_LoadFile(Desk_msgtrans_filedesc **filedesc, const char *filename);
#define Desk_MsgTrans_Lookup(filedesc, token, buffer, bufflen) \
Desk_MsgTrans_LookupPS((filedesc), (token), (buffer), (bufflen), \
NULL, NULL, NULL, NULL)
extern void	Desk_MsgTrans_LookupPS(Desk_msgtrans_filedesc *filedesc, const char *token,
                                   char *buffer, int bufflen,
                                   const char *p0, const char *p1, const char *p2, const char *p3);
extern void	Desk_MsgTrans_LoseFile(Desk_msgtrans_filedesc *filedesc);
#define Desk_MsgTrans_Report(filedesc, token, fatal) \
  Desk_MsgTrans_ReportPS((filedesc), (token), (fatal), 0, 0, 0, 0)
extern void	Desk_MsgTrans_ReportPS(Desk_msgtrans_filedesc *filedesc, const char *token,
                                   Desk_bool fatal,
                                   const char *p0, const char *p1, const char *p2, const char *p3);
int	Desk_MessageTrans_LookupGetSize(
		Desk_msgtrans_filedesc*	filedesc,
		const char*		token,
		const char*		p0,
		const char*		p1,
		const char*		p2,
		const char*		p3
		);
void Desk_MessageTrans_LookupIntoBuffer(
Desk_deskmem_buffer* buffer,
Desk_msgtrans_filedesc* filedesc,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
void Desk_MessageTrans_LookupIntoBufferPos(
Desk_deskmem_buffer* buffer,
int pos,
Desk_msgtrans_filedesc* filedesc,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
void Desk_MessageTrans_LookupIntoBufferCat(
Desk_deskmem_buffer* buffer,
Desk_msgtrans_filedesc* filedesc,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
void Desk_MessageTrans_OpenLookupCloseIntoBufferPos(
Desk_deskmem_buffer* buffer,
int pos,
const char* filename,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
void Desk_MessageTrans_OpenLookupCloseIntoBuffer(
Desk_deskmem_buffer* buffer,
const char* filename,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
void Desk_MessageTrans_OpenLookupCloseIntoBufferCat(
Desk_deskmem_buffer* buffer,
const char* filename,
const char* token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
typedef struct {
char* filename;
Desk_msgtrans_filedesc* desc;
}
Desk_msgtrans_rmafiledesc;
void Desk_MessageTrans_OpenFileRMA( Desk_msgtrans_rmafiledesc* filedesc, const char* filename);
void Desk_MessageTrans_CloseFileRMA( Desk_msgtrans_rmafiledesc* filedesc);
int Desk_MessageTrans_Lookupvf( char* buffer, Desk_msgtrans_filedesc *filedesc, const char *token, va_list va);
int Desk_MessageTrans_Lookupf( char* buffer, Desk_msgtrans_filedesc *filedesc, const char *token, ...);
char* Desk_MessageTrans_LookupvfStatic( Desk_msgtrans_filedesc *filedesc, const char *token, va_list va);
char* Desk_MessageTrans_LookupfStatic( Desk_msgtrans_filedesc *filedesc, const char *token, ...);
char* Desk_MessageTrans_LookupStatic(
Desk_msgtrans_filedesc *filedesc,
const char *token,
const char* p0,
const char* p1,
const char* p2,
const char* p3
);
#ifdef __cplusplus
}
#endif
#endif
