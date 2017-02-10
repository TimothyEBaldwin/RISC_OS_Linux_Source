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
     This header describes the interface to the manipulation of
     large lumps of memory and files.

Revision History:

0.00  13-Jun-89  JSR  Created.
*/

/*
     For c.memmanage
*/
extern void action_slot( int );
extern os_error *init_memmanagement( void );
extern os_error *init_for_copying( void );
extern os_error *add_file_to_chain( char *dest, char *source,
                                    uint32_t size, int reload, int exec, int attr, int objtype,
                                    BOOL force, BOOL *full
                                    #ifdef USE_PROGRESS_BAR
                                    , uint32_t progress, void **ref
                                    #endif
                                  );
extern os_error *read_a_block( BOOL *i_am_full, BOOL *need_another_file, BOOL *that_finished_a_file, uint32_t *progress);
extern os_error *write_a_block( BOOL *i_am_empty, BOOL *that_finished_a_file, uint32_t *progress );
extern char *next_file_to_be_written( void );
extern char *next_file_to_be_read( void );
extern void restart_file_read( void );
extern void restart_file_write( void );
extern void skip_file_read( void );
extern void skip_file_write( void );
extern uint32_t bytes_left_to_read( void );
extern uint32_t bytes_left_to_write( void );
extern void closedown_memmanagement( void );
extern void copy_go_faster( BOOL do_it );
#ifdef USE_PROGRESS_BAR
extern void modify_chain_file_progress( void *ref, uint32_t progress );
#endif

extern BOOL  finished_obj_was_file;
extern char *finished_obj_source_name;
