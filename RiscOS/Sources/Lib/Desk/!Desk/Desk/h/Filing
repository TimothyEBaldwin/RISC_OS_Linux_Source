#ifndef __Desk_Filing_h
#define __Desk_Filing_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef Desk_filing_MAXLEAFNAMELEN
#define Desk_filing_MAXLEAFNAMELEN 32
#endif
typedef enum {
Desk_filing_NOTFOUND = 0,
Desk_filing_FILE = 1,
Desk_filing_DIRECTORY = 2,
Desk_filing_IMAGEFILE = 3
} Desk_filing_objtype;
typedef struct {
int loadaddr;
int execaddr;
int length;
int attrib;
Desk_filing_objtype objtype;
char name[ Desk_filing_MAXLEAFNAMELEN];
} Desk_filing_direntry;
typedef struct {
int loadaddr;
int execaddr;
int length;
int attrib;
Desk_filing_objtype objtype;
int SIN;
char date[ 5];
char name[ Desk_filing_MAXLEAFNAMELEN];
} Desk_filing_fulldirentry;
typedef enum {
Desk_readdirtype_DIRENTRY,
Desk_readdirtype_FULLDIRENTRY,
Desk_readdirtype_NAMEONLY
} Desk_filing_readdirtype;
typedef struct {
char *dirname;
void *buf;
int size;
Desk_filing_readdirtype type;
union {
Desk_filing_direntry *direntry;
Desk_filing_fulldirentry *fulldirentry;
char *name;
void *act;
} act;
int offset;
int read;
char *match;
} Desk_filing_dirdata;
void Desk_Filing_OpenDir( const char *dirname, Desk_filing_dirdata *dirdata,
int bufsize, Desk_filing_readdirtype type);
void	Desk_Filing_OpenDir2( const char *dirname, Desk_filing_dirdata *dirdata,
                            int bufsize, Desk_filing_readdirtype type, const char* wildcard);
  void *Desk_Filing_ReadDir( Desk_filing_dirdata *dirdata);
  void Desk_Filing_CloseDir( Desk_filing_dirdata *dirdata);
  void	Desk_Filing_ReadDirNames( const char *dirname, char *buf,
                                 int *number, int *offset,
                                 int size, const char *match);
  void	Desk_Filing_ReadDirEntry( const char *dirname, Desk_filing_direntry *buf,
                                 int *number, int *offset,
                                 int size, const char *match);
  void	Desk_Filing_ReadFullDirEntry( const char *dirname, Desk_filing_fulldirentry *buf,
                                     int *number, int *offset,
                                     int size, const char *match);
  void	Desk_Filing_ReadCatalogue( const char *filename, Desk_filing_objtype *objtype,
                                  int *loadaddr, int *execaddr, int *length,
                                  int *attrib, int *filetype);
void Desk_Filing_SingleDirEntry( const char *filename,
Desk_filing_direntry *buf, int size);
void Desk_Filing_SingleDirEntry2( const char *dirname,
Desk_filing_direntry *buf,
int size, const char *filename);
void Desk_Filing_SingleFullDirEntry( const char *filename,
Desk_filing_fulldirentry *buf, int size);
void Desk_Filing_SingleFullDirEntry2( const char *dirname,
Desk_filing_fulldirentry *buf,
int size, const char *filename);
char *Desk_Filing_GetTopPathname( const char *pathname, int count);
char *Desk_Filing_GetPathname( const char *filename, char *pathname);
char *Desk_Filing_GetLeafname( const char *filename, char *leafname);
char *Desk_Filing_FindLeafname( const char *filename);
char *Desk_Filing_MakePath( char *newpath, const char *dirname, const char *leafname);
void Desk_Filing_CanonicalisePath( const char *pathname, char *buffer,
int size, int *spare);
typedef Desk_os_error *(*Desk_filing_scan_startdirfn) ( const char *dirname,
Desk_filing_fulldirentry *dirdata,
void *reference);
typedef Desk_os_error *(*Desk_filing_scan_foundfilefn) ( const char *dirname,
Desk_filing_fulldirentry *filedata,
void *reference);
typedef Desk_os_error *(*Desk_filing_scan_enddirfn) ( const char *dirname,
Desk_filing_fulldirentry *dirdata,
void *reference);
#define Desk_filing_scan_PRUNE ( (Desk_os_error *) 1)
void Desk_Filing_ScanDir( const char *dirname,
Desk_filing_scan_startdirfn startdirproc,
Desk_filing_scan_foundfilefn foundfileproc,
Desk_filing_scan_enddirfn enddirproc,
void *reference
);
void Desk_Filing_ScanDir2(const char *dirname,
Desk_filing_scan_startdirfn startdirproc,
Desk_filing_scan_foundfilefn foundfileproc,
Desk_filing_scan_enddirfn enddirproc,
Desk_bool skipdirerrors,
void *reference);
void Desk_Filing_ScanDirByDir( const char *dirname,
Desk_filing_scan_startdirfn startdirproc,
Desk_filing_scan_foundfilefn foundfileproc,
Desk_filing_scan_enddirfn enddirproc,
void *reference
);
int Desk_Filing_CompareDates( char date1[5], char date2[5]);
Desk_filing_objtype Desk_Filing_GetObjType( const char* filename);
#ifdef __cplusplus
}
#endif
#endif
