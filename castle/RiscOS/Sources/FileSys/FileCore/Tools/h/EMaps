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
#include "kernel.h"
#include "typedefs.h"
unsigned int read_bits( void const * const start, unsigned int const bit_offset, unsigned int const bit_size );
unsigned int read_len( void const * const start, unsigned int const bit_offset, unsigned int const bit_size );
direct_disc_address map_bit_offset_to_disc_address( disc_record const * const discrec, unsigned int const bit_offset );
unsigned int map_size( disc_record const * const discrec );
direct_disc_address map_start( disc_record const * const discrec );
unsigned int fragment_ids_per_zone( disc_record const * const discrec );
unsigned int indirect_disc_address_to_zone( disc_record const * const discrec, indirect_disc_address const address );
_kernel_oserror *read_map( void ** const map, disc_record const * const discrec );
unsigned char map_zone_valid_byte( void const * const map, disc_record const * const discrec, unsigned int zone );
YesNoAnswer zone_is_valid( void const * const map, disc_record const * const discrec, unsigned int zone, YesNoAnswer report_the_results );
int map_crosscheck_is_valid( void const * const map, disc_record const * const discrec );
_kernel_oserror *read_disc_record( char const * const disc_specifier, disc_record * const discrec );

typedef void (*pre_zone_function)
(
        void *param,
        disc_record const * const discrec,
        unsigned int zone
);

typedef YesNoAnswer (*unused_function)
(
        void *param,
        disc_record const * const discrec,
        unsigned int bit_offset,
        unsigned int bit_length
);

typedef YesNoAnswer (*alloced_function)
(
        void *param,
        disc_record const * const discrec,
        unsigned int zone,
        unsigned int fragment_id,
        unsigned int bit_offset,
        unsigned int bit_length
);

typedef void (*post_zone_function)
(
        void *param,
        disc_record const * const discrec,
        unsigned int zone,
        unsigned int bit_offset
);

typedef void (*all_done_function)
(
        void *param,
        disc_record const *discrec,
        void const *map
);

void do_zone_walk
(
        unsigned int const start_zone,
        pre_zone_function pre_zone_func,        void *pre_zone_func_param,
        unused_function unused_func,            void *unused_func_param,
        alloced_function alloced_func,          void *alloced_func_param,
        post_zone_function post_zone_func,      void *post_zone_func_param,
        all_done_function all_done_func,        void *all_done_func_param,
        disc_record const * const discrec,
        void const * const map
);
