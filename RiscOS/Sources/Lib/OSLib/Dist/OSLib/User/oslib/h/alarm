#ifndef alarm_H
#define alarm_H

/* C header file for Alarm
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct alarm_date_and_time              alarm_date_and_time;
typedef struct alarm_message_set                alarm_message_set;
typedef struct alarm_message_cancel             alarm_message_cancel;
typedef struct alarm_message_gone_off           alarm_message_gone_off;
typedef struct alarm_full_message_set           alarm_full_message_set;
typedef struct alarm_full_message_cancel        alarm_full_message_cancel;
typedef struct alarm_full_message_gone_off      alarm_full_message_gone_off;

/********************
 * Type definitions *
 ********************/
typedef int alarm_reason;

struct alarm_date_and_time
   {  short year;
      byte month;
      byte date;
      byte hour;
      byte minute;
   };

struct alarm_message_set
   {  alarm_reason set_reason;
      union
      {  os_date_and_time utc;
         alarm_date_and_time local;
      }
      time;
      char sender [40];
      char alarm_name [40];
   };

struct alarm_message_cancel
   {  alarm_reason cancel;
      char sender [40];
      char alarm_name [40];
   };

struct alarm_message_gone_off
   {  char sender [40];
      char alarm_name [40];
   };

struct alarm_full_message_set
   {  wimp_MESSAGE_HEADER_MEMBERS
      alarm_reason set_reason;
      union
      {  os_date_and_time utc;
         alarm_date_and_time local;
      }
      time;
      char sender_name [40];
      char alarm_name [40];
   };

struct alarm_full_message_cancel
   {  wimp_MESSAGE_HEADER_MEMBERS
      alarm_reason cancel;
      char sender_name [40];
      char alarm_name [40];
   };

struct alarm_full_message_gone_off
   {  wimp_MESSAGE_HEADER_MEMBERS
      char sender_name [40];
      char alarm_name [40];
   };

/************************
 * Constant definitions *
 ************************/
#define alarm_NAME_LIMIT                        40
#define message_ALARM_SET                       0x500u
#define message_ALARM_GONE_OFF                  0x501u
#define alarm_REASON_SET_LOCAL                  ((alarm_reason) 0x0u)
#define alarm_REASON_SET_UTC                    ((alarm_reason) 0x1u)
#define alarm_REASON_CANCEL                     ((alarm_reason) 0x2u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
