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
*   C.Printers -- Does printing-related things
*
*   16-12-94 INH Original
*
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "kernel.h"
#include "swis.h"
#include "stdtypes.h"
#include "Printers.h"
#include "SMB.h"
#include "Omni.h"

struct pjob_info /* Print job info */
{
  int tag;
#define PJOB_VALID_TAG 0x57202116

  int  status;     /* Only valid if tag is PJOB_VALID_TAG */
#define PJOB_OPEN    0
#define PJOB_CLOSED  1
#define PJOB_ABORTED 2

  char SMBletter;  /* letter representing printer connection */
  int  SMBhandle;  /* handle to which to print */
  int  serialno;   /* Serial number of job */
  int  bytecount;  /* Number of bytes sent */
};

#define PJOB_BLOCK_SIZE 20

struct pjob_block /* A bunch of print jobs */
{
  struct pjob_block *next;
  struct pjob_info jobs[PJOB_BLOCK_SIZE];
};

/* Globals --------------------------------------- */

static struct pjob_block *JobBlockList;

static int JobSerialNo;  /* Serial number of last job created */

/* CheckDisconnect ------------------------------- */

static void CheckDisconnect ( char drvletter )
{
  int i;
  struct pjob_block *pPB;

  /* Look for any job using this connection */

  for ( pPB = JobBlockList; pPB != NULL; pPB = pPB->next )
  {
    for ( i=0; i < PJOB_BLOCK_SIZE; i++ )
    {
      if ( pPB->jobs[i].tag == PJOB_VALID_TAG &&
           pPB->jobs[i].SMBletter == drvletter )
        return;
    }
  }

  /* No one using it - we can disconnect */

  debug0("Server disconnect\n");

  SMB_DeleteShare(drvletter);
}

/* ---------------------- */

static struct pjob_info *AllocPJob ( void )
{
  int i;
  struct pjob_block *pPB;

  /* Look for free slot in existing chunks */

  for ( pPB = JobBlockList; pPB != NULL; pPB = pPB->next )
  {
    for ( i=0; i < PJOB_BLOCK_SIZE; i++ )
      if ( pPB->jobs[i].tag != PJOB_VALID_TAG )
        return &(pPB->jobs[i]);
  }

  /* If none suitable, alloc new block */

  pPB = (struct pjob_block *)malloc ( sizeof(struct pjob_block) );
  if ( pPB == NULL )
    return NULL;      /* Malloc failure */

  /* Set all slots free */
  for ( i=0; i < PJOB_BLOCK_SIZE; i++ )
    pPB->jobs[i].tag = 0;

  /* Add block to list */
  pPB->next = JobBlockList;
  JobBlockList = pPB;

  return &(pPB->jobs[0]);
}

/* Prn_CreateJob() ------------------------------------- */

err_t Prn_CreateJob ( char *servname, char *prnname, char *userid,
                        char *passwd, int *jobid_out )
{
  char namebuf[16];
  err_t res;
  char drvletter;
  int  handle;
  struct pjob_info * pPJ;

  debug2("Create job srv=%s prn=%s ", servname, prnname );
  debug2("usr=%s passwd=%s\n", userid==NULL ? "<NULL>":userid,
                               passwd==NULL ? "<NULL>":passwd );

  /* Try to alloc job handle */

  *jobid_out = 0;

  pPJ = AllocPJob ();

  if ( pPJ == NULL )
    return ENOHANDLES;

  /* Try to connect to server - most likely we will already
     be connected, in which case don't worry */

  res = SMB_CreateShare ( SHR_PRINTER, CREATE_NORMAL,
          servname, prnname, userid, passwd, &drvletter );

  if ( res != OK )
    return res;

  Omni_AddInfo ( OAI_PRINTER, servname, prnname, NULL );
  sprintf ( namebuf, "%05d", ++JobSerialNo );

  /* Open printer spool file */

  res = SMB_OpenPrinter ( drvletter, namebuf, &handle );
  if ( res != OK )
  {
    debug1("Printer open failed, code %d", res );
    /* Disconnect only if no-one else is using this connection */
    CheckDisconnect(drvletter);
    return res;
  }

  /* So far so good: */

  pPJ->SMBhandle = handle;
  pPJ->SMBletter = drvletter;
  pPJ->status    = PJOB_OPEN;
  pPJ->serialno  = JobSerialNo;
  pPJ->bytecount = 0;

  pPJ->tag = PJOB_VALID_TAG;

  *jobid_out = (int) pPJ;

  debug1( "Created job %d\n", (int) pPJ );

  return OK;
}

/* ---------------------------- */

err_t Prn_WriteData ( int jobid, char *data, int datalen )
{
  err_t res;

  struct pjob_info *pPJ;

  debug2( "Write job %d, %d chars\n", jobid, datalen );

  pPJ = (struct pjob_info *)jobid;

  if ( pPJ == NULL || pPJ->tag != PJOB_VALID_TAG ||
       pPJ->status != PJOB_OPEN )
    return EBADPARAM;

  res = SMB_WritePrinter ( pPJ->SMBhandle, (BYTE *)data, datalen );
  if ( res != OK )
    return res;

  pPJ->bytecount += datalen;
  return OK;
}

/* ---------------------------- */

err_t Prn_CloseJob ( int jobid, bool abort )
{
  err_t res;

  struct pjob_info *pPJ;

  debug1( "Close job %d\n", jobid );

  pPJ = (struct pjob_info *)jobid;

  if ( pPJ == NULL || pPJ->tag != PJOB_VALID_TAG ||
       pPJ->status != PJOB_OPEN )
    return EBADPARAM;

  res = SMB_ClosePrinter ( pPJ->SMBhandle );
  if ( res != OK )
  {
    debug1("Close prn failed, code %d", res);
    return res;
  }

  if ( abort )
    pPJ->status = PJOB_ABORTED; /* Ignore really!! */
  else
    pPJ->status = PJOB_CLOSED;

  return OK;
}

/* ---------------------------- */

err_t Prn_GetJobStatus ( int jobid, struct JobStatus *pJS )
{
  struct pjob_info *pPJ;

  debug1( "Get job status %d\n", jobid );

  pPJ = (struct pjob_info *)jobid;

  if ( pPJ == NULL || pPJ->tag != PJOB_VALID_TAG )
    return EBADPARAM;

  switch ( pPJ->status )
  {
    case PJOB_OPEN:
      pJS->lclstatus = (pPJ->bytecount > 0) ? 5 : 3;
      break;

    case PJOB_CLOSED:
      pJS->lclstatus = 7; /* 'Transfer complete' status */
      break;

    case PJOB_ABORTED:
      pJS->lclstatus = 11; /* 'Terminal error' */
      break;

    default:
      pJS->lclstatus = 0;  /* No info available */
  }

  pJS->lclcount = pPJ->bytecount;
  pJS->lclerror = 0;
  pJS->rmtstatus = 0; /* No info available */
  pJS->rmtcount = 0;
  pJS->rmterror = 0;

  return OK;
}

/* ---------------------------- */

err_t Prn_ClearJob ( int jobid )
{
  struct pjob_info *pPJ;

  debug1( "Kill job %d\n", jobid );

  if ( jobid == 0 )   /* Clear all inactive jobs */
  {
    int i;
    struct pjob_block *pPB;

    for ( pPB = JobBlockList; pPB != NULL; pPB = pPB->next )
    {
      /* Check for inactive jobs */
      for ( i=0; i<PJOB_BLOCK_SIZE; i++ )
        if ( pPB->jobs[i].tag == PJOB_VALID_TAG &&
             pPB->jobs[i].status != PJOB_OPEN )
        {
          Prn_ClearJob( (int) &(pPB->jobs[i]) );
        }
    }

    return OK;
  }

  /* Clear specific job */

  pPJ = (struct pjob_info *)jobid;

  if ( pPJ->tag != PJOB_VALID_TAG )
    return EBADPARAM;

  if ( pPJ->status == PJOB_OPEN )
    Prn_CloseJob ( jobid, false );

  /* See if we should disconnect server */

  pPJ->tag = 0;
  CheckDisconnect ( pPJ->SMBletter );

  return OK;
}

/* --------------------- */

bool Prn_Init (void)
{
  JobBlockList = NULL;
  JobSerialNo  = 0;
  return true;
}

/* --------------------- */

void Prn_Shutdown (void)
{
  int i;
  struct pjob_block *pPB, *pPB_next;

  /* We assume SMB_Shutdown will kill of all connections */

  for ( pPB = JobBlockList; pPB != NULL; pPB = pPB_next )
  {
    /* Invalidate all pjob_id's */
    for ( i=0; i<PJOB_BLOCK_SIZE; i++ )
      pPB->jobs[i].tag = 0;

    pPB_next = pPB->next;
    free ( pPB );
  }
}


