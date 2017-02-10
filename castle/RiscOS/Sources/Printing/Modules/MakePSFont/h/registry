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
/*-*-C-*-
 * Interface to the font registry
 */

extern Bool getnext(int *handle,	/* updated with next handle, or 0 */
		    char **local,	/* points to RMA storage */
		    char **foreign,	/* which we do not own */
		    int flags);		/* Only return entries that match this */

extern char *addrecord(char *local, char *foreign, int flags, Bool overwrite);

/* Values for the flags word */

#define FONT_REGISTRY 1
#define ENCODING_REGISTRY 6

#define DF_REGISTRY 40
#define DSF_REGISTRY 41
