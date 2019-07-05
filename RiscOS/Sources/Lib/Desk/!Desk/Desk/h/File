#ifndef __Desk_File_h
#define __Desk_File_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_SWI_h
#include "Desk.SWI.h"
#endif
#ifndef __Desk_Error2_h
#include "Desk.Error2.h"
#endif
extern void	Desk_File_Delete( const char *filename);
extern int Desk_File_Size( const char *filename);
extern Desk_bool Desk_File_Exists( const char *filename);
typedef int Desk_file_position;
typedef int Desk_file_handle;
#define Desk_file_READERROR (-1)
typedef enum
{
  Desk_file_READ   = 0x40,          
  Desk_file_WRITE  = 0x80,          
  Desk_file_APPEND = 0xC0           
} Desk_file_access;
extern Desk_file_handle Desk_File_Open( const char *filename, Desk_file_access access);
extern void Desk_File_Close(Desk_file_handle handle);
extern Desk_bool Desk_File_EOF(Desk_file_handle handle);
extern void Desk_File_Seek(Desk_file_handle handle, Desk_file_position position);
extern Desk_file_position Desk_File_ReturnPos(Desk_file_handle handle);
extern int Desk_File_ReadExtent(Desk_file_handle handle);
extern void Desk_File_WriteBytes(Desk_file_handle handle,
const void *buffer, int numbytes);
extern int Desk_File_ReadBytes(Desk_file_handle handle, void *buffer, int numbytes);
extern void Desk_File_Write8(Desk_file_handle handle, int byte);
#define Desk_File_WriteByte Desk_File_Write8
#define Desk_File_WriteChar Desk_File_Write8
extern int Desk_File_Read8(Desk_file_handle handle);
#define Desk_File_ReadByte Desk_File_Read8
#define Desk_File_ReadChar Desk_File_Read8
extern void Desk_File_Write32(Desk_file_handle handle, int word);
#define Desk_File_WriteWord Desk_File_Write32
#define Desk_File_WriteInt Desk_File_Write32
#define Desk_File_WriteLong Desk_File_Write32
extern int Desk_File_Read32(Desk_file_handle handle);
#define Desk_File_ReadWord Desk_File_Read32
#define Desk_File_ReadInt Desk_File_Read32
#define Desk_File_ReadLong Desk_File_Read32
extern int Desk_File_Read32R(Desk_file_handle handle);
#define Desk_File_ReadWordR Desk_File_Read32R
#define Desk_File_ReadIntR Desk_File_Read32R
#define Desk_File_ReadLongR Desk_File_Read32R
extern void Desk_File_Write32R(Desk_file_handle handle, int word);
#define Desk_File_WriteWordR Desk_File_Write32R
#define Desk_File_WriteIntR  Desk_File_Write32R
#define Desk_File_WriteLongR Desk_File_Write32R
extern void	Desk_File_SetType( const char *filename, int type);
extern void	Desk_File_SetLoad( const char *filename, int load);
extern void	Desk_File_SetExec( const char *filename, int exec);
extern void	Desk_File_CreateDirectory( const char *dirname);
extern int Desk_File_GetType( const char *filename);
int	Desk_File_GetLength( const char* filename);
extern Desk_bool Desk_File_IsDirectory( const char *pathname);
extern void	Desk_File_LoadTo( const char *filename, void *address, int *size );
extern void Desk_File_Date( const char *filename, char *fivebytedate);
extern char*	Desk_File_AllocLoad( const char* filename, int* lengthptr);
extern char* Desk_File_AllocLoad0( const char *filename);
extern int Desk_File_printf(Desk_file_handle file, const char *format, ...);
extern int Desk_File_ReadExtent(Desk_file_handle handle);
void Desk_File_SaveMemory2( const char* filename, void* buffer, int size, int filetype);
#define Desk_File_SaveMemory( filename, buffer, size) Desk_File_SaveMemory2( filename, buffer, size, 0xfff)
void Desk_File_EnsureDirectory( const char* path);
void Desk_File_EnsureParentDirectory( const char* filename);
#define Desk_FILETYPE(x) (((x) & 0xFFF00) >> 8)
#define Desk_filetype_AIM 0x004
#define Desk_filetype_CLEAR 0x690
#define Desk_filetype_DEGAS 0x691
#define Desk_filetype_IMG 0x692
#define Desk_filetype_AMIGAIFF 0x693
#define Desk_filetype_MACPAINT 0x694
#define Desk_filetype_GIF 0x695
#define Desk_filetype_PCX 0x697
#define Desk_filetype_QRT 0x698
#define Desk_filetype_MTV 0x699
#define Desk_filetype_CADSOFT 0x69A
#define Desk_filetype_IRLAM 0x69B
#define Desk_filetype_BMP 0x69C
#define Desk_filetype_TARGA 0x69D
#define Desk_filetype_PBMPlus 0x69E
#define Desk_filetype_ZVDA 0x69F
#define Desk_filetype_MSX2 0x6A0
#define Desk_filetype_RLE 0x6A1
#define Desk_filetype_COLORIX 0x6A2
#define Desk_filetype_FITS 0x6A3
#define Desk_filetype_HAWKV9 0x6A4
#define Desk_filetype_REPLAY 0xAE7
#define Desk_filetype_ALARMS 0xAE9
#define Desk_filetype_DRAWFILE 0xAFF
#define Desk_filetype_BBCROM 0xBBC
#define Desk_filetype_AUDIOWRK 0xBD6
#define Desk_filetype_RENDPIC 0xD58
#define Desk_filetype_ARCHIVE 0xDDC
#define Desk_filetype_PROART 0xDE2
#define Desk_filetype_PICTURE 0xDFA
#define Desk_filetype_PRNTDEFN 0xFC6
#define Desk_filetype_DOSDISC 0xFC8
#define Desk_filetype_SUNRASTR 0xFC9
#define Desk_filetype_DEVICE 0xFCC
#define Desk_filetype_CACHE 0xFCF
#define Desk_filetype_PCEMCONF 0xFD0
#define Desk_filetype_DEBIMAGE 0xFD3
#define Desk_filetype_TASKEXEC 0xFD6
#define Desk_filetype_TASKOBEY 0xFD7
#define Desk_filetype_MAKEFILE 0xFE1
#define Desk_filetype_DOS 0xFE4
#define Desk_filetype_DESKTOP 0xFEA
#define Desk_filetype_OBEY 0xFEB
#define Desk_filetype_TEMPLATE 0xFEC
#define Desk_filetype_PALETTE 0xFED
#define Desk_filetype_TIFF 0xFF0
#define Desk_filetype_CONFIG 0xFF2
#define Desk_filetype_PRINTOUT 0xFF4
#define Desk_filetype_POSCRIPT 0xFF5
#define Desk_filetype_FONT 0xFF6
#define Desk_filetype_BBCFONT 0xFF7
#define Desk_filetype_ABSOLUTE 0xFF8
#define Desk_filetype_SPRITE 0xFF9
#define Desk_filetype_MODULE 0xFFA
#define Desk_filetype_BASIC 0xFFB
#define Desk_filetype_UTILITY 0xFFC
#define Desk_filetype_DATA 0xFFD
#define Desk_filetype_COMMAND 0xFFE
#define Desk_filetype_TEXT 0xFFF
#define Desk_filetype_HTML 0xFAF
#ifdef __cplusplus
}
#endif
#endif
