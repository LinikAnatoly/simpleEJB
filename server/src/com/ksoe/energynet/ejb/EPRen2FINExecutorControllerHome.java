
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for EPRen2FINExecutor;
 *
 */

public interface EPRen2FINExecutorControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.EPRen2FINExecutorController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}