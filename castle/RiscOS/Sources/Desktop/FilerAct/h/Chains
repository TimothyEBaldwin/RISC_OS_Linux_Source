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
        Chain manipulation routines.
*/

#ifndef __chains_h
#define __chains_h

typedef struct chain_link
{
        struct chain_link       *forwards;
        struct chain_link       *backwards;
        int                     wrapper;
}       chain_link;

typedef struct chain_header
{
        chain_link              *forwards;
        chain_link              *header_indicator;      /* = NULL to indicate this is a header */
        chain_link              *backwards;
}       chain_header;

extern  void chain_remove_link( chain_link *link );
extern  void chain_insert_before_link( chain_link *link, void *wrapper, chain_link *before_this );
extern  void chain_insert_after_link( chain_link *link, void *wrapper, chain_link *after_this );
extern  void chain_insert_after_header( chain_link *link, void *wrapper, chain_header *header );
extern  void chain_insert_before_header( chain_link *link, void *wrapper, chain_header *header );
extern  void chain_initialise_header( chain_header *header );
#define chain_link_Wrapper(link) ((void *)((char *)(link)+(link)->wrapper))
#endif
