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
void recurse_directory_display( char const * const prefix, indirect_disc_address dir, disc_record * discrec, void const * const map );
void accum_and_display_directory_stats( disc_record const *, void const * );
unsigned int dir_read_bytes
(
        void const * const where,
        unsigned int how_many
);
void dir_write_bytes
(
        void * const where,
        unsigned int how_many,
        unsigned int what
);
YesNoAnswer directory_utterly_broken
(
        char directory[ NewDirLen ],
        disc_record const * const discrec
);
YesNoAnswer writeout_directory
(
        char const * const dirname,
        char directory[ NewDirLen ],
        indirect_disc_address dir,
        disc_record const * const discrec,
        void const * const map
);
void recurse_accum_directory_stats
(
        object_record *all_obj_recs,
        char const * const prefix,
        indirect_disc_address parent_dir,
        indirect_disc_address dir,
        disc_record const * const discrec,
        void const * const map
);
void const * const dir_first_free_entry
(
        disc_record const * const discrec,
        void const * const directory
);
int caseless_strcmp( const char *a, const char *b );
