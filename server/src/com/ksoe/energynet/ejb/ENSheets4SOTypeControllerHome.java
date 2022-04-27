
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSheets4SOType;
 *
 */

public interface ENSheets4SOTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSheets4SOTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}