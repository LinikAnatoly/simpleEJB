//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimateHistory;
 *
 */

public interface ENEstimateHistoryControllerHome extends javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENEstimateHistoryController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}