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
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define DEFAULT_PASSWORD     "TheDefaultPassword"
#define TITLESTRING          "FSLock"
#define CRC_POLY             0xA001 /* Per OS_CRC */

static uint32_t crypt_passwd(const char *string)
{
	uint32_t sum = 0;
	uint8_t  rot;

	while (*string >= ' ')
	{
		sum = (sum << 1) + *string;
		if (*string & 1)
		{
			rot = *string & 0x1F;
			sum = (sum >> rot) | (sum << (32 - rot));
		}
		string++;
	}

	return sum;
}

static void stringcopy(char *dst, const char *src, size_t length)
{
	int8_t eormax = strlen(TITLESTRING) - 1;
	int8_t eoridx = -1;
	size_t i;

	for (i = 0; i < length; i++)
	{
		if (eoridx < 0) eoridx = eormax;
		dst[i] = src[i] ^ TITLESTRING[eoridx];
		eoridx--;
	}

	/* Always terminate the string */
	dst[length] = 0;
}

static uint32_t os_crc(uint32_t crc, void *start, void *end, int32_t stride)
{
	uint8_t *src = (uint8_t *)start;
	size_t   bits;
	bool     carry;

	while (src != end)
	{
		crc = crc ^ ((*src) << 0);
		src = src + stride;
		bits = 8;
		if (src != end)
		{
			/* Even stride, consume another byte */
			crc = crc ^ ((*src) << 8);
			src = src + stride;
			bits = 16;
		}
		while (bits)
		{
			carry = (crc & 1) != 0;
			crc = crc >> 1;
			if (carry) crc = crc ^ CRC_POLY;
			bits--;
		}
	}

	return crc;
}

int main(int argc, char *argv[])
{
	FILE    *f;
	uint32_t modulesize, pwd;
	char    *module;
	struct
	{
		uint32_t sig_lo;
#define SIG_LO           0xE7FF1234uL
		uint32_t crc_value;
		uint32_t default_password;
		uint32_t crypt_passwd;
		uint32_t rnd1;
		uint32_t rnd2;
#define PATCH_OFFSET(k)  ((k) & 0xFFFFFF)
#define PATCH_SIZE(k)    ((k) >> 24)
		uint32_t sig_hi;
#define SIG_HI           0xE7FF5678uL
	} patches;

	if (argc != 2)
	{
		printf("%s: Bad args\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	/* Get everything we need to know */
	f = fopen(argv[1], "rb");
	fseek(f, 0, SEEK_END);
	modulesize = (uint32_t)ftell(f);
	fseek(f, -sizeof(patches), SEEK_END);
	if (fread(&patches, sizeof(patches), 1, f) != 1)
	{
		printf("%s: Can't read patch table\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	if ((patches.sig_lo != SIG_LO) || (patches.sig_hi != SIG_HI))
	{
		/* Already patched this one */
		fclose(f);
		return EXIT_SUCCESS;
	}

	/* Read in the unscrambled binary */
	fseek(f, 0, SEEK_SET);
	module = malloc(modulesize);
	if (module == NULL)
	{
		printf("%s: Out of memory\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	if (fread(module, sizeof(*module), modulesize, f) != modulesize)
	{
		printf("%s: Can't load module\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	fclose(f);

	/* State what we know */
	printf("Scrambling '%s'\n", argv[1]);
	printf("  - Default password at +%X.\n", PATCH_OFFSET(patches.default_password));
	printf("  - Crypt code at +%X length %u.\n", PATCH_OFFSET(patches.crypt_passwd),
	                                             PATCH_SIZE(patches.crypt_passwd));
	printf("  - Rand 1 at +%X.\n", PATCH_OFFSET(patches.rnd1));
	printf("  - Rand 2 at +%X.\n", PATCH_OFFSET(patches.rnd2));
	printf("  - CRC at +%X.\n", PATCH_OFFSET(patches.crc_value));

	/* Set a default password */
	pwd = crypt_passwd(DEFAULT_PASSWORD);
	*(uint32_t *)&module[PATCH_OFFSET(patches.default_password)] = pwd; 

	/* Sprinkle in some entropy */
	srand(time(NULL));
	*(uint32_t *)&module[PATCH_OFFSET(patches.rnd1)] = rand() ^ (rand() << 8);
	*(uint32_t *)&module[PATCH_OFFSET(patches.rnd2)] = rand() ^ (rand() << 8);

	/* Cloak the decrypter */
	stringcopy(&module[PATCH_OFFSET(patches.crypt_passwd)],
	           &module[PATCH_OFFSET(patches.crypt_passwd)],
	           PATCH_SIZE(patches.crypt_passwd));

	/* CRC the result up to but not including the CRC */
	*(uint32_t *)&module[PATCH_OFFSET(patches.crc_value)] = os_crc(pwd,
	                                                               module,
	                                                               &module[PATCH_OFFSET(patches.crc_value)],
	                                                               1);

	/* Write it back out */
	f = fopen(argv[1], "wb");
	if (fwrite(module, modulesize - sizeof(patches), 1, f) != 1)
	{
		printf("%s: Failed writing module\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	free(module);
	fclose(f);

	return EXIT_SUCCESS;
}
