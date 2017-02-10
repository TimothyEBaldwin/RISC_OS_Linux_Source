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
#include <stdio.h>
#include <stdlib.h>
#include "typedefs.h"
#include "EMaps.h"
#include "StatEMap.h"


void junk_fragment_list
(
        object_record *fragment_list
)
{
        object_record *free_this;

        while( fragment_list )
        {
                free_this = fragment_list;
                fragment_list = fragment_list->next;
                free( free_this );
        }
}

object_record *find_obj_rec
(
        object_record * frag_list,
        unsigned int frid
)
{
        for ( ;
                frag_list;
                frag_list = frag_list->next )
        {
                if ( frag_list->id == frid )
                        break;
        }

        return frag_list;
}

static YesNoAnswer accumulate_fragment
(
        object_record **fragment_list,
        disc_record const * const discrec,
        unsigned int zone,
        unsigned int fragment_id,
        unsigned int bit_offset,
        unsigned int bit_length
)
{
        object_record *rover;

        bit_length = bit_length;

        rover = find_obj_rec( *fragment_list, fragment_id );

        if ( !rover )
        {
                rover = malloc( sizeof( *rover ));
                rover->next = *fragment_list;
                rover->id = fragment_id;
                rover->size = 0;
                rover->fragments = 0;
                rover->status = unused;

                *fragment_list = rover;
        }

if ( fragment_id == 1 ) printf( "Bad block in zone %d of 0..%d\n", zone, discrec->zones_in_map-1 );

        rover->fragments++;
        rover->size += bit_length;

        return No;
}

void adjust_fragment_lengths
(
        object_record **fragment_list,
        disc_record const *discrec,
        void const *map
)
{
        object_record *rover;

        for ( rover = *fragment_list;
                rover;
                rover = rover->next )
        {
                rover->size = rover->size << discrec->log2_bytes_per_map_bit;
        }
}

void accumulate_fragments
(
        disc_record const * const discrec,
        void const * const map,
        object_record **fragment_list
)
{
        *fragment_list = NULL;

        do_zone_walk(
                0,
                NULL, NULL,
                NULL, NULL,
                (alloced_function) accumulate_fragment, fragment_list,
                NULL, NULL,
                (all_done_function) adjust_fragment_lengths, fragment_list,
                discrec, map );
}
