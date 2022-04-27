
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SystemOperations;
 *
 */

public interface SystemOperationsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SystemOperationsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}