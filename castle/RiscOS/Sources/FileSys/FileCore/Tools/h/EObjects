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
void find_fragment( unsigned int * const found_frag_start, unsigned int * const found_frag_length, unsigned int * const offset_in_frag, disc_record const * const discrec, void const * const map, indirect_disc_address const fragment_to_find, unsigned int const bit_offset_in_object );
void find_file_fragment( direct_disc_address * const where, unsigned int * const bytes_left_in_fragment, disc_record const * const discrec, void const * const map, indirect_disc_address const object_to_find, unsigned int const byte_offset_in_object );
_kernel_oserror *read_object_bytes( void ** const to_where, indirect_disc_address const what, unsigned int * const from_where, unsigned int * const how_much_left, disc_record const * const discrec, void const * const map );
_kernel_oserror *write_object_bytes( void ** const to_where, indirect_disc_address const what, unsigned int * const from_where, unsigned int * const how_much_left, disc_record const * const discrec, void const * const map );
