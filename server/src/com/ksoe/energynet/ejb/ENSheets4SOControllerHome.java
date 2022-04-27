
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSheets4SO;
 *
 */

public interface ENSheets4SOControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSheets4SOController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}