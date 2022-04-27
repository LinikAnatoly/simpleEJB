//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimateHistoryType;
 *
 */

public interface ENEstimateHistoryTypeControllerHome extends javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENEstimateHistoryTypeController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}