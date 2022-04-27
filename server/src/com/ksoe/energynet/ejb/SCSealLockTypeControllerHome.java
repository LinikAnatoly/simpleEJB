
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSealLockType;
 *
 */

public interface SCSealLockTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSealLockTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}