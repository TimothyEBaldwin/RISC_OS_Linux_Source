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
/* ScrModes.c */

/*
 * ScreenModes module main code.
 */

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#include "kernel.h"
#include "swis.h"
#include "Global/RISCOS.h"
#include "Global/GraphicsV.h"
#include "Global/Services.h"
#include "Global/VduExt.h"
#include "Global/Variables.h"
#include "Global/FileTypes.h"
#include "Global/OsBytes.h"
#include "Global/CMOS.h"
#include "Global/ModHand.h"
#include "Global/VIDCList.h"
#undef   Module_Title /* CMHG defines this too */
#include "Interface/HighFSI.h"
#include "Interface/ScrModes.h"

#include "ScrModesv.h"
#include "errors.h"
#include "monitors.h"
#include "modex.h"
#include "mdfsupport.h"
#include "edidsupport.h"

/* Switch to define whether live EDID read from the monitor is in use.
 * If the graphics driver supports it and MonitorType is EDID this
 * will cause the EDID to be reloaded if the graphics driver changes.
 * Should an MDF be loaded, this behaviour is cancelled (latching). 
 */
static bool using_edid = false;

/* Pointer to (root block of) current monitor definition structure.
 * This becomes valid (non NULL) on successful completion of a
 * *loadmodefile command.  The memory space it consumes is thereafter
 * released on either (a) shutdown of the module or (b) successful
 * completion of another *loadmodefile command.
 */
MonitorDescriptionRef current_monitor = NULL; /* not defined to start with */

ModeSelectorRef preferred_mode = NULL; /* The preferred mode */

/* The sync type for the preferred mode
 * NB only service_monitorleadtranslation uses this value
 */
int preferred_sync_type = 0;
 
/* Keep a copy of the current monitor type at the time of the first
 * successful *LoadModeFile, to restore on exit.
 */
int old_monitortype = -1; /* -1 means we haven't loaded a file yet */

/* Construct an error block from the given ScreenModes module-specific
 * error code and the list of up to 3 arguments.  To ensure easy
 * internationalisability, this is done using text from our Messages
 * file, via MessageTrans_Lookup.  Note that all errors from this
 * module cause the whole process to stop (i.e. there should only be
 * one error generated for any *loadmodefile command) so don't worry
 * about efficiency; e.g. we could keep the file open and the handle
 * lying around, but there really isn't any point.
 */
_kernel_oserror *messages_lookup(char *buffer, size_t space, const char *token,
                                 const char *arg0, const char *arg1, const char *arg2)
{
    /* Handle for MessageTrans. */
    int file_data[4];
    _kernel_oserror *res;

    /* Open the Messages file */
    res = _swix(MessageTrans_OpenFile, _INR(0,2),
                file_data, Module_MessagesFile, 0);
    if (res != NULL)
    {
        return res;
    }

    res = _swix(MessageTrans_Lookup, _INR(0,7),
                file_data, token, buffer, space, arg0, arg1, arg2, NULL);
    /* Always close the messages file, ignoring possible but most unlikely errors */
    (void)_swix(MessageTrans_CloseFile, _IN(0), file_data);
    if (res != NULL)
    {
        buffer[0] = '?'; buffer[1] = '\0'; /* lookup failed */
    }
    return res;
}

_kernel_oserror *error(int error, const char *arg0, const char *arg1, const char *arg2)
{
    /* Where the final returned message is constructed */
    static _kernel_oserror theerror;
    _kernel_oserror *res;
    char token[8];

    sprintf(token, "E%02d", error);
    res = messages_lookup(theerror.errmess, sizeof(theerror.errmess), token, arg0, arg1, arg2);
    if (res != NULL)
    {
        return res;
    }
    /* Construct the rest of the error block, i.e. the error number */
    theerror.errnum = ERROR_BASE + error;
    return &theerror;
}

_kernel_oserror *new_monitordescription(MonitorDescriptionRef *description)
{
    MonitorDescriptionRef md;

    md = (MonitorDescriptionRef) calloc(1, sizeof(MonitorDescription));
    if (md == NULL)
    {
        return error(ERR_NOSPACE, 0, 0, 0);
    }

    messages_lookup(md->name, sizeof(md->name), "NoName", NULL, NULL, NULL);

    md->output_format = -1; /* Output format */
    md->external_clock = -1; /* External clock not present */
    md->modelist = NULL; /* Empty initially */
    md->audio_formats = NULL; /* Empty initially */

    *description = md;

    return NULL;
}

void free_monitordescription(MonitorDescriptionRef description)
{
    ModeDescriptionRef md;
    md = description->modelist;
    while (md)
    {
        ModeDescriptionRef td = md;
        md = md->next;
        free(td);
    }
    if (description->audio_formats)
    {
        free(description->audio_formats);
    }
    free(description);
}

void release_currentmonitor(void)
{
    if (current_monitor)
    {
        IFDEBUG printf("releasing previous monitor description\n");
        free_monitordescription(current_monitor);
    }
}

void compute_modedescription(ModeDescriptionRef md)
{
    uint32_t vtot, htot;
    int pn;
    ModeDef *mp = &md->definition.timings; /* for terseness! */
    for (htot = 0, vtot = 0, pn = 0; pn < FR__COUNT; ++pn)
    {
        htot += mp->hpar[pn];
        vtot += mp->vpar[pn];
    }
    md->line_hz = mp->pixel_khz * 1000 / htot;  /* compute line frequency in Hz */
    md->frame_mhz = md->line_hz * 1000 / vtot; /* frame frequency in milliHz, high-prec */
    if (mp->interlaced)
    {
        md->frame_mhz /= 2; /* if interlaced, one frame is 2 fields */
    }
    md->frame_hz = (md->frame_mhz + 500) / 1000; /* & low-prec for user integer Hz matching */
}

/* For efficiency in handling the Service_ModeExtension service call,
 * we keep the list of supported modes in order.  The keys used for
 * comparison of modes are (in order of use):
 *   (1) increasing x resolution
 *   (2) increasing y resolution
 *   (3) decreasing frame rate
 *   (4) increasing peak datarate at a given depth, i.e. pixelrate
 */
static int modes_inorder(ModeDescriptionRef m1, ModeDescriptionRef m2)
{
    if (m1->definition.timings.xres < m2->definition.timings.xres)
    {
        return 1;
    }
    if (m1->definition.timings.xres > m2->definition.timings.xres)
    {
        return 0;
    }
    if (m1->definition.timings.yres < m2->definition.timings.yres)
    {
        return 1;
    }
    if (m1->definition.timings.yres > m2->definition.timings.yres)
    {
        return 0;
    }
    if (m1->frame_mhz > m2->frame_mhz)
    {
        return 1;
    }
    if (m1->frame_mhz < m2->frame_mhz)
    {
        return 0;
    }
    if (m1->definition.timings.pixel_khz < m2->definition.timings.pixel_khz)
    {
        return 1;
    }
    if (m1->definition.timings.pixel_khz > m2->definition.timings.pixel_khz)
    {
        return 0;
    }
    return 1;                           /* arbitrary here - modes seem the same! */
}

void sort_modelist(ModeDescriptionRef *list)
{
    ModeDescriptionRef prev, this, next;
    int swapped;
    do
    {
        prev = NULL;                    /* marks being at start of list */
        this = *list;                   /* not NULL */
        next = this->next;              /* might be NULL, for 1-entry list */
        swapped = 0;
        while (next)
        {
            if (!modes_inorder(this, next))
            {
                ModeDescriptionRef t;
                /* Move whatever is pointing at this to point at next */
                if (prev == NULL)
                {
                    *list = next;       /* swap at start of list */
                }
                else
                {
                    prev->next = next;
                }
                /* The new successor to this record is what was after the next one */
                this->next = next->next;
                /* The new successor to what was the next record is now this record */
                next->next = this;
                /* Swap our local this and next pointers */
                t = this;  this = next;  next = t;
                swapped = 1;
            }
            /* Step all the pointers on by one in the (perhaps re-ordered) list */
            prev = this;
            this = next;
            next = next->next;
        }
    } while (swapped);
}

_kernel_oserror *set_monitortype(int monitortype)
{
    _kernel_swi_regs regs;
    regs.r[0] = 3;
    regs.r[1] = monitortype;
    return _kernel_swi(OS_ScreenMode, &regs, &regs);
}

int read_monitortype(void)
{
    _kernel_swi_regs regs;
    _kernel_oserror *res;
    regs.r[0] = 1;
    res = _kernel_swi(OS_ReadSysInfo, &regs, &regs);
    if (res)
    {
        return -1;
    }
    else
    {
        return regs.r[1];
    }
}

_kernel_oserror *restore_monitortype(void)
{
    int temp = old_monitortype;
    if (temp != -1)
    {
        old_monitortype = -1;
        return set_monitortype(temp);
    }
    return NULL;
}

static _kernel_oserror *open_modefile(const char *filename, FILE **handle)
{
    _kernel_oserror *res;
    FILE *f = fopen(filename, "r");
    *handle = f;
    if (f != NULL)
    {
        res = NULL;                     /* all OK */
    }
    else
    {
        res = _kernel_last_oserror();
        if (res == NULL)
        {
            _kernel_swi_regs regs;
            /* Couldn't open file but only C library knows why: let's find out. */
            regs.r[0] = OSFind_OpenIn | open_nopath | open_nodir | open_mustopen;
            regs.r[1] = (int) filename;
            regs.r[2] = 0;
            res = _kernel_swi(OS_Find, &regs, &regs);
            if (res == NULL)
            {
                /* Hmmm, fopen failed but we *can* open it: give up!
                 * First re-close this file handle.
                 */
                int fh = regs.r[0];
                regs.r[0] = OSFind_Close;
                regs.r[1] = fh;
                (void) _kernel_swi(OS_Find, &regs, &regs);
                res = error(ERR_OPENFAIL, filename, 0, 0);
            }
        }
    }
    return res;
}

static _kernel_oserror *loadmodefile(const char *file)
{
  _kernel_oserror *res;
  FILE *handle;

  res = open_modefile(file, &handle);
  if (res != NULL)
  {
      IFDEBUG printf("failed to open modefile\n");
  }
  else
  {
      /* Now need to differentiate if text file or EDID file. */
      /* We do so by looking for the EDID header 0x00ffffffffffff00 */
      int is_edid = 1;
      int c;
      for (int i = 0; i<8;i++)
      {
          c = getc(handle);
          if (((i == 0) || (i == 7)) && (c != 0x00))
          {
              is_edid = 0;
          }
          if (((i > 0) && (i < 7)) && (c != 0xff))
          {
              is_edid = 0;
          }
      }

      if (is_edid == 1)
      {
          /* Close the file - we need to load the whole file to map it
           * onto the EDID struct.
           */
          fclose(handle);
          /* Now pass loadEDID the path */
          res = loadedid(file);
      }
      else
      {
          rewind(handle); /* Reset the pointer to the beginning */
          res = loadtextMDF(file, handle);
      }
      if (res == NULL)
      {
          /* Use of an MDF cancels (latching) the automatic EDID side effects */
          using_edid = false;
      }
  }
  return res;
}

static _kernel_oserror *savemodefile(const char *file)
{
    char  *fbuf;
    FILE  *f = NULL;
    size_t length; 
    ModeDescriptionRef this;

    if (current_monitor == NULL)
    {
        return error(ERR_NOMODEFILE, 0, 0, 0);
    }

    /* open file for new mode file if required */
    /* file is a string terminated in 0x0D */
    length = strcspn(file, "\r");
    fbuf = malloc(length + 1);
    if (fbuf)
    {
        memcpy(fbuf, file, length);
        fbuf[length] = '\0';
        f = fopen(fbuf, "w");
        free(fbuf);
    }
    if (f == NULL)
    {
        return _kernel_last_oserror();
    }
    fprintf(f, "# Exported from ScrModes " Module_VersionString "\n"
               "file_format:1\n"
               "monitor_title:%s\n", current_monitor->name);
    if (current_monitor->dpms_state!=-1)
    {
        fprintf(f, "DPMS_state:%d\n\n", current_monitor->dpms_state);
    }
    this = current_monitor->modelist;
    while (this)
    {
        ModeDef *mp = &this->definition.timings;
        fprintf(f, "# Mode: %d x %d @ %dHz\n", mp->xres, mp->yres, this->frame_hz);
        fprintf(f, "startmode\n"
                   " mode_name:%s\n"
                   " x_res:%d\n"
                   " y_res:%d\n"
                   " pixel_rate:%d\n", this->definition.name, mp->xres, mp->yres, mp->pixel_khz);
        fprintf(f, " h_timings:%d,%d,%d,%d,%d,%d\n", mp->hpar[0], mp->hpar[1], mp->hpar[2],
                                                     mp->hpar[3], mp->hpar[4], mp->hpar[5]);
        fprintf(f, " v_timings:%d,%d,%d,%d,%d,%d\n", mp->vpar[0], mp->vpar[1], mp->vpar[2],
                                                     mp->vpar[3], mp->vpar[4], mp->vpar[5]);
        fprintf(f, " sync_pol:%d\n", mp->syncpol);
        if (mp->interlaced == 1)
        {
            fprintf(f, " interlaced\n");
        }
        fprintf(f,"endmode\n\n");
        this = this->next;
    }
    fclose(f);

    return NULL;
}

/* List of new PixelFormats available from old GraphicsV_DisplayFeatures */
static PixelFormat oldformats[] = {
    {1,0,0},
    {3,0,1},
    {15,0,2},
    {255,ModeFlag_FullPalette,3},
    {65535,0,4},
    {-1,0,5},
};

/* Convert an old pixel depth value to a PixelFormat value */
static void pixelformat_from_depth(PixelFormatRef pf,int depth)
{
    pf->log2bpp = depth;
    pf->ncolour = (1<<(1<<depth))-1;
    pf->modeflags = (depth==3?ModeFlag_FullPalette:0);
}

/* Can this PixelFormat be represented as a pixel depth? (if so, pf->log2bpp is the value) */
bool is_old_format(const PixelFormatRef pf)
{
    if (pf->log2bpp > 5)
        return false;
    if (pf->ncolour != (1<<(1<<pf->log2bpp))-1)
        return false;
    if (pf->modeflags != (pf->log2bpp==3?ModeFlag_FullPalette:0))
        return false;
    return true;
}

/* Return current GraphicsV driver number */
static int current_graphicsv_driver(void)
{
    int variables[2];
    variables[0] = VduExt_CurrentGraphicsVDriver;
    variables[1] = -1;
    _swix(OS_ReadVduVariables, _INR(0,1), variables, variables);
    return variables[0];
}

/* Build a VIDC list
 * Returns the number of control list items
 */
static int build_a_vidclist(VIDCListRef vp, ModeDescriptionRef mp, const PixelFormatRef pf)
{
    int fn;
    int ctrllistpos = 0;

    /* Fill in the fields */
    vp->format = 3;
    vp->depth = pf->log2bpp;
    for (fn = 0; fn < FR__COUNT; ++fn)
    {
        vp->hpar[fn] = mp->definition.timings.hpar[fn];
        vp->vpar[fn] = mp->definition.timings.vpar[fn];
    }
    vp->pixelrate = mp->definition.timings.pixel_khz;
    vp->syncpol = mp->definition.timings.syncpol;

    /* Only specify ModeFlags & NColour if necessary? */
    if (!is_old_format(pf))
    {
        vp->vcparam[ctrllistpos].index = ControlList_NColour;
        vp->vcparam[ctrllistpos].value = pf->ncolour;
        ctrllistpos++;
        vp->vcparam[ctrllistpos].index = ControlList_ModeFlags;
        vp->vcparam[ctrllistpos].value = pf->modeflags;
        ctrllistpos++;
    }

    if (current_monitor->dpms_state != -1)
    {
        vp->vcparam[ctrllistpos].index = ControlList_DPMSState;
        vp->vcparam[ctrllistpos].value = current_monitor->dpms_state;
        ctrllistpos++;
    }

    if (current_monitor->lcd_support != 0)
    {
        IFDEBUG printf("I'm an LCD panel & I'm going to tell the Kernel!\n");
        vp->vcparam[ctrllistpos].index = ControlList_LCDMode;
        vp->vcparam[ctrllistpos].value = LCDMODE_VALUE;
        ctrllistpos++;
        if (current_monitor->lcd_support != 3)
        {
            vp->vcparam[ctrllistpos].index = ControlList_LCDDualPanelMode;
            vp->vcparam[ctrllistpos].value = LCDDUAL_VALUE;
            ctrllistpos++;
        }
        vp->vcparam[ctrllistpos].index = ControlList_LCDOffset0;
        vp->vcparam[ctrllistpos].value = LCDOFF0_VALUE;
            ctrllistpos++;
        vp->vcparam[ctrllistpos].index = ControlList_LCDOffset1;
        vp->vcparam[ctrllistpos].value = LCDOFF1_VALUE;
            ctrllistpos++;
        vp->vcparam[ctrllistpos].index = ControlList_DACControl;
        vp->vcparam[ctrllistpos].value = DACCTRL_VALUE;
            ctrllistpos++;
    }

    if (mp->definition.timings.external_clock != -1)
    {
        vp->vcparam[ctrllistpos].index = ControlList_HClockSelect;
        vp->vcparam[ctrllistpos].value = mp->definition.timings.external_clock;
        ctrllistpos++;
    }

    if (mp->definition.timings.interlaced)
    {
        vp->vcparam[ctrllistpos].index = ControlList_Interlaced;
        vp->vcparam[ctrllistpos].value = 1;
        ctrllistpos++;
    }

    if (current_monitor->output_format != -1)
    {
        vp->vcparam[ctrllistpos].index = ControlList_OutputFormat;
        vp->vcparam[ctrllistpos].value = current_monitor->output_format;
        ctrllistpos++;
    }

    vp->vcparam[ctrllistpos].index = -1;      /* List terminator */

    return ctrllistpos;
}

/* Test for whether a given mode definition is usable within the
 * specified data rate and video memory size bounds, at a given pixel
 * depth.  Limitations of the current video controller chip (if known)
 * are also factored in to the test.
 * If the mode is valid, it optionally copies the VIDC list into the
 * provided buffer.
 */
static int mode_valid(ModeDescriptionRef mp, const PixelFormatRef pf,
                       uint32_t maxdatarate /* kB/s */,
                       uint32_t maxdatasize /* bytes */,
                       VIDCListRef outlist)
{
    _kernel_swi_regs r;
    VIDCList         vetlist;
    uint32_t pixrate = mp->definition.timings.pixel_khz;
    uint32_t mx = mp->definition.timings.xres;
    uint32_t my = mp->definition.timings.yres;
    uint32_t pixels = mx * my;
    uint32_t datarate, datasize;

    /* Get true bpp value */
    uint32_t bpp = 1<<pf->log2bpp;
    if (pf->log2bpp == 6) /* 24bit packed formats */
        bpp = 24;
    else if (pf->log2bpp == 7) /* YUV formats - TODO! */
        return 0;

    /* Convert from pixels to bytes: method varies according to depth */
    if ((bpp > 4) && (current_monitor->lcd_support == 1))
    {
        return 0;         /** Eek! 4bpp is max for b/w panels! **/
    }

    if (bpp < 8)
    {
        uint8_t shift = 3 - pf->log2bpp;
        uint32_t round = (1 << shift) - 1;
        datarate = (pixrate + round) >> shift;
        datasize = (pixels + round) >> shift;
    }
    else
    {
        uint8_t mult = bpp>>3;
        datarate = pixrate * mult;
        datasize = pixels * mult;
    }

    /* Check global data rate/size limits */
    if (datarate > maxdatarate || datasize > maxdatasize)
    {
        return 0;
    }

    /* Apply video-controller-specific checks */
    int driver = current_graphicsv_driver();

    r.r[4] = GraphicsV_PixelFormats | (driver<<24);
    r.r[9] = GraphicsV;
    _kernel_swi(OS_CallAVector, &r, &r);
    if (r.r[4] == 0)
    {
        int i=r.r[1];
        PixelFormatRef formats = (PixelFormatRef) r.r[0];
        while (i)
        {
            if ((formats->ncolour == pf->ncolour)
              && (formats->modeflags == pf->modeflags)
              && (formats->log2bpp == pf->log2bpp))
                break;
            formats++;
            i--;
        }
        if (i == 0)
            return 0;    /* Had a definitive answer from GraphicsV that this bpp is forbidden */
    }
    else
    {
        /* Try the old DisplayFeatures call */
        if (!is_old_format(pf))
            return 0;    /* Not a format supported by DisplayFeatures */
        r.r[4] = GraphicsV_DisplayFeatures | (driver<<24);
        r.r[9] = GraphicsV;
        _kernel_swi(OS_CallAVector, &r, &r);
        if ((r.r[4] == 0) && ((r.r[1] & (1<<pf->log2bpp)) == 0))
        {
            return 0;    /* Had a definitive answer from GraphicsV that this bpp is forbidden */
        }
    }

    /* Propose the resulting mode to the graphics driver */
    int ctrllistpos = build_a_vidclist(&vetlist, mp, pf);
    r.r[0] = (int)&vetlist;
    r.r[1] = 0; /* Flags */
    r.r[4] = GraphicsV_VetMode2 | (driver<<24);
    r.r[9] = GraphicsV;
    _kernel_swi(OS_CallAVector, &r, &r);
    if ((r.r[4] == 0) && !(r.r[0] & ~7)) /* Call claimed, and no unknown flags returned? */
    {
        if ((r.r[0] & GVVetMode2_ResultMask) == 0)
        {
            return 0; /* Had a definitive answer from GraphicsV that it no-likey */
        }
        else if (r.r[0] & GVVetMode2_ExtraBytes_Invalid)
        {
            /* Check to see if this ExtraBytes value will cause us to exceed
             * maxdatasize.
             * (n.b. it's assumed that build_a_vidclist will never set
             * ExtraBytes itself)
             */
            datasize += r.r[2] * my;
            if (datasize > maxdatasize)
            {
                return 0;
            }
            /* ExtraBytes value is acceptable, use it */
            vetlist.vcparam[ctrllistpos].index = ControlList_ExtraBytes;
            vetlist.vcparam[ctrllistpos].value = r.r[2];
            ctrllistpos++;
            vetlist.vcparam[ctrllistpos].index = -1;      /* List terminator */
        }
    }
    else
    {
        /* Try the old vet call */
        r.r[0] = (int)&vetlist;
        r.r[1] = NULL;
        r.r[4] = GraphicsV_VetMode | (driver<<24);
        _kernel_swi(OS_CallAVector, &r, &r);
        if ((r.r[4] == 0) && (r.r[0] != 0))
        {
            return 0; /* Had a definitive answer from GraphicsV that it no-likey */
        }
    }

    /* No obvious conflicts, accept the mode */
    if (outlist != NULL)
    {
        *outlist = vetlist;
    }
    return 1;
}

bool find_deepest_by_xyhz(PixelFormatRef fp, ModeDescriptionRef mp)
{
    _kernel_swi_regs r;
    PixelFormatRef   pflist;
    size_t pflistlen;
    int    driver, maxlog2bpp = 0;
    bool   found = false;

    /* See if the driver is helpful in listing the pixel formats */
    driver = current_graphicsv_driver();
    r.r[4] = GraphicsV_PixelFormats | (driver<<24);
    r.r[9] = GraphicsV;
    _kernel_swi(OS_CallAVector, &r, &r);
    if (r.r[4] == 0)
    {
        pflist = (PixelFormatRef) r.r[0];
        pflistlen = r.r[1];
    }
    else
    {
        /* Use the old list */
        pflist = oldformats;
        pflistlen = sizeof(oldformats)/sizeof(oldformats[0]);
    }
    IFDEBUG printf("Trying %d pixel formats\n", pflistlen);

    /* The format list isn't necessarily sorted by depth, so just try them
     * all to find the highest log2bpp.
     */
    while (pflistlen)
    {
        if (mode_valid(mp, pflist, INT32_MAX, INT32_MAX, NULL))
        {
            /* That depth is achievable, keep it if bigger */
            if (pflist->log2bpp > maxlog2bpp)
            {
                maxlog2bpp = pflist->log2bpp;
                IFDEBUG printf("Deeper mode_valid at log2bpp = %d\n", maxlog2bpp);
                *fp = *pflist;
                found = true;
            }
        }
        pflist++;
        pflistlen--;
    }

    return found;
}

static ModeDescriptionRef find_by_xy(ModeDescriptionRef mp,
                                      uint32_t xres, uint32_t yres, int *count)
{
    while (mp && mp->definition.timings.xres < xres)
        mp = mp->next;
    while (mp && mp->definition.timings.xres == xres && mp->definition.timings.yres < yres)
        mp = mp->next;
    if (mp && mp->definition.timings.xres == xres && mp->definition.timings.yres == yres)
    {
        int entries;
        ModeDescriptionRef head = mp;
        entries = 0;
        do
        {
            ++entries;
            mp = mp->next;
        } while (mp && mp->definition.timings.xres == xres &&
                 mp->definition.timings.yres == yres);
        *count = entries;
        return head;
    }
    return NULL;
}

static int restrict_bandwidth(int os_limit)
{
    /* On a HAL based kernel the kernel doesn't know what the bandwidth limitations
     * for a given mode are (an LCD graphics controller might for example be able
     * to use local SRAM buffering for smallish modes, but swap to shared slow DRAM
     * for bigger modes, both of which have differing bandwidths). The kernel
     * therefore just guesses a value, which we choose to ignore here and leave any
     * vetting up to GraphicsV.
     */
    UNUSED(os_limit);

    return INT32_MAX;
}

static void service_modeextension(_kernel_swi_regs *regs)
{
    /* Static allocation of a single VIDCList, for return from
     * Service_ModeExtension in the case that we have a mode
     * satisfying the requirements.  The data in this block is
     * overwritten by the next Service_ModeExtension call which we
     * also satisfy.  NB. Since we currently have no mechanism whereby
     * additional fields can be specified (e.g. in the ModeInfo file)
     * to be returned in a video control parameters list at the end of
     * the main block, there is no need for this block to be variable
     * length.  If that were ever added, the space would need to be
     * claimed either by assuming some maximum possible VCP list size
     * and keeping it static, or allocating the right size
     * dynamically; the latter case would imply keeping a file-scope
     * static pointer so that the space can be released as required
     * when module_shutdown is called.
     *
     * TMD 02-Nov-93 - A video control parameters list is now appended
     * if the file includes the DPMS_state keyword. However since this
     * is only 1 pair of words, I have allocated it statically.
     * If no list is necessary, the 1st word holds -1.
     * If a list is necessary, the 1st word holds DPMS_INDEX, the 2nd
     * holds the dpms value, and the 3rd word holds -1.
     *
     * WT 19-Jan-95 - The parameters list is extended to cater for LCD
     * panels, both single and dual panel, as defined in the LCD_support
     * field of the mode definition file. So, now 6 words are statically
     * allocated.
     */
    static VIDCList thevidclist;

    ModeSelectorRef    sel;
    ModeDescriptionRef mp;
    uint32_t dataratelimit, datasizelimit;
    int nmodes;
    PixelFormat pf;

    /* Check for being passed a mode selector as opposed to a mode
     * number - we only handle the former.
     */
    if (!IS_MODE_SEL_PTR(regs->r[2]))
    {
        return;
    }

    /* Check for suitable monitor type being requested - we handle
     * don't-care case as well as explicit file-specified monitor
     * type, but don't touch other specific monitor class codes.
     */
    if (regs->r[3] != -1 && regs->r[3] != MONITOR_FILE)
    {
        return;                         /* pass service on */
    }

    /* Address the mode selector (R2 on entry has been found to be a
     * pointer), and check for known format (bit 0 set, bits 7..1
     * clear).
     */
    sel = MODESEL(regs->r[2]);
    if (sel->bit0 != 1 || sel->format != 0)
    {
        return;                         /* pass service on */
    }

    /* Examine the mode selector to deduce the pixel format */
    pixelformat_from_depth(&pf,sel->depth);
    ModeParam *param = sel->param;
    while (param->index != -1)
    {
        if (param->index == VduExt_ModeFlags)
            pf.modeflags = param->value;
        else if (param->index == VduExt_NColour)
            pf.ncolour = param->value;
        param++;
    }

    /* Mask out unwanted mode flags */
    pf.modeflags &= ~(ModeFlag_NonGraphic | ModeFlag_Teletext | ModeFlag_GapMode | ModeFlag_BBCGapMode | ModeFlag_HiResMono | ModeFlag_DoubleVertical | ModeFlag_HardScrollDisabled | ModeFlag_InterlacedMode);

    /* Massage flags for RGB modes a bit */
    if ((pf.modeflags & ModeFlag_DataFormatFamily_Mask) == ModeFlag_DataFormatFamily_RGB)
    {
        /* Detect 64 colour modes and convert to 256 colour */
        if ((pf.ncolour == 63) && (pf.log2bpp == 3))
        {
            pf.ncolour = 255;
            pf.modeflags |= ModeFlag_FullPalette;
        }
        /* Clear the greyscale flag. TODO - keep it so greyscale-only devices can make use of it? */
        pf.modeflags &= ~ModeFlag_GreyscalePalette;
    }

    /* Bail if we see something unexpected */
    if (pf.modeflags & ~(ModeFlag_FullPalette | ModeFlag_64k | ModeFlag_ChromaSubsampleMode | ModeFlag_DataFormat_Mask))
        return;

    /* Pick up data size limit from args to service call */
    datasizelimit = regs->r[5]; /* data size is measured in bytes */

    /* Current Screen Mode selection API FuncSpec (0197,290/FS, Issue
     * D) says data rate figure in R4 is in bytes/sec.  Since Medusa
     * h/ware can do up to 170,000,000 bytes/sec, and that number is a
     * factor of only 12 times smaller than the max number in a 32-bit
     * signed integer, it would seem more future-proof and consistent
     * (cf. pixel rate specs which use kHz not Hz) to use 1000's of
     * bytes/sec, but for now convert to preferred units as used internally.
     */
    dataratelimit = restrict_bandwidth(regs->r[4]) / 1000;

    /* Scan all available modes, looking for a match.  First find the
     * subset of all known modes which have the right resolution.
     * They are contiguous on the master list.  We track where to stop
     * by knowing how many of them there are (find_by_xy counts up)
     * rather than by rechecking the pointer and x/y fields every
     * time.
     */
    mp = find_by_xy(current_monitor->modelist, sel->xresol, sel->yresol, &nmodes);
    if (mp == NULL)
    {
        return;                         /* no match */
    }
    do
    {
        /* Test whether this mode can satisfy the requirements */
        if ((sel->framerate == -1 || sel->framerate == mp->frame_hz) &&
            mode_valid(mp, &pf, dataratelimit, datasizelimit, &thevidclist))
        {
            /* And claim the service */
            regs->r[1] = 0;                 /* Service_Serviced */
            regs->r[3] = (int)&thevidclist; /* return pointer to VIDC list to use (mode_valid will have filled this in for us) */
            regs->r[4] = NULL;              /* marks no workspace list(mode selector given) */
            return;
        }
        mp = mp->next;
    } while (--nmodes);
}

static void service_enumeratescreenmodes(_kernel_swi_regs *regs)
{
    ModeDescriptionRef mp;
    uint32_t dataratelimit, datasizelimit;
    PixelFormatRef pf,pflist;
    int numformats,pflistlen;
    _kernel_swi_regs r;

    /* See comments re. data-rate spec in service_modeextension */
    dataratelimit = restrict_bandwidth(regs->r[4]) / 1000;
    datasizelimit = regs->r[5];

    /* Get list of pixel formats supported by driver */
    int driver = current_graphicsv_driver();

    r.r[4] = GraphicsV_PixelFormats | (driver<<24);
    r.r[9] = GraphicsV;
    _kernel_swi(OS_CallAVector, &r, &r);
    if (r.r[4] == 0)
    {
        pflist = (PixelFormatRef) r.r[0];
        pflistlen = r.r[1];
    }
    else
    {
        /* Use the old list */
        pflist = oldformats;
        pflistlen = sizeof(oldformats)/sizeof(oldformats[0]);
    }

    /* Scan all available modes at all available pixel formats */
    mp = current_monitor->modelist;
    pf = pflist;
    numformats = pflistlen;

    for (;;)
    {
        if (!mode_valid(mp, pf, dataratelimit, datasizelimit, NULL))
        {
            /* TMD 03-Nov-93: Fix bug MED-00833
             * Code used to set depth to 5 here, assuming that if the mode
             * was invalid at a low depth, it would be invalid at all higher
             * depths. This is a wrong assumption when a mode can fail because
             * the length of the line is not a suitable multiple.
             */
        }
        else
        {
            /* OK, it fits; what to do with it?  Follow algorithm from F.S. */
            if (regs->r[2] > 0)
            {
                /* skipping (in a partial enumeration) - nowt to do */
            }
            else
            {
                int nlen = strlen(mp->definition.name);
                int entrysize = 24 + ((nlen + 1 + 3) & ~3);
                bool old_format = is_old_format(pf);
                if (!old_format)
                {
                    entrysize += 8;
                }
                if (regs->r[6] != 0)
                {
                    /* Enumeration case - filling in block */
                    if (regs->r[7] >= entrysize)
                    {
                        if (old_format)
                        {
                            ModeInfoBlockRef ip = (ModeInfoBlockRef)regs->r[6];
                            int i;

                            /* Copy the mode information into the supplied data buffer */
                            ip->blocksize = entrysize;
                            ip->format = 0;  ip->flags = 0;  ip->bit0 = 1;
                            ip->xresol = mp->definition.timings.xres;
                            ip->yresol = mp->definition.timings.yres;
                            ip->depth = pf->log2bpp; /* log2(bits/pixel) */
                            ip->framerate = mp->frame_hz; /* integer Hz value used here */

                            /* Copy name + 1 terminating null into block */
                            strcpy(ip->name, mp->definition.name);
                            /* Pad name field out with 0's to N*4 */
                            for (i = nlen+1; (i & 3) != 0; ++i)
                                ip->name[i] = 0;
                        }
                        else
                        {
                            ModeInfoBlock1Ref ip = (ModeInfoBlock1Ref)regs->r[6];
                            int i;

                            /* Copy the mode information into the supplied data buffer */
                            ip->blocksize = entrysize;
                            ip->format = 1;  ip->flags = 0;  ip->bit0 = 1;
                            ip->xresol = mp->definition.timings.xres;
                            ip->yresol = mp->definition.timings.yres;
                            ip->pixelformat = *pf;
                            ip->framerate = mp->frame_hz; /* integer Hz value used here */

                            /* Copy name + 1 terminating null into block */
                            strcpy(ip->name, mp->definition.name);
                            /* Pad name field out with 0's to N*4 */
                            for (i = nlen+1; (i & 3) != 0; ++i)
                                ip->name[i] = 0;
                        }
                        /* Step buffer pointer past this new entry */
                        regs->r[6] += entrysize;
                    }
                    else
                    {
                        regs->r[1] = 0; /* Service_Serviced */
                        return;
                    }
                }
                /* Update remaining size of user data area */
                regs->r[7] -= entrysize;
            }
            /* count down matching modes in calling r2 */
            --regs->r[2];
        }

        /* Move on to next mode, if there are any left */
        if (numformats--)
        {
            pf++;                       /* next deeper mode of current def'n */
        }
        else
        {
            mp = mp->next;              /* next mode in list */
            if (mp == NULL)
            {
                return;                 /* no more modes from this module */
            }
            pf = pflist;                /* start with min. depth */
            numformats = pflistlen;
        }
    }
}

static int mode_available(uint32_t xres, uint32_t yres, const PixelFormatRef pf, int framerate)
{
    ModeDescriptionRef mp;
    int nmodes;

    mp = find_by_xy(current_monitor->modelist, xres, yres, &nmodes);
    if (mp == NULL)
    {
        return 0;
    }
    do
    {
        if ((framerate == -1 || framerate == mp->frame_hz) &&
            mode_valid(mp, pf, INT32_MAX, INT32_MAX, NULL))
        {
            return 1;
        }
        mp = mp->next;
    } while (--nmodes);

    return 0;
}

static void service_modetranslation(_kernel_swi_regs *regs)
{
    unsigned int flags;
    int depth;
    PixelFormat pf;

    static const char pal[4]  = {  0,  8, 12, 15 };
    static const char ntsc[4] = { 44, 45, 46, 46 };
    static const char vga[4]  = { 25, 26, 27, 28 };

    /* We do monitor type 7 only */
    if (regs->r[3] != 7 || !current_monitor)
    {
        return;
    }

    /* Someone has asked for an old-style mode number, but we
     * must have refused it.
     *
     * If we don't handle this, the Kernel will select one of
     * modes 25, 26, 27 or 28. This would be fine, except
     * we may not have mode 25, due to interlacing problems, or
     * we may have only non-interlaced modes.
     *
     * Note we're not told the bandwidth and memory limits.
     * Could deal with this by issuing OS_CheckModeValid for
     * each mode, but that adds reentrancy problems :) The
     * selection of modes above are within the limits of even
     * an A310, so we assume they won't be too big/fast.
     */

    /* What depth are they looking for? If the mode is
     * unknown, use 1bpp (as the Kernel does).
     */
    if (_swix(OS_ReadModeVariable, _INR(0,1)|_OUT(2)|_OUT(_FLAGS),
              regs->r[2], 9, &depth, &flags) || (flags & _C)) {
        depth = 0;
    }

    /* Clamp depth to 8bpp to restrict ourselves to old-style
     * modes.
     */
    if (depth > 3)
    {
        depth = 3;
    }

retry_with_4bpp:
     pixelformat_from_depth(&pf,depth);

    /* Check if 640x480xdepth @ 60Hz is available. If so, allow
     * kernel to do normal.
     */
     if (mode_available(640, 480, &pf, 60))
     {
         regs->r[1] = Service_Serviced;
         regs->r[2] = vga[depth];       /* substitute mode */
         return;
     }

     /* We don't have a standard VGA mode. Let's try a PAL TV
      * mode.
      */
     if (mode_available(640, 256, &pf, 50))
     {
         regs->r[1] = Service_Serviced;
         regs->r[2] = pal[depth];       /* substitute mode */
         return;
     }

     /* Alright then. How about a NTSC TV mode? */
     if (mode_available(640, 200, &pf, 60))
     {
         regs->r[1] = Service_Serviced;
         regs->r[2] = ntsc[depth];      /* substitute mode */
         return;
     }

     /* Check if 640x480xdepth @ any rate is available */
     if (mode_available(640, 480, &pf, -1))
     {
         regs->r[1] = Service_Serviced;
         regs->r[2] = vga[depth];       /* substitute mode */
         return;
     }

     /* Still getting nowhere? Maybe we can't do 1bpp or 8bpp for
      * various reasons. Try again with 4bpp.
      */
     if (depth != 2)
     {
         depth = 2;
         goto retry_with_4bpp;
     }

     /* I give up. Let someone else worry about it. */
     return;
}

static void service_displaychanged(_kernel_swi_regs *regs)
{
    switch (regs->r[0])
    {
        case DisplayChanged_Changing:
            /* The current driver is changing. We must recache any
             * driver-specific things which we store.
             * At the moment all the driver-specific stuff happens during the
             * enumerate/translate calls, so just check the monitor's still there.
             * Note that doing it here means:
             * a) ScreenModes must precede the driver if you want a mode defined
             *    during module init AND the MonitorType is EDID. If the MonitorType
             *    is some other value, including Auto, it doesn't matter
             *    where ScreenModes is as the Kernel will use a built in numbered mode.
             * b) Loading ScreenModes off disc won't automatically load the EDID data
             *    as this service call doesn't happen. Calling readedid() from module
             *    init isn't possible because the module isn't linked to the service
             *    call chain, so Display Manager et al can't enumerate the modes
             *    with OS_ScreenMode 2. This is only a problem for developers, who
             *    can manually re-read it (standalone builds are only partly supported today).
            */
            readedid(regs->r[2], using_edid);
            break;
    }
}

static void service_monitorleadtranslation(_kernel_swi_regs *regs)
{
    if ((preferred_mode != NULL) && (preferred_mode->bit0 == 1))
    {
        regs->r[1] = Service_Serviced;
        regs->r[3] = (int) preferred_mode;
        regs->r[4] = MONITOR_FILE;
        regs->r[5] = preferred_sync_type;
    }
}

static int we_are_preferred(void *pw)
{
    _kernel_swi_regs sregs;
    sregs.r[0] = ModHandReason_LookupName;
    sregs.r[1] = (int)"ScreenModes";
    (void)_kernel_swi(OS_Module, &sregs, &sregs);
    return (sregs.r[4] == *(int *)pw);
}

static const int samplerates[] =
{
     32000*1024,
     44100*1024,
     48000*1024,
     88200*1024,
     96000*1024,
    176400*1024,
    192000*1024,
};

static _kernel_oserror *swi_enumerateaudioformats(_kernel_swi_regs *regs)
{
    if (!current_monitor)
    {
        return error(ERR_NOMODEFILE, 0, 0, 0);
    }

    /* In:  r0 = flags:
     *           bit 0: 0 -> read raw data
     *                  1 -> read friendly data
     *      r1 = format code to start from (-1 = first)
     *      r2 = index within format code (-1 = first)
     * Out: r1 = format code of this entry (-1 if no more formats)
     *      r2 = index within format code (-1 if no more formats)
     *      r3 = max channels
     *      raw data:
     *        r4 = audio short descriptor byte 2
     *        r5 = audio short descriptor byte 3
     *      friendly data:
     *        r4 = sample rate (Hz*1024)
     *        r5 = LPCM: bit depth
     *             codes 2-8: max bit rate in Hz
     *             other codes: not supported by this API
     *
     * n.b. index values (r2) differ between raw & friendly modes
     */
    if (regs->r[0] & ~1)
    {
        return error(ERR_BADENUMAUDIO, 0, 0, 0);
    }
    /* Find the right index to start from */
    AudioFormat *current = current_monitor->audio_formats;
    int count = current_monitor->audio_format_count;
    int format = regs->r[1];
    int start_index = regs->r[2];
    while (count && (current->format_code < format))
    {
        current++;
        count--;
    }
    if (regs->r[0] & 1)
    {
        /* Friendly mode */
        /* Skip formats we don't understand */
        int my_index = 0;
find_next_entry:;
        int sample_rate = -1;
        int bits = -1;
        while (count && ((current->format_code < 1) || (current->format_code > 8)))
        {
            current++;
            count--;
        }
        if (!count)
        {
            regs->r[1] = -1;
            regs->r[2] = -1;
            return NULL;
        }
        bool is_LPCM = (current->format_code == 1);
        if (is_LPCM)
        {
            if ((current->format_specific & 0xf8) || !(current->format_specific & 0x7))
            {
                /* Weird bit depth mask for LPCM, skip entry */
                current++;
                count--;
                goto find_next_entry;
            }
        }
find_next_sub_entry:
        /* Find first sample_rate & bits value */
        while (!(current->sample_rates & (1<<sample_rate)))
        {
            sample_rate++;
        }
        if (is_LPCM)
        {
            while (!(current->format_specific & (1<<bits)))
            {
                bits++;
            }
        }
        /* Skip entries as necessary */
        if ((current->format_code == format) && (my_index <= start_index))
        {
            my_index++;
            /* Step to next sample rate */
            sample_rate++;
            if ((1<<sample_rate) > current->sample_rates)
            {
                /* Step to next bit depth value */
                sample_rate = 0;
                bits++;
                if (!is_LPCM || ((1<<bits) > current->format_specific))
                {
                    /* Step to next format list entry */
                    current++;
                    count--;
                    goto find_next_entry;
                }
            }
            goto find_next_sub_entry;
        }
        if (current->format_code > format)
        {
            my_index = 0;
        }
        regs->r[1] = current->format_code;
        regs->r[2] = my_index;
        regs->r[3] = current->max_channels;
        regs->r[4] = samplerates[sample_rate];
        regs->r[5] = is_LPCM ? (16 + 4*bits) : (current->format_specific*8000);

        return NULL;
    }
    else
    {
        /* Raw mode */
        int my_index = 0;
        while (count && (current->format_code == format) && (my_index <= start_index))
        {
            current++;
            count--;
            my_index++;
        }
        if (!count)
        {
            regs->r[1] = -1;
            regs->r[2] = -1;
            return NULL;
        }
        if (current->format_code > format)
        {
            my_index = 0;
        }
        regs->r[1] = current->format_code;
        regs->r[2] = my_index;
        regs->r[3] = current->max_channels;
        regs->r[4] = current->sample_rates;
        regs->r[5] = current->format_specific;

        return NULL;
    }
}

/* EXPORTED */
_kernel_oserror *ScreenModes_initialise(const char *cmd_tail, int podule_base, void *pw)
{
    char typevar[16];
    int  config;

    /* Keep a preferred mode with space for 2 extra mode variables */
    preferred_mode = calloc(1, sizeof(ModeSelector) + (2 * sizeof(ModeParam)));

    /* Define the EDID type name */
    sprintf(typevar, "File$Type_%03X", FileType_EDID);
    _swix(OS_SetVarVal, _INR(0,4), typevar, FileType_EDID_Name,
                                   strlen(FileType_EDID_Name), 0, VarType_String);

    /* Look at the MonitorType to see whether to proactively parse EDID */
    if (!_swix(OS_Byte, _INR(0,1) | _OUT(2), OsByte_ReadCMOS, VduCMOS, &config))
    {
        using_edid = ((config & MonitorTypeBits) >> MonitorTypeShift) == MONITOR_EDID;
    }

    UNUSED(cmd_tail);
    UNUSED(podule_base);
    UNUSED(pw);

    return NULL;
}

/* EXPORTED */
_kernel_oserror *ScreenModes_final(int fatal, int podule, void *pw)
{
    /* Free the space claimed for the current monitor
     * description (if any) and revert to the configured monitor type,
     * when the module is shut down.
     */
    (void) restore_monitortype(); /* restore old value */
    release_currentmonitor();
    release_edidblocks();
    if (preferred_mode)
    {
        free(preferred_mode);
    }

    UNUSED(pw);
    UNUSED(podule);
    UNUSED(fatal);

    return NULL;
}

/* EXPORTED */
void ScreenModes_servicecall(int servicecallno, _kernel_swi_regs *regs, void *pw)
{
    if ((current_monitor == NULL) && (servicecallno != Service_DisplayChanged))
    {
        return;                         /* nothing loaded */
    }

    /* Ignore service calls if we are not the current preferred instantiation */
    if (!we_are_preferred(pw))
    {
        return;
    }

    if (servicecallno == Service_ModeExtension)
    {
        service_modeextension(regs);
    }
    else if (servicecallno == Service_EnumerateScreenModes)
    {
        service_enumeratescreenmodes(regs);
    }
    else if (servicecallno == Service_ModeTranslation)
    {
        service_modetranslation(regs);
    }
    else if (servicecallno == Service_DisplayChanged)
    {
        service_displaychanged(regs);
    }
    else if (servicecallno == Service_MonitorLeadTranslation)
    {
        service_monitorleadtranslation(regs);
    }
}

/* EXPORTED */
_kernel_oserror *ScreenModes_cmdhandler(const char *arg_string, int argc, int cmd_no, void *pw)
{
    _kernel_oserror *result;

    switch (cmd_no)
    {
        case CMD_LoadModeFile:
            result = loadmodefile(arg_string);
            break;
        case CMD_SaveModeFile:
            result = savemodefile(arg_string);
            break;
        default:
            return NULL;
    }

    UNUSED(pw);
    UNUSED(argc);

    return result;
}

/* EXPORTED */
_kernel_oserror *ScreenModes_swihandler(int swi_no, _kernel_swi_regs *r, void *pw)
{
    _kernel_oserror *result;

    switch (swi_no)
    {
        case ScreenModes_ReadInfo - ScreenModes_00:
            switch (r->r[0])    /* r0 = subreason code */
            {
                case ScreenModes_ReadInfo_MonitorName: /* Return pointer to monitor name */
                    if (current_monitor)
                    {
                        r->r[0] = (int) &current_monitor->name;
                        result = NULL;
                    }
                    else
                    {
                        /* No monitor description file loaded */
                        result = error(ERR_NOMODEFILE, 0, 0, 0);
                    }
                    break;

                case ScreenModes_ReadInfo_DPMS: /* Read supported DPMS state of monitor */
                    if (current_monitor)
                    {
                        r->r[0] = current_monitor->dpms_state;
                        result = NULL;
                    }
                    else
                    {
                        /* No monitor description file loaded */
                        result = error(ERR_NOMODEFILE, 0, 0, 0);
                    }
                    break;

                case ScreenModes_ReadInfo_SpeakerMask: /* Read monitor speaker mask */
                    if (current_monitor)
                    {
                        r->r[0] = current_monitor->speaker_mask; /* Mask */
                        r->r[1] = current_monitor->speaker_mask_provided ? 0x7f : 0; /* Validity of each bit */
                        result = NULL;
                    }
                    else
                    {
                        /* No monitor description file loaded */
                        result = error(ERR_NOMODEFILE, 0, 0, 0);
                    }
                    break;                        

                default:        /* Unknown ScreenModes_ReadInfo call */
                    result = error(ERR_BADREADINFO, 0, 0, 0);
            }
            break;

        case ScreenModes_EnumerateAudioFormats - ScreenModes_00:
            return swi_enumerateaudioformats(r);

        case ScreenModes_Features - ScreenModes_00:
            r->r[0] = ScreenModes_Features_EDID; /* These extra features are supported */
            result = NULL;
            break;

        default:                /* Unknown ScreenModes SWI */
            return error_BAD_SWI;
    }
    UNUSED(pw);

    return result;
}

/* EOF ScrModes.c */
