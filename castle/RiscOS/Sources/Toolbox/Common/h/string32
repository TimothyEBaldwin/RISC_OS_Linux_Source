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
/* File:     string32.h
 * Purpose:  strings terminated by char < 32
 * Author:   Timothy Roddis
 * History:  24-Jan-94: IDJ: created from original TGR sources
 */

/* Strings passed to the toolbox might be terminated with any control character ... */



extern void string_copy (char *dst_txt, char *src_txt);
   /*
    * copy a ctrl-terminated string to a buffer big enough to
    * hold the result (no length checking).
    */




extern char *string_copy_chk (char *dst_txt, char *src_txt, int max_len);
   /*
    * copy a ctrl-terminated string to a buffer checking it is big enough to
    * hold the result.  Return NULL and nul-terminate, if dst buffer not
    * big enough.
    */



extern int string_length (char *txt); 
   /*
    * return length of ctrl-terminated string
    */


extern void string_to_buffer (char *dst_txt, char *src_txt, int *max_len);
    /*
     * general purpose routine to fill in a user-supplied buffer (and report
     * number of bytes written), or just report size of buffer needed.
     * If buffer is supplied (dst_txt != 0), then *max_len gives size of supplied
     * buffer; if this is not large enough, don't return an error, but return
     * size of bufer required!
     */
