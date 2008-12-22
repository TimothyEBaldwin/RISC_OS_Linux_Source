#ifndef sound_H
#define sound_H

/* C header file for Sound
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Sound_Configure
#define Sound_Configure                         0x40140
#undef  XSound_Configure
#define XSound_Configure                        0x60140
#undef  Sound_Enable
#define Sound_Enable                            0x40141
#undef  XSound_Enable
#define XSound_Enable                           0x60141
#undef  Sound_Stereo
#define Sound_Stereo                            0x40142
#undef  XSound_Stereo
#define XSound_Stereo                           0x60142
#undef  Sound_Speaker
#define Sound_Speaker                           0x40143
#undef  XSound_Speaker
#define XSound_Speaker                          0x60143
#undef  Sound_Mode
#define Sound_Mode                              0x40144
#undef  XSound_Mode
#define XSound_Mode                             0x60144
#undef  SoundMode_ReadConfiguration
#define SoundMode_ReadConfiguration             0x0
#undef  SoundMode_SetOversampling
#define SoundMode_SetOversampling               0x1
#undef  Sound_LinearHandler
#define Sound_LinearHandler                     0x40145
#undef  XSound_LinearHandler
#define XSound_LinearHandler                    0x60145
#undef  Sound_SampleRate
#define Sound_SampleRate                        0x40146
#undef  XSound_SampleRate
#define XSound_SampleRate                       0x60146
#undef  SoundSampleRate_ReadCount
#define SoundSampleRate_ReadCount               0x0
#undef  SoundSampleRate_ReadCurrent
#define SoundSampleRate_ReadCurrent             0x1
#undef  SoundSampleRate_Lookup
#define SoundSampleRate_Lookup                  0x2
#undef  SoundSampleRate_Select
#define SoundSampleRate_Select                  0x3
#undef  Sound_Volume
#define Sound_Volume                            0x40180
#undef  XSound_Volume
#define XSound_Volume                           0x60180
#undef  Sound_SoundLog
#define Sound_SoundLog                          0x40181
#undef  XSound_SoundLog
#define XSound_SoundLog                         0x60181
#undef  Sound_LogScale
#define Sound_LogScale                          0x40182
#undef  XSound_LogScale
#define XSound_LogScale                         0x60182
#undef  Sound_InstallVoice
#define Sound_InstallVoice                      0x40183
#undef  XSound_InstallVoice
#define XSound_InstallVoice                     0x60183
#undef  SoundInstallVoice_ReadName
#define SoundInstallVoice_ReadName              0x0
#undef  SoundInstallVoice_AddNamedVoice
#define SoundInstallVoice_AddNamedVoice         0x1
#undef  SoundInstallVoice_ReadLocalName
#define SoundInstallVoice_ReadLocalName         0x2
#undef  SoundInstallVoice_ChangeLocalName
#define SoundInstallVoice_ChangeLocalName       0x3
#undef  Sound_RemoveVoice
#define Sound_RemoveVoice                       0x40184
#undef  XSound_RemoveVoice
#define XSound_RemoveVoice                      0x60184
#undef  Sound_AttachVoice
#define Sound_AttachVoice                       0x40185
#undef  XSound_AttachVoice
#define XSound_AttachVoice                      0x60185
#undef  Sound_ControlPacked
#define Sound_ControlPacked                     0x40186
#undef  XSound_ControlPacked
#define XSound_ControlPacked                    0x60186
#undef  Sound_Tuning
#define Sound_Tuning                            0x40187
#undef  XSound_Tuning
#define XSound_Tuning                           0x60187
#undef  Sound_Pitch
#define Sound_Pitch                             0x40188
#undef  XSound_Pitch
#define XSound_Pitch                            0x60188
#undef  Sound_Control
#define Sound_Control                           0x40189
#undef  XSound_Control
#define XSound_Control                          0x60189
#undef  Sound_AttachNamedVoice
#define Sound_AttachNamedVoice                  0x4018A
#undef  XSound_AttachNamedVoice
#define XSound_AttachNamedVoice                 0x6018A
#undef  Sound_ReadControlBlock
#define Sound_ReadControlBlock                  0x4018B
#undef  XSound_ReadControlBlock
#define XSound_ReadControlBlock                 0x6018B
#undef  Sound_WriteControlBlock
#define Sound_WriteControlBlock                 0x4018C
#undef  XSound_WriteControlBlock
#define XSound_WriteControlBlock                0x6018C
#undef  Sound_QInit
#define Sound_QInit                             0x401C0
#undef  XSound_QInit
#define XSound_QInit                            0x601C0
#undef  Sound_QSchedule
#define Sound_QSchedule                         0x401C1
#undef  XSound_QSchedule
#define XSound_QSchedule                        0x601C1
#undef  Sound_QRemove
#define Sound_QRemove                           0x401C2
#undef  XSound_QRemove
#define XSound_QRemove                          0x601C2
#undef  Sound_QFree
#define Sound_QFree                             0x401C3
#undef  XSound_QFree
#define XSound_QFree                            0x601C3
#undef  Sound_QSDispatch
#define Sound_QSDispatch                        0x401C4
#undef  XSound_QSDispatch
#define XSound_QSDispatch                       0x601C4
#undef  Sound_QTempo
#define Sound_QTempo                            0x401C5
#undef  XSound_QTempo
#define XSound_QTempo                           0x601C5
#undef  Sound_QBeat
#define Sound_QBeat                             0x401C6
#undef  XSound_QBeat
#define XSound_QBeat                            0x601C6
#undef  Sound_QInterface
#define Sound_QInterface                        0x401C7
#undef  XSound_QInterface
#define XSound_QInterface                       0x601C7
#undef  Service_Sound
#define Service_Sound                           0x54
#undef  Event_StartOfBar
#define Event_StartOfBar                        0xC

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct sound_log_table                  sound_log_table;
typedef struct sound_log_scale_table            sound_log_scale_table;
typedef struct sound_channel_handler            sound_channel_handler;
typedef struct sound_sccb                       sound_sccb;
typedef struct sound_scheduler                  sound_scheduler;
typedef struct sound_voice_generator            sound_voice_generator;

/********************
 * Type definitions *
 ********************/
struct sound_log_table
   {  byte log [8192];
   };

struct sound_log_scale_table
   {  byte log_scale [256];
   };

struct sound_channel_handler
   {  void *fill_code;
      void *overrun_fixup_code;
      sound_log_table *log_table;
      sound_log_scale_table *log_scale_table;
   };

struct sound_sccb
   {  byte amplitude;
      byte voice_no;
      byte voice_instance;
      byte flags;
      int pitch;
      int timbre;
      int buffer_fill_count;
      int r4;
      int r5;
      int r6;
      int r7;
      int r8;
      int reserved [7];
      int available [48];
   };

struct sound_scheduler
   {  void *scheduler;
   };

struct sound_voice_generator
   {  int fill_code;
      int update_code;
      int gate_on_code;
      int gate_off_code;
      int instantiate_code;
      int free_code;
      int install_code;
      int voice_name_offset;
   };

typedef int sound_state;

typedef bits sound_configuration;

typedef bits sound_linear_handler_flags;

/************************
 * Constant definitions *
 ************************/
#define sound_INSTALL_CODE                      (-390234112)
      /*LDMFD R13!, PC*/
#define sound_STATE_READ                        ((sound_state) 0x0u)
#define sound_STATE_OFF                         ((sound_state) 0x1u)
#define sound_STATE_ON                          ((sound_state) 0x2u)
#define sound_CONFIGURATION_FORMAT              ((sound_configuration) 0xFu)
#define sound_CONFIGURATION_FORMAT16_BIT_ANY    ((sound_configuration) 0x1u)
#define sound_CONFIGURATION_FORMAT16_BIT_MU_LAW ((sound_configuration) 0x2u)
#define sound_CONFIGURATION_OVERSAMPLING_ENABLED ((sound_configuration) 0x10u)
#define sound_DATA_FLAGS                        ((sound_linear_handler_flags) 0x7u)
#define sound_DATA_INVALID                      ((sound_linear_handler_flags) 0x0u)
#define sound_DATA_NON_NOUGHT                   ((sound_linear_handler_flags) 0x1u)
#define sound_DATA_NOUGHT                       ((sound_linear_handler_flags) 0x2u)
#define sound_RESERVED_FLAGS                    ((sound_linear_handler_flags) 0xF8u)
#define sound_HZ                                1024
      /*1Hz in Sound units*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      sound_configure()
 *
 * Description:   Configures the sound system
 *
 * Input:         channel_count - value of R0 on entry
 *                sample_size - value of R1 on entry
 *                sample_period - value of R2 on entry
 *                channel_handler - value of R3 on entry
 *                scheduler - value of R4 on entry
 *
 * Output:        channel_count_out - value of R0 on exit
 *                sample_size_out - value of R1 on exit
 *                sample_period_out - value of R2 on exit
 *                channel_handler_out - value of R3 on exit
 *                scheduler_out - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x40140.
 */

extern os_error *xsound_configure (int channel_count,
      int sample_size,
      int sample_period,
      sound_channel_handler const *channel_handler,
      sound_scheduler const *scheduler,
      int *channel_count_out,
      int *sample_size_out,
      int *sample_period_out,
      sound_channel_handler **channel_handler_out,
      sound_scheduler **scheduler_out);
extern void sound_configure (int channel_count,
      int sample_size,
      int sample_period,
      sound_channel_handler const *channel_handler,
      sound_scheduler const *scheduler,
      int *channel_count_out,
      int *sample_size_out,
      int *sample_period_out,
      sound_channel_handler **channel_handler_out,
      sound_scheduler **scheduler_out);

/* ------------------------------------------------------------------------
 * Function:      sound_enable()
 *
 * Description:   Enables or disables the sound system
 *
 * Input:         state - value of R0 on entry
 *
 * Output:        state_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40141.
 */

extern os_error *xsound_enable (sound_state state,
      sound_state *state_out);
__swi (0x40141) sound_state sound_enable (sound_state state);

/* ------------------------------------------------------------------------
 * Function:      sound_stereo()
 *
 * Description:   Sets the stereo position of a channel
 *
 * Input:         channel_no - value of R0 on entry
 *                position - value of R1 on entry
 *
 * Output:        position_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40142.
 */

extern os_error *xsound_stereo (int channel_no,
      int position,
      int *position_out);
extern int sound_stereo (int channel_no,
      int position);

/* ------------------------------------------------------------------------
 * Function:      sound_speaker()
 *
 * Description:   Enables or disables the speaker(s)
 *
 * Input:         state - value of R0 on entry
 *
 * Output:        state_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40143.
 */

extern os_error *xsound_speaker (sound_state state,
      sound_state *state_out);
__swi (0x40143) sound_state sound_speaker (sound_state state);

/* ------------------------------------------------------------------------
 * Function:      soundmode_read_configuration()
 *
 * Description:   Reads the current sound system configuration
 *
 * Output:        has_16bit - value of R0 on exit (X version only)
 *                configuration - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40144 with R0 = 0x0.
 */

extern os_error *xsoundmode_read_configuration (osbool *has_16bit,
      sound_configuration *configuration);
extern osbool soundmode_read_configuration (sound_configuration *configuration);

/* ------------------------------------------------------------------------
 * Function:      soundmode_set_oversampling()
 *
 * Description:   Enables or disables automatic oversampling
 *
 * Input:         oversample - value of R1 on entry
 *
 * Output:        old_oversample - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40144 with R0 = 0x1.
 */

extern os_error *xsoundmode_set_oversampling (osbool oversample,
      osbool *old_oversample);
extern osbool soundmode_set_oversampling (osbool oversample);

/* ------------------------------------------------------------------------
 * Function:      sound_linear_handler()
 *
 * Description:   Reads or installs the 16-bit linear stereo sound handler
 *
 * Input:         install - value of R0 on entry
 *                new_handler_code - value of R1 on entry
 *                new_workspace - value of R2 on entry
 *
 * Output:        old_handler_code - value of R1 on exit
 *                old_workspace - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40145.
 */

extern os_error *xsound_linear_handler (osbool install,
      void const *new_handler_code,
      void *new_workspace,
      void **old_handler_code,
      void **old_workspace);
extern void sound_linear_handler (osbool install,
      void const *new_handler_code,
      void *new_workspace,
      void **old_handler_code,
      void **old_workspace);

/* ------------------------------------------------------------------------
 * Function:      soundsamplerate_read_count()
 *
 * Description:   Reads the number of available sample rates
 *
 * Output:        rate_count - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40146 with R0 = 0x0.
 */

extern os_error *xsoundsamplerate_read_count (int *rate_count);
extern int soundsamplerate_read_count (void);

/* ------------------------------------------------------------------------
 * Function:      soundsamplerate_read_current()
 *
 * Description:   Reads the current sample rate
 *
 * Output:        rate_index - value of R1 on exit (X version only)
 *                rate - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40146 with R0 = 0x1.
 */

extern os_error *xsoundsamplerate_read_current (int *rate_index,
      int *rate);
extern int soundsamplerate_read_current (int *rate);

/* ------------------------------------------------------------------------
 * Function:      soundsamplerate_lookup()
 *
 * Description:   Converts a sample rate index to the corresponding sample
 *                rate value
 *
 * Input:         rate_index - value of R1 on entry
 *
 * Output:        rate - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40146 with R0 = 0x2.
 */

extern os_error *xsoundsamplerate_lookup (int rate_index,
      int *rate);
extern int soundsamplerate_lookup (int rate_index);

/* ------------------------------------------------------------------------
 * Function:      soundsamplerate_select()
 *
 * Description:   Selects a sample rate
 *
 * Input:         rate_index - value of R1 on entry
 *
 * Output:        old_rate_index - value of R1 on exit (X version only)
 *                old_rate - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40146 with R0 = 0x3.
 */

extern os_error *xsoundsamplerate_select (int rate_index,
      int *old_rate_index,
      int *old_rate);
extern int soundsamplerate_select (int rate_index,
      int *old_rate);

/* ------------------------------------------------------------------------
 * Function:      sound_volume()
 *
 * Description:   Sets the overall volume of the sound system
 *
 * Input:         volume - value of R0 on entry
 *
 * Output:        volume_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40180.
 */

extern os_error *xsound_volume (int volume,
      int *volume_out);
__swi (0x40180) int sound_volume (int volume);

/* ------------------------------------------------------------------------
 * Function:      sound_sound_log()
 *
 * Description:   Converts a signed integer to a signed logarithm, scaling
 *                it by volume
 *
 * Input:         linear - value of R0 on entry
 *
 * Output:        log - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40181.
 */

extern os_error *xsound_sound_log (int linear,
      int *log);
__swi (0x40181) int sound_sound_log (int linear);

/* ------------------------------------------------------------------------
 * Function:      sound_log_scale()
 *
 * Description:   Scales a signed logarithm by the current volume setting
 *
 * Input:         log - value of R0 on entry
 *
 * Output:        linear - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40182.
 */

extern os_error *xsound_log_scale (int log,
      int *linear);
__swi (0x40182) int sound_log_scale (int log);

/* ------------------------------------------------------------------------
 * Function:      sound_install_voice()
 *
 * Description:   Adds a voice to the sound system
 *
 * Input:         voice_generator - value of R0 on entry
 *                voice_no - value of R1 on entry
 *
 * Output:        voice_name_out - value of R0 on exit
 *                voice_no_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40183.
 */

extern os_error *xsound_install_voice (sound_voice_generator const *voice_generator,
      int voice_no,
      char **voice_name_out,
      int *voice_no_out);
extern int sound_install_voice (sound_voice_generator const *voice_generator,
      int voice_no,
      char **voice_name_out);

/* ------------------------------------------------------------------------
 * Function:      soundinstallvoice_read_name()
 *
 * Description:   Reads the name of the voice installed in the specified
 *                slot
 *
 * Input:         voice_no - value of R1 on entry
 *
 * Output:        voice_name - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40183 with R0 = 0x0.
 */

extern os_error *xsoundinstallvoice_read_name (int voice_no,
      char **voice_name);
extern char *soundinstallvoice_read_name (int voice_no);

/* ------------------------------------------------------------------------
 * Function:      soundinstallvoice_add_named_voice()
 *
 * Description:   Adds a voice to the sound system, specifying its name in
 *                the local language
 *
 * Input:         voice_no - value of R1 on entry
 *                voice_generator - value of R2 on entry
 *                voice_name - value of R3 on entry
 *
 * Output:        voice_no_out - value of R1 on exit (X version only)
 *                voice_name_out - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40183 with R0 = 0x1.
 */

extern os_error *xsoundinstallvoice_add_named_voice (int voice_no,
      sound_voice_generator const *voice_generator,
      char const *voice_name,
      int *voice_no_out,
      char **voice_name_out);
extern int soundinstallvoice_add_named_voice (int voice_no,
      sound_voice_generator const *voice_generator,
      char const *voice_name,
      char **voice_name_out);

/* ------------------------------------------------------------------------
 * Function:      soundinstallvoice_read_local_name()
 *
 * Description:   Reads the name and local name of the voice installed in
 *                the specified slot
 *
 * Input:         voice_no - value of R1 on entry
 *
 * Output:        voice_name_out - value of R2 on exit (X version only)
 *                voice_local_name_out - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40183 with R0 = 0x2.
 */

extern os_error *xsoundinstallvoice_read_local_name (int voice_no,
      char **voice_name_out,
      char **voice_local_name_out);
extern char *soundinstallvoice_read_local_name (int voice_no,
      char **voice_local_name_out);

/* ------------------------------------------------------------------------
 * Function:      soundinstallvoice_change_local_name()
 *
 * Description:   Changes the local name of the voice installed in the
 *                specified slot
 *
 * Input:         voice_no - value of R1 on entry
 *                voice_local_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40183 with R0 = 0x3, R2 = 0x0.
 */

extern os_error *xsoundinstallvoice_change_local_name (int voice_no,
      char const *voice_local_name);
extern void soundinstallvoice_change_local_name (int voice_no,
      char const *voice_local_name);

/* ------------------------------------------------------------------------
 * Function:      sound_remove_voice()
 *
 * Description:   Removes a voice from the sound system
 *
 * Input:         voice_no - value of R1 on entry
 *
 * Output:        voice_name_out - value of R0 on exit
 *                voice_no_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40184.
 */

extern os_error *xsound_remove_voice (int voice_no,
      char **voice_name_out,
      int *voice_no_out);
extern int sound_remove_voice (int voice_no,
      char **voice_name_out);

/* ------------------------------------------------------------------------
 * Function:      sound_attach_voice()
 *
 * Description:   Attaches a voice to a channel
 *
 * Input:         channel_no - value of R0 on entry
 *                voice_no - value of R1 on entry
 *
 * Output:        channel_no_out - value of R0 on exit
 *                voice_no_out - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x40185.
 */

extern os_error *xsound_attach_voice (int channel_no,
      int voice_no,
      int *channel_no_out,
      int *voice_no_out);
extern void sound_attach_voice (int channel_no,
      int voice_no,
      int *channel_no_out,
      int *voice_no_out);

/* ------------------------------------------------------------------------
 * Function:      sound_control_packed()
 *
 * Description:   Makes an immediate sound
 *
 * Input:         amp_and_channel - value of R0 on entry
 *                duration_and_pitch - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40186.
 */

extern os_error *xsound_control_packed (bits amp_and_channel,
      bits duration_and_pitch);
__swi (0x40186) void sound_control_packed (bits amp_and_channel,
      bits duration_and_pitch);

/* ------------------------------------------------------------------------
 * Function:      sound_tuning()
 *
 * Description:   Sets the tuning for the sound system
 *
 * Input:         tuning - value of R0 on entry
 *
 * Output:        tuning_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40187.
 */

extern os_error *xsound_tuning (int tuning,
      int *tuning_out);
__swi (0x40187) int sound_tuning (int tuning);

/* ------------------------------------------------------------------------
 * Function:      sound_pitch()
 *
 * Description:   Converts a pitch to internal format (a phase accumulator
 *                value)
 *
 * Input:         pitch - value of R0 on entry
 *
 * Output:        accumulator - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40188.
 */

extern os_error *xsound_pitch (int pitch,
      int *accumulator);
__swi (0x40188) int sound_pitch (int pitch);

/* ------------------------------------------------------------------------
 * Function:      sound_control()
 *
 * Description:   Makes an immediate sound
 *
 * Input:         channel_no - value of R0 on entry
 *                amplitude - value of R1 on entry
 *                pitch - value of R2 on entry
 *                duration - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40189.
 */

extern os_error *xsound_control (int channel_no,
      int amplitude,
      int pitch,
      int duration);
__swi (0x40189) void sound_control (int channel_no,
      int amplitude,
      int pitch,
      int duration);

/* ------------------------------------------------------------------------
 * Function:      sound_attach_named_voice()
 *
 * Description:   Attaches a named voice to a channel
 *
 * Input:         channel_no - value of R0 on entry
 *                voice_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4018A.
 */

extern os_error *xsound_attach_named_voice (int channel_no,
      char const *voice_name);
__swi (0x4018A) void sound_attach_named_voice (int channel_no,
      char const *voice_name);

/* ------------------------------------------------------------------------
 * Function:      sound_read_control_block()
 *
 * Description:   Reads a value from the sound channel control block (S C C
 *                B)
 *
 * Input:         channel_no - value of R0 on entry
 *                offset - value of R1 on entry
 *
 * Output:        channel_no_out - value of R0 on exit
 *                word - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x4018B.
 */

extern os_error *xsound_read_control_block (int channel_no,
      int offset,
      int *channel_no_out,
      int *word);
extern void sound_read_control_block (int channel_no,
      int offset,
      int *channel_no_out,
      int *word);

/* ------------------------------------------------------------------------
 * Function:      sound_write_control_block()
 *
 * Description:   Writes a value to the sound channel control block (S C C
 *                B)
 *
 * Input:         channel_no - value of R0 on entry
 *                offset - value of R1 on entry
 *                word - value of R2 on entry
 *
 * Output:        channel_no_out - value of R0 on exit
 *                word_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x4018C.
 */

extern os_error *xsound_write_control_block (int channel_no,
      int offset,
      int word,
      int *channel_no_out,
      int *word_out);
extern void sound_write_control_block (int channel_no,
      int offset,
      int word,
      int *channel_no_out,
      int *word_out);

/* ------------------------------------------------------------------------
 * Function:      sound_qinit()
 *
 * Description:   Initialises the scheduler's event queue
 *
 * Other notes:   Calls SWI 0x401C0.
 */

extern os_error *xsound_qinit (void);
__swi (0x401C0) void sound_qinit (void);

/* ------------------------------------------------------------------------
 * Function:      sound_qschedule()
 *
 * Description:   Schedules a sound SWI on the event queue
 *
 * Input:         period - value of R0 on entry
 *                swi_no - value of R1 on entry
 *                swi_r0 - value of R2 on entry
 *                swi_r1 - value of R3 on entry
 *
 * Output:        failed - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x401C1.
 */

extern os_error *xsound_qschedule (int period,
      int swi_no,
      int swi_r0,
      int swi_r1,
      osbool *failed);
__swi (0x401C1) osbool sound_qschedule (int period,
      int swi_no,
      int swi_r0,
      int swi_r1);

/* ------------------------------------------------------------------------
 * Function:      sound_qremove()
 *
 * Description:   This call is for use by the scheduler only
 *
 * Other notes:   Calls SWI 0x401C2.
 */

extern os_error *xsound_qremove (void);
__swi (0x401C2) void sound_qremove (void);

/* ------------------------------------------------------------------------
 * Function:      sound_qfree()
 *
 * Description:   Returns the minimum number of free slots in the event
 *                queue
 *
 * Output:        free_count - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x401C3.
 */

extern os_error *xsound_qfree (int *free_count);
__swi (0x401C3) int sound_qfree (void);

/* ------------------------------------------------------------------------
 * Function:      sound_qtempo()
 *
 * Description:   Sets the tempo for the scheduler
 *
 * Input:         tempo - value of R0 on entry
 *
 * Output:        tempo_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x401C5.
 */

extern os_error *xsound_qtempo (int tempo,
      int *tempo_out);
__swi (0x401C5) int sound_qtempo (int tempo);

/* ------------------------------------------------------------------------
 * Function:      sound_qbeat()
 *
 * Description:   Sets or reads the beat counter or bar length
 *
 * Input:         bar_length - value of R0 on entry
 *
 * Output:        bar_length_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x401C6.
 */

extern os_error *xsound_qbeat (int bar_length,
      int *bar_length_out);
__swi (0x401C6) int sound_qbeat (int bar_length);

/* ------------------------------------------------------------------------
 * Function:      service_sound()
 *
 * Description:   Parts of the sound system are starting up or dying
 *
 * Input:         part - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x54.
 */

extern os_error *xservice_sound (int part);
extern void service_sound (int part);

/* ------------------------------------------------------------------------
 * Function:      event_start_of_bar()
 *
 * Description:   Sound start of bar event
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0xC, R1 = 0x2, R2 = 0x0.
 */

extern os_error *xevent_start_of_bar (void);
extern void event_start_of_bar (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
