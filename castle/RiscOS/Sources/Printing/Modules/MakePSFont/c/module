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
/* -*-C-*-
 * Module-specific parts
 */

#include "module.h"
#include "swicall.h"
#include "mheader.h"

#if DEBUG

#define HostFS_HostVdu 0x40100
#define HostFS_TubeVdu 0x40101

void dstringc (char *s)
{
    swi(HostFS_HostVdu, END);
    swi(OS_Write0, R0, s, END);
    swi(HostFS_TubeVdu, END);
}

void dstring (char *s)
{
    dstringc (s); dstringc("\r\n");
}

void dint (char *s, int i)
{
    char num[12];
    sprintf(num, "%d", i);
    dstringc(s); dstring(num);
}

#endif


/* Make an error by looking up a token in our messages file which is constructed
 * from the given error number.
 */
os_error *make_error (int num)
{
    static os_error error;
    int msgtrans_desc[4];
    os_error *err;

    if ((err = swi(MessageTrans_OpenFile, R0, msgtrans_desc, R1, Module_MessagesFile, R2, 0, END)) == NULL)
    {
        error.errnum = num + ERROR_BASE;
        sprintf(error.errmess, "E%02d", num-1);
        err = swi(MessageTrans_ErrorLookup, R0, &error, R1, msgtrans_desc, R2, 0, END);
        (void)swi(MessageTrans_CloseFile, R0, msgtrans_desc, END);
    }

    /* Copy error as MessageTrans is capable of overwriting it if we
     * don't use it straight away.
     */
    error.errnum = err->errnum;
    strncpy(error.errmess, err->errmess, sizeof(error.errmess));
    return &error;
}


/*
 * BODGE ALERT
 * The HACK structure is a mimic of part of the FILE structure, with
 * the hidden fields made available.
 */
typedef struct _hack
{
    unsigned char *__ptr;
    int __icnt, __ocnt, __flag;
    unsigned char *__base;
    int __file;
} HACK;

Bool do_declarations;           /* TRUE if we are declaring stuff to the */
                                /* MiscOp fontlist.  If this is set, output */
                                /* should be NULL. */

Bool do_extra_declarations;     /* TRUE if we want to declare DocumentFonts
                                 * and DocumentSuppliedFont entries too. */

Bool dont_allow_downloads;      /* FALSE if whole fonts may be downloaded.  If */
                                /* TRUE then fonts may be remapped, but big nasty */
                                /* space-consuming downloads will be quietly */
                                /* replaced with a reference to a default font */

Bool permanent;                 /* TRUE if we're doing a permanent download; */
                                /* handle font names and encodings differently */

Bool procremap;                 /* TRUE if we rely on the presence of RF and RFE procs */
                                /* for font remapping */

_kernel_oserror *convert_swi (int swi_no, _kernel_swi_regs *r, void *private)
{
    switch (swi_no)
    {
    case MakePSFont_MakeFont - MakePSFont_00:
        /*
         * R0: file handle, or -1 for no output (but still declare fonts
         *     and encodings) or -2 for no output and no declarations (just
         *     return name).
         * R1: font name string, NUL terminated
         * R2: return font name buffer or NULL if you don't want to know
         * R3: size of buffer (ignored if R2 is NULL)
         * R4: Flags:
         *      Bit 0 set: make MiscOp entries of types DF_REGISTRY and DSF_REGISTRY.

         *      Bit 1 set: Don't allow downloading -- substitute a default font instead.
         *                 This only applies if bit 2 is clear (permanent download) and
         *                 does not affect remappings -- only full downloads.  The default
         *                 font is hardwired into the code (DEFAULTFONT).

         *      Bit 2 set: this is a transient download (inside print job) and an Acorn
         *                 encoding may be sent/referenced.  The font might have kerning info,
         *                 and its name will be prefixed RO_ or RK_.  If this bit is clear,
         *                 then the font is being downloaded permanently, without an encoding and
         *                 with a name prefix of DL_.  In this case the font should get
         *                 remapped to something with an encoding when someone tries to
         *                 print with it.  Unless you are providing an exitserver wrapper
         *                 in the calling code, this bit should be SET.

         *      Bit 3 set: try to provide kerning info.  No effect if bit 2 is clear.

         *      Bit 4 set: Do remaps with RF and RFE procedures (which should be predefined
         *                 in the preceding PostScript prologue).  This mechanism is provided
         *                 so that the remapping system can be altered by editing the prologue
         *                 file.  RF takes three parameters:
         *                      newname matrix oldname RF
         *                 RFE takes four parameters:
         *                      newname encoding matrix oldname RFE
         *                 In both cases matrix may be 'false' meaning don't alter the
         *                 parent font's matrix.  If a matrix is specified it should be
         *                 concatenated with the parent font's matrix.  For RFE, encoding
         *                 may be 'false' meaning use the parent font's encoding.
         *                 The matrix may be 'false' which means don't apply a matrix.
         *
         *                 If this bit is not set, then a short PostScript remap sequence is
         *                 sent instead, which does not rely on prologue support.  If you are
         *                 doing permanent downloading (bit 2 clear) then you should set this bit).
         *

         *      All other bits reserved and should be zero.

         * RETURNS:
         * V SET:  R0 points to error block
         * V CLEAR: if R3 is zero, the (R2) contains the zero-terminated
         *          font name to reference this font with.
         *          If R3 is non-zero, then the return name buffer overflowed.
         *          Allocate a buffer at least R3 bytes long, and call
         *          again to obtain the font name.  (NB: the output has
         *          already been sent; the second call just gets you
         *          the fontname).
         *
         * Other registers preserved.
         * Output to the file handle supplied (which is still open)
         * Zero or more fonts will have been declared to the printer system.
         */

        {
            int null_handle;
            os_error *err;
            FILE *out;
            HACK *hack;
            int handle = r->r[0];
            char *fontname = (char *) r->r[1];
            char *fontret = (char *) r->r[2];
            int fontretlen = r->r[3];
            int flags = r->r[4];

            if (handle < 0)
            {
                out = NULL;
                do_declarations = (handle == -1);
            }
            else
            {
                do_declarations = TRUE;
                out = fopen("NULL:", "w");
                hack = (HACK *) out;
                if (!out)
                    return make_error(ENULL);
                null_handle = hack->__file;
                hack->__file = r->r[0];
            }

dint("Flags ", flags);
            do_extra_declarations = do_declarations && (flags & 1);
            dont_allow_downloads = (flags & 2);
            permanent = !(flags & 4);
            procremap = (flags & 16);

dstring("Calling ensure");
            err = ensure_font(fontname, out, fontret, &fontretlen, flags & 8);
dstring("Back from ensure");

            if (fontret)
                r->r[3] = fontretlen;

            if (handle >= 0)
            {
                fflush(out);    /* this is vital! */
                hack->__file = null_handle;
                fclose(out);
            }

            if (err)
                return err;
        }
        return NULL;

    default:
        return error_BAD_SWI;
    }
}

