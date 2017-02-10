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
/* edidmemory.h */

typedef struct _EDIDBlock
{
    /* 8 bytes of header */
    uint8_t header[8];
    /* 10 bytes of vendor id */
    uint8_t manufacturer_id[2];
    uint8_t product_id[2];
    uint8_t serial[4];
    uint8_t week_made;
    uint8_t year_made;
    /* 2 bytes of EDID Structure and version */
    uint8_t edid_version;
    uint8_t edid_revision;
    /* 5 bytes of Basic parameters */
    uint8_t video_input_definition;
    uint8_t horizontal_screen_size; /* Listed in cm. Aspect ratio - landscape */
    uint8_t vertical_screen_size;   /* Listed in cm. Aspect ratio - portrait */
    uint8_t gamma;
    uint8_t feature_support;
#define FEATURE_SUPPORT_CONTINUOUS_FREQUENCY            (1 << 0)
#define FEATURE_SUPPORT_PTM_INC_PIXELFMT_AND_REFRESH    (1 << 1)
#define FEATURE_SUPPORT_SRGB_COLOUR_SPACE               (1 << 2)
#define FEATURE_SUPPORT_COLOUR_ENC_MASK                 (3 << 3)
#define FEATURE_SUPPORT_COLOUR_ENC_RGB444               (0 << 3)
#define FEATURE_SUPPORT_COLOUR_ENC_RGB444_YUV444        (1 << 3)
#define FEATURE_SUPPORT_COLOUR_ENC_RGB444_YUV422        (2 << 3)
#define FEATURE_SUPPORT_COLOUR_ENC_RGB444_YUV444_YUV422 (3 << 3)
#define FEATURE_SUPPORT_COLOUR_TYPE_MASK                (3 << 3)
#define FEATURE_SUPPORT_COLOUR_TYPE_MONO                (0 << 3)
#define FEATURE_SUPPORT_COLOUR_TYPE_RGB                 (1 << 3)
#define FEATURE_SUPPORT_COLOUR_TYPE_NON_RGB             (2 << 3)
#define FEATURE_SUPPORT_COLOUR_TYPE_UNDEFINED           (3 << 3)
#define FEATURE_SUPPORT_DPM_MASK                        (7 << 5)
#define FEATURE_SUPPORT_DPM_ACTIVE_OFF_SUPPORTED        (1 << 5)
#define FEATURE_SUPPORT_DPM_SUSPEND_SUPPORTED           (1 << 6)
#define FEATURE_SUPPORT_DPM_STANDBY_SUPPORTED           (1 << 7)
    /* 10 bytes of colour characteristics */
    uint8_t colour_characteristics[10];
    /* 3 bytes of established timings */
    uint8_t established_timings[3];
    /* 16 bytes of standard timings identification 1-8 */
    uint8_t standard_timings[16];
    /* 72 bytes of 18 byte data blocks; */
    uint8_t data_block[4][18];
    /* Extension blocks */
    uint8_t extension_block_count;
    uint8_t checksum;
} EDIDBlock, *EDIDBlockRef;

enum
{
    /* 00-0F manufacturer */
    DATA_TYPE_MANUFACTURER0 = 0,
    DATA_TYPE_MANUFACTURER1,
    DATA_TYPE_MANUFACTURER2,
    DATA_TYPE_MANUFACTURER3,
    DATA_TYPE_MANUFACTURER4,
    DATA_TYPE_MANUFACTURER5,
    DATA_TYPE_MANUFACTURER6,
    DATA_TYPE_MANUFACTURER7,
    DATA_TYPE_MANUFACTURER8,
    DATA_TYPE_MANUFACTURER9,
    DATA_TYPE_MANUFACTURERA,
    DATA_TYPE_MANUFACTURERB,
    DATA_TYPE_MANUFACTURERC,
    DATA_TYPE_MANUFACTURERD,
    DATA_TYPE_MANUFACTURERE,
    DATA_TYPE_MANUFACTURERF,
    /* 10 dummy tag for unused block */
    DATA_TYPE_DUMMY,

    /* 11-F6 reserved for future use */

    /* F7-FF various info */
    DATA_TYPE_ESTTIMINGS3 = 0xF7,
    DATA_TYPE_CVT3BYTE,
    DATA_TYPE_DCM,
    DATA_TYPE_STDTIMING,
    DATA_TYPE_COLOURPOINT,
    DATA_TYPE_MONITORNAME,
    DATA_TYPE_RANGELIMITS,
    DATA_TYPE_STRING,
    DATA_TYPE_MONITORSERIALNUM
};

typedef struct _EDIDExtensionBlock
{
    uint8_t tag;
    uint8_t revision;
    uint8_t data[125];
    uint8_t checksum;
} EDIDExtensionBlock, *EDIDExtensionBlockRef;

/* EOF edidmemory.h */
