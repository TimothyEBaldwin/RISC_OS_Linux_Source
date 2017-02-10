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
/* @(#)printmsg.c	1.1 87/11/04 3.9 RPCSRC */
/*
 * printmsg.c: print a message on the console
 */
#include <stdio.h>

main(argc, argv)
	int argc;
	char *argv[];
{
	char *message;

	if (argc < 2) {
		fprintf(stderr, "usage: %s <message>\n", argv[0]);
		exit(1);
	}
	message = argv[1];

	if (!printmessage(message)) {
		fprintf(stderr, "%s: sorry, couldn't print your message\n",
			argv[0]);
		exit(1);
	} 
	printf("Message delivered!\n");
}

/*
 * Print a message to the console.
 * Return a boolean indicating whether the message was actually printed.
 */
printmessage(msg)
	char *msg;
{
	FILE *f;

	f = fopen("/dev/console", "w");
	if (f == NULL) {
		return (0);
	}
	fprintf(f, "%s\n", msg);
	fclose(f);
	return(1);
}
