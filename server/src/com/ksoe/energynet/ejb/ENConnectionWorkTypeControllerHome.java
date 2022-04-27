
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionWorkType;
 *
 */

public interface ENConnectionWorkTypeControllerHome extends javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENConnectionWorkTypeController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}