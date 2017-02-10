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
/* -> h.DrawFileIO
 *
 * Header for file I/O fumctions in Draw
 *
 * Author:  Richard Manby, David Elworthy
 * Version: 0.11
 * History: 0.10 - 12 June 1989 - header added. Old code weeded.
 *          0.11 - 26 June 1989 - name changes.
 *
 */

#define NEWLOADCODE 1
#define NEWSAVECODE 1

/* for compatibility with xfersend & xferrecv, these routines  */
/* return TRUE if successful, else report the error using werr */
/* and return FALSE.                                           */

typedef enum
{ via_FILE,          /* Save/load into/from file */
  via_RAM,           /* Save/load via RAM */
  via_COMMANDLINE,   /* Load from command line parameters */
  via_DIRECTCLICK    /* Save without dbox */
} fileIO_method;

extern void draw_file_fontuse_object (draw_objptr, char *fontusetab);
   /*Writes 1's in fontusetab at positions corresponding in draw_fontcat to
      fonts used by the given object.*/

diagrec *draw_file_loadfile (diagrec *diag, viewrec *vuue, char *name,
    int filetype, int filesize, fileIO_method method,
    draw_objcoord *mouse);

/* Routines passed to xfersend                 */
/*                                             */
/* 'save' routines output Draw format files    */
/* 'export' routines output other file formats */
/* 'print' routines print the file if it is    */
/*         dropped on the printer application  */

extern BOOL draw_file_file_saveall (char *filename, void *handle);
extern BOOL draw_file_file_savedirect (char *filename, diagrec *diag);
extern BOOL draw_file_file_saveselection (char *filename, void *handle);
extern BOOL draw_file_file_exportsprites (char *filename, void *handle);
extern BOOL draw_file_file_exportTextArea (char *filename, void *handle);
extern BOOL draw_file_file_exportEPSF (char *filename, void *handle);
extern BOOL draw_file_file_exportJPEG (char *filename, void *handle);

extern BOOL draw_file_ram_saveall (void *handle, int *maxbuf);
extern BOOL draw_file_ram_saveselection (void *handle, int *maxbuf);
extern BOOL draw_file_ram_exportsprites (void *handle, int *maxbuf);
extern BOOL draw_file_ram_exportTextArea (void *handle, int *maxbuf);
extern BOOL draw_file_ram_exportEPSF (void *handle, int *maxbuf);

extern BOOL draw_file_printall (char *filename, void *handle);

extern BOOL draw_file_get (char *name, char **buffp, int offset,
    int *filelenp, xferrecv_buffer_processor extender);

extern int draw_file_matches (char *a, char *b);
    /* Case insensitive string compare */

extern void draw_file_load_named_file (char *filename, diagrec *diag,
    viewrec *vuue);

extern int draw_file_size (diagrec *);

extern int draw_file_selection_size (diagrec *);

extern int draw_file_sprites_size (diagrec *);

extern int draw_file_text_size (diagrec *);
