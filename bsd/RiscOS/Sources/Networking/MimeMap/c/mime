/*
 * Copyright (c) 2014, RISC OS Open Ltd
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met: 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of RISC OS Open Ltd nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>
#include "swis.h"

#include "Global/Services.h"
#include "Interface/MimeMap.h"
#include "Interface/HighFSI.h"

#include "MimeMapHdr.h"
#include "mime.h"

static mimeentry_t *list_end;
static mimeentry_t *list_head;
static uint32_t     last_load, last_exec;
static uint32_t     msgs_struct[4];

/*
 * International support functions
 */
static const char *intl_lookup(const char *token)
{
	_kernel_oserror *err;
	static char string[48];

	err = _swix(MessageTrans_Lookup, _INR(0,7),
	            msgs_struct, token, string, sizeof(string), 0, 0, 0, 0);
	if (err != NULL)
	{
		return "???";
	}
	return (const char *)string;
}

static _kernel_oserror *intl_error(uint32_t which)
{
	_kernel_oserror *err;
	struct
	{
		uint32_t errnum;
		char     token[8];
	} msg_errblk;

	/* Translate via MessageTrans' internal buffer */
	sprintf(msg_errblk.token, "E%02x", which);
	msg_errblk.errnum = which + ErrorBase_ANTMimeMap;
	err = _swix(MessageTrans_ErrorLookup, _INR(0,7),
	            &msg_errblk, msgs_struct, 0, 0, 0, 0, 0, 0);

	return err;
}

/*
 * String support functions
 */
static int16_t stricmp(const char *a, const char *b)
{
	while (*a && *b && (toupper(*a) == toupper(*b)))
	{
		a++;
		b++;
	}

	return *a - *b;
}

static char *strdup(const char *s)
{
	char *dupe;

	dupe = malloc(strlen(s) + 1);
	if (dupe != NULL)
	{
		strcpy(dupe, s);
	}

	return dupe;
}

/*
 * Module functions
 */
static bool mime_flags_ok(mimeentry_t *entry, mimeflag_t flags)
{
	if ((flags & MAPPING_HAS_VALID_MIME) &&
	    ((entry->major[0] == '*') || (entry->minor[0] == '*')))
	{
		return FALSE;
	}
	
	if ((flags & MAPPING_HAS_VALID_DOT_EXTN) &&
	    (entry->num_exts == 0))
	{
		return FALSE;
	}
	
	if ((flags & MAPPING_HAS_VALID_RISCOS) &&
	    ((entry->filetype == MAPPING_FILETYPE_WILDCARDED) ||
	     (entry->filetype == MAPPING_FILETYPE_INVALID)))
	{
		return FALSE;
	}

	return TRUE;
}

static void mime_print_mimeentry_t(mimeentry_t *entry)
{
	printf("%s: %s/%s, ", intl_lookup("Mt"), entry->major, entry->minor);
	printf("%s: &%03X\n", intl_lookup("Rt"), entry->filetype);
	if (entry->num_exts && (entry->exts != NULL))
	{
		size_t i;

		printf("%s:\n", intl_lookup("Ex"));
		for (i = 0; i < entry->num_exts; i++)
		{
			printf("\t%s", entry->exts[i]);
		}
		printf("\n");
	}
}

static void mime_free_mimeentry_t(mimeentry_t *entry)
{
	if (entry->major != NULL)
	{
		free(entry->major);
	}
	if (entry->minor != NULL)
	{
		free(entry->minor);
	}
	if (entry->exts != NULL)
	{
		size_t i;

		for (i = 0; i < entry->num_exts; i++)
		{
			if (entry->exts[i] != NULL)
			{
				free(entry->exts[i]);
			}
		}
		free(entry->exts);
	}

	/* And drop the structure itself */
	free(entry);
}

static void mime_free_list_head(void)
{
	mimeentry_t *entry, *temp;

	for (entry = list_head; entry; )
	{
		temp = entry->next;
		mime_free_mimeentry_t(entry);
		entry = temp;
	}

	list_head = list_end = NULL;
}

static _kernel_oserror *mime_read_file(const char *name)
{
	FILE *file;
	_kernel_oserror *err;
	mimeentry_t *entry;
	char buffer[MAX_LINE];
	size_t i;

	file = fopen(name, "r");
	if (file == NULL)
	{
		return intl_error(ERR_BAD_FILE);
	}

	/* Drop the current list, now we're sure the file exists */
	mime_free_list_head();

	while (!feof(file))
	{
		char *p, *type, *ext;
		char *major, *minor;
		char *exts[MAX_EXTS];

		if (fgets(buffer, MAX_LINE, file) == NULL)
		{
			continue;
		}
		p = buffer;

		/* Trim leading spaces */
		while (isspace(*p))
		{
			p++;
		}

		/* Ignore comment lines */
		if (*p == '#')
		{
			continue;
		}

		/* Split */
		major = strtok(p, "/");
		minor = strtok(NULL, " \t");
		type  = strtok(NULL, " \t\n");
		ext   = strtok(NULL, " \t\n");

		/* Make sure the minimun number of columns were specified */
		if ((major == NULL) || (minor == NULL) || (type == NULL))
		{
			continue;
		}

		/* Add this as a new entry to the list */
		entry = malloc(sizeof(*entry));
		if (entry == NULL)
		{
			break;
		}

		entry->major = strdup(major);
		entry->minor = strdup(minor);
		entry->next = NULL;

		if (list_end != NULL)
		{ 
			/* List already exists case, append */
			list_end->next = entry;
			list_end = entry;
		}
		else
		{
			/* List creation case */
			list_head = list_end = entry;
		}

		if (type[0] == '*')
		{
			entry->filetype = MAPPING_FILETYPE_WILDCARDED;
		}
		else
		{
			uint32_t value;

			/* Assume strtok() gave the type in the first column */
			err = _swix(OS_FSControl, _INR(0,1) | _OUT(2),
			            FSControl_FileTypeFromString, type,
			            &value);

			if ((err != NULL) && (ext != NULL) && (ext[0] != '.'))
			{
				/* Try next column from strtok() if it's not a dotted extension */
				err = _swix(OS_FSControl, _INR(0,1) | _OUT(2),
				            FSControl_FileTypeFromString, ext,
				            &value);
				
				/* So there's no dotted extension */
				ext = NULL;
			}

			if (err != NULL)
			{
				entry->filetype = MAPPING_FILETYPE_INVALID;
			}
			else
			{
				entry->filetype = value;
			}
		}

		i = 0;
		do
		{
			if ((ext != NULL) && (ext[0] == '.'))
			{
				/* Another dotted extension to remember */
				exts[i++] = strdup(&ext[1]);
			}
			
			/* Optionally more dotted extensions */
			ext = strtok(NULL, " \t\n");
		} while ((i < MAX_EXTS) && (ext != NULL));

		entry->num_exts = i;

		/* Count of pointers now known */
		entry->exts = NULL;
		if (i)
		{
			entry->exts = malloc(i * sizeof(char *));
			if (entry->exts)
			{
				memcpy(entry->exts, exts, i * sizeof(char *));
			}
		}
	}

	fclose(file);

	return NULL;
}

static _kernel_oserror *mime_read_file_if_changed(const char *name)
{
	_kernel_oserror *err;
	uint32_t object, load, exec;

	err = _swix(OS_File, _INR(0,1) | _OUT(0) | _OUTR(2,3),
	            OSFile_ReadInfo, name,
	            &object, &load, &exec);
	if ((err != NULL) || (object != object_file))
	{
		return intl_error(ERR_BAD_FILE);
	}

	if ((load != last_load) || (exec != last_exec))
	{
		last_load = load;
		last_exec = exec;

		return mime_read_file(MAPPING_FILE);
	}

	return NULL;
}

static _kernel_oserror *mime_read_file_if_not_inited(const char *name)
{
	if (list_head == NULL)
	{
		return mime_read_file(name);
	}

	return NULL;
}

static mimeentry_t *mime_lookup_by_mime(const char *mime, mimeflag_t flags)
{
	mimeentry_t *entry;
	char *major, *minor;
	char buffer[MAX_LINE];

	strncpy(buffer, mime, MAX_LINE); buffer[MAX_LINE - 1] = 0;
	major = strtok(buffer, "/");
	minor = strtok(NULL, " \t\r\n");

	if ((major == NULL) || (minor == NULL))
	{
		return NULL;
	}

	for (entry = list_head; entry != NULL; entry = entry->next)
	{
		if (mime_flags_ok(entry, flags))
		{
			if (entry->major[0] == '*')
			{
				/* Wildcarded major matches absolutely anything.
				 * There should only be one of these in the
				 * mapping as the 'catch all' entry.
				 */
				return entry;
			}
			if (stricmp(major, entry->major) == 0)
			{
				/* Matched major */
				if ((entry->minor[0] == '*') || (stricmp(minor, entry->minor) == 0))
				{
					/* Wildcarded minor or match minor -> match! */
					return entry;
				}
			}
		}
	}

	return NULL;
}

static mimeentry_t *mime_lookup_by_ft(uint32_t filetype, mimeflag_t flags)
{
	mimeentry_t *entry;

	for (entry = list_head; entry != NULL; entry = entry->next)
	{
		if ((flags == MAPPING_HAS_VALID_RISCOS) || mime_flags_ok(entry, flags))
		{
			if (entry->filetype == filetype)
			{
				return entry;
			} 
			if (entry->filetype == MAPPING_FILETYPE_WILDCARDED)
			{
				static mimeentry_t result;

				/* Matched any, fake up a MIME list entry for the return */
				result = *entry;
				result.filetype = filetype;

				return &result;
			}
		}
	}

	return NULL;
}

static mimeentry_t *mime_lookup_by_ftname(const char *type, mimeflag_t flags)
{
	uint32_t value;
	_kernel_oserror *err;

	err = _swix(OS_FSControl, _INR(0,1) | _OUT(2),
	        FSControl_FileTypeFromString, type,
	        &value);
	if (err != NULL)
	{
		return NULL;
	}
	else
	{
		return mime_lookup_by_ft(value, flags);
	}
}

static mimeentry_t *mime_lookup_by_ext(const char *ext, mimeflag_t flags)
{
	mimeentry_t *entry;

	if (ext[0] == '.')
	{
		ext++;
	}

	for (entry = list_head; entry != NULL; entry = entry->next)
	{
		size_t i;

		for (i = 0; i < entry->num_exts; i++)
		{
			if (mime_flags_ok(entry, flags) && 
			    (stricmp(ext, entry->exts[i]) == 0))
			{
				return entry;
			}
		}
	}

	return NULL;
}

/* SWI MimeMap_Translate
 * => R0 = input format
 *    R1 = input buffer pointer (or actual value for input type MMM_TYPE_RISCOS)
 *    R2 = output format
 *    R3 = output buffer pointer (or undefined for output type MMM_TYPE_RISCOS)
 * <= R0 = error and V set, else preserved
 *    R3 = output value for MMM_TYPE_RISCOS, else preserved
 *    R4 = number of extensions returned for output format MMM_TYPE_DOT_EXTNS, else preserved
 */
static _kernel_oserror *mime_translate_swi(_kernel_swi_regs *r)
{
	mimeflag_t   flags;
	mimeentry_t *entry = NULL;

	mime_read_file_if_not_inited(MAPPING_FILE);

	switch(r->r[2])
	{
		case MMM_TYPE_RISCOS:
		case MMM_TYPE_RISCOS_STRING:
			flags = MAPPING_HAS_VALID_RISCOS;
			break;

		case MMM_TYPE_MIME:
			flags = MAPPING_HAS_VALID_MIME;
			break;

		case MMM_TYPE_DOT_EXTN:
			flags = MAPPING_HAS_VALID_DOT_EXTN;
			break;

		default:
			flags = MAPPING_HAS_NO_CHECKS;
			break;
	}

	switch(r->r[0])
	{
		case MMM_TYPE_RISCOS:
			entry = mime_lookup_by_ft(r->r[1], flags);
			break;

		case MMM_TYPE_RISCOS_STRING:
			entry = mime_lookup_by_ftname((const char *)r->r[1], flags);
			break;

		case MMM_TYPE_MIME:
			entry = mime_lookup_by_mime((const char *)r->r[1], flags);
			break;

		case MMM_TYPE_DOT_EXTN:
			entry = mime_lookup_by_ext((const char *)r->r[1], flags);
			break;

		case MMM_TYPE_DOT_EXTNS:
		default:
			/* Nonsensical as an input format */
			return intl_error(ERR_BAD_REASON);
	}

	if (entry == NULL)
	{
		return intl_error(ERR_LOOKUP_FAILED);
	}

	switch(r->r[2])
	{
		case MMM_TYPE_RISCOS:
			r->r[3] = entry->filetype;
			break;

		case MMM_TYPE_RISCOS_STRING:
			{
				uint32_t value[3];
				char    *type;

				if (_swix(OS_FSControl, _IN(0) | _IN(2) | _OUTR(2,3),
				          FSControl_ReadFileType, entry->filetype,
				          &value[0], &value[1]) == NULL)
				{
					/* Shorten to a C string, or 8 characters */
					type = (char *)value;
					type[8] = ' ';
					*strchr(type, ' ') = 0;
					strcpy((char *)r->r[3], type);
				}
				else
				{
					/* No name, give hex */
					sprintf((char *)r->r[3], "&%03X", entry->filetype);
				}
			}
			break;

		case MMM_TYPE_MIME:
			sprintf((char *)r->r[3], "%s/%s", entry->major, entry->minor);
			break;

		case MMM_TYPE_DOT_EXTN:
			strcpy((char *)r->r[3], entry->exts[0]);
			break;

		case MMM_TYPE_DOT_EXTNS:
			*(char ***)r->r[3] = entry->exts;
			r->r[4] = entry->num_exts;
			break;
	}

	return NULL;
}

_kernel_oserror *mime_init(const char *cmd_tail, int podule_base, void *pw)
{
	_kernel_oserror *err;

	/* Wipe static state */
	list_head = list_end = NULL;
	last_load = last_exec = 0;

#ifndef ROM
	err = _swix(ResourceFS_RegisterFiles, _IN(0), Resources());
	if (err != NULL)
	{
		return err;
	}
#endif
	err = _swix(MessageTrans_OpenFile, _INR(0,2),
	            msgs_struct, Module_MessagesFile, 0);
	if (err != NULL)
	{
#ifndef ROM
		_swix(ResourceFS_DeregisterFiles, _IN(0), Resources());
#endif
		return err;
	}

	/* Try loading a mapping, silently fail if not there */
	mime_read_file_if_changed(MAPPING_FILE);

	UNUSED(pw);
	UNUSED(podule_base);
	UNUSED(cmd_tail);

	return NULL;
}

_kernel_oserror *mime_final(int fatal, int podule, void *pw)
{
	mime_free_list_head();

	_swix(MessageTrans_CloseFile, _IN(0), msgs_struct);
#ifndef ROM
	_swix(ResourceFS_DeregisterFiles, _IN(0), Resources());
#endif

	UNUSED(pw);
	UNUSED(fatal);
	UNUSED(podule);

	return NULL;
}


_kernel_oserror *mime_cli_handler(const char *arg_string, int argc, int cmd_no, void *pw)
{
	mimeentry_t *entry;

	switch (cmd_no)
	{
		case CMD_MimeMap:
			mime_read_file_if_not_inited(MAPPING_FILE);
			if (argc == 0)
			{
				/* Show all mappings */
				for (entry = list_head; entry != NULL; entry = entry->next)
				{
					mime_print_mimeentry_t(entry);
				}
			}
			else
			{
				char copy[MAX_LINE];

				strncpy(copy, arg_string, MAX_LINE); copy[MAX_LINE - 1] = 0;
				if (copy[0] == '.')
				{
					/* Dotted extension entered */
					entry = mime_lookup_by_ext(strtok(&copy[1], " \t\r\n"), MAPPING_HAS_NO_CHECKS);
				}
				else
				{
					if (copy[0] == '&')
					{
						char *p;
						uint32_t value;

						/* Hex filetype entered */
						p = strtok(&copy[1], " \t\r\n");
						value = (uint32_t)strtoul(p, &p, 16);
						entry = mime_lookup_by_ft(value, MAPPING_HAS_NO_CHECKS);
					}
					else
					{
						if (strchr(copy, '/'))
						{
							/* MIME type entered */
							entry = mime_lookup_by_mime(strtok(copy, " \t\r\n"), MAPPING_HAS_NO_CHECKS);
						}
						else
						{
							/* Last ditch attempt as a filetype name */
							entry = mime_lookup_by_ftname(strtok(copy, " \t\r\n"), MAPPING_HAS_NO_CHECKS);
						}
					}
				}
				if (entry != NULL)
				{
					/* Got a match for the type deduced */
					mime_print_mimeentry_t(entry);
				}
				else
				{
					return intl_error(ERR_LOOKUP_FAILED);
				}
			}
			break;
		
		case CMD_ReadMimeMap:
			return mime_read_file_if_changed(MAPPING_FILE);
	}

	UNUSED(pw);

	return NULL;
}

_kernel_oserror *mime_swi_handler(int swi_offset, _kernel_swi_regs *r, void *pw)
{
	switch (swi_offset)
	{
		case MimeMap_Translate - MimeMap_00:
			return mime_translate_swi(r);

		default:
			return error_BAD_SWI;
	}

	UNUSED(pw);

	return NULL;
}

void mime_service(int service_number, _kernel_swi_regs *r, void *pw)
{
	switch (service_number)
	{
#ifndef ROM
		case Service_ResourceFSStarting:
			/* Reregister the messages */
			(*(void (*)(void *, void *, void *, void *))r->r[2])(Resources(), 0, 0, (void *)r->r[3]);
			break;
#endif
	}

	UNUSED(r);
	UNUSED(pw);
}
