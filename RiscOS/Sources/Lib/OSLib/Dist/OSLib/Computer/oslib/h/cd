#ifndef cd_H
#define cd_H

/* C header file for CD
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Simon Middleton, Uniqueway Ltd; Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 July 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef scsi_H
#include "oslib/scsi.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  CD_Version
#define CD_Version                              0x41240
#undef  XCD_Version
#define XCD_Version                             0x61240
#undef  CD_ReadData
#define CD_ReadData                             0x41241
#undef  XCD_ReadData
#define XCD_ReadData                            0x61241
#undef  CD_SeekTo
#define CD_SeekTo                               0x41242
#undef  XCD_SeekTo
#define XCD_SeekTo                              0x61242
#undef  CD_DriveStatus
#define CD_DriveStatus                          0x41243
#undef  XCD_DriveStatus
#define XCD_DriveStatus                         0x61243
#undef  CD_DriveReady
#define CD_DriveReady                           0x41244
#undef  XCD_DriveReady
#define XCD_DriveReady                          0x61244
#undef  CD_GetParameters
#define CD_GetParameters                        0x41245
#undef  XCD_GetParameters
#define XCD_GetParameters                       0x61245
#undef  CD_SetParameters
#define CD_SetParameters                        0x41246
#undef  XCD_SetParameters
#define XCD_SetParameters                       0x61246
#undef  CD_OpenDrawer
#define CD_OpenDrawer                           0x41247
#undef  XCD_OpenDrawer
#define XCD_OpenDrawer                          0x61247
#undef  CD_EjectButton
#define CD_EjectButton                          0x41248
#undef  XCD_EjectButton
#define XCD_EjectButton                         0x61248
#undef  CD_EnquireAddress
#define CD_EnquireAddress                       0x41249
#undef  XCD_EnquireAddress
#define XCD_EnquireAddress                      0x61249
#undef  CD_EnquireDataMode
#define CD_EnquireDataMode                      0x4124A
#undef  XCD_EnquireDataMode
#define XCD_EnquireDataMode                     0x6124A
#undef  CD_PlayAudio
#define CD_PlayAudio                            0x4124B
#undef  XCD_PlayAudio
#define XCD_PlayAudio                           0x6124B
#undef  CD_PlayTrack
#define CD_PlayTrack                            0x4124C
#undef  XCD_PlayTrack
#define XCD_PlayTrack                           0x6124C
#undef  CD_AudioPause
#define CD_AudioPause                           0x4124D
#undef  XCD_AudioPause
#define XCD_AudioPause                          0x6124D
#undef  CD_EnquireTrack
#define CD_EnquireTrack                         0x4124E
#undef  XCD_EnquireTrack
#define XCD_EnquireTrack                        0x6124E
#undef  CD_EnquireAllTracks
#define CD_EnquireAllTracks                     0x0
#undef  CD_EnquireOneTrack
#define CD_EnquireOneTrack                      0x4124E
#undef  XCD_EnquireOneTrack
#define XCD_EnquireOneTrack                     0x6124E
#undef  CD_ReadSubChannel
#define CD_ReadSubChannel                       0x4124F
#undef  XCD_ReadSubChannel
#define XCD_ReadSubChannel                      0x6124F
#undef  CD_CheckDrive
#define CD_CheckDrive                           0x41250
#undef  XCD_CheckDrive
#define XCD_CheckDrive                          0x61250
#undef  CD_DiscChanged
#define CD_DiscChanged                          0x41251
#undef  XCD_DiscChanged
#define XCD_DiscChanged                         0x61251
#undef  CD_StopDisc
#define CD_StopDisc                             0x41252
#undef  XCD_StopDisc
#define XCD_StopDisc                            0x61252
#undef  CD_DiscUsed
#define CD_DiscUsed                             0x41253
#undef  XCD_DiscUsed
#define XCD_DiscUsed                            0x61253
#undef  CD_AudioStatus
#define CD_AudioStatus                          0x41254
#undef  XCD_AudioStatus
#define XCD_AudioStatus                         0x61254
#undef  CD_Inquiry
#define CD_Inquiry                              0x41255
#undef  XCD_Inquiry
#define XCD_Inquiry                             0x61255
#undef  CD_DiscHasChanged
#define CD_DiscHasChanged                       0x41256
#undef  XCD_DiscHasChanged
#define XCD_DiscHasChanged                      0x61256
#undef  CD_Control
#define CD_Control                              0x41257
#undef  XCD_Control
#define XCD_Control                             0x61257
#undef  CD_Supported
#define CD_Supported                            0x41258
#undef  XCD_Supported
#define XCD_Supported                           0x61258
#undef  CD_Prefetch
#define CD_Prefetch                             0x41259
#undef  XCD_Prefetch
#define XCD_Prefetch                            0x61259
#undef  CD_Reset
#define CD_Reset                                0x4125A
#undef  XCD_Reset
#define XCD_Reset                               0x6125A
#undef  CD_CloseDrawer
#define CD_CloseDrawer                          0x4125B
#undef  XCD_CloseDrawer
#define XCD_CloseDrawer                         0x6125B
#undef  CD_IsDrawerLocked
#define CD_IsDrawerLocked                       0x4125C
#undef  XCD_IsDrawerLocked
#define XCD_IsDrawerLocked                      0x6125C
#undef  CD_AudioControl
#define CD_AudioControl                         0x4125D
#undef  XCD_AudioControl
#define XCD_AudioControl                        0x6125D
#undef  CD_LastError
#define CD_LastError                            0x4125E
#undef  XCD_LastError
#define XCD_LastError                           0x6125E
#undef  CD_AudioLevel
#define CD_AudioLevel                           0x4125F
#undef  XCD_AudioLevel
#define XCD_AudioLevel                          0x6125F
#undef  CD_Register
#define CD_Register                             0x41260
#undef  XCD_Register
#define XCD_Register                            0x61260
#undef  CD_Unregister
#define CD_Unregister                           0x41261
#undef  XCD_Unregister
#define XCD_Unregister                          0x61261
#undef  CD_ByteCopy
#define CD_ByteCopy                             0x41262
#undef  XCD_ByteCopy
#define XCD_ByteCopy                            0x61262
#undef  CD_Identify
#define CD_Identify                             0x41263
#undef  XCD_Identify
#define XCD_Identify                            0x61263
#undef  CD_ConvertToLBA
#define CD_ConvertToLBA                         0x41264
#undef  XCD_ConvertToLBA
#define XCD_ConvertToLBA                        0x61264
#undef  CD_ConvertToMSF
#define CD_ConvertToMSF                         0x41265
#undef  XCD_ConvertToMSF
#define XCD_ConvertToMSF                        0x61265
#undef  CD_ReadAudio
#define CD_ReadAudio                            0x41266
#undef  XCD_ReadAudio
#define XCD_ReadAudio                           0x61266
#undef  CD_ReadUserData
#define CD_ReadUserData                         0x41267
#undef  XCD_ReadUserData
#define XCD_ReadUserData                        0x61267
#undef  CD_SeekUserData
#define CD_SeekUserData                         0x41268
#undef  XCD_SeekUserData
#define XCD_SeekUserData                        0x61268
#undef  CD_GetAudioParms
#define CD_GetAudioParms                        0x41269
#undef  XCD_GetAudioParms
#define XCD_GetAudioParms                       0x61269
#undef  CDGetAudioParms_VolumeBlock
#define CDGetAudioParms_VolumeBlock             0x41269
#undef  XCDGetAudioParms_VolumeBlock
#define XCDGetAudioParms_VolumeBlock            0x61269
#undef  CD_SetAudioParms
#define CD_SetAudioParms                        0x4126A
#undef  XCD_SetAudioParms
#define XCD_SetAudioParms                       0x6126A
#undef  CD_SCSIUserOp
#define CD_SCSIUserOp                           0x4126B
#undef  XCD_SCSIUserOp
#define XCD_SCSIUserOp                          0x6126B

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct cd_control_block                 cd_control_block;
typedef struct cd_version_block                 cd_version_block;
typedef struct cd_parameter_block               cd_parameter_block;
typedef struct cd_enquire_all_tracks_block      cd_enquire_all_tracks_block;
typedef struct cd_enquire_one_track_block       cd_enquire_one_track_block;
typedef struct cd_sub_channel_block             cd_sub_channel_block;
typedef struct cd_disc_used_block               cd_disc_used_block;
typedef struct cd_inquiry_block                 cd_inquiry_block;
typedef struct cd_register_block                cd_register_block;
typedef struct cd_volume_block                  cd_volume_block;

/********************
 * Type definitions *
 ********************/
typedef bits cd_address;

typedef int cd_address_mode;

struct cd_control_block
   {  int reserved [5];
   };

typedef byte cd_audio_flags;

struct cd_version_block
   {  int version_number;
      char version_string [256];
   };

typedef int cd_status;

typedef int cd_readiness;

typedef int cd_multiplier;

typedef int cd_data_mode;

typedef int cd_speed;

struct cd_parameter_block
   {  cd_multiplier inactivity_timer;
      int retry_count;
      cd_data_mode mode;
      cd_speed speed;
   };

typedef int cd_play_to_what;

struct cd_enquire_all_tracks_block
   {  byte first_track;
      byte last_track;
      byte reserved0;
      byte reserved1;
      byte reserved2;
   };

struct cd_enquire_one_track_block
   {  cd_address address;
      cd_audio_flags audio_control;
   };

struct cd_sub_channel_block
   {  cd_address relative_lba;
      cd_address absolute_lba;
      cd_audio_flags audio_control;
      byte track_number;
      byte index_number;
   };

struct cd_disc_used_block
   {  int block_count;
      int block_size;
   };

typedef int cd_audio;

struct cd_inquiry_block
   {  byte i [36];
   };

typedef int cd_error_response_level;

typedef bits cd_flags;

typedef bits cd_register_flags;

struct cd_register_block
   {  cd_register_flags flags;
      int registration_count;
      int drive_type_count;
   };

typedef int cd_drive_type;

typedef int cd_audio_completion;

struct cd_volume_block
   {  int volume [2];
   };

/************************
 * Constant definitions *
 ************************/
#define error_CD_BASE                           0x803400u
#define error_CD_BAD_ALIGNMENT                  0x803401u
#define error_CD_DRIVE_NOT_SUPPORTED            0x803402u
#define error_CD_BAD_MODE                       0x803403u
#define error_CD_INVALID_PARAMETER              0x803404u
#define error_CD_NOT_AUDIO_TRACK                0x803405u
#define error_CD_NO_CADDY                       0x803406u
#define error_CD_NO_DRIVE                       0x803407u
#define error_CD_INVALID_FORMAT                 0x803408u
#define error_CD_BAD_MINUTES                    0x803409u
#define error_CD_BAD_SECONDS                    0x80340Au
#define error_CD_BAD_BLOCKS                     0x80340Bu
#define error_CD_PHYSICAL_BLOCK_BAD             0x80340Cu
#define error_CD_DRAWER_LOCKED                  0x80340Du
#define error_CD_WRONG_DATA_MODE                0x80340Eu
#define error_CD_CHANNEL_NOT_SUPPORTED          0x80340Fu
#define error_CD_BAD_DEVICE_ID                  0x803410u
#define error_CD_BAD_CARD_NUMBER                0x803411u
#define error_CD_BAD_LUN_NUMBER                 0x803412u
#define error_CD_NO_SUCH_TRACK                  0x803413u
#define error_CD_FAULTY_DISC                    0x803414u
#define error_CD_NO_SUCH_BLOCK                  0x803415u
#define error_CD_NOT_SUPPORTED                  0x803416u
#define error_CD_DRIVER_NOT_PRESENT             0x803417u
#define error_CD_SWI_NOT_SUPPORTED              0x803418u
#define error_CD_TOO_MANY_DRIVERS               0x803419u
#define error_CD_NOT_REGISTERED                 0x80341Au
#define cd_LOGICAL_BLOCK_ADDRESSING             ((cd_address_mode) 0x0u)
#define cd_RED_BOOK_ADDRESSING                  ((cd_address_mode) 0x1u)
#define cd_PHYSICAL_BLOCK_ADDRESSING            ((cd_address_mode) 0x2u)
#define cd_AUDIO                                ((cd_audio_flags) 0x0u)
#define cd_DATA                                 ((cd_audio_flags) 0x1u)
#define cd_FOUR_CHANNEL                         ((cd_audio_flags) 0x0u)
#define cd_TWO_CHANNEL                          ((cd_audio_flags) 0x2u)
#define cd_READ_AUDIO_READ                      ((byte) 0)
#define cd_READ_AUDIO_REASON_MASK               0xFFu
#define cd_DRIVE_STATUS_OK                      ((cd_status) 0x1u)
#define cd_DRIVE_STATUS_BUSY                    ((cd_status) 0x2u)
#define cd_DRIVE_STATUS_NOT_READY               ((cd_status) 0x4u)
#define cd_DRIVE_STATUS_UNAVAILABLE             ((cd_status) 0x8u)
#define cd_DRIVE_READY                          ((cd_readiness) 0x0u)
#define cd_DRIVE_NOT_READY                      ((cd_readiness) 0x1u)
#define cd_MULTIPLIER_DEFAULT                   ((cd_multiplier) 0x0u)
#define cd_MULTIPLIER_EIGHTH_SEC                ((cd_multiplier) 0x1u)
#define cd_MULTIPLIER_QUARTER_SEC               ((cd_multiplier) 0x2u)
#define cd_MULTIPLIER_HALF_SEC                  ((cd_multiplier) 0x3u)
#define cd_MULTIPLIER_ONE_SEC                   ((cd_multiplier) 0x4u)
#define cd_MULTIPLIER_TWO_SEC                   ((cd_multiplier) 0x5u)
#define cd_MULTIPLIER_FOUR_SEC                  ((cd_multiplier) 0x6u)
#define cd_MULTIPLIER_EIGHT_SEC                 ((cd_multiplier) 0x7u)
#define cd_MULTIPLIER_SIXTEEN_SEC               ((cd_multiplier) 0x8u)
#define cd_MULTIPLIER_THIRTY_TWO_SEC            ((cd_multiplier) 0x9u)
#define cd_MULTIPLIER_ONE_MIN                   ((cd_multiplier) 0xAu)
#define cd_MULTIPLIER_TWO_MIN                   ((cd_multiplier) 0xBu)
#define cd_MULTIPLIER_FOUR_MIN                  ((cd_multiplier) 0xCu)
#define cd_MULTIPLIER_EIGHT_MIN                 ((cd_multiplier) 0xDu)
#define cd_MULTIPLIER_SIXTEEN_MIN               ((cd_multiplier) 0xEu)
#define cd_MULTIPLIER_THIRTY_TWO_MIN            ((cd_multiplier) 0xFu)
#define cd_MODE_AUDIO                           ((cd_data_mode) 0x0u)
#define cd_MODE1                                ((cd_data_mode) 0x1u)
#define cd_MODE2_FORM2                          ((cd_data_mode) 0x2u)
#define cd_MODE2_FORM1                          ((cd_data_mode) 0x3u)
#define cd_SPEED_UNCHANGED                      0
#define cd_SPEED_STANDARD                       1
#define cd_SPEED_DOUBLE                         2
#define cd_SPEED_MAX                            255
#define cd_PLAY_TO_END_OF_TRACK                 ((cd_play_to_what) 0xFEu)
#define cd_PLAY_TO_END_OF_DISC                  ((cd_play_to_what) 0xFFu)
#define cd_AUDIO_PLAYING                        ((cd_audio) 0x0u)
#define cd_AUDIO_PAUSED                         ((cd_audio) 0x1u)
#define cd_AUDIO_COMPLETED                      ((cd_audio) 0x3u)
#define cd_AUDIO_ERROR                          ((cd_audio) 0x4u)
#define cd_AUDIO_STOPPED                        ((cd_audio) 0x5u)
#define cd_CHECK_ERROR                          ((cd_error_response_level) 0x0u)
#define cd_CHECK_SENSE                          ((cd_error_response_level) 0x1u)
#define cd_CHECK_RETRY                          ((cd_error_response_level) 0x2u)
#define cd_SUPPORTED_AUDIO_CONTROL              ((cd_flags) 0x7u)
#define cd_SUPPORTED_PREFETCH                   ((cd_flags) 0x8u)
#define cd_SUPPORTED_CLOSE_DRAWER               ((cd_flags) 0x10u)
#define cd_SUPPORTED_AUDIO_LEVEL                ((cd_flags) 0x20u)
#define cd_SUPPORTED_SPEED_MULTIPLIER           ((cd_flags) 0x3FC0u)
#define cd_SUPPORTED_READ_AUDIO                 ((cd_flags) 0x4000u)
#define cd_SUPPORTED_AUDIO_PARAMS               ((cd_flags) 0x8000u)
#define cd_USE_OLD_READ                         ((cd_register_flags) 0x40u)
#define cd_USE_OLD_SEEK                         ((cd_register_flags) 0x80u)
#define cd_USE_OLD_INQUIRY                      ((cd_register_flags) 0x100u)
#define cd_USE_OLD_CAPACITY                     ((cd_register_flags) 0x200u)
#define cd_USE_OLD_READY                        ((cd_register_flags) 0x400u)
#define cd_USE_OLD_STOP_OPEN                    ((cd_register_flags) 0x800u)
#define cd_USE_OLD_CHECK                        ((cd_register_flags) 0x1000u)
#define cd_USE_OLD_STATUS                       ((cd_register_flags) 0x2000u)
#define cd_USE_OLD_CONTROL                      ((cd_register_flags) 0x4000u)
#define cd_USE_OLD_PREFETCH                     ((cd_register_flags) 0x8000u)
#define cd_USE_OLD_RESET                        ((cd_register_flags) 0x10000u)
#define cd_USE_READ_DATA_PROPRIETARY            ((cd_register_flags) 0x20000u)
#define cd_USE_READ_DATA_SCATTER                ((cd_register_flags) 0x40000u)
#define cd_USE_SEEK_DATA_PROPRIETARY            ((cd_register_flags) 0x80000u)
#define cd_USE_SEEK_DATA_SCATTER                ((cd_register_flags) 0x100000u)
#define cd_USE_SCSI_OP                          ((cd_register_flags) 0x200000u)
      /*RISC O S 5+*/
#define cd_DRIVE_TYPE_UNKNOWN                   ((cd_drive_type) 0xFFFFFFFFu)
#define cd_AUDIO_DONE                           ((cd_audio_completion) 0xFFFFFFFFu)
#define cd_VOLUME_LIMIT                         65535

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      cd_version()
 *
 * Description:   Reads version string
 *
 * Output:        version - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41240.
 */

extern os_error *xcd_version (cd_version_block **version);
__swi (0x41240) cd_version_block *cd_version (void);

/* ------------------------------------------------------------------------
 * Function:      cd_read_data()
 *
 * Description:   Reads data from CD-ROM - do not use
 *
 * Input:         address_mode - value of R0 on entry
 *                start_address - value of R1 on entry
 *                block_count - value of R2 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41241.
 */

extern os_error *xcd_read_data (cd_address_mode address_mode,
      cd_address start_address,
      int block_count,
      byte *buffer,
      int size,
      cd_control_block const *control);
extern void cd_read_data (cd_address_mode address_mode,
      cd_address start_address,
      int block_count,
      byte *buffer,
      int size,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_seek_to()
 *
 * Description:   Seeks head to given position
 *
 * Input:         address_mode - value of R0 on entry
 *                seek - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41242.
 */

extern os_error *xcd_seek_to (cd_address_mode address_mode,
      cd_address seek,
      cd_control_block const *control);
extern void cd_seek_to (cd_address_mode address_mode,
      cd_address seek,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_drive_status()
 *
 * Description:   Reads drive status
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41243.
 */

extern os_error *xcd_drive_status (cd_control_block const *control,
      cd_status *status);
extern cd_status cd_drive_status (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_drive_ready()
 *
 * Description:   Checks if drive is ready - prefer CD_DriveStatus
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        ready - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41244.
 */

extern os_error *xcd_drive_ready (cd_control_block const *control,
      cd_readiness *ready);
extern cd_readiness cd_drive_ready (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_get_parameters()
 *
 * Description:   Reads drive setup parameters
 *
 * Input:         params - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41245.
 */

extern os_error *xcd_get_parameters (cd_parameter_block *params,
      cd_control_block const *control);
extern void cd_get_parameters (cd_parameter_block *params,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_set_parameters()
 *
 * Description:   Sets drive setup paramters
 *
 * Input:         params - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41246.
 */

extern os_error *xcd_set_parameters (cd_parameter_block const *params,
      cd_control_block const *control);
extern void cd_set_parameters (cd_parameter_block const *params,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_open_drawer()
 *
 * Description:   Stops the disc, opens the drawer and ejects the disc
 *
 * Input:         control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41247.
 */

extern os_error *xcd_open_drawer (cd_control_block const *control);
extern void cd_open_drawer (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_eject_button()
 *
 * Description:   Controls the effect of the eject button and *Eject
 *                command
 *
 * Input:         disable - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41248.
 */

extern os_error *xcd_eject_button (osbool disable,
      cd_control_block const *control);
extern void cd_eject_button (osbool disable,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_enquire_address()
 *
 * Description:   Reads current head position
 *
 * Input:         address_mode - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Output:        address - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41249.
 */

extern os_error *xcd_enquire_address (cd_address_mode address_mode,
      cd_control_block const *control,
      cd_address *address);
extern cd_address cd_enquire_address (cd_address_mode address_mode,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_enquire_data_mode()
 *
 * Description:   Finds data mode at given address
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Output:        data_mode - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4124A.
 */

extern os_error *xcd_enquire_data_mode (cd_address_mode address_mode,
      cd_address address,
      cd_control_block const *control,
      cd_data_mode *data_mode);
extern cd_data_mode cd_enquire_data_mode (cd_address_mode address_mode,
      cd_address address,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_play_audio()
 *
 * Description:   Plays selected section of audio
 *
 * Input:         address_mode - value of R0 on entry
 *                start - value of R1 on entry
 *                end - value of R2 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4124B.
 */

extern os_error *xcd_play_audio (cd_address_mode address_mode,
      cd_address start,
      cd_address end,
      cd_control_block const *control);
extern void cd_play_audio (cd_address_mode address_mode,
      cd_address start,
      cd_address end,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_play_track()
 *
 * Description:   Plays one or more tracks
 *
 * Input:         track - value of R0 on entry
 *                play_to - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4124C.
 */

extern os_error *xcd_play_track (int track,
      cd_play_to_what play_to,
      cd_control_block const *control);
extern void cd_play_track (int track,
      cd_play_to_what play_to,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_audio_pause()
 *
 * Description:   Controls pausing of audio playing
 *
 * Input:         pause - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4124D.
 */

extern os_error *xcd_audio_pause (osbool pause,
      cd_control_block const *control);
extern void cd_audio_pause (osbool pause,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_enquire_all_tracks()
 *
 * Description:   Reads information on all tracks
 *
 * Input:         info - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4124E with R0 = 0x0.
 */

extern os_error *xcd_enquire_all_tracks (cd_enquire_all_tracks_block *info,
      cd_control_block const *control);
extern void cd_enquire_all_tracks (cd_enquire_all_tracks_block *info,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_enquire_one_track()
 *
 * Description:   Reads information on a given track
 *
 * Input:         track - value of R0 on entry
 *                info - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4124E.
 */

extern os_error *xcd_enquire_one_track (int track,
      cd_enquire_one_track_block *info,
      cd_control_block const *control);
extern void cd_enquire_one_track (int track,
      cd_enquire_one_track_block *info,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_read_sub_channel()
 *
 * Description:   Calls SWI 0x4124F
 *
 * Input:         block - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Before entry, R0 = 0x40.
 */

extern os_error *xcd_read_sub_channel (cd_sub_channel_block *block,
      cd_control_block const *control);
extern void cd_read_sub_channel (cd_sub_channel_block *block,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_check_drive()
 *
 * Description:   Returns SCSI diagnostic information - should not nomally
 *                be used
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41250.
 */

extern os_error *xcd_check_drive (cd_control_block const *control,
      bits *status);
extern bits cd_check_drive (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_disc_changed()
 *
 * Description:   Checks whether the disc has changed - do not use
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        changed - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41251.
 */

extern os_error *xcd_disc_changed (cd_control_block const *control,
      osbool *changed);
extern osbool cd_disc_changed (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_stop_disc()
 *
 * Description:   Stops the disc
 *
 * Input:         control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41252.
 */

extern os_error *xcd_stop_disc (cd_control_block const *control);
extern void cd_stop_disc (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_disc_used()
 *
 * Description:   Calls SWI 0x41253
 *
 * Input:         address_mode - value of R0 on entry
 *                info - value of R1 on entry
 *                control - value of R7 on entry
 */

extern os_error *xcd_disc_used (cd_address_mode address_mode,
      cd_disc_used_block *info,
      cd_control_block const *control);
extern void cd_disc_used (cd_address_mode address_mode,
      cd_disc_used_block *info,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_audio_status()
 *
 * Description:   Returns the current audio status of the drive
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41254.
 */

extern os_error *xcd_audio_status (cd_control_block const *control,
      cd_audio *status);
extern cd_audio cd_audio_status (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_inquiry()
 *
 * Description:   Reads info on drive - should not normally be used
 *
 * Input:         data - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41255.
 */

extern os_error *xcd_inquiry (cd_inquiry_block *data,
      cd_control_block const *control);
extern void cd_inquiry (cd_inquiry_block *data,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_disc_has_changed()
 *
 * Description:   Marks disc as having changed - should not normally be
 *                used
 *
 * Input:         control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41256.
 */

extern os_error *xcd_disc_has_changed (cd_control_block const *control);
extern void cd_disc_has_changed (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_control()
 *
 * Description:   Controls retry on Unit Attention - do not use
 *
 * Input:         level - value of R0 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41257.
 */

extern os_error *xcd_control (cd_error_response_level level,
      cd_control_block const *control);
extern void cd_control (cd_error_response_level level,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_supported()
 *
 * Description:   Calls SWI 0x41258
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xcd_supported (cd_control_block const *control,
      cd_flags *flags);
extern cd_flags cd_supported (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_prefetch()
 *
 * Description:   Causes cacheing on drives where this is supported
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41259.
 */

extern os_error *xcd_prefetch (cd_address_mode address_mode,
      cd_address address,
      cd_control_block const *control);
extern void cd_prefetch (cd_address_mode address_mode,
      cd_address address,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_reset()
 *
 * Description:   Resets the drive
 *
 * Input:         control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4125A.
 */

extern os_error *xcd_reset (cd_control_block const *control);
extern void cd_reset (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_close_drawer()
 *
 * Description:   Closes the drawer
 *
 * Input:         control - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4125B.
 */

extern os_error *xcd_close_drawer (cd_control_block const *control);
extern void cd_close_drawer (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_is_drawer_locked()
 *
 * Description:   Calls SWI 0x4125C
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        locked - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xcd_is_drawer_locked (cd_control_block const *control,
      osbool *locked);
extern osbool cd_is_drawer_locked (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_audio_control()
 *
 * Description:   Do not use
 *
 * Input:         control - value of R1 on entry
 *                control_block - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4125D with R0 = 0x0.
 */

extern os_error *xcd_audio_control (int control,
      cd_control_block const *control_block);
extern void cd_audio_control (int control,
      cd_control_block const *control_block);

/* ------------------------------------------------------------------------
 * Function:      cd_last_error()
 *
 * Description:   Calls SWI 0x4125E
 *
 * Output:        errnum - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xcd_last_error (int *errnum);
__swi (0x4125E) int cd_last_error (void);

/* ------------------------------------------------------------------------
 * Function:      cd_audio_level()
 *
 * Description:   Do not use
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        error - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x4125F.
 */

extern os_error *xcd_audio_level (cd_control_block const *control,
      os_error **error);
extern void cd_audio_level (cd_control_block const *control,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      cd_register()
 *
 * Description:   version 2.20+
 *
 * Input:         info - value of R0 on entry
 *                driver_code - value of R1 on entry
 *                driver_workspace - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41260.
 */

extern os_error *xcd_register (cd_register_block const *info,
      void const *driver_code,
      void *driver_workspace);
__swi (0x41260) void cd_register (cd_register_block const *info,
      void const *driver_code,
      void *driver_workspace);

/* ------------------------------------------------------------------------
 * Function:      cd_unregister()
 *
 * Description:   version 2.20+
 *
 * Input:         info - value of R0 on entry
 *                driver_code - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x41261.
 */

extern os_error *xcd_unregister (cd_register_block const *info,
      void const *driver_code);
__swi (0x41261) void cd_unregister (cd_register_block const *info,
      void const *driver_code);

/* ------------------------------------------------------------------------
 * Function:      cd_byte_copy()
 *
 * Description:   A fast memory copy routine - version 2.20+
 *
 * Input:         source - value of R1 on entry
 *                destination - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x41262.
 */

extern os_error *xcd_byte_copy (byte const *source,
      byte *destination,
      int size);
extern void cd_byte_copy (byte const *source,
      byte *destination,
      int size);

/* ------------------------------------------------------------------------
 * Function:      cd_identify()
 *
 * Description:   version 2.20+
 *
 * Input:         control - value of R7 on entry
 *
 * Output:        drive_type - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41263.
 */

extern os_error *xcd_identify (cd_control_block const *control,
      cd_drive_type *drive_type);
extern cd_drive_type cd_identify (cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_convert_to_lba()
 *
 * Description:   Converts an audio CD disc address to a logical block
 *                address - version 2.20+
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *
 * Output:        new_address - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41264.
 */

extern os_error *xcd_convert_to_lba (cd_address_mode address_mode,
      cd_address address,
      cd_address *new_address);
extern cd_address cd_convert_to_lba (cd_address_mode address_mode,
      cd_address address);

/* ------------------------------------------------------------------------
 * Function:      cd_convert_to_msf()
 *
 * Description:   Converts an audio CD disc address to a red book format
 *                address - version 2.20+
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *
 * Output:        new_address - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41265.
 */

extern os_error *xcd_convert_to_msf (cd_address_mode address_mode,
      cd_address address,
      cd_address *new_address);
extern cd_address cd_convert_to_msf (cd_address_mode address_mode,
      cd_address address);

/* ------------------------------------------------------------------------
 * Function:      cd_read_audio()
 *
 * Description:   Reads data from digitial audio tracks - version 2.22+
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *                block_count - value of R2 on entry
 *                buffer - value of R3 on entry
 *                flags - value of R4 on entry
 *                control - value of R7 on entry
 *
 * Output:        drive_type - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41266.
 */

extern os_error *xcd_read_audio (cd_address_mode address_mode,
      cd_address address,
      int block_count,
      byte *buffer,
      bits flags,
      cd_control_block const *control,
      cd_drive_type *drive_type);
extern cd_drive_type cd_read_audio (cd_address_mode address_mode,
      cd_address address,
      int block_count,
      byte *buffer,
      bits flags,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_read_user_data()
 *
 * Description:   Do not use - version 2.22+
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *                size - value of R2 on entry
 *                buffer - value of R3 on entry
 *                offset - value of R4 on entry
 *                control - value of R7 on entry
 *
 * Output:        last - value of R1 on exit (X version only)
 *                next_offset - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41267.
 */

extern os_error *xcd_read_user_data (cd_address_mode address_mode,
      cd_address address,
      int size,
      byte *buffer,
      int offset,
      cd_control_block const *control,
      cd_address *last,
      int *next_offset);
extern cd_address cd_read_user_data (cd_address_mode address_mode,
      cd_address address,
      int size,
      byte *buffer,
      int offset,
      cd_control_block const *control,
      int *next_offset);

/* ------------------------------------------------------------------------
 * Function:      cd_seek_user_data()
 *
 * Description:   version 2.22+
 *
 * Input:         address_mode - value of R0 on entry
 *                address - value of R1 on entry
 *                offset - value of R2 on entry
 *                control - value of R7 on entry
 *
 * Output:        found - value of R1 on exit (X version only)
 *                offset_out - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41268.
 */

extern os_error *xcd_seek_user_data (cd_address_mode address_mode,
      cd_address address,
      int offset,
      cd_control_block const *control,
      cd_address *found,
      int *offset_out);
extern cd_address cd_seek_user_data (cd_address_mode address_mode,
      cd_address address,
      int offset,
      cd_control_block const *control,
      int *offset_out);

/* ------------------------------------------------------------------------
 * Function:      cdgetaudioparms_volume_block()
 *
 * Description:   version 2.22+
 *
 * Input:         block - value of R1 on entry
 *                control - value of R7 on entry
 *
 * Output:        cmp - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41269 with R0 = 0x0.
 */

extern os_error *xcdgetaudioparms_volume_block (cd_volume_block *block,
      cd_control_block const *control,
      cd_audio_completion *cmp);
extern cd_audio_completion cdgetaudioparms_volume_block (cd_volume_block *block,
      cd_control_block const *control);

/* ------------------------------------------------------------------------
 * Function:      cd_scsi_user_op()
 *
 * Description:   RISC O S 5+
 *
 * Input:         op - value of R0 on entry
 *                block_size - value of R1 on entry
 *                block - value of R2 on entry
 *                start_addr - value of R3 on entry
 *                length - value of R4 on entry
 *                timeout - value of R5 on entry
 *                control - value of R7 on entry
 *
 * Output:        next_addr - value of R3 on exit
 *                undone - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4126B.
 */

extern os_error *xcd_scsi_user_op (bits op,
      int block_size,
      scsi_op_block const *block,
      byte *start_addr,
      int length,
      int timeout,
      cd_control_block const *control,
      byte **next_addr,
      int *undone);
extern int cd_scsi_user_op (bits op,
      int block_size,
      scsi_op_block const *block,
      byte *start_addr,
      int length,
      int timeout,
      cd_control_block const *control,
      byte **next_addr);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
