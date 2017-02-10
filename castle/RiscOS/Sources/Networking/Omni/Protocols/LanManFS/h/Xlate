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
*  Xlate.H --  DOS to RISCOS name & attrib mapping header
*
*  Versions
*  08-03-94 INH Original
*
*/

/* Some general functions */
extern int stricmp ( const char *s1, const char *s2 );
extern void strcpyn ( char *d, const char *s, int n );
extern void strcpyn_upper ( char *d, const char *s, int n );
extern void strcpyn_lower ( char *d, const char *s, int n );

extern void Xlt_Jumble ( char *str );
extern void Xlt_Unjumble ( char *str );

#define CNV_DEFAULT_TYPE        FileType_Text
#define CNV_DATETIME            1
#define CNV_ATTRIBS             2

extern void Xlt_CnvDOStoRO ( DOS_ATTRIBS *pInAttr,
                             RISCOS_ATTRIBS *pOutAttr, int flags );

extern void Xlt_CnvROtoDOS ( RISCOS_ATTRIBS *pInAttr,
                             DOS_ATTRIBS *pOutAttr, int flags );


extern char *Xlt_GetRISCOSLeafName ( char *name );
extern void Xlt_NameDOStoRO ( char *riscos_dst, char *dos_src );

/* Name mode */
#define NM_PRESERVED 0
#define NM_LOWERCASE 1
#define NM_FIRSTCAPS 2
#define NM_INTERNAL  4 /* Can't be selected at the CLI */


extern err_t Xlt_ExpandSearchEntry ( BYTE *entry,
            char *DOS_pathname,
            char *name_out,
            DOS_ATTRIBS *pOutDA,
            RISCOS_ATTRIBS *pOutRA );
extern err_t Xlt_ExpandSearchEntryX2 ( BYTE *entry,
            char *DOS_pathname,
            char *name_out,
            DOS_ATTRIBS *pOutDA,
            RISCOS_ATTRIBS *pOutRA );


extern err_t Xlt_SetDefaultDrv ( char *path );
extern err_t Xlt_ConvertPath ( char *RO_name_in,
                               char *DOS_name_out );

#ifdef LONGNAMES
/* Looks at the specified path/leaf name and determines if it has
 * a ,xxx type specifier on the end of it.  If it does, it returns
 * the address of the comma in the terminator parameter, and updates
 * the RISCOS_ATTRIBS.loadaddr field to contain the type of the file.
 * The source string is not modified (but cannot be const without
 * requiring a cast to store the address of the terminator)
 */
extern err_t Xlt_SplitLeafnameX2 ( char *leafname, RISCOS_ATTRIBS *pRA,
  char **terminator);

/* Trims the optional ",ttt" extension from 'name'
 * and returns the updated string
 */
extern err_t Xlt_RemoveROType ( char *name );

/* Alters the filename specified so that it co-incides with the
 * type encoded in the given "load addr" parameter,
 * Returns 1 if it changed the filetype, 0 otherwise
 */
extern int Xlt_AddROType ( char *leafname, uint loadaddr );
#endif
