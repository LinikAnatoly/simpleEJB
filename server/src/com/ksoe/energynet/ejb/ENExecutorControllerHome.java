
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENExecutor;
 *
 */

public interface ENExecutorControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENExecutorController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}