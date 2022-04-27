
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDepartment2CCExecutor;
 *
 */

public interface ENDepartment2CCExecutorControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDepartment2CCExecutorController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}