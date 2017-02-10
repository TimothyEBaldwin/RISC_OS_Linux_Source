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

#include <stdio.h>
#include "debug.h"

#include "chains.h"

void chain_remove_link( chain_link *link )
{
        link->forwards->backwards = link->backwards;
        link->backwards->forwards = link->forwards;
}

void chain_insert_before_link( chain_link *link, void *wrapper, chain_link *before_this )
{
        link->backwards = before_this->backwards;
        link->forwards = before_this;
        before_this->backwards->forwards = link;
        before_this->backwards = link;
        link->wrapper = (char *)wrapper - (char *)link;
}

void chain_insert_after_link( chain_link *link, void *wrapper, chain_link *after_this )
{
        link->backwards = after_this;
        link->forwards = after_this->forwards;
        after_this->forwards->backwards = link;
        after_this->forwards = link;
        link->wrapper = (char *)wrapper - (char *)link;
}

/*
NOT USED
void chain_insert_after_header( chain_link *link, void *wrapper, chain_header *header )
{
        chain_insert_after_link( link, wrapper, (chain_link *)(&header->forwards) );
}
*/

void chain_insert_before_header( chain_link *link, void *wrapper, chain_header *header )
{
        chain_insert_before_link( link, wrapper, (chain_link *)(&header->header_indicator) );
}

void chain_initialise_header( chain_header *header )
{
        header->forwards = (chain_link *)(&header->header_indicator);
        header->header_indicator = NULL;
        header->backwards = (chain_link *)(&header->forwards );
}
