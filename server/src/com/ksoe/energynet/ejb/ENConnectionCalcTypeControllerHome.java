
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionCalcType;
 *
 */

public interface ENConnectionCalcTypeControllerHome extends javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENConnectionCalcTypeController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}