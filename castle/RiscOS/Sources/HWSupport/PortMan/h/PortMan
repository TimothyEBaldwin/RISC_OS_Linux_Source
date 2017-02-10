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
#pragma force_top_level
#pragma include_only_once

#include "Global/SWIs.h"

/* The SWIs defined by PortMan */
#ifndef PortMan_AccessBit
# define PortMan_AccessBit         	(PortManSWI_Base+0)

#else
#  if PortMan_AccessBit != PortManSWI_Base
#    error PortMan SWI mismatch
Error: PortMan SWI mismatch
#  endif
#endif

/* Flags to PortMan_AccessBit */
#define PORTMAN_FLAG_CLEAR	(1<<0)
#define PORTMAN_FLAG_TOGGLE	(1<<1)
#define PORTMAN_FLAG_SET	(PORTMAN_FLAG_CLEAR|PORTMAN_FLAG_TOGGLE)

/* Reason codes for the service call */
#define PORTMAN_SERVICE_STARTING	0
#define PORTMAN_SERVICE_DYING		1

/* A list of well known tags */
#define PortMan_MPEG_Fitted		"MPEG_Fitted"
#define PortMan_LED_Red			"LED_Red"
#define PortMan_LED_Green		"LED_Green"
#define PortMan_SCART_TV		"SCART_TV"
#define PortMan_NTSC			"NTSC"
#define PortMan_Interlace_Odd		"Interlace_Odd"
#define PortMan_SCART_CVBS		"SCART_CVBS"
#define PortMan_Watchdog		"Watchdog"
#define PortMan_Monitor_Type		"Monitor_Type"
#define PortMan_Video_Power_Down	"Video_Power_Down"
#define PortMan_Chrontel_Power  	"Chrontel_Power"
#define PortMan_ROMCard_Vpp		"ROMCard_Vpp"
#define PortMan_LED_Right		"LED_Right"
#define PortMan_LED_Left		"LED_Left"
#define PortMan_CD_Fitted		"CD_Fitted"
#define PortMan_Joystick_Detect_0	"Joystick_Detect_0"
#define PortMan_Joystick_Detect_1	"Joystick_Detect_1"
#define PortMan_Front_Panel_Button      "Front_Panel_Button"
#define PortMan_EEPROM_Protect          "EEPROM_Protect"
#define PortMan_TV_Mode                 "TV_Mode"
#define PortMan_General_IO              "General_IO"

/* Errors */
#define ErrorBase_PortMan		0x00816900
#define PortMan_BadLine			(ErrorBase_PortMan+0)
#define PortMan_NoTag			(ErrorBase_PortMan+1)
