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
#include <rpc/rpc.h>
#include "mount.h"


bool_t
xdr_fhandle(xdrs, objp)
        XDR *xdrs;
        fhandle *objp;
{
        if (!xdr_opaque(xdrs, (char *)objp, FHSIZE)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_fhstatus(xdrs, objp)
        XDR *xdrs;
        fhstatus *objp;
{
        if (!xdr_u_int(xdrs, &objp->fhs_status)) {
                return (FALSE);
        }
        switch (objp->fhs_status) {
        case 0:
                if (!xdr_fhandle(xdrs, &objp->fhstatus_u.fhs_fhandle)) {
                        return (FALSE);
                }
                break;
        }
        return (TRUE);
}




bool_t
xdr_dirpath(xdrs, objp)
        XDR *xdrs;
        dirpath *objp;
{
        if (!xdr_string(xdrs, objp, MNTPATHLEN)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_name(xdrs, objp)
        XDR *xdrs;
        name *objp;
{
        if (!xdr_string(xdrs, objp, MNTNAMLEN)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_mountlist(xdrs, objp)
        XDR *xdrs;
        mountlist *objp;
{
        if (!xdr_name(xdrs, &objp->ml_hostname)) {
                return (FALSE);
        }
        if (!xdr_dirpath(xdrs, &objp->ml_directory)) {
                return (FALSE);
        }
        if (!xdr_pointer(xdrs, (char **)&objp->ml_next, sizeof(mountlist), xdr_mountlist)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_groups(xdrs, objp)
        XDR *xdrs;
        groups *objp;
{
        if (!xdr_pointer(xdrs, (char **)objp, sizeof(struct groupnode), xdr_groupnode)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_groupnode(xdrs, objp)
        XDR *xdrs;
        groupnode *objp;
{
        if (!xdr_name(xdrs, &objp->gr_name)) {
                return (FALSE);
        }
        if (!xdr_pointer(xdrs, (char **)&objp->gr_next, sizeof(groups), xdr_groups)) {
                return (FALSE);
        }
        return (TRUE);
}




bool_t
xdr_exports(xdrs, objp)
        XDR *xdrs;
        exports *objp;
{
        if (!xdr_dirpath(xdrs, &objp->ex_dir)) {
                return (FALSE);
        }
        if (!xdr_groups(xdrs, &objp->ex_groups)) {
                return (FALSE);
        }
        if (!xdr_pointer(xdrs, (char **)&objp->ex_next, sizeof(exports), xdr_exports)) {
                return (FALSE);
        }
        return (TRUE);
}


