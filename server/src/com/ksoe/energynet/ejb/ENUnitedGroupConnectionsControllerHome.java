//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENUnitedGroupConnections;
 *
 */

public interface ENUnitedGroupConnectionsControllerHome extends
        javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENUnitedGroupConnectionsController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}