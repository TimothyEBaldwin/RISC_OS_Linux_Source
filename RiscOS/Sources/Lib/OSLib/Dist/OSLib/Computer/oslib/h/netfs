#ifndef netfs_H
#define netfs_H

/* C header file for NetFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  NetFS_ReadFSNumber
#define NetFS_ReadFSNumber                      0x40040
#undef  XNetFS_ReadFSNumber
#define XNetFS_ReadFSNumber                     0x60040
#undef  NetFS_SetFSNumber
#define NetFS_SetFSNumber                       0x40041
#undef  XNetFS_SetFSNumber
#define XNetFS_SetFSNumber                      0x60041
#undef  NetFS_ReadFSName
#define NetFS_ReadFSName                        0x40042
#undef  XNetFS_ReadFSName
#define XNetFS_ReadFSName                       0x60042
#undef  NetFS_SetFSName
#define NetFS_SetFSName                         0x40043
#undef  XNetFS_SetFSName
#define XNetFS_SetFSName                        0x60043
#undef  NetFS_ReadFSTimeouts
#define NetFS_ReadFSTimeouts                    0x40046
#undef  XNetFS_ReadFSTimeouts
#define XNetFS_ReadFSTimeouts                   0x60046
#undef  NetFS_SetFSTimeouts
#define NetFS_SetFSTimeouts                     0x40047
#undef  XNetFS_SetFSTimeouts
#define XNetFS_SetFSTimeouts                    0x60047
#undef  NetFS_DoFSOp
#define NetFS_DoFSOp                            0x40048
#undef  XNetFS_DoFSOp
#define XNetFS_DoFSOp                           0x60048
#undef  NetFS_EnumerateFSList
#define NetFS_EnumerateFSList                   0x40049
#undef  XNetFS_EnumerateFSList
#define XNetFS_EnumerateFSList                  0x60049
#undef  NetFS_EnumerateFS
#define NetFS_EnumerateFS                       0x4004A
#undef  XNetFS_EnumerateFS
#define XNetFS_EnumerateFS                      0x6004A
#undef  NetFS_ConvertDate
#define NetFS_ConvertDate                       0x4004B
#undef  XNetFS_ConvertDate
#define XNetFS_ConvertDate                      0x6004B
#undef  NetFS_DoFSOpToGivenFS
#define NetFS_DoFSOpToGivenFS                   0x4004C
#undef  XNetFS_DoFSOpToGivenFS
#define XNetFS_DoFSOpToGivenFS                  0x6004C
#undef  NetFS_UpdateFSList
#define NetFS_UpdateFSList                      0x4004D
#undef  XNetFS_UpdateFSList
#define XNetFS_UpdateFSList                     0x6004D
#undef  NetFS_EnumerateFSContexts
#define NetFS_EnumerateFSContexts               0x4004E
#undef  XNetFS_EnumerateFSContexts
#define XNetFS_EnumerateFSContexts              0x6004E
#undef  NetFS_ReadUserId
#define NetFS_ReadUserId                        0x4004F
#undef  XNetFS_ReadUserId
#define XNetFS_ReadUserId                       0x6004F
#undef  NetFS_GetObjectUID
#define NetFS_GetObjectUID                      0x40050
#undef  XNetFS_GetObjectUID
#define XNetFS_GetObjectUID                     0x60050
#undef  NetFS_EnableCache
#define NetFS_EnableCache                       0x40051
#undef  XNetFS_EnableCache
#define XNetFS_EnableCache                      0x60051
#undef  Service_NetFS
#define Service_NetFS                           0x55
#undef  Service_NetFSDying
#define Service_NetFSDying                      0x5F

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct netfs_cli_request                netfs_cli_request;
typedef struct netfs_save_request               netfs_save_request;
typedef struct netfs_save_reply                 netfs_save_reply;
typedef struct netfs_save_final_reply           netfs_save_final_reply;
typedef struct netfs_load_request               netfs_load_request;
typedef struct netfs_load_reply                 netfs_load_reply;
typedef struct netfs_ex_request                 netfs_ex_request;
typedef struct netfs_cat_request                netfs_cat_request;
typedef struct netfs_cat_reply                  netfs_cat_reply;
typedef struct netfs_open_request               netfs_open_request;
typedef struct netfs_open_reply                 netfs_open_reply;
typedef struct netfs_close_request              netfs_close_request;
typedef struct netfs_bget_request               netfs_bget_request;
typedef struct netfs_bget_reply                 netfs_bget_reply;
typedef struct netfs_bput_request               netfs_bput_request;
typedef struct netfs_gbpb_request               netfs_gbpb_request;
typedef struct netfs_gbpb_reply                 netfs_gbpb_reply;
typedef struct netfs_read_args_request          netfs_read_args_request;
typedef struct netfs_read_args_reply            netfs_read_args_reply;
typedef struct netfs_set_args_request           netfs_set_args_request;
typedef struct netfs_read_disc_info_request     netfs_read_disc_info_request;
typedef struct netfs_disc_info                  netfs_disc_info;
typedef struct netfs_read_disc_info_reply       netfs_read_disc_info_reply;
typedef struct netfs_read_disc_info_reply_base  netfs_read_disc_info_reply_base;
typedef struct netfs_read_logon_info_request    netfs_read_logon_info_request;
typedef struct netfs_logon_info                 netfs_logon_info;
typedef struct netfs_read_logon_info_reply      netfs_read_logon_info_reply;
typedef struct netfs_read_logon_info_reply_base netfs_read_logon_info_reply_base;
typedef struct netfs_read_date_and_time_reply   netfs_read_date_and_time_reply;
typedef struct netfs_read_eof_status_request    netfs_read_eof_status_request;
typedef struct netfs_read_eof_status_reply      netfs_read_eof_status_reply;
typedef struct netfs_read_object_request        netfs_read_object_request;
typedef struct netfs_delete_object_request      netfs_delete_object_request;
typedef struct netfs_delete_object_reply        netfs_delete_object_reply;
typedef struct netfs_read_env_reply             netfs_read_env_reply;
typedef struct netfs_opt_request                netfs_opt_request;
typedef struct netfs_read_user_info_request     netfs_read_user_info_request;
typedef struct netfs_read_user_info_reply       netfs_read_user_info_reply;
typedef struct netfs_read_version_reply         netfs_read_version_reply;
typedef struct netfs_read_free_request          netfs_read_free_request;
typedef struct netfs_read_free_reply            netfs_read_free_reply;
typedef struct netfs_create_dir_request         netfs_create_dir_request;
typedef struct netfs_set_date_and_time_request  netfs_set_date_and_time_request;
typedef struct netfs_create_request             netfs_create_request;
typedef struct netfs_create_reply               netfs_create_reply;
typedef struct netfs_read_user_free_request     netfs_read_user_free_request;
typedef struct netfs_read_user_free_reply       netfs_read_user_free_reply;
typedef struct netfs_set_user_free_request      netfs_set_user_free_request;
typedef struct netfs_read_user_name_reply       netfs_read_user_name_reply;
typedef struct netfs_logon_info_extended        netfs_logon_info_extended;
typedef struct netfs_read_logon_info_extended_request netfs_read_logon_info_extended_request;
typedef struct netfs_read_logon_info_extended_reply netfs_read_logon_info_extended_reply;
typedef struct netfs_read_logon_info_extended_reply_base netfs_read_logon_info_extended_reply_base;
typedef struct netfs_read_user_info_extended_request netfs_read_user_info_extended_request;
typedef struct netfs_read_user_info_extended_reply netfs_read_user_info_extended_reply;
typedef struct netfs_cli_info_reply             netfs_cli_info_reply;
typedef struct netfs_clii_am_reply              netfs_clii_am_reply;
typedef struct netfs_clis_disc_reply            netfs_clis_disc_reply;
typedef struct netfs_cli_dir_reply              netfs_cli_dir_reply;
typedef struct netfs_cli_unknown_reply          netfs_cli_unknown_reply;
typedef struct netfs_cli_lib_reply              netfs_cli_lib_reply;
typedef struct netfs_ex_reply                   netfs_ex_reply;
typedef struct netfs_ex_text_reply              netfs_ex_text_reply;
typedef struct netfs_ex_title_reply             netfs_ex_title_reply;
typedef struct netfs_ex_title_text_reply        netfs_ex_title_text_reply;
typedef struct netfs_read_object_stamp_reply    netfs_read_object_stamp_reply;
typedef struct netfs_read_object_load_and_exec_addr_reply netfs_read_object_load_and_exec_addr_reply;
typedef struct netfs_read_object_size_reply     netfs_read_object_size_reply;
typedef struct netfs_read_object_attr_reply     netfs_read_object_attr_reply;
typedef struct netfs_read_object_all_info_reply netfs_read_object_all_info_reply;
typedef struct netfs_read_object_attr_and_cycle_no_reply netfs_read_object_attr_and_cycle_no_reply;
typedef struct netfs_read_object_sin_reply      netfs_read_object_sin_reply;
typedef struct netfs_set_object_load_exec_and_attr_request netfs_set_object_load_exec_and_attr_request;
typedef struct netfs_set_object_load_addr_request netfs_set_object_load_addr_request;
typedef struct netfs_set_object_exec_addr_request netfs_set_object_exec_addr_request;
typedef struct netfs_set_object_attr_request    netfs_set_object_attr_request;
typedef struct netfs_set_object_stamp_request   netfs_set_object_stamp_request;
typedef struct netfs_manager_op_read_password_count_request netfs_manager_op_read_password_count_request;
typedef struct netfs_manager_op_read_password_count_reply netfs_manager_op_read_password_count_reply;
typedef struct netfs_manager_op_read_password_request netfs_manager_op_read_password_request;
typedef struct netfs_manager_op_read_password_reply netfs_manager_op_read_password_reply;
typedef struct netfs_manager_op_write_password_request netfs_manager_op_write_password_request;
typedef struct netfs_manager_op_add_user_request netfs_manager_op_add_user_request;
typedef struct netfs_manager_op_remove_user_request netfs_manager_op_remove_user_request;
typedef struct netfs_manager_op_set_privilege_request netfs_manager_op_set_privilege_request;
typedef struct netfs_manager_op_logoff_user_request netfs_manager_op_logoff_user_request;
typedef union  netfs_cli                        netfs_cli;
typedef union  netfs_save                       netfs_save;
typedef union  netfs_load                       netfs_load;
typedef union  netfs_ex                         netfs_ex;
typedef union  netfs_cat                        netfs_cat;
typedef union  netfs_open                       netfs_open;
typedef union  netfs_close                      netfs_close;
typedef union  netfs_bget                       netfs_bget;
typedef union  netfs_bput                       netfs_bput;
typedef union  netfs_gbpb                       netfs_gbpb;
typedef union  netfs_read_args                  netfs_read_args;
typedef union  netfs_set_args                   netfs_set_args;
typedef union  netfs_read_disc_info             netfs_read_disc_info;
typedef union  netfs_read_logon_info            netfs_read_logon_info;
typedef union  netfs_read_date_and_time         netfs_read_date_and_time;
typedef union  netfs_read_eof_status            netfs_read_eof_status;
typedef union  netfs_read_object                netfs_read_object;
typedef union  netfs_set_object                 netfs_set_object;
typedef union  netfs_delete_object              netfs_delete_object;
typedef union  netfs_read_env                   netfs_read_env;
typedef union  netfs_opt                        netfs_opt;
typedef union  netfs_read_user_info             netfs_read_user_info;
typedef union  netfs_read_version               netfs_read_version;
typedef union  netfs_read_free                  netfs_read_free;
typedef union  netfs_create_dir                 netfs_create_dir;
typedef union  netfs_set_date_and_time          netfs_set_date_and_time;
typedef union  netfs_create                     netfs_create;
typedef union  netfs_read_user_free             netfs_read_user_free;
typedef union  netfs_set_user_free              netfs_set_user_free;
typedef union  netfs_read_user_name             netfs_read_user_name;
typedef union  netfs_read_logon_info_extended   netfs_read_logon_info_extended;
typedef union  netfs_read_user_info_extended    netfs_read_user_info_extended;
typedef union  netfs_manager_op_read_password_count netfs_manager_op_read_password_count;
typedef union  netfs_manager_op_read_password   netfs_manager_op_read_password;
typedef union  netfs_manager_op_write_password  netfs_manager_op_write_password;
typedef union  netfs_manager_op_add_user        netfs_manager_op_add_user;
typedef union  netfs_manager_op_remove_user     netfs_manager_op_remove_user;
typedef union  netfs_manager_op_set_privilege   netfs_manager_op_set_privilege;
typedef union  netfs_manager_op_logoff_user     netfs_manager_op_logoff_user;
typedef union  netfs_op                         netfs_op;
typedef struct netfs_file_server                netfs_file_server;
typedef struct netfs_file_server_context        netfs_file_server_context;

/********************
 * Type definitions *
 ********************/
typedef byte netfs_fs_op;

typedef byte netfs_fs_op_ex_type;

typedef byte netfs_fs_op_args_type;

typedef byte netfs_fs_op_read_object_type;

typedef byte netfs_fs_op_set_object_type;

typedef byte netfs_fs_op_manager_op_type;

struct netfs_cli_request
   {  char command [256];
   };

struct netfs_save_request
   {  bits load_addr;
      bits exec_addr;
      byte size [3];
      char file_name [256];
   };

struct netfs_save_reply
   {  byte port;
      byte block_limit [2];
      char leaf_name [10];
   };

struct netfs_save_final_reply
   {  byte attr;
      byte date [2];
   };

struct netfs_load_request
   {  char file_name [256];
   };

struct netfs_load_reply
   {  bits load_addr;
      bits exec_addr;
      byte size [3];
      byte attr;
      byte date [2];
      char file_name [256];
   };

struct netfs_ex_request
   {  netfs_fs_op_ex_type ex_type;
      byte entry;
      byte count;
      char dir_name [256];
   };

struct netfs_cat_request
   {  char dir_name [256];
   };

struct netfs_cat_reply
   {  char leaf_name [10];
      char reserved1;
      char owner;
      byte reserved2 [3];
      char disc_name [16];
   };

struct netfs_open_request
   {  byte error_if_absent;
      byte read_only;
      char file_name [256];
   };

struct netfs_open_reply
   {  byte handle;
      char leaf_name [10];
   };

struct netfs_close_request
   {  byte handle;
   };

struct netfs_bget_request
   {  byte handle;
   };

struct netfs_bget_reply
   {  byte b;
      byte terminator;
   };

struct netfs_bput_request
   {  byte handle;
      byte b;
   };

struct netfs_gbpb_request
   {  byte handle;
      byte read_next;
      byte size [3];
      byte ptr [3];
   };

struct netfs_gbpb_reply
   {  byte final_block;
      byte size [3];
   };

struct netfs_read_args_request
   {  netfs_fs_op_args_type args_type;
   };

struct netfs_read_args_reply
   {  byte arg [3];
   };

struct netfs_set_args_request
   {  netfs_fs_op_args_type args_type;
      byte arg [3];
   };

struct netfs_read_disc_info_request
   {  byte first;
      byte count;
   };

struct netfs_disc_info
   {  byte phys_no;
      char disc_name [16];
   };

#define netfs_READ_DISC_INFO_REPLY_MEMBERS \
   byte count;

/* Base netfs_read_disc_info_reply structure without variable part */
struct netfs_read_disc_info_reply_base
   {  netfs_READ_DISC_INFO_REPLY_MEMBERS
   };

/* legacy structure */
struct netfs_read_disc_info_reply
   {  netfs_READ_DISC_INFO_REPLY_MEMBERS
      netfs_disc_info info [UNKNOWN];
   };

#define netfs_READ_DISC_INFO_REPLY(N) \
   struct \
      {  netfs_READ_DISC_INFO_REPLY_MEMBERS \
         netfs_disc_info info [N]; \
      }

#define netfs_SIZEOF_READ_DISC_INFO_REPLY(N) \
   (offsetof (netfs_read_disc_info_reply, info) + \
         (N)*sizeof ((netfs_read_disc_info_reply *) NULL)->info)

struct netfs_read_logon_info_request
   {  byte first;
      byte count;
   };

/* ------------------------------------------------------------------------
 * Type:          netfs_logon_info
 *
 * Description:   Structure repeats
 *
 * Fields:        user_name - User name terminated by 13
 *                privilege - Privilege byte immediately follows user_name
 */

struct netfs_logon_info
   {  byte station;
      byte net;
      byte user_name [22];
      byte privilege;
   };

#define netfs_READ_LOGON_INFO_REPLY_MEMBERS \
   byte count;

/* Base netfs_read_logon_info_reply structure without variable part */
struct netfs_read_logon_info_reply_base
   {  netfs_READ_LOGON_INFO_REPLY_MEMBERS
   };

/* legacy structure */
struct netfs_read_logon_info_reply
   {  netfs_READ_LOGON_INFO_REPLY_MEMBERS
      netfs_logon_info info [UNKNOWN];
   };

#define netfs_READ_LOGON_INFO_REPLY(N) \
   struct \
      {  netfs_READ_LOGON_INFO_REPLY_MEMBERS \
         netfs_logon_info info [N]; \
      }

#define netfs_SIZEOF_READ_LOGON_INFO_REPLY(N) \
   (offsetof (netfs_read_logon_info_reply, info) + \
         (N)*sizeof ((netfs_read_logon_info_reply *) NULL)->info)

struct netfs_read_date_and_time_reply
   {  byte date [2];
      byte hr;
      byte min;
      byte s;
   };

struct netfs_read_eof_status_request
   {  byte handle;
   };

struct netfs_read_eof_status_reply
   {  byte eof_status;
   };

struct netfs_read_object_request
   {  netfs_fs_op_read_object_type read_type;
      char file_name [256];
   };

struct netfs_delete_object_request
   {  char file_name [256];
   };

struct netfs_delete_object_reply
   {  bits load_addr;
      bits exec_addr;
      byte size [3];
      byte attr;
   };

struct netfs_read_env_reply
   {  byte len;
      char disc_name [16];
      char csd_name [10];
      char lib_name [10];
   };

struct netfs_opt_request
   {  byte opt;
   };

struct netfs_read_user_info_request
   {  char user_name [22];
   };

struct netfs_read_user_info_reply
   {  byte privilege;
      byte station;
      byte net;
   };

struct netfs_read_version_reply
   {  char type [10];
      char version [4];
   };

struct netfs_read_free_request
   {  char disc_name [16];
   };

struct netfs_read_free_reply
   {  byte free_sector_count [3];
      byte sector_count [3];
   };

struct netfs_create_dir_request
   {  byte sector_count;
      char dir_name [256];
   };

struct netfs_set_date_and_time_request
   {  byte date [2];
      byte hr;
      byte min;
      byte s;
   };

struct netfs_create_request
   {  bits load_addr;
      bits exec_addr;
      byte size [3];
      char file_name [256];
   };

struct netfs_create_reply
   {  byte attr;
      byte date [2];
   };

struct netfs_read_user_free_request
   {  char user_name [22];
   };

struct netfs_read_user_free_reply
   {  byte user_free [3];
   };

struct netfs_set_user_free_request
   {  byte user_free [3];
      char user_name [22];
   };

struct netfs_read_user_name_reply
   {  char user_name [22];
   };

struct netfs_logon_info_extended
   {  byte station;
      byte net;
      byte task;
      byte user_name [22];
      byte privilege;
   };

struct netfs_read_logon_info_extended_request
   {  byte first;
      byte count;
   };

#define netfs_READ_LOGON_INFO_EXTENDED_REPLY_MEMBERS \
   byte count;

/* Base netfs_read_logon_info_extended_reply structure without variable part */
struct netfs_read_logon_info_extended_reply_base
   {  netfs_READ_LOGON_INFO_EXTENDED_REPLY_MEMBERS
   };

/* legacy structure */
struct netfs_read_logon_info_extended_reply
   {  netfs_READ_LOGON_INFO_EXTENDED_REPLY_MEMBERS
      netfs_logon_info_extended info [UNKNOWN];
   };

#define netfs_READ_LOGON_INFO_EXTENDED_REPLY(N) \
   struct \
      {  netfs_READ_LOGON_INFO_EXTENDED_REPLY_MEMBERS \
         netfs_logon_info_extended info [N]; \
      }

#define netfs_SIZEOF_READ_LOGON_INFO_EXTENDED_REPLY(N) \
   (offsetof (netfs_read_logon_info_extended_reply, info) + \
         (N)*sizeof ((netfs_read_logon_info_extended_reply *) NULL)->info)

struct netfs_read_user_info_extended_request
   {  char user_name;
   };

struct netfs_read_user_info_extended_reply
   {  byte privilege;
      byte station;
      byte net;
      byte task;
   };

struct netfs_cli_info_reply
   {  char file_name [10];
      char reserved1;
      char load_addr [9];
      char exec_addr [9];
      char reserved2 [2];
      char length [7];
      char reserved3 [2];
      char access [7];
      char reserved4 [4];
      char date [9];
      char sin [6];
      byte terminator;
   };

struct netfs_clii_am_reply
   {  byte urd;
      byte csd;
      byte lib;
      byte opt;
   };

struct netfs_clis_disc_reply
   {  byte urd;
      byte csd;
      byte lib;
   };

struct netfs_cli_dir_reply
   {  byte csd;
   };

struct netfs_cli_unknown_reply
   {  char command [256];
   };

struct netfs_cli_lib_reply
   {  byte lib;
   };

struct netfs_ex_reply
   {  byte ex_count;
      byte dir_count;
      char name [10];
      bits load_addr;
      bits exec_addr;
      byte attr;
      byte date [2];
      byte sin [3];
      byte size [3];
   };

struct netfs_ex_text_reply
   {  byte ex_count;
      byte dir_count;
      char text [UNKNOWN];
   };

struct netfs_ex_title_reply
   {  byte ex_count;
      byte dir_count;
      byte len;
      char name [10];
   };

struct netfs_ex_title_text_reply
   {  byte ex_count;
      byte dir_count;
      char text [UNKNOWN];
   };

struct netfs_read_object_stamp_reply
   {  byte date [2];
   };

struct netfs_read_object_load_and_exec_addr_reply
   {  bits load_addr;
      bits exec_addr;
   };

struct netfs_read_object_size_reply
   {  byte size [3];
   };

struct netfs_read_object_attr_reply
   {  byte attr;
   };

struct netfs_read_object_all_info_reply
   {  bits load_addr;
      bits exec_addr;
      byte size [3];
      byte attr;
      byte date [2];
      byte access [2];
   };

struct netfs_read_object_attr_and_cycle_no_reply
   {  byte reserved [2];
      byte len;
      byte dir_name [10];
      byte access;
      byte count;
   };

struct netfs_read_object_sin_reply
   {  byte obj_type;
      byte sin [6];
   };

struct netfs_set_object_load_exec_and_attr_request
   {  netfs_fs_op_set_object_type set_type;
      bits load_addr;
      bits exec_addr;
      byte attr;
   };

struct netfs_set_object_load_addr_request
   {  netfs_fs_op_set_object_type set_type;
      bits load_addr;
   };

struct netfs_set_object_exec_addr_request
   {  netfs_fs_op_set_object_type set_type;
      bits exec_addr;
   };

struct netfs_set_object_attr_request
   {  netfs_fs_op_set_object_type set_type;
      byte attr;
   };

struct netfs_set_object_stamp_request
   {  netfs_fs_op_set_object_type set_type;
      byte date [2];
   };

struct netfs_manager_op_read_password_count_request
   {  netfs_fs_op_manager_op_type req_no;
   };

struct netfs_manager_op_read_password_count_reply
   {  int user_count;
   };

struct netfs_manager_op_read_password_request
   {  netfs_fs_op_manager_op_type req_no;
      byte user_no [2];
   };

struct netfs_manager_op_read_password_reply
   {  int index;
      byte privilege;
      byte opt;
      char reserved [4];
      byte station;
      byte net;
      byte logon_permitted;
      char user_name [22];
      char password [23];
      char urd_name [10];
   };

struct netfs_manager_op_write_password_request
   {  netfs_fs_op_manager_op_type req_no;
      char reserved1 [4];
      byte privilege;
      byte opt;
      byte reserved2 [6];
      byte logon_permitted;
      char user_name [22];
      char password [23];
      char urd_name [10];
   };

struct netfs_manager_op_add_user_request
   {  netfs_fs_op_manager_op_type req_no;
      char user_name [22];
   };

struct netfs_manager_op_remove_user_request
   {  netfs_fs_op_manager_op_type req_no;
      char user_name [22];
   };

struct netfs_manager_op_set_privilege_request
   {  netfs_fs_op_manager_op_type req_no;
      char user_name [22];
      byte privilege;
   };

struct netfs_manager_op_logoff_user_request
   {  netfs_fs_op_manager_op_type req_no;
      char user_name [22];
   };

union netfs_cli
   {  netfs_cli_request request;
      netfs_cli_info_reply info_reply;
      netfs_clii_am_reply i_am_reply;
      netfs_clis_disc_reply s_disc_reply;
      netfs_cli_dir_reply dir_reply;
      netfs_cli_unknown_reply unknown_reply;
      netfs_cli_lib_reply lib_reply;
   };

union netfs_save
   {  netfs_save_request request;
      netfs_save_reply reply;
      netfs_save_final_reply final_reply;
   };

union netfs_load
   {  netfs_load_request request;
      netfs_load_reply reply;
   };

union netfs_ex
   {  netfs_ex_request request;
      netfs_ex_reply reply;
      netfs_ex_text_reply text_reply;
      netfs_ex_title_reply title_reply;
      netfs_ex_title_text_reply title_text_reply;
   };

union netfs_cat
   {  netfs_cat_request request;
      netfs_cat_reply reply;
   };

union netfs_open
   {  netfs_open_request request;
      netfs_open_reply reply;
   };

union netfs_close
   {  netfs_close_request request;
   };

union netfs_bget
   {  netfs_bget_request request;
      netfs_bget_reply reply;
   };

union netfs_bput
   {  netfs_bput_request request;
   };

union netfs_gbpb
   {  netfs_gbpb_request request;
      netfs_gbpb_reply reply;
   };

union netfs_read_args
   {  netfs_read_args_request request;
      netfs_read_args_reply reply;
   };

union netfs_set_args
   {  netfs_set_args_request request;
   };

union netfs_read_disc_info
   {  netfs_read_disc_info_request request;
      netfs_read_disc_info_reply reply;
   };

union netfs_read_logon_info
   {  netfs_read_logon_info_request request;
      netfs_read_logon_info_reply reply;
   };

union netfs_read_date_and_time
   {  netfs_read_date_and_time_reply reply;
   };

union netfs_read_eof_status
   {  netfs_read_eof_status_request request;
      netfs_read_eof_status_reply reply;
   };

union netfs_read_object
   {  netfs_read_object_request request;
      netfs_read_object_stamp_reply stamp_reply;
      netfs_read_object_load_and_exec_addr_reply load_and_exec_addr_reply;
      netfs_read_object_size_reply size_reply;
      netfs_read_object_attr_reply attr_reply;
      netfs_read_object_all_info_reply all_info_reply;
      netfs_read_object_attr_and_cycle_no_reply attr_and_cycle_no_reply;
      netfs_read_object_sin_reply sin_reply;
   };

union netfs_set_object
   {  netfs_set_object_load_exec_and_attr_request load_exec_and_attr_request;
      netfs_set_object_load_addr_request load_addr_request;
      netfs_set_object_exec_addr_request exec_addr_request;
      netfs_set_object_attr_request attr_request;
      netfs_set_object_stamp_request stamp_request;
   };

union netfs_delete_object
   {  netfs_delete_object_request request;
      netfs_delete_object_reply reply;
   };

union netfs_read_env
   {  netfs_read_env_reply reply;
   };

union netfs_opt
   {  netfs_opt_request request;
   };

union netfs_read_user_info
   {  netfs_read_user_info_request request;
      netfs_read_user_info_reply reply;
   };

union netfs_read_version
   {  netfs_read_version_reply reply;
   };

union netfs_read_free
   {  netfs_read_free_request request;
      netfs_read_free_reply reply;
   };

union netfs_create_dir
   {  netfs_create_dir_request request;
   };

union netfs_set_date_and_time
   {  netfs_set_date_and_time_request request;
   };

union netfs_create
   {  netfs_create_request request;
      netfs_create_reply reply;
   };

union netfs_read_user_free
   {  netfs_read_user_free_request request;
      netfs_read_user_free_reply reply;
   };

union netfs_set_user_free
   {  netfs_set_user_free_request request;
   };

union netfs_read_user_name
   {  netfs_read_user_name_reply reply;
   };

union netfs_read_logon_info_extended
   {  netfs_read_logon_info_extended_request request;
      netfs_read_logon_info_extended_reply reply;
   };

union netfs_read_user_info_extended
   {  netfs_read_user_info_extended_request request;
      netfs_read_user_info_extended_reply reply;
   };

union netfs_manager_op_read_password_count
   {  netfs_manager_op_read_password_count_request request;
      netfs_manager_op_read_password_count_reply reply;
   };

union netfs_manager_op_read_password
   {  netfs_manager_op_read_password_request request;
      netfs_manager_op_read_password_reply reply;
   };

union netfs_manager_op_write_password
   {  netfs_manager_op_write_password_request request;
   };

union netfs_manager_op_add_user
   {  netfs_manager_op_add_user_request request;
   };

union netfs_manager_op_remove_user
   {  netfs_manager_op_remove_user_request request;
   };

union netfs_manager_op_set_privilege
   {  netfs_manager_op_set_privilege_request request;
   };

union netfs_manager_op_logoff_user
   {  netfs_manager_op_logoff_user_request request;
   };

union netfs_op
   {  netfs_cli cli;
      netfs_save save;
      netfs_load load;
      netfs_ex ex;
      netfs_cat cat;
      netfs_open open;
      netfs_close close;
      netfs_bget bget;
      netfs_bput bput;
      netfs_gbpb gbpb;
      netfs_read_args read_args;
      netfs_set_args set_args;
      netfs_read_disc_info read_disc_info;
      netfs_read_logon_info read_logon_info;
      netfs_read_date_and_time read_date_and_time;
      netfs_read_eof_status read_eof_status;
      netfs_read_object read_object;
      netfs_set_object set_object;
      netfs_delete_object delete_object;
      netfs_read_env read_env;
      netfs_opt opt;
      netfs_read_user_info read_user_info;
      netfs_read_version read_version;
      netfs_read_free read_free;
      netfs_create_dir create_dir;
      netfs_set_date_and_time set_date_and_time;
      netfs_create create;
      netfs_read_user_free read_user_free;
      netfs_set_user_free set_user_free;
      netfs_read_user_name read_user_name;
      netfs_read_logon_info_extended read_logon_info_extended;
      netfs_read_user_info_extended read_user_info_extended;
      netfs_manager_op_read_password_count manager_op_read_password_count;
      netfs_manager_op_read_password manager_op_read_password;
      netfs_manager_op_write_password manager_op_write_password;
      netfs_manager_op_add_user manager_op_add_user;
      netfs_manager_op_remove_user manager_op_remove_user;
      netfs_manager_op_set_privilege manager_op_set_privilege;
      netfs_manager_op_logoff_user manager_op_logoff_user;
   };

struct netfs_file_server
   {  byte station_no;
      byte net_no;
      byte drive;
      char disc_name [16];
      byte reserved;
   };

typedef byte netfs_date_and_time [5];

struct netfs_file_server_context
   {  byte station_no;
      byte net_no;
      byte reserved1;
      char disc_name [16];
      byte reserved2;
      char user_name [22];
      byte reserved3;
      byte reserved4;
   };

/************************
 * Constant definitions *
 ************************/
#define netfs_LEAF_NAME_LIMIT                   10
#define netfs_DISC_NAME_LIMIT                   16
#define netfs_USER_NAME_LIMIT                   22
#define netfs_PASSWORD_LIMIT                    23
#define netfs_FILE_NAME_LIMIT                   256
#define netfs_CLI_LIMIT                         256
#define error_NET_FS_BAD_NAME                   0x10500u
      /*Bad file server name*/
#define error_NET_FS_BAD_COMMAND_CODE           0x10501u
      /*Bad file server command code*/
#define error_NET_FS_UNEXPECTED_COMMAND_CODE    0x10502u
      /*Unexpected file server command code*/
#define error_NET_FS_UNKNOWN_FUNCTION_CODE      0x10503u
      /*Unknown function code*/
#define error_NET_FS_UNKNOWN_STATION_NAME       0x10504u
      /*Unknown station name*/
#define error_NET_FS_UNKNOWN_STATION_NUMBER     0x10505u
      /*Unknown station number*/
#define error_NET_FS_STATION_NOT_FOUND          0x10506u
      /*Station name not found*/
#define error_NET_FS_FILE_SERVER_NAME_TOO_LONG  0x10507u
      /*File server name too long*/
#define error_NET_FS_BAD_FILE_SERVER_DATE       0x10508u
      /*Bad date*/
#define error_NET_FS_NET_FS_INTERNAL_ERROR      0x10509u
      /*Fatal internal error*/
#define error_NET_FS_FILE_SERVER_NOT_CAPABLE    0x1050Au
      /*Not possible on this file server*/
#define error_NET_FS_BROADCAST_SERVER_DEAD      0x1050Bu
      /*Broadcast server not responding*/
#define error_NET_FS_FILE_SERVER_ONLY24_BIT     0x1050Cu
      /*File too big*/
#define error_NET_UTILS_WRONG_VERSION           0x1053Au
      /*NetFS isn't version 5.78*/
#define error_NET_UTILS_NET_FS_NO_GO            0x1053Bu
      /*NetFS isn't running as a filing system*/
#define error_NET_UTILS_IS_THREADED             0x1053Cu
      /*You can't kill NetUtils*/
#define error_NET_FS_SET_FREE_SYNTAX            0x10540u
      /*Syntax: *SetFree <Username> <FreeSpace (in hex)>, ErrorNumber_Syntax*/
#define error_NET_FS_FS_CLI_SYNTAX              0x10541u
      /*Syntax: *FSCLI <string>, ErrorNumber_Syntax*/
#define netfs_FS_OP_CLI                         ((netfs_fs_op) 0x0u)
#define netfs_FS_OP_SAVE                        ((netfs_fs_op) 0x1u)
#define netfs_FS_OP_LOAD                        ((netfs_fs_op) 0x2u)
#define netfs_FS_OP_EX                          ((netfs_fs_op_ex_type) 0x0u)
#define netfs_FS_OP_CAT                         ((netfs_fs_op) 0x4u)
#define netfs_FS_OP_LOAD_AS                     ((netfs_fs_op) 0x5u)
#define netfs_FS_OP_OPEN                        ((netfs_fs_op) 0x6u)
#define netfs_FS_OP_CLOSE                       ((netfs_fs_op) 0x7u)
#define netfs_FS_OP_BGET                        ((netfs_fs_op) 0x8u)
#define netfs_FS_OP_BPUT                        ((netfs_fs_op) 0x9u)
#define netfs_FS_OP_GBPB_READ                   ((netfs_fs_op) 0xAu)
#define netfs_FS_OP_GBPB_WRITE                  ((netfs_fs_op) 0xBu)
#define netfs_FS_OP_READ_ARGS                   ((netfs_fs_op) 0xCu)
#define netfs_FS_OP_SET_ARGS                    ((netfs_fs_op) 0xDu)
#define netfs_FS_OP_READ_DISC_INFO              ((netfs_fs_op) 0xEu)
#define netfs_FS_OP_READ_LOGON_INFO             ((netfs_fs_op) 0xFu)
#define netfs_FS_OP_READ_DATE_AND_TIME          ((netfs_fs_op) 0x10u)
#define netfs_FS_OP_READ_EOF_STATUS             ((netfs_fs_op) 0x11u)
#define netfs_FS_OP_READ_OBJECT                 ((netfs_fs_op) 0x12u)
#define netfs_FS_OP_SET_OBJECT                  ((netfs_fs_op) 0x13u)
#define netfs_FS_OP_DELETE_OBJECT               ((netfs_fs_op) 0x14u)
#define netfs_FS_OP_READ_ENV                    ((netfs_fs_op) 0x15u)
#define netfs_FS_OP_OPT                         ((netfs_fs_op) 0x16u)
#define netfs_FS_OP_LOGOFF                      ((netfs_fs_op) 0x17u)
#define netfs_FS_OP_READ_USER_INFO              ((netfs_fs_op) 0x18u)
#define netfs_FS_OP_READ_VERSION                ((netfs_fs_op) 0x19u)
#define netfs_FS_OP_READ_FREE                   ((netfs_fs_op) 0x1Au)
#define netfs_FS_OP_CREATE_DIR                  ((netfs_fs_op) 0x1Bu)
#define netfs_FS_OP_SET_DATE_AND_TIME           ((netfs_fs_op) 0x1Cu)
#define netfs_FS_OP_CREATE                      ((netfs_fs_op) 0x1Du)
#define netfs_FS_OP_READ_USER_FREE              ((netfs_fs_op) 0x1Eu)
#define netfs_FS_OP_SET_USER_FREE               ((netfs_fs_op) 0x1Fu)
#define netfs_FS_OP_READ_USER_NAME              ((netfs_fs_op) 0x20u)
#define netfs_FS_OP_READ_LOGON_INFO_EXTENDED    ((netfs_fs_op) 0x21u)
#define netfs_FS_OP_READ_USER_INFO_EXTENDED     ((netfs_fs_op) 0x22u)
#define netfs_FS_OP_MANAGER_OP                  ((netfs_fs_op) 0x24u)
#define netfs_FS_OP_CLI_COMPLETE                ((byte) 0)
#define netfs_FS_OP_CLI_INFO                    ((byte) 4)
#define netfs_FS_OP_CLII_AM                     ((byte) 5)
#define netfs_FS_OP_CLIS_DISC                   ((byte) 6)
#define netfs_FS_OP_CLI_DIR                     ((byte) 7)
#define netfs_FS_OP_CLI_UNKNOWN                 ((byte) 8)
#define netfs_FS_OP_CLI_LIB                     ((byte) 9)
#define netfs_FS_OP_CLI_DISC_INFO               ((byte) 10)
#define netfs_FS_OP_CLI_USER_INFO               ((byte) 11)
#define netfs_FS_OP_EX_TEXT                     ((netfs_fs_op_ex_type) 0x1u)
#define netfs_FS_OP_EX_TITLE                    ((netfs_fs_op_ex_type) 0x2u)
#define netfs_FS_OP_EX_TITLE_TEXT               ((netfs_fs_op_ex_type) 0x3u)
#define netfs_FS_OP_ARGS_PTR                    ((netfs_fs_op_args_type) 0x0u)
#define netfs_FS_OP_ARGS_EXT                    ((netfs_fs_op_args_type) 0x1u)
#define netfs_FS_OP_ARGS_SIZE                   ((netfs_fs_op_args_type) 0x2u)
#define netfs_FS_OP_READ_OBJECT_STAMP           ((netfs_fs_op_read_object_type) 0x1u)
#define netfs_FS_OP_READ_OBJECT_LOAD_AND_EXEC_ADDR ((netfs_fs_op_read_object_type) 0x2u)
#define netfs_FS_OP_READ_OBJECT_SIZE            ((netfs_fs_op_read_object_type) 0x3u)
#define netfs_FS_OP_READ_OBJECT_ATTR            ((netfs_fs_op_read_object_type) 0x4u)
#define netfs_FS_OP_READ_OBJECT_ALL_INFO        ((netfs_fs_op_read_object_type) 0x5u)
#define netfs_FS_OP_READ_OBJECT_ATTR_AND_CYCLE_NO ((netfs_fs_op_read_object_type) 0x6u)
#define netfs_FS_OP_READ_OBJECT_SIN             ((netfs_fs_op_read_object_type) 0x7u)
#define netfs_FS_OP_SET_OBJECT_LOAD_EXEC_AND_ATTR ((netfs_fs_op_set_object_type) 0x1u)
#define netfs_FS_OP_SET_OBJECT_LOAD_ADDR        ((netfs_fs_op_set_object_type) 0x2u)
#define netfs_FS_OP_SET_OBJECT_EXEC_ADDR        ((netfs_fs_op_set_object_type) 0x3u)
#define netfs_FS_OP_SET_OBJECT_ATTR             ((netfs_fs_op_set_object_type) 0x4u)
#define netfs_FS_OP_SET_OBJECT_STAMP            ((netfs_fs_op_set_object_type) 0x5u)
#define netfs_FS_OP_MANAGER_OP_READ_PASSWORD_COUNT ((netfs_fs_op_manager_op_type) 0x0u)
#define netfs_FS_OP_MANAGER_OP_READ_PASSWORD    ((netfs_fs_op_manager_op_type) 0x1u)
#define netfs_FS_OP_MANAGER_OP_WRITE_PASSWORD   ((netfs_fs_op_manager_op_type) 0x2u)
#define netfs_FS_OP_MANAGER_OP_ADD_USER         ((netfs_fs_op_manager_op_type) 0x3u)
#define netfs_FS_OP_MANAGER_OP_REMOVE_USER      ((netfs_fs_op_manager_op_type) 0x4u)
#define netfs_FS_OP_MANAGER_OP_SET_PRIVILEGE    ((netfs_fs_op_manager_op_type) 0x5u)
#define netfs_FS_OP_MANAGER_OP_LOGOFF_USER      ((netfs_fs_op_manager_op_type) 0x6u)
#define netfs_FS_OP_MANAGER_OP_SHUTDOWN         ((netfs_fs_op_manager_op_type) 0x7u)
#define netfs_NO_MORE                           (-1)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      netfs_read_fs_number()
 *
 * Description:   Returns the full station number of your current file
 *                server
 *
 * Output:        station_no - value of R0 on exit
 *                net_no - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x40040.
 */

extern os_error *xnetfs_read_fs_number (byte *station_no,
      byte *net_no);
extern void netfs_read_fs_number (byte *station_no,
      byte *net_no);

/* ------------------------------------------------------------------------
 * Function:      netfs_set_fs_number()
 *
 * Description:   Sets the full station number used as the current file
 *                server
 *
 * Input:         station_no - value of R0 on entry
 *                net_no - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40041.
 */

extern os_error *xnetfs_set_fs_number (byte station_no,
      byte net_no);
__swi (0x40041) void netfs_set_fs_number (byte station_no,
      byte net_no);

/* ------------------------------------------------------------------------
 * Function:      netfs_read_fs_name()
 *
 * Description:   Reads the name of your current file server
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40042.
 */

extern os_error *xnetfs_read_fs_name (char *buffer,
      int size,
      char **end);
extern char *netfs_read_fs_name (char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      netfs_set_fs_name()
 *
 * Description:   Sets by name the file server used as your current one
 *
 * Input:         fs_name - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40043.
 */

extern os_error *xnetfs_set_fs_name (char const *fs_name);
__swi (0x40043) void netfs_set_fs_name (char const *fs_name);

/* ------------------------------------------------------------------------
 * Function:      netfs_read_fs_timeouts()
 *
 * Description:   Reads the current values for timeouts used by NetFS
 *
 * Output:        transmit_count - value of R0 on exit
 *                transmit_delay - value of R1 on exit
 *                peek_count - value of R2 on exit
 *                peek_delay - value of R3 on exit
 *                receive_delay - value of R4 on exit
 *                broadcast_delay - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x40046.
 */

extern os_error *xnetfs_read_fs_timeouts (int *transmit_count,
      int *transmit_delay,
      int *peek_count,
      int *peek_delay,
      int *receive_delay,
      int *broadcast_delay);
extern void netfs_read_fs_timeouts (int *transmit_count,
      int *transmit_delay,
      int *peek_count,
      int *peek_delay,
      int *receive_delay,
      int *broadcast_delay);

/* ------------------------------------------------------------------------
 * Function:      netfs_set_fs_timeouts()
 *
 * Description:   Sets the current values for timeouts used by NetFS
 *
 * Input:         transmit_count - value of R0 on entry
 *                transmit_delay - value of R1 on entry
 *                peek_count - value of R2 on entry
 *                peek_delay - value of R3 on entry
 *                receive_delay - value of R4 on entry
 *                broadcast_delay - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40047.
 */

extern os_error *xnetfs_set_fs_timeouts (int transmit_count,
      int transmit_delay,
      int peek_count,
      int peek_delay,
      int receive_delay,
      int broadcast_delay);
extern void netfs_set_fs_timeouts (int transmit_count,
      int transmit_delay,
      int peek_count,
      int peek_delay,
      int receive_delay,
      int broadcast_delay);

/* ------------------------------------------------------------------------
 * Function:      netfs_do_fs_op()
 *
 * Description:   Commands the current file server to perform an operation
 *
 * Input:         fs_op - value of R0 on entry
 *                op - value of R1 on entry
 *                tx_count - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                rx_count - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40048.
 */

extern os_error *xnetfs_do_fs_op (netfs_fs_op fs_op,
      netfs_op *op,
      int tx_count,
      int size,
      int *status,
      int *rx_count);
extern int netfs_do_fs_op (netfs_fs_op fs_op,
      netfs_op *op,
      int tx_count,
      int size,
      int *rx_count);

/* ------------------------------------------------------------------------
 * Function:      netfs_enumerate_fs_list()
 *
 * Description:   Lists all file servers of which the NetFS software
 *                currently knows
 *
 * Input:         context - value of R0 on entry
 *                file_server - value of R1 on entry
 *                size - value of R2 on entry
 *                server_limit - value of R3 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                server_count - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40049.
 */

extern os_error *xnetfs_enumerate_fs_list (int context,
      netfs_file_server *file_server,
      int size,
      int server_limit,
      int *context_out,
      int *server_count);
extern int netfs_enumerate_fs_list (int context,
      netfs_file_server *file_server,
      int size,
      int server_limit,
      int *server_count);

/* ------------------------------------------------------------------------
 * Function:      netfs_enumerate_fs()
 *
 * Description:   Lists all file servers to which the NetFS software is
 *                currently logged on
 *
 * Input:         context - value of R0 on entry
 *                file_server - value of R1 on entry
 *                size - value of R2 on entry
 *                server_limit - value of R3 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                server_count - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4004A.
 */

extern os_error *xnetfs_enumerate_fs (int context,
      netfs_file_server *file_server,
      int size,
      int server_limit,
      int *context_out,
      int *server_count);
extern int netfs_enumerate_fs (int context,
      netfs_file_server *file_server,
      int size,
      int server_limit,
      int *server_count);

/* ------------------------------------------------------------------------
 * Function:      netfs_convert_date()
 *
 * Description:   Converts a file server time and date to a RISC OS time
 *                and date
 *
 * Input:         n - value of R0 on entry
 *                o - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4004B.
 */

extern os_error *xnetfs_convert_date (netfs_date_and_time const *n,
      os_date_and_time *o);
__swi (0x4004B) void netfs_convert_date (netfs_date_and_time const *n,
      os_date_and_time *o);

/* ------------------------------------------------------------------------
 * Function:      netfs_do_fs_op_to_given_fs()
 *
 * Description:   Commands a given file server to perform an operation
 *
 * Input:         fs_op - value of R0 on entry
 *                op - value of R1 on entry
 *                tx_count - value of R2 on entry
 *                size - value of R3 on entry
 *                station - value of R4 on entry
 *                net - value of R5 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                rx_count - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4004C.
 */

extern os_error *xnetfs_do_fs_op_to_given_fs (netfs_fs_op fs_op,
      netfs_op *op,
      int tx_count,
      int size,
      byte station,
      byte net,
      int *status,
      int *rx_count);
extern int netfs_do_fs_op_to_given_fs (netfs_fs_op fs_op,
      netfs_op *op,
      int tx_count,
      int size,
      byte station,
      byte net,
      int *rx_count);

/* ------------------------------------------------------------------------
 * Function:      netfs_update_fs_list()
 *
 * Description:   Adds names of discs to the list of names held by NetFS
 *
 * Input:         station_no - value of R0 on entry
 *                net_no - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4004D.
 */

extern os_error *xnetfs_update_fs_list (byte station_no,
      byte net_no);
__swi (0x4004D) void netfs_update_fs_list (byte station_no,
      byte net_no);

/* ------------------------------------------------------------------------
 * Function:      netfs_enumerate_fs_contexts()
 *
 * Description:   Lists all the entries in the list of file servers to
 *                which NetFS is currently logged on
 *
 * Input:         context - value of R0 on entry
 *                file_server_context - value of R1 on entry
 *                size - value of R2 on entry
 *                server_limit - value of R3 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                server_count - value of R3 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4004E.
 */

extern os_error *xnetfs_enumerate_fs_contexts (int context,
      netfs_file_server_context *file_server_context,
      int size,
      int server_limit,
      int *context_out,
      int *server_count);
extern int netfs_enumerate_fs_contexts (int context,
      netfs_file_server_context *file_server_context,
      int size,
      int server_limit,
      int *server_count);

/* ------------------------------------------------------------------------
 * Function:      netfs_read_user_id()
 *
 * Description:   Returns the current user id if logged on to the current
 *                file server
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4004F.
 */

extern os_error *xnetfs_read_user_id (char *buffer,
      int size,
      char **end);
extern char *netfs_read_user_id (char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      netfs_get_object_uid()
 *
 * Description:   Gets a unique identifier for an object
 *
 * Input:         path_name - value of R1 on entry
 *                special - value of R6 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *                uid0 - value of R6 on exit
 *                uid1 - value of R7 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40050.
 */

extern os_error *xnetfs_get_object_uid (char const *path_name,
      char const *special,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      int *uid0,
      int *uid1);
extern fileswitch_object_type netfs_get_object_uid (char const *path_name,
      char const *special,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      int *uid0,
      int *uid1);

/* ------------------------------------------------------------------------
 * Function:      netfs_enable_cache()
 *
 * Description:   Enables a suspended event task
 *
 * Other notes:   Calls SWI 0x40051.
 */

extern os_error *xnetfs_enable_cache (void);
__swi (0x40051) void netfs_enable_cache (void);

/* ------------------------------------------------------------------------
 * Function:      service_net_fs()
 *
 * Description:   Either a *Logon, a *Bye, a *SDisc or a *Mount has
 *                occurred
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x55.
 */

extern os_error *xservice_net_fs (void);
extern void service_net_fs (void);

/* ------------------------------------------------------------------------
 * Function:      service_net_fs_dying()
 *
 * Description:   NetFS is dying
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5F.
 */

extern os_error *xservice_net_fs_dying (void);
extern void service_net_fs_dying (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
